#!/bin/bash
django-admin startproject $SITE_NAME

     python manage.py makemigrations && \
     python manage.py migrate && \
     python manage.py createsuperuser --no-input && \
     python manage.py makemigrations && \
     python manage.py migrate


mv ./recurent_entrypoint.sh ./entrypoint.sh
