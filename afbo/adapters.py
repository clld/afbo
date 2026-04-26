from clld.web.adapters.geojson import GeoJsonParameter, GeoJsonLanguages
from clld.interfaces import IParameter, ILanguage, IIndex


class GeoJsonAffixFunction(GeoJsonParameter):
    def feature_properties(self, ctx, req, valueset):
        return {'label': '%s: %s' % (
            valueset.language, ', '.join(v.format() for v in valueset.values))}


class GeoJsonAfboLanguages(GeoJsonLanguages):
    def feature_properties(self, ctx, req, language):
        if language.donor_assocs:
            return {'zindex': 1000}


def includeme(config):
    config.register_adapter(GeoJsonAffixFunction, IParameter)
    config.registry.registerAdapter(
        GeoJsonAfboLanguages, (ILanguage,), IIndex, name=GeoJsonLanguages.mimetype)
