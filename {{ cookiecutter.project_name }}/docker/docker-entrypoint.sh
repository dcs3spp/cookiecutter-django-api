#!/bin/sh

set -e

exec gunicorn --bind 0.0.0.0:5000 --forwarded-allow-ips='*' {{ cookiecutter.project_name }}.main.wsgi:application

