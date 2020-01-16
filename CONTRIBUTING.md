Contributing
------------

Install the development environment:

```sh
$ pip install virtualenv  # might require sudo/admin privileges
$ git clone https://github.com/clld/clld.git  # you may also clone a suitable fork
$ cd afbo
$ python -m virtualenv .venv
$ source .venv/bin/activate  # Windows: .venv\Scripts\activate.bat
$ pip install -r requirements.txt  # installs the cloned version with dev-tools in development mode
```

and initialize it, by running 
```
afbo-app initdb --repos PATH/TO/CLONE/OF/cldf-datasets/afbo
```
Now you should be able to run the tests:

```sh
$ pytest
```
