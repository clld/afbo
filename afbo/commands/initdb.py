"""

"""
import json
import pathlib
import contextlib
import collections

import transaction
from clldutils import db
from clldutils import clilib
from clld.scripts.util import SessionContext, ExistingConfig, get_env_and_settings
from clld.db.meta import DBSession
from clld.db.models import common
from clld.lib.bibtex import EntryType
from csvw.dsv import reader

import afbo
from afbo import models

PKG_DIR = pathlib.Path(afbo.__file__).parent
PROJECT_DIR = PKG_DIR.parent

# FIXME:
# - source.bib - we should import source data from the bib file, because this can be easier
#   maintained.


def register(parser):  # pragma: no cover
    parser.add_argument(
        "--config-uri",
        action=ExistingConfig,
        help="ini file providing app config",
        default=str(PROJECT_DIR / 'development.ini'))
    parser.add_argument(
        '--doi',
        default=None,
    )
    parser.add_argument(
        '--repos',
        default=pathlib.Path(PROJECT_DIR.parent / 'wals-cldf'),
        help='Clone of cldf-datasets/wals',
        type=clilib.PathType(type='dir'),
    )


def run(args):  # pragma: no cover
    args.env, settings = get_env_and_settings(args.config_uri)

    with contextlib.ExitStack() as stack:
        stack.enter_context(db.FreshDB.from_settings(settings, log=args.log))
        stack.enter_context(SessionContext(settings))

        with transaction.manager:
            load(args.repos)
            cache(args.log)


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


def load(repos):  # pragma: no cover
    def iterrows(core, extended=False):
        res = collections.OrderedDict()
        for row in reader(repos / 'raw' / core, dicts=True):
            res[row['pk']] = row
        if extended:
            for row in reader(repos / 'raw' / extended, dicts=True):
                res[row['pk']].update(row)
        for r in res.values():
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


def cache(log):
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

    for l in DBSession.query(common.Language)\
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
