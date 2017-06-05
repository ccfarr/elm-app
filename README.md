## Purpose

Build "toy" app using Elm + Postgres + Node + Docker  

Inspired by [Simple Node App with Docker](https://github.com/codeschool/WatchUsBuild-SimpleNodeAppWithDocker.git)

### Run node-api server

From `node-api` directory, build image named `node-api`
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

### Run pg-database server

From `pg-database` directory, build image named `pg-database`
```
docker build -t pg-database .
```

Run container from image
```
docker container run -p 9000:5432 --name pg-database --rm pg-database
```

### Interact with database

Run postgres client from container prompt
```
docker container exec -it pg-database psql -U postgres
```

* `\l` - list databases
* `\dt` - list tables
* `\q` - quit postgres client

### Git cheatsheet

Get started
```
git init
git add .
git commit -m "initial commit"
```

*After creating new repository on github*
```
git remote add origin git@github.com:ccfarr/elm-app.git
git push -u origin master
```

Make a topic branch
```
git checkout -b json-example
```

Commit changes and push to github
```
git commit -am "some message"
git push
```

Merge changes back to master branch
```
git checkout master
git merge json-example
```
