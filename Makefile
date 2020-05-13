include .env

up:
	docker-compose up -d
build:
	docker-compose up --build -d
down:
	docker-compose down

serve:
	php artisan serve

migrate:
	docker-compose exec php-cli php artisan migrate