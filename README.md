# docker-django-mysite

essa imagem vai criar um ambiente de desenvolvimento rapido para o django 3 com bootstrap 4


'SITE_NAME' nome do site inicial<br>
'DJANGO_SUPERUSER_USERNAME' nome do usuario superuser<br>
'DJANGO_SUPERUSER_PASSWORD' senha do usuario superuser

SITE_NAME="mysite" #default <br>
DJANGO_SUPERUSER_USERNAME="admin" #default <br>
DJANGO_SUPERUSER_PASSWORD="admin" #default <br>

## Build

```
$ docker build -t mysite .
```

## Run

```
$ docker run -d -p 8000:8000 mysite SITE_NAME="site name" DJANGO_SUPERUSER_USERNAME="user" DJANGO_SUPERUSER_PASSWORD="password"
```
