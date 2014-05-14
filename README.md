# Docker Playground

This repo has everything you need to get started with Docker. It
includes a Vagrantfile for a virtual machine that will serve as our
docker host and a couple of Dockerfiles to show how everything works.


By the end, it will set up a couple images that can be used to run a
rails application in a container.


## Commands to Build Everything

```shell
vagrant up

export DOCKER_HOST=tcp://localhost:4243

for type (
  base
  ruby
  rails
) docker build -t playground/$type $type
```

## Command to get MySQL Running

```shell
docker pull orchardup/mysql
docker run -d -P --name orchard_mysql -e MYSQL_ROOT_PASSWORD=<PASSWORD HERE> orchardup/mysql
```

## Commands to Run Everything

```shell
docker run -d --link orchard_mysql:db -P --name railsapp playground/rails
```


## Commands to Stop Everything

```shell
docker stop railsapp orchard_mysql
vagrant halt
```

