# Releasing the AfBo clld app

- Install the software:
  ```shell
  git clone https://github.com/clld/afbo
  cd afbo
  pip install -e .[test]
  ```

- Recreate the database:
  ```shell
  clld initdb development.ini --cldf ../afbo-cldf/cldf/StructureDataset-metadata.json
  ```

- Run the tests:
  ```shell
  pytest
  ```

- Store the tested requirements:
  ```shell
  pip freeze > requirements.txt
  ```

- Store a db dump:
  ```shell
  pg_dump -xO afbo > afbo.sql
  ```

