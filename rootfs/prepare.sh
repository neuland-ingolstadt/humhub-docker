#!/bin/bash
set -euxo pipefail

apt update
apt install -y -o DPkg::Options::="--force-confold" supervisor busybox-static build-essential libmagickwand-dev libzip-dev libldap2-dev

a2enmod rewrite

pecl install imagick apcu
docker-php-ext-enable imagick apcu
docker-php-ext-configure gd --with-jpeg
docker-php-ext-install gd intl exif zip ldap pdo pdo_mysql
