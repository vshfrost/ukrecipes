DC  	    := docker-compose exec
PHP-SERVICE := $(DC) php-fpm
ARTISAN     := $(PHP-SERVICE) php artisan 
COMPOSER    := $(PHP-SERVICE) composer

.PHONY:
	run vendors keygen env permissions stop build start migrate back-build

build:
	@docker-compose build

start:
	@docker-compose up -d

stop:
	@docker-compose down

permissions: 
	sudo chmod -R 777 storage/

env: 
	cp .env.example .env

keygen:
	@$(ARTISAN) key:generate

vendors:
	@$(COMPOSER) install

back-build:
	@$(COMPOSER) dump-autoload

migrate:
	@$(ARTISAN) migrate

ssh: 
	@$(PHP-SERVICE) /bin/sh 

run:
	make start && make env && make vendors && make keygen && make permissions 
