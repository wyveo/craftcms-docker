FROM wyveo/nginx-php-fpm:php73

LABEL maintainer colin@wyveo.com

# Remove existing webroot, configure PHP session handler for Redis, install postgresql-client (pg_dump)
RUN rm -rf /usr/share/nginx/* && \
sed -i -e "s/memory_limit\s*=\s*.*/memory_limit = 256M/g" ${php_conf} && \
sed -i -e "s/session.save_handler\s*=\s*.*/session.save_handler = redis/g" ${php_conf} && \
sed -i -e "s/;session.save_path\s*=\s*.*/session.save_path = \"\${REDIS_PORT_6379_TCP}\"/g" ${php_conf} && \
wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' && \
apt-get update && \
apt-get install -y postgresql-client-10

# Create Craft project
RUN composer create-project craftcms/craft /usr/share/nginx/

# Install the yii2-redis library
RUN composer require --prefer-dist yiisoft/yii2-redis -d /usr/share/nginx/

# Add default craft cms nginx config
ADD ./default.conf /etc/nginx/conf.d/default.conf

# Add database environment
ADD .env.sample /usr/share/nginx/.env

# Add default config
ADD ./config /usr/share/nginx/config

RUN chown -Rf nginx:nginx /usr/share/nginx/

EXPOSE 80
