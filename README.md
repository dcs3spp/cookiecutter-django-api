# django-api-cookiecutter
The cookicutter template of a python package with poetry

## Usage

### Dependencies

[Poetry](https://python-poetry.org/docs/) is used as the Python build tool and dependency manager.

Installation is detailed [here](https://python-poetry.org/docs/#installation).

After installation, configure poetry to create virtualenvs within each project's root folder:

```bash
poetry config virtualenvs.in-project = true
```

### Create django docker project using this cookiecutter

```bash
$ cookiecutter https://github.com/dcs3spp/cookiecutter-django-api.git
description [desc]: description
docker_image [myimage]: testimage
email [me@example.com]: me@example.com
full_name [Your Name]: X Smith
Select license:
1 - MIT
2 - BSD
3 - GPLv3
4 - Apache Software License 2.0
5 - Not open source
Choose from 1, 2, 3, 4, 5 [1]: 2
project_name [default_project]: test_proj
Select python_version:
1 - 3.8
2 - 3.9
Choose from 1, 2 [1]: 1
```

### Setup project and compile docker image

    make setup

### Run linters, autoformat, tests etc.

    export DJANGO_SECRET_KEY=fortesting
    make pretty lint test

### Start docker-compose stack

    make docker-up

### Bump new version

    make bump_major
    make bump_minor
    make bump_patch

