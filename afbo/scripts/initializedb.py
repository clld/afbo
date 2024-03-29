import json
import collections

from clld.db.meta import DBSession
from clld.db.models import common
from clld.lib.bibtex import EntryType
from csvw.dsv import reader

import afbo
from afbo import models


def typed(r, t):  # pragma: no cover
    if 'version' in r:
        del r['version']
    for k in r:
        if k.endswith('_pk') or k == 'pk' or k.endswith('_int'):
            r[k] = int(r[k]) if r[k] != '' else None
        elif k == 'jsondata':
            r[k] = json.loads(r[k]) if r[k] else None
        elif k in {'latitude', 'longitude'}:
            r[k] = float(r[k]) if r[k] != '' else None
        elif k in {'samples_100', 'samples_200'}:
            r[k] = r[k] == 't'

    if t in {'editor.csv', 'contributioncontributor.csv'}:
        r['primary'] = r['primary'] == 't'
        r['ord'] = int(r['ord'])
    elif t == 'contribution.csv':
        r['date'] = None
    elif t == 'value.csv':
        r['frequency'] = None
    elif t == 'source.csv':
        r['bibtex_type'] = r['bibtex_type'] or 'misc'
        r['bibtex_type'] = EntryType.get(r['bibtex_type'])
    return r


def main(args):  # pragma: no cover
    repos = args.repos
    pks = collections.defaultdict(list)

    def iterrows(core, extended=False):
        res = collections.OrderedDict()
        for row in reader(repos / 'raw' / core, dicts=True):
            res[row['pk']] = row
        if extended:
            for row in reader(repos / 'raw' / extended, dicts=True):
                res[row['pk']].update(row)
        for r in res.values():
            pks[core.replace('.csv', '')].append(int(r['pk']))
            yield typed(r, core)

    for stem, cls in [
        ('dataset', common.Dataset),
        ('contributor', common.Contributor),
        ('contribution', common.Contribution),
        ('editor', common.Editor),
        ('source', common.Source),
        ('identifier', common.Identifier),
        ('language', common.Language),
        ('languageidentifier', common.LanguageIdentifier),
        ('pair', models.Pair),
        ('pairsource', models.PairSource),
    ]:
        for row in iterrows(stem + '.csv'):

            DBSession.add(cls(**row))
        DBSession.flush()

    maxpks = {n: max(l) for n, l in pks.items()}
    common.Dataset.first().update_jsondata(doi=args.doi)

    ids = {}
    for l in reader(args.repos / 'cldf' / 'languages.csv', dicts=True):
        if l['Glottocode']:
            gc = l['Glottocode']
            identifier = ids.get(gc)
            if not identifier:
                maxpks['identifier'] += 1
                ids[gc] = identifier = common.Identifier(
                    pk=maxpks['identifier'],
                    id=gc,
                    name=gc,
                    type='glottolog')
            maxpks['languageidentifier'] += 1
            DBSession.add(common.LanguageIdentifier(
                pk=maxpks['languageidentifier'],
                language=common.Language.get(l['ID']),
                identifier=identifier))

    for row in iterrows('parameter.csv', extended='affixfunction.csv'):
        DBSession.add(models.AffixFunction(**row))
        DBSession.flush()

    for stem, cls in [
        ('valueset', common.ValueSet),
    ]:
        for row in iterrows(stem + '.csv'):
            DBSession.add(cls(**row))
        DBSession.flush()

    for row in iterrows('value.csv', extended='waabvalue.csv'):
        DBSession.add(models.AfboValue(**row))
        DBSession.flush()


def prime_cache(args):  # pragma: no cover
    log = args.log
    for param in DBSession.query(models.AffixFunction):
        param.representation = len(param.valuesets)
        param.count_borrowed = sum(
            sum(v.numeric for v in vs.values) for vs in param.valuesets)

    colors = {}
    for _min, _max, color in afbo.COLOR_MAP:
        _min = _min or 0
        _max = _max or 100
        for i in range(_min, _max + 1):
            colors[i] = color

    for l in DBSession.query(common.Language) \
            .join(models.Pair, common.Language.pk == models.Pair.recipient_pk):
        l.update_jsondata(color=colors[max(p.count_borrowed for p in l.donor_assocs)])

    for l in DBSession.query(common.Language):
        if not l.donor_assocs:
            l.update_jsondata(color='ffffff')

    for p in DBSession.query(models.Pair):
        for source_id in set(afbo.SOURCE_ID_PATTERN.findall(p.description)):
            try:
                p.sources.append(common.Source.get(source_id))
            except:
                log.warning('missing source: {0}'.format(source_id))
