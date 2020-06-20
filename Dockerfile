FROM python:3.6-slim-buster
ENV PYTHONUNBUFFERED 1
ENV SITE_NAME="mysite"\
    DJANGO_SUPERUSER_USERNAME="admin" \
    DJANGO_SUPERUSER_PASSWORD="admin" \
    DJANGO_SUPERUSER_EMAIL="admin@example.com"
    
RUN apt-get update 
RUN apt-get install -y git gcc make automake python3-pandas zlib1g-dev libjpeg-dev \
  && mkdir -p /usr/src/app \
  && rm -fr /var/lib/apt/lists/* \
  apt-get autoremove && apt clean

ADD ./requirements.txt ./requirements.txt

RUN pip install --no-cache-dir -r ./requirements.txt && \
    rm ./requirements.txt && \
    cd /usr/src/app/
    
VOLUME /usr/src/app/

WORKDIR /usr/src/app/

ADD ./entrypoint.sh ./

ADD ./recurent_entrypoint.sh ./

EXPOSE 8000

ENTRYPOINT "./entrypoint.sh"
