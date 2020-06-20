FROM python:3.6-slim-buster
ENV PYTHONUNBUFFERED 1
ENV SITE_NAME="mysite"\
    DJANGO_SUPERUSER_USERNAME="admin" \
    DJANGO_SUPERUSER_PASSWORD="admin" \
    DJANGO_SUPERUSER_EMAIL=""
    
RUN apt-get update \
  && apt install -y git gcc make automake python3-pandas zlibc \
  && mkdir -p /usr/src/app \
  && rm -fr /var/lib/apt/lists/* 

ADD ./requirements.txt ./requirements.txt

RUN pip install --no-cache-dir -r ./requirements.txt;rm ./requirements.txt;cd /usr/src/app/;\
django-admin startproject $SITE_NAME

VOLUME /usr/src/app/${SITE_NAME}/

WORKDIR /usr/src/app/${SITE_NAME}/

RUN  python manage.py makemigrations && python manage.py migrate && python manage.py createsuperuser --username $DJANGO_SUPERUSER_USERNAME --noinput --email DJANGO_SUPERUSER_EMAIL && python manage.py makemigrations && python manage.py migrate


EXPOSE 8000

ENTRYPOINT ["python", "manage.py"]

CMD ["runserver", "0.0.0.0:8000"]
