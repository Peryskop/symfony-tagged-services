OS := $(shell uname)

install:
	sh ./install.sh

build_dev_local:
	docker-compose -f docker-compose.yaml -f docker-compose-dev.local.yaml build

start_dev_local:
ifeq ($(OS),Darwin)
	docker volume create --name=symfony-tagged-services-api-vendor-sync
	docker volume create --name=symfony-tagged-services-api-app-sync
	docker-compose -f docker-compose.yaml -f docker-compose-dev.local.yaml up -d --remove-orphans
	docker-sync start -f
endif

stop_dev_local:
ifeq ($(OS),Darwin)
	docker-compose stop
	docker-sync stop
endif

sync_clean:
ifeq ($(OS),Darwin)
	docker-sync clean
endif

copy_vendor:
	rm -r ./vendor
	docker-compose cp symfony-cqrs-php:/app/vendor/ ./vendor

build_dev:
	docker-compose -f docker-compose.yaml -f docker-compose-dev.yaml build

start_dev:
	docker-compose -f docker-compose.yaml -f docker-compose-dev.yaml up -d

execphp:
	docker-compose exec symfony-tagged-services-php bash

execdb:
	docker-compose exec symfony-tagged-services-mysql bash
