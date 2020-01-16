from clld.web.maps import Map, Legend
from clld.web.util.htmllib import HTML, literal
from clld.web.util.helpers import marker_img
from clldutils import svg

from afbo import COLOR_MAP


class LanguagesMap(Map):
    def get_options(self):
        return {'no_popup': True}

    def get_legends(self):
        def html_label(color, text):
            return HTML.label(
                marker_img(svg.data_url(svg.icon('c' + color))),
                literal(text),
                style='margin-left: 1em; margin-right: 1em;')

        values = []
        for _min, _max, color in COLOR_MAP:
            if not _max:
                label = '%s or more' % _min
            elif not _min:
                label = '%s' % _max
            else:
                label = '-'.join(map(str, [_min, _max]))

            values.append(html_label(color, label + ' affixes'))

        values.append(html_label('ffffff', 'donor language'))
        yield Legend(self, 'values', values, label='Legend')


def includeme(config):
    config.register_map('languages', LanguagesMap)
