import pathlib

from clld.web.assets import environment

import afbo


environment.append_path(
    str(pathlib.Path(afbo.__file__).parent.joinpath('static')), url='/afbo:static/')
environment.load_path = list(reversed(environment.load_path))
