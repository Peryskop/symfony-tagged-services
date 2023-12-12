#!/usr/bin/env bash

rm -Rf var/cache/*

COMPOSER_ALLOW_SUPERUSER=1 docker-compose exec -T symfony-tagged-services-php composer self-update
COMPOSER_ALLOW_SUPERUSER=1 docker-compose exec -T symfony-tagged-services-php composer update --no-interaction --classmap-authoritative --optimize-autoloader

docker-compose exec -T symfony-tagged-services-php php bin/console doctrine:database:create --if-not-exists
docker-compose exec -T symfony-tagged-services-php php bin/console doctrine:migrations:migrate --no-interaction
