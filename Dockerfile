FROM wyveo/nginx-php-fpm:latest

MAINTAINER Colin Wilson "colin@wyveo.com"

# Set craft cms version
ENV CRAFTURL 'https://craftcms.com/latest.zip?accept_license=yes'

# Remove existing webroot files
RUN rm -rf /usr/share/nginx/html/*

# Download the latest Craft, save as craft.zip in current folder
RUN wget $CRAFTURL -O "/craft.zip"

# Extract craft to webroot
RUN unzip -qqo /craft.zip 'craft/*' -d /usr/share/nginx/ && \
    unzip -qqoj /craft.zip 'public/index.php' -d /usr/share/nginx/html

# Remove default template files
RUN rm -rf /usr/share/nginx/craft/templates/*

# Add default craft cms nginx config
ADD ./default.conf /etc/nginx/conf.d/default.conf

# Add default config
ADD ./config /usr/share/nginx/craft/config

# Cleanup
RUN rm /craft.zip

RUN chown -Rf nginx:nginx /usr/share/nginx/

EXPOSE 80
