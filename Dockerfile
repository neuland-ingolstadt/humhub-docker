FROM php:8.1-apache

ARG HUMHUB_VERSION

ENV DEBIAN_FRONTEND noninteractive

COPY rootfs/prepare.sh /
RUN /prepare.sh

COPY rootfs/download.sh /
RUN /download.sh

COPY rootfs /
RUN /setup.sh
USER www-data

VOLUME /var/www/html/protected/config
VOLUME /var/www/html/protected/modules
VOLUME /var/www/html/protected/runtime
VOLUME /var/www/html/uploads

USER root
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

EXPOSE 80/tcp
