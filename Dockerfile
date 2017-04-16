FROM wyveo/nginx-php-fpm:latest

MAINTAINER Colin Wilson "colin@wyveo.com"

# Composer - https://hub.docker.com/r/composer/composer/
ENV COMPOSER_VERSION 1.4.1

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
  && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
  && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"

RUN php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION} && rm -rf /tmp/composer-setup.php

# Remove existing webroot
RUN rm -rf /usr/share/nginx/*

# Create Craft project
RUN composer create-project craftcms/craft /usr/share/nginx/ -s beta

# Add default craft cms nginx config
ADD ./default.conf /etc/nginx/conf.d/default.conf

# Add database environment
ADD ./config/.env.sample /usr/share/nginx/.env

RUN chown -Rf nginx:nginx /usr/share/nginx/

EXPOSE 80
