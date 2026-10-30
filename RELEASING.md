# Releasing the AfBo clld app

Install the software:
```shell
git clone --branch v2.0.3 --depth 1 https://github.com/cldf-datasets/afbo afbo-cldf
git clone https://github.com/clld/afbo
cd afbo
pip install -e .[test]
```

Recreate the database:
```shell
clld initdb development.ini --cldf ../afbo-cldf/cldf/StructureDataset-metadata.json
```

Run the tests:
```shell
pytest
```

Store the tested requirements:
```shell
pip freeze > requirements.txt
```

Create a db dump (to be archived with Zenodo):
```shell
pg_dump -xO --compress gzip:9 afbo > afbo.sql.gz
```

