# HumHub Docker container

HumHub packaged as a simple Docker container, based on the official PHP 8.1 base image.

Developed by [Neuland Ingolstadt e.V.](https://neuland-ingolstadt.de) for the [student council of the University of Applied Sciences Ingolstadt](https://studverthi.de/).

## Deployment

Example docker-compose.yml:
```yaml
version: '3'

services:
  humhub:
    build:
      context: https://github.com/neuland-ingolstadt/humhub-docker.git
      args:
        - HUMHUB_VERSION=1.13.0
    volumes:
      - ./humhub_config:/var/www/humhub/protected/config
      - ./humhub_modules:/var/www/humhub/protected/modules
      - ./humhub_uploads:/var/www/humhub/uploads
    ports:
      - 8080:80
    environment:
      - "TZ=Europe/Berlin"
  db:
    image: mariadb:10.10
    restart: always
    volumes:
      - ./humhub_db:/var/lib/mysql
    environment:
      - "TZ=Europe/Berlin"
      - "MARIADB_RANDOM_ROOT_PASSWORD=true"
      - "MARIADB_DATABASE=humhub"
      - "MARIADB_USER=humhub"
      - "MARIADB_PASSWORD=redacted"
```
