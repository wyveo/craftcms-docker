## Introduction
This repo contains instrumentation to automate the creation of a GRANA customised [CMS]() development environment. 
 
## Pre-requisites
Before you start, please ensure `docker-sync` and `docker` are installed in your local env.
- [docker-sync](http://docker-sync.io/)
- [docker community edition](https://www.docker.com/community-edition)

## Clone repo and run
To run, clone the git repo and run `docker-sync-stack up`.  
```
$ git clone https://github.com/grana/craftcms-docker.git
$ cd craftcms-docker
$ sudo docker-sync-stack start 
```
Under the hood, `docker-sync-stack up` starts a new volume to sync your local git repo into the `cms` container, and then calls `docker-compose up` to instrument creation of the `cms`, `redis`, `mysql` containers to host the dev environment.

Navigate to `http://localhost/` to begin.

## Edit CraftCMS files
You can edit the files in your local repo directly, they will be automatically sync'ed into docker container. 

## Features - what this project is reference from.
 - [Craft 3 Docker](https://github.com/wyveo/craftcms-docker)
 - [Craft 3](https://craftcms.com/3)
 - base running on the [nginx-php-fpm](https://hub.docker.com/r/wyveo/nginx-php-fpm/)
 - Nginx 1.15.x, PHP-FPM 7.2.x / 7.1.x, Git 2.11.0
 - imageMagick image manipulation library
