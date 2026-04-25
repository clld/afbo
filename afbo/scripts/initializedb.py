from clld.db.meta import DBSession
from clld.db.models import common
from clld.cliutil import Data, bibtex2source
from clld.lib import bibtex
from nameparser import HumanName

import afbo
from afbo import models


def main(args):  # pragma: no cover
    data = Data()
    ds = data.add(
        common.Dataset,
        'afbo',
        id='afbo',
        domain='afbo.info',
        name=args.cldf.properties['dc:title'],
        description="",
        publisher_name="MPI EVA",
        publisher_place="Leipzig",
        publisher_url="https://www.eva.mpg.de/",
        license="http://creativecommons.org/licenses/by/4.0/",
        jsondata={
            'license_icon': 'cc-by.png',
            'license_name': 'Creative Commons Attribution 4.0 International License',
        },
    )
    contrib = common.Contribution(id='afbo')
    for i, name in enumerate(args.cldf.properties['dc:creator'].split(' and ')):
        cid = HumanName(name.strip()).last.lower() + HumanName(name.strip()).first.lower()[0]
        co = data.add(common.Contributor, cid, id=cid, name=name.strip())
        common.Editor(dataset=ds, ord=i, contributor=co)
    DBSession.add(ds)

    for rec in bibtex.Database.from_file(args.cldf.bibpath, lowercase=True):
        data.add(common.Source, rec.id, _obj=bibtex2source(rec))

    for row in args.cldf.iter_rows('LanguageTable'):
        data.add(common.Language, row['ID'], id=row['ID'], name=row['Name'])

    for row in args.cldf.iter_rows('ParameterTable'):
        data.add(models.AffixFunction, row['ID'], id=row['ID'], name=row['Name'])

    for row in args.cldf.iter_rows('donor_recipient_pairs.csv'):
        data.add(
            models.Pair, row['ID'],
            id=row['ID'],
            name=row['Name'],
            description=row['Description'],
            recipient=data['Language'][row['Recipient_ID']],
            donor=data['Language'][row['Donor_ID']],
            count_borrowed=row['Count_Borrowed'],
        )

    DBSession.flush()

    for row in args.cldf.iter_rows('ValueTable'):
        vs = data['ValueSet'].get((row['Language_ID'], row['Parameter_ID']))
        if not vs:
            vs = data.add(
                common.ValueSet,
                (row['Language_ID'], row['Parameter_ID']),
                id=f"{row['Language_ID']}-{row['Parameter_ID']}",
                language_pk=data['Language'][row['Language_ID']].pk,
                parameter_pk=data['AffixFunction'][row['Parameter_ID']].pk,
                contribution_pk=contrib.pk,
            )
        data.add(
            models.AfboValue, row['ID'],
            id=row['ID'],
            name=row['Value'],
            numeric=int(row['Value']),
            pair=data['Pair'][row['Pair_ID']],
            valueset=vs)

    for stem, cls in [
        ('identifier', common.Identifier),
        ('languageidentifier', common.LanguageIdentifier),
        ('pairsource', models.PairSource),
    ]:
        pass



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

    #for p in DBSession.query(models.Pair):
    #    for source_id in set(afbo.SOURCE_ID_PATTERN.findall(p.description)):
    #        try:
    #            p.sources.append(common.Source.get(source_id))
    #        except:
    #            log.warning('missing source: {0}'.format(source_id))
