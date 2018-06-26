FROM wyveo/nginx-php-fpm:latest

MAINTAINER Ted Kuo "ted@grana.com"

# Remove existing webroot, configure PHP session handler for Redis, install postgresql-client (pg_dump)
RUN rm -rf /usr/share/nginx/* && \
sed -i -e "s/memory_limit\s*=\s*.*/memory_limit = 256M/g" ${php_conf} && \
sed -i -e "s/session.save_handler\s*=\s*.*/session.save_handler = redis/g" ${php_conf} && \
sed -i -e "s/;session.save_path\s*=\s*.*/session.save_path = \"\${REDIS_PORT_6379_TCP}\"/g" ${php_conf} && \
apt-get update && \
apt-get install -y vim zsh && \
# Install oh-my-zsh for easier development for developers. Force true in return code, because it sometimes returns non-zero code unnecessarily
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" || true


ENV NODE_VERSION 9.8.0
ENV NVM_DIR /usr/local/nvm
RUN apt install -y build-essential libssl-dev \
    # install ruby, and all necessary dependencies required by gulp commands
    && apt-get install -y ruby ruby-dev && gem install rake scss-lint \
    && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash \
    # install nvm, npm, and all the fundamental binaries required for development, bower + gulp
    && chmod a+x $NVM_DIR/nvm.sh \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm use --delete-prefix v$NODE_VERSION \
    && echo '{"allow_root":true }' > $HOME/.bowerrc \
    && npm install --global gulp-cli \
    && npm install --global bower \
    && npm install --save-dev gulp@next
ENV PATH $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

# Clone from the existing GRANA/cms github repo, and install it under /usr/share/nginx
WORKDIR /usr/share/nginx/
RUN git clone https://github.com/GRANA/cms.git /usr/share/nginx/ && cd /usr/share/nginx/ && \
git checkout d30b42f215111ea6f384ee98dbef46467d094977 && \
composer install

# Install the yii2-redis library
RUN composer require --prefer-dist yiisoft/yii2-redis -d /usr/share/nginx/

# Add default craft cms nginx config
ADD ./default.conf /etc/nginx/conf.d/default.conf

# Add default config
ADD ./config /usr/share/nginx/config

ADD ./bin/install_dep.sh /usr/local/bin/install_dep.sh

# Change owner to nginx to ensure web server has write access to all the files.
RUN chown -Rf nginx:nginx /usr/share/nginx/

EXPOSE 80
