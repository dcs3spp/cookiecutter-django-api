# {{ cookiecutter.project_name }}

## Description

{{ cookiecutter.description }}

## Installation

    pip install {{ cookiecutter.project_name }}


## Usage

...

## For developers

### Dependencies

[Poetry](https://python-poetry.org/docs/) is used as the Python build tool and dependency manager.

Installation is detailed [here](https://python-poetry.org/docs/#installation).

After installation, configure poetry to create virtualenvs within each project's root folder:

```bash
poetry config virtualenvs.in-project = true
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

## License

{{ cookiecutter.license }}

