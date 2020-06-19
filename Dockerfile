FROM python:3.6-slim-buster
#ENV PYTHONUNBUFFERED 1
ENV SITE_NAME="mysite"\
    DJANGO_SUPERUSER_USERNAME="admin" \
    DJANGO_SUPERUSER_PASSWORD="admin"
    
RUN apt-get update \
  && apt-get upgrade -y \
  && apt install -y git gcc make automake  \
  && mkdir -p /usr/src/app \
  && rm -fr /var/lib/apt/lists/* 

WORKDIR /usr/src/app

COPY ./requirements.txt ./requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

RUN django-admin startproject SITE_NAME && python manage.py makemigrations && python manage.py migrate && django-admin createsuperuser --username DJANGO_SUPERUSER_USERNAME --noinput && python manage.py makemigrations && python manage.py migrate


EXPOSE 8000

ENTRYPOINT ["python", "manage.py"]

CMD ["runserver", "0.0.0.0:8000"]

