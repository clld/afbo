from clld.db.meta import DBSession
from clld.db.models import common

from .models import Pair


def dataset_detail_html(context=None, request=None, **kw):
    pairs = DBSession.query(Pair).all()
    return {
        'count_pairs': len(pairs),
        'count_borrowed_affixes': sum(p.count_borrowed for p in pairs),
        'count_sources': DBSession.query(common.Source).count(),
    }

