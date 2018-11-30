[![Docker Hub; wyveo/craftcms-docker](https://img.shields.io/badge/docker%20hub-%20wyveo%2Fcraftcms--docker-blue.svg)](https://hub.docker.com/r/wyveo/craftcms-docker/) ![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)
## Introduction
This is a  [Craft 3](https://craftcms.com/3) / [Craft 2](https://craftcms.com/) base running on the [nginx-php-fpm](https://hub.docker.com/r/wyveo/nginx-php-fpm/) docker image.
#### Versioning
| Docker Tag | Git Branch | Craft Release | Database | Caching |
|-----|-------|-----|--------|--------|
| latest | craft3 | 3.0.33 | PostgreSQL 10.6 | Redis 4.0.11 |
| craft2 | craft2 | 2.7.3 | MariaDB 10.3.10 | Redis 4.0.11 |

Features:

 - Nginx 1.15.x, PHP-FPM 7.2.x, Git 2.11.0
 - imageMagick image manipulation library

## Clone repo and run
To run, clone the git repo and run `docker-compose up`:
#### Craft 3 - [![version craft3](https://img.shields.io/badge/version-craft3-blue.svg)](https://craftcms.com/3) [![](https://images.microbadger.com/badges/image/wyveo/craftcms-docker:craft3.svg)](https://microbadger.com/images/wyveo/craftcms-docker:craft3 "Get your own image badge on microbadger.com")
```
$ git clone https://github.com/wyveo/craftcms-docker.git
$ cd craftcms-docker
$ sudo docker-compose up -d
```
navigate to `http://<HOSTNAME>/index.php?p=admin` to begin installing Craft 3.
NOTE: if the above url doesn't work, try navigating to `http://<HOSTNAME>/admin/install` instead.

#### Craft 2 - [![version craft2](https://img.shields.io/badge/version-craft2-blue.svg)](https://craftcms.com) [![](https://images.microbadger.com/badges/image/wyveo/craftcms-docker:craft2.svg)](https://microbadger.com/images/wyveo/craftcms-docker:craft2 "Get your own image badge on microbadger.com")
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
