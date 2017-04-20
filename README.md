[![Docker Hub; wyveo/craftcms-docker](https://img.shields.io/badge/docker%20hub-%20wyveo%2Fcraftcms--docker-blue.svg)](https://hub.docker.com/r/wyveo/craftcms-docker/) [![](https://images.microbadger.com/badges/image/wyveo/craftcms-docker:craft3beta.svg)](https://microbadger.com/images/wyveo/craftcms-docker:craft3beta "Get your own image badge on microbadger.com") [![version craft3beta](https://img.shields.io/badge/version-craft3beta-blue.svg)](https://craftcms.com/3) ![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)
## Introduction
This is a [Craft 3 Beta CMS](https://craftcms.com/3) base running on our [nginx-php-fpm](https://hub.docker.com/r/wyveo/nginx-php-fpm/) docker image.

Features:

 - Nginx 1.11.x, PHP-FPM 7.1.x, PostgreSQL 9.6.x
 - Redis caching
 - imageMagick image manipulation library

## Clone repo and run from source
To run, clone the git repo and run `docker-compose up`:
```
$ git clone -b craft3beta --single-branch https://github.com/wyveo/craftcms-docker.git
$ cd craftcms-docker
$ sudo docker-compose up -d
```

navigate to `http://<HOSTNAME>/index.php?p=admin` to begin installing Craft 3 Beta.
