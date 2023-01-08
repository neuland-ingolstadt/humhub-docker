#!/bin/bash
set -euxo pipefail

apt update
apt install -y -o DPkg::Options::="--force-confold" supervisor busybox-static libmagickwand-dev libzip-dev libldap2-dev

pecl install imagick apcu
docker-php-ext-enable imagick apcu
docker-php-ext-configure gd --with-jpeg
docker-php-ext-install gd intl exif zip ldap pdo pdo_mysql

rm -rf /var/lib/apt/lists/*

a2enmod rewrite
