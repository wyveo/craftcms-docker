#!/usr/bin/env bash

## This is a script that gels the environment with the code. It depends on the latest dependencies json(s) to
## generate the dependencies required.

# The default shell is zsh, force loading of .bashrc by Docker, first to ensure npm is available.
source /root/.bashrc

# First, install all dependencies specified in composer.json
cd /usr/share/nginx
composer install

# Second, trigger bower install to install style-guide (front-end) dependencies.
bower install

# Install requirements for minification, js / css linting, and monitoring via gulp.
npm install