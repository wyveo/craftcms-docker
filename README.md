[![Docker Hub; wyveo/craftcms-docker](https://img.shields.io/badge/docker%20hub-%20wyveo%2Fcraftcms--docker-blue.svg)](https://hub.docker.com/r/wyveo/craftcms-docker/) ![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)
## Introduction
This is a  [Craft CMS](https://craftcms.com/) / [Craft 3 Beta](https://craftcms.com/3) base running on our [nginx-php-fpm](https://hub.docker.com/r/wyveo/nginx-php-fpm/) docker image.
#### Versioning
| Docker Tag | Git Branch | Craft Release | Database | Caching |
|-----|-------|-----|--------|--------|
| latest | master | 2.6.2987 | MariaDB 10.2.27 | Redis 3.2.9 |
| craft3beta | craft3beta | 3.0.0-beta.22 | PostgreSQL 9.6.3 | Memcached 1.4.39 |

Features:

 - Nginx 1.13.x, PHP-FPM 7.1.x, Git 2.1.4
 - imageMagick image manipulation library

## Clone repo and run
To run, clone the git repo and run `docker-compose up`:
#### Craft - [![version latest](https://img.shields.io/badge/version-latest-blue.svg)](https://craftcms.com/) [![](https://images.microbadger.com/badges/image/wyveo/craftcms-docker.svg)](http://microbadger.com/images/wyveo/craftcms-docker "Get your own image badge on microbadger.com")
```
$ git clone https://github.com/wyveo/craftcms-docker.git
$ cd craftcms-docker
$ sudo docker-compose up -d
```

navigate to `http://<HOSTNAME>/admin` to begin installing Craft.

#### Craft 3 Beta - [![version craft3beta](https://img.shields.io/badge/version-craft3beta-blue.svg)](https://craftcms.com/3) [![](https://images.microbadger.com/badges/image/wyveo/craftcms-docker:craft3beta.svg)](https://microbadger.com/images/wyveo/craftcms-docker:craft3beta "Get your own image badge on microbadger.com")
```
$ git clone -b craft3beta --single-branch https://github.com/wyveo/craftcms-docker.git
$ cd craftcms-docker
$ sudo docker-compose up -d
```

navigate to `http://<HOSTNAME>/index.php?p=admin` to begin installing Craft 3 Beta.
