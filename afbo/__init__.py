import re
import functools

from pyramid.config import Configurator

from clld.web.app import menu_item, MapMarker
from clld.interfaces import IMapMarker, ILanguage, IValueSet
from clldutils import svg

# we must make sure custom models are known at database initialization!
from afbo import models
from afbo.interfaces import IPair


_ = lambda s: s
_('Pair')
_('Pairs')
_('Parameter')
_('Parameters')
_('Source')
_('Sources')
_('Languages')


SOURCE_ID_PATTERN = re.compile('__(?P<id>[a-z0-9]+)__')
COLOR_MAP = [
    (10, None, '8b4512'),
    (5, 9, 'cd661c'),
    (2, 4, 'ee7620'),
    (None, 1, 'ff7f24'),
]


class AfboMapMarker(MapMarker):
    def __call__(self, ctx, req):
        c = None
        if ILanguage.providedBy(ctx):
            c = ctx.jsondata.get('color')
        elif IValueSet.providedBy(ctx):
            c = ctx.language.jsondata.get('color')

        if c:
            return svg.data_url(svg.icon('c' + c))

        return super(AfboMapMarker, self).__call__(ctx, req)  # pragma: no cover


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    settings['sitemaps'] = 'pair parameter source'.split()
    config = Configurator(settings=settings)
    config.include('clldmpg')
    config.registry.registerUtility(AfboMapMarker(), IMapMarker)
    config.register_resource('pair', models.Pair, IPair, with_index=True)
    config.register_menu(
        ('dataset', functools.partial(menu_item, 'dataset', label='Home')),
        ('about', lambda c, r: (r.route_url('about'), 'About')),
        ('languages', functools.partial(menu_item, 'languages')),
        ('pairs', functools.partial(menu_item, 'pairs')),
        ('parameters', functools.partial(menu_item, 'parameters')),
        ('sources', functools.partial(menu_item, 'sources')),
    )
    return config.make_wsgi_app()
