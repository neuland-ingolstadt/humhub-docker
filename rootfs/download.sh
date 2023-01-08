#!/bin/bash
set -euxo pipefail

cd /tmp
curl -O https://download.humhub.com/downloads/install/humhub-$HUMHUB_VERSION.tar.gz
tar xvfz humhub-$HUMHUB_VERSION.tar.gz
rm -rf /var/www/html && mv humhub-$HUMHUB_VERSION /var/www/html
cp /var/www/html/.htaccess.dist /var/www/html/.htaccess
chown -R www-data:www-data /var/www/html

sed -i '/YII_DEBUG/s/^\/*/\/\//' /var/www/html/index.php
sed -i '/YII_ENV/s/^\/*/\/\//' /var/www/html/index.php
