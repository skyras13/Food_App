#!/bin/bash

sed -i -e 's/\${localhost}/'"$DOMAIN_NAME"'/' /etc/nginx/sites-enabled/default

# change localConfig owner and perms
chown www-data:www-data /var/www/html/config/config.php
chmod 440 /var/www/html/config/config.php

# # Start Nginx
service nginx start

exec "$@"