
def about(request):
    return {'sections': request.dataset.jsondata['about']}
