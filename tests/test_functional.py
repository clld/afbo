import pytest


@pytest.mark.parametrize(
    "method,path",
    [
        ('get_html', '/'),
        ('get_html', '/legal'),
        ('get_html', '/download'),
        ('get_html', '/pairs/15'),
        ('get_html', '/languages'),
        ('get_json', '/languages.geojson'),
        ('get_json', '/parameters/4.geojson'),
        ('get_dt', '/parameters'),
        ('get_dt', '/pairs'),
        ('get_dt', '/sources'),
        ('get_dt', '/values'),
    ])
def test_pages(app, method, path):
    getattr(app, method)(path)
