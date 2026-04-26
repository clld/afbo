from sqlalchemy import Integer
from sqlalchemy.sql.expression import cast
from sqlalchemy.orm import aliased, joinedload

from clld.db.meta import DBSession
from clld.db.models.common import Value, Parameter, ValueSet, Source
from clld.db.util import icontains, get_distinct_values
from clld.web.datatables.base import (
    Col, LinkCol, DataTable, filter_number, LinkToMapCol,
)
from clld.web.datatables.parameter import Parameters
from clld.web.datatables.source import Sources
from clld.web.datatables.value import Values
from clld.web.util.htmllib import HTML
from clld.web.util.helpers import link

from afbo.models import Pair, AffixFunction, AfboValue, AfboLanguage


class AffixFunctions(Parameters):
    def col_defs(self):
        return [
            LinkCol(self, 'name', sTitle='Affix function'),
            Col(self, 'count_borrowed',
                sTitle='total number of borrowed affixes',
                model_col=AffixFunction.count_borrowed),
            Col(self, 'representation',
                sTitle='number of languages that borrowed affixes with this function',
                model_col=AffixFunction.representation),
        ]


class DetailsCol(LinkCol):
    def get_attrs(self, item):
        return {'label': 'details'}


class DonorCol(LinkCol):
    def get_obj(self, item):
        return item.donor

    def search(self, qs):
        return icontains(self.dt.donor.name, qs)

    def order(self):
        return self.dt.donor.name


class DonorFamilyCol(Col):
    def format(self, item):
        return item.donor.family

    def search(self, qs):
        return icontains(self.dt.donor.family, qs)

    def order(self):
        return self.dt.donor.family


class RecipientCol(LinkCol):
    def get_obj(self, item):
        return item.recipient

    def search(self, qs):
        return icontains(self.dt.recipient.name, qs)

    def order(self):
        return self.dt.recipient.name


class RecipientFamilyCol(Col):
    def format(self, item):
        return item.recipient.family

    def search(self, qs):
        return icontains(self.dt.recipient.family, qs)

    def order(self):
        return self.dt.recipient.family


def recipient_families():
    return sorted(set(
        r[0] for r in
        DBSession.query(AfboLanguage.family).join(Pair, Pair.recipient_pk == AfboLanguage.pk)))


def donor_families():
    return sorted(set(
        r[0] for r in
        DBSession.query(AfboLanguage.family).join(Pair, Pair.donor_pk == AfboLanguage.pk)))


class Pairs(DataTable):
    def __init__(self, *args, **kw):
        super(Pairs, self).__init__(*args, **kw)
        self.donor = aliased(AfboLanguage)
        self.recipient = aliased(AfboLanguage)

    def base_query(self, query):
        return query\
            .join(self.donor, self.donor.pk == Pair.donor_pk)\
            .join(self.recipient, self.recipient.pk == Pair.recipient_pk)

    def col_defs(self):
        return [
            RecipientCol(self, 'recipient', sTitle='Recipient language'),
            RecipientFamilyCol(
                self,
                'recipient_family',
                sTitle='Recipient family',
                choices=recipient_families(),
            ),
            DonorCol(self, 'donor', sTitle='Donor language'),
            DonorFamilyCol(
                self,
                'donor_family',
                sTitle='Donor family',
                choices=donor_families(),
            ),
            Col(self, 'count_borrowed', sTitle='# borrowed affixes', input_size='mini'),
            Col(self, 'area', choices=get_distinct_values(Pair.area)),
            LinkCol(self, 'details', model_col=Pair.name),
        ]

    def get_options(self):
        return {"iDisplayLength": 200}


class ReferencedInCol(Col):
    def format(self, item):
        return HTML.ul(
            *[HTML.li(link(self.dt.req, pair)) for pair in item.pairs],
            class_="unstyled")


class References(Sources):
    def base_query(self, query):
        query = Sources.base_query(self, query)
        return query.options(joinedload(Source.pairs))

    def col_defs(self):
        return [
            Col(self, 'author'),
            Col(self, 'year'),
            Col(self, 'title'),
            ReferencedInCol(self, 'referenced_in', bSearchable=False, bSortable=False),
            DetailsCol(self, 'details', bSearchable=False, bSortable=False),
        ]

    def get_options(self):
        return {'aaSorting': [[0, 'asc'], [1, 'asc']]}


class ValueCol(Col):
    __kw__ = {
        'sClass': 'right',
        'sTitle': '# affixes',
        'input_size': 'mini',
        'sDescription': 'Number of [affix function] affixes borrowed'}

    def format(self, item):
        return int(item.name)

    def search(self, qs):
        return filter_number(cast(Value.name, Integer), qs, type_=int)

    def order(self):
        return cast(Value.name, Integer)


class waabValues(Values):
    def __init__(self, req, model, parameter=None, pair=None):
        Values.__init__(self, req, model, parameter=parameter)

        if pair:
            self.pair = pair
        elif 'pair' in req.params:
            self.pair = Pair.get(req.params['pair'])
        else:
            self.pair = None

    def base_query(self, query):
        query = Values.base_query(self, query)
        if self.pair:
            query = query.join(ValueSet.parameter)
            return query.filter(AfboValue.pair_pk == self.pair.pk)
        if self.parameter:
            return query.join(AfboValue.pair)
        return query

    def col_defs(self):
        if self.parameter:
            return [
                LinkCol(
                    self, 'languages',
                    sTitle="Languages", get_obj=lambda i: i.pair, model_col=Pair.name),
                ValueCol(
                    self, 'value',
                    sTitle='number of borrowed %s affixes' % self.parameter.name),
                LinkToMapCol(self, 'm', get_obj=lambda i: i.pair.recipient)]
        if self.pair:
            return [
                LinkCol(
                    self, 'affix_function',
                    sTitle='Affix function',
                    get_obj=lambda i: i.valueset.parameter,
                    model_col=Parameter.name),
                ValueCol(self, 'value', sTitle='number of borrowed affixes')]
        return []

    def xhr_query(self):
        res = Values.xhr_query(self) or {}
        if self.pair:
            res['pair'] = self.pair.id
        return res

    def get_options(self):
        if self.pair or self.parameter:
            return {'bPaginate': False}


def includeme(config):
    config.register_datatable('parameters', AffixFunctions)
    config.register_datatable('pairs', Pairs)
    config.register_datatable('sources', References)
    config.register_datatable('values', waabValues)
