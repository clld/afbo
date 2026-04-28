from clld.db.meta import DBSession
from clld.db.models import common
from clld.cliutil import Data, bibtex2source
from clld.lib import bibtex
from nameparser import HumanName
from pycldf.media import MediaTable
from clldutils.markup import iter_markdown_sections

import afbo
from afbo import models


def strip_title(t):
    return '\n'.join(line for line in t.split('\n') if not line.startswith('# ')).strip()


def main(args):  # pragma: no cover
    files = {f.id: f for f in MediaTable(args.cldf)}
    about = []
    for i, (level, title, text) in enumerate(iter_markdown_sections(files['about'].read())):
        if level == 2:
            about.append((i + 1, title.lstrip('#').strip(), text))

    data = Data()
    ds = data.add(
        common.Dataset,
        'afbo',
        id='afbo',
        domain='afbo.info',
        name=args.cldf.properties['dc:title'],
        description="",
        contact="frank.seifart@cnrs.fr",
        publisher_name="Max Planck Institute for Evolutionary Anthropology",
        publisher_place="Leipzig",
        publisher_url="https://www.eva.mpg.de/",
        license="http://creativecommons.org/licenses/by/4.0/",
        jsondata={
            'license_icon': 'cc-by.png',
            'license_name': 'Creative Commons Attribution 4.0 International License',
            'about': about,
        },
    )
    contrib = common.Contribution(id='afbo')
    for i, name in enumerate(args.cldf.properties['dc:creator'].split(' and ')):
        cid = HumanName(name.strip()).last.lower() + HumanName(name.strip()).first.lower()[0]
        co = data.add(common.Contributor, cid, id=cid, name=name.strip())
        common.Editor(dataset=ds, ord=i, contributor=co)
    DBSession.add(ds)

    for rec in bibtex.Database.from_file(args.cldf.bibpath, lowercase=True):
        data.add(common.Source, rec.id, _obj=bibtex2source(rec, sluggify_id=False))

    for row in args.cldf.iter_rows('LanguageTable'):
        data.add(
            models.AfboLanguage,
            row['ID'],
            id=row['ID'],
            name=row['Name'],
            latitude=row['Latitude'],
            longitude=row['Longitude'],
            family=row['Family'],
            jsondata=dict(genus=row['Genus'], family_glottocode=row['Family_Glottocode'])
        )

    for row in args.cldf.iter_rows('ParameterTable'):
        data.add(models.AffixFunction, row['ID'], id=row['ID'], name=row['Name'])

    for row in args.cldf.iter_rows('donor_recipient_pairs.csv'):
        data.add(
            models.Pair, row['ID'],
            id=row['ID'],
            name=row['Name'],
            description=strip_title(files[row['Description']].read()),
            area=row['Macroarea'],
            recipient=data['AfboLanguage'][row['Recipient_ID']],
            donor=data['AfboLanguage'][row['Donor_ID']],
            count_borrowed=row['Count_Borrowed'],
        )

    DBSession.flush()

    for row in args.cldf.iter_rows('LanguageTable'):
        id_ = data['Identifier'].get((row['Glottocode'], 'glottolog'))
        if not id_:
            id_ = data.add(
                common.Identifier,
                (row['Glottocode'], 'glottolog'),
                id=row['Glottocode'], type='glottolog')
        DBSession.add(
            common.LanguageIdentifier(language_pk=data['AfboLanguage'][row['ID']].pk, identifier=id_))
        for iso in row['ISO639P3code']:
            id_ = data['Identifier'].get((iso, 'iso639-3'))
            if not id_:
                id_ = data.add(
                    common.Identifier,
                    (iso, 'iso639-3'),
                    id=iso, type='iso639-3')
            DBSession.add(
                common.LanguageIdentifier(language_pk=data['AfboLanguage'][row['ID']].pk, identifier=id_))

    for row in args.cldf.iter_rows('donor_recipient_pairs.csv'):
        for srcid in row['Source']:
            DBSession.add(models.PairSource(
                source_pk=data['Source'][srcid].pk,
                pair_pk=data['Pair'][row['ID']].pk,
            ))

    for row in args.cldf.iter_rows('ValueTable'):
        vs = data['ValueSet'].get((row['Language_ID'], row['Parameter_ID']))
        if not vs:
            vs = data.add(
                common.ValueSet,
                (row['Language_ID'], row['Parameter_ID']),
                id=f"{row['Language_ID']}-{row['Parameter_ID']}",
                language_pk=data['AfboLanguage'][row['Language_ID']].pk,
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


def prime_cache(args):  # pragma: no cover
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
