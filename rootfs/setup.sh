#!/bin/bash
set -euxo pipefail

mkdir -p /var/spool/cron/crontabs
busybox crontab -u www-data /humhub.cron
