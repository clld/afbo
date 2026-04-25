from clld_markdown_plugin import markdown

def about(request):
    #
    # FIXME: pass rendered sections of ABOUT.md CLDF markdown.
    #
    return {'sections': request.dataset.jsondata['about']}
