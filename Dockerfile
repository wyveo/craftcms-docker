FROM wyveo/nginx-php-fpm:php72

MAINTAINER Colin Wilson "colin@wyveo.com"

# Set craft cms version
ENV CRAFT_VERSION=2.7 CRAFT_BUILD=10

ENV CRAFT_ZIP=Craft-$CRAFT_VERSION.$CRAFT_BUILD.zip

# Remove default webroot files & set PHP session handler to Redis
RUN rm -rf /usr/share/nginx/html/* && \
sed -i -e "s/memory_limit\s*=\s*.*/memory_limit = 256M/g" ${php_conf} && \
sed -i -e "s/session.save_handler\s*=\s*.*/session.save_handler = redis/g" ${php_conf} && \
sed -i -e "s/;session.save_path\s*=\s*.*/session.save_path = \"\${REDIS_PORT_6379_TCP}\"/g" ${php_conf}

# Download the latest Craft (https://craftcms.com/support/download-previous-versions)
ADD https://download.buildwithcraft.com/craft/$CRAFT_VERSION/$CRAFT_VERSION.$CRAFT_BUILD/$CRAFT_ZIP /tmp/$CRAFT_ZIP

# Extract craft to webroot & remove default template files
RUN unzip -qqo /tmp/$CRAFT_ZIP 'craft/*' -d /usr/share/nginx/ && \
    unzip -qqoj /tmp/$CRAFT_ZIP 'public/index.php' -d /usr/share/nginx/html

# Add default craft cms nginx config
ADD ./default.conf /etc/nginx/conf.d/default.conf

# Add default config
ADD ./config /usr/share/nginx/craft/config

# Cleanup
RUN rm /tmp/$CRAFT_ZIP && \
chown -Rf nginx:nginx /usr/share/nginx/

EXPOSE 80
