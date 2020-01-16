import pytest

from afbo.__main__ import main


def test_initdb():
    with pytest.raises(SystemExit):
        main(['initdb', '-h'])
