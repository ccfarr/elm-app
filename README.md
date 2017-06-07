## Purpose

Build a simple voting app using Elm + Postgres + Node + Docker  

Inspired by [Simple Node App with Docker](https://github.com/codeschool/WatchUsBuild-SimpleNodeAppWithDocker.git)

## TODO

- Post vote changes to db
- Add more comments to Main.elm

## Installation Overview

1. Install Docker, e.g. [for Mac](https://store.docker.com/editions/community/docker-ce-desktop-mac)

2. Clone this repository to your local machine: `git clone https://github.com/ccfarr/elm-app.git`

3. Follow **Run node-api server** directions below

4. Follow **Run pg-database server** directions below

5. Follow **Run elm-front-end** directions below

6. Visit [http://localhost:4000](http://localhost:4000)

7. If you see the app, **SUCCESS!**

*You should see seven sandwiches and three tacos. These are the default values in the database.*

## Run `node-api` server

From `node-api` directory, build image named `node-api`
```
docker build -t node-api .
```

View image
```
docker image ls
```

Run container from image
```
docker container run -p 8888:8888 --name node-api --rm -v ~/elm-app/node-api/src:/usr/src/app/src node-api
```

## Run `pg-database` server

From `pg-database` directory, build image named `pg-database`
```
docker build -t pg-database .
```

Run container from image
```
docker container run -p 9000:5432 --name pg-database --rm pg-database
```

## Run `elm-front-end`

From `elm-front-end` directory, build image named `elm-front-end`
```
docker build -t elm-front-end .
```

Run container from image
```
docker container run -p 4000:4000 --name elm-front-end --rm -v ~/elm-app/elm-front-end/src:/usr/src/app/src elm-front-end
```

Wait a bit until gulp makes the elm app, should see something like this
```
[13:35:19] elm make:  Starting downloads...

  ● elm-lang/virtual-dom 2.0.4
  ● elm-lang/http 1.0.0
  ● elm-lang/core 5.1.1
  ● elm-lang/html 2.0.0

Packages configured successfully!
Success! Compiled 41 modules.
Successfully generated bundle.js

[13:35:19] Finished 'elm' after 9.82 s
```

## Directory structure

```
elm-app - project folder
  |
  +-- elm-front-end - elm app directory
  |  |
  |  +-- src - source code directory
  |  |  |
  |  |  +-- Main.elm - elm source code
  |  |  |
  |  |  +-- OLD-Main.elm - local app
  |  |
  |  +-- Dockerfile - builds image
  |  |
  |  +-- elm-package.json - elm packages
  |  |
  |  +-- gulpfile.js - sets up a watch and server
  |  |
  |  +-- index.html - entrypoint into app
  |  |
  |  +-- package.json - required npm modules
  |  |
  +-- node-api - node api server directory
  |  |
  |  +-- src - source code directory
  |  |  |
  |  |  +-- server.js - node source code
  |  |
  |  +-- Dockerfile - builds image
  |  |
  |  +-- package.json - required npm modules
  |  |
  +-- pg-database - pg database directory
  |  |
  |  +-- Dockerfile - builds image
  |  |
  |  +-- seed.sql - seeds db
  |
  +-- README.MD - this file
```

## Cleanup

Stop containers

```
docker stop node-api pg-database elm-front-end
```

Remove images (if desired)

```
docker image rm node-api pg-database elm-front-end
```

## Docker command line parameters

* `-p` specify ports
* `--rm` remove container after stopped
* `--name` name the container (same as image)
* `-v` mount volume on local machine

## Interact with database

Run postgres client from container prompt
```
docker container exec -it pg-database psql -U postgres
```

* `\l` - list databases
* `\dt` - list tables
* `\q` - quit postgres client

## Ports and endpoints

* [http://localhost:8888/json](http://localhost:8888/json) - returns info from db in json format

```
[
  {
    "id": 1,
    "option_name": "sandwiches",
    "number_of_votes": 7
  },
  {
    "id": 2,
    "option_name": "tacos",
    "number_of_votes": 3
  }
]
```

* [http://localhost:4000](http://localhost:4000) - elm app

* `9000` - port for postgres db server

## Git cheatsheet

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

Commit changes
```
git commit -am "some message"
```

Merge changes back to master branch
```
git checkout master
git merge json-example
```

Push to github
```
git push
```

Checkout master branch discarding local changes
```
git checkout -f master
```

## Resources

* [Elm screencasts](http://knowthen.com)

* [Simple Node App with Docker](https://github.com/codeschool/WatchUsBuild-SimpleNodeAppWithDocker.git)
