# Releasing the AfBo clld app

- Commit and push all changes.
- Recreate the database:
```shell
clld initdb development.ini --cldf ../afbo-cldf/cldf/StructureDataset-metadata.json
```

- Run the tests:
```shell
pytest
```

- Deploy.
