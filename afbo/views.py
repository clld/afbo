from clld.web.util import glottolog


def about(request):
    #
    # FIXME: pass rendered sections of ABOUT.md CLDF markdown.
    #
    return {'sections': request.dataset.jsondata['about']}
