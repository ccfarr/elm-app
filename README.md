## Purpose

Toy app using Elm + Postgres + Node + Docker  

Inspired by [Simple Node App with Docker](https://github.com/codeschool/WatchUsBuild-SimpleNodeAppWithDocker.git)

## Run node-api server

From `node-api` directory, build image named `node-api` using `Dockerfile`
```
docker build -t node-api .
```

View image
```
docker image ls
```

Run container from image
* -p specify ports
* --rm remove container after stopped
* --name name the container (same as image)
* -v mount volume on local machine
```
docker container run -p 8888:8888 --name node-api --rm -v ~/elm-app/node-api/src:/usr/src/app/src node-api
```
