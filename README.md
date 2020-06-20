# django_docker_env

essa imagem vai criar um ambiente de desenvolvimento rapido para o django 3 com bootstrap 4


'SITE_NAME' nome do site inicial<br>
'DJANGO_SUPERUSER_USERNAME' nome do usuario superuser<br>
'DJANGO_SUPERUSER_PASSWORD' senha do usuario superuser<br>
'DJANGO_SUPERUSER_EMAIL' email do usuario superuser

SITE_NAME="mysite" #default <br>
DJANGO_SUPERUSER_USERNAME="admin" #default <br>
DJANGO_SUPERUSER_PASSWORD="admin" #default <br>
DJANGO_SUPERUSER_EMAIL="admin@example.com"<br>

o diretorio de execução da aplicação está localizado em /usr/src/app/$SITE_NAME,o que quer dizer que o diretorio depende da variavel SITE_NAME que se não for definida será "mysite" , isso deve ser levado em conta durante a criação do container caso queira que ele compartilhe seus dados com a maquina host

## Build

```
$ docker build -t site_name . --build-arg DJANGO_SUPERUSER_USERNAME="user" --build-arg DJANGO_SUPERUSER_PASSWORD="password" --build-arg SITE_NAME="site_name" --build-arg DJANGO_SUPERUSER_EMAIL="admin@example.com"
```

## Run

```
$ docker run -d -p 8000:8000 site_name SITE_NAME="site_name" DJANGO_SUPERUSER_USERNAME="user" DJANGO_SUPERUSER_PASSWORD="password" DJANGO_SUPERUSER_EMAIL="admin@example.com" -v /my/app:/usr/src/app/site_name
```


## Create
```
$ docker create --name site_name -p 8000:8000 SITE_NAME="site_name" DJANGO_SUPERUSER_USERNAME="user" DJANGO_SUPERUSER_PASSWORD="password" DJANGO_SUPERUSER_EMAIL="admin@example.com" -v /my/app:/usr/src/app/site_name
```
