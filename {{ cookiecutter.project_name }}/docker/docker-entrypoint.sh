#!/bin/sh

set -e

echo "Making migrations..."
django-admin makemigrations

echo "Running migrations..."
django-admin migrate

echo "Making staticfiles..."
mkdir -p "/opt/venv/lib/python{{ cookiecutter.python_version }}/site-packages/{{ cookiecutter.project_name }}/staticfiles"

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
  --bind 0.0.0.0:5000 \
  --forwarded-allow-ips='*' \
  --worker-tmp-dir /dev/shm \
  --workers=4 \
  --threads=1 \
  --worker-class=gthread \
  {{ cookiecutter.project_name }}.main.wsgi:application

exec "$@"

