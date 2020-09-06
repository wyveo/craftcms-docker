[![Docker Hub; wyveo/craftcms-docker](https://img.shields.io/badge/docker%20hub-wyveo%2Fcraftcms--docker-blue.svg?&logo=docker&style=for-the-badge)](https://hub.docker.com/r/wyveo/craftcms-docker/) [![](https://badges.weareopensource.me/docker/pulls/wyveo/craftcms-docker?style=for-the-badge)](https://hub.docker.com/r/wyveo/craftcms-docker/) [![License MIT](https://img.shields.io/badge/license-MIT-blue.svg?&style=for-the-badge)](https://github.com/wyveo/nginx-php-fpm/blob/master/LICENSE)
## Introduction
This is a  [Craft 3](https://craftcms.com/3) / [Craft 2](https://craftcms.com/) base running on the [nginx-php-fpm](https://hub.docker.com/r/wyveo/nginx-php-fpm/) docker image.
#### Versioning
| Docker Tag | Git Branch | Craft Release | Database | Caching |
|-----|-------|-----|--------|--------|
| latest | craft3 | 3.5.8 | PostgreSQL 12.4 | Redis 6.0.7 |
| craft2 | craft2 | 2.7.10 | MariaDB 10.5.1 | Redis 5.0.7 |

Features:

 - Nginx 1.19.x, PHP-FPM 7.4.x, Git 2.11.0
 - imageMagick image manipulation library

## Clone repo and run
To run, clone the git repo and run `docker-compose up`:
#### [![version craft3](https://img.shields.io/badge/version-Craft%203-red.svg?&style=for-the-badge)](https://craftcms.com/3) [![](https://img.shields.io/microbadger/image-size/wyveo/craftcms-docker/craft3.svg?&style=for-the-badge)](https://microbadger.com/images/wyveo/craftcms-docker) [![](https://img.shields.io/microbadger/layers/wyveo/craftcms-docker/craft3.svg?&style=for-the-badge)](https://microbadger.com/images/wyveo/craftcms-docker)
```
$ git clone https://github.com/wyveo/craftcms-docker.git
$ cd craftcms-docker
$ sudo docker-compose up -d
```
navigate to `http://<HOSTNAME>/index.php?p=admin` to begin installing Craft 3.
NOTE: if the above url doesn't work, try navigating to `http://<HOSTNAME>/admin/install` instead.

#### [![version craft2](https://img.shields.io/badge/version-Craft%202-red.svg?&style=for-the-badge)](https://craftcms.com/2) [![](https://img.shields.io/microbadger/image-size/wyveo/craftcms-docker/craft2.svg?&style=for-the-badge)](https://microbadger.com/images/wyveo/craftcms-docker) [![](https://img.shields.io/microbadger/layers/wyveo/craftcms-docker/craft2.svg?&style=for-the-badge)](https://microbadger.com/images/wyveo/craftcms-docker)
```
$ git clone -b craft2 --single-branch https://github.com/wyveo/craftcms-docker.git
$ cd craftcms-docker
$ sudo docker-compose up -d
```
navigate to `http://<HOSTNAME>/admin` to begin installing Craft 2.


## Editing CraftCMS files
You can access the CraftCMS volume by going to the physical location of the `craftcmsdocker_craftcms-data` volume.

```shell
$ docker volume ls
DRIVER     VOLUME NAME
local      craftcmsdocker_craftcms-data
local      craftcmsdocker_craftcms-logs
local      craftcmsdocker_postgresql-data

$ docker volume inspect craftcmsdocker_craftcms-data
[
  {
    "CreatedAt": "2018-05-17T11:35:52+02:00",
    "Driver": "local",
    "Labels": null,
    "Mountpoint": "/var/lib/docker/volumes/craftcmsdocker_craftcms-data/_data"
    "Name": "craftcmsdocker_craftcms-data",
    "Options": {},
    "Scope": "local"
  }
]

$ cd /var/lib/docker/volumes/craftcmsdocker_craftcms-data/_data
```

This directory is where the CraftCMS files live, and where you can edit/update/backup whatever you need.
