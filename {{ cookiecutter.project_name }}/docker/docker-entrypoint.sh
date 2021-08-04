#!/bin/sh

set -e

echo "Making migrations..."
django-admin makemigrations

echo "Running migrations..."
django-admin migrate

id
echo "Making staticfiles..."
mkdir -p /opt/venv/lib/python3.8/site-packages/default_project/staticfiles
echo "Displaying permissions from staticfiles"
ls -l /opt/venv/lib/python3.8/site-packages/default_project

echo "Collecting static files..."
django-admin collectstatic --noinput

# requires gnu text tools
# echo "Compiling translation messages..."
# django-admin compilemessages

# echo "Making translation messages..."
# django-admin makemessages

if [ "$DJANGO_SUPERUSER_USERNAME" ]
then
    echo "Creating django superuser"
    django-admin createsuperuser \
        --noinput \
        --username $DJANGO_SUPERUSER_USERNAME \
        --email $DJANGO_SUPERUSER_EMAIL
fi

exec gunicorn \
  --bind 0.0.0.0:${iDJANGO_PORT:-"5000"} \
  --forwarded-allow-ips='*' \
  {{ cookiecutter.project_name }}.main.wsgi:application

