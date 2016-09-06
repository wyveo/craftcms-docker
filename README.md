[![Docker Hub; wyveo/craftcms-docker](https://img.shields.io/badge/docker%20hub-%20wyveo%2Fcraftcms--docker-blue.svg)](https://hub.docker.com/r/wyveo/craftcms-docker/) [![craftcms latest](https://img.shields.io/badge/craftcms-latest-red.svg)](https://craftcms.com/) ![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)
## Introduction
This is a  [Craft CMS](https://craftcms.com/) base running on our [nginx-php-fpm](https://hub.docker.com/r/wyveo/nginx-php-fpm/) docker image.

Features:

 - Nginx 1.11.x, PHP-FPM 7.0.x
 - Redis caching
 - imageMagick image manipulation library

## Building from source
To build from source, clone the git repo and run docker-compose build:
```
$ git clone https://github.com/wyveo/craftcms-docker.git
$ cd craftcms-docker
$ sudo docker-compose build
```

## Running
To run the container:
```
$ sudo docker-compose up
```
navigate to `your-ip-address/admin` to see Craft's installation page.
