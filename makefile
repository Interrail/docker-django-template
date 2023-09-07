# Makefile for Django + Docker Compose project

# Start services
up:
	docker-compose up -d

# Stop services
down:
	docker-compose down

# View logs
logs:
	docker-compose logs

# Run migrations
migrate:
	docker-compose exec server python manage.py migrate

# Create new migration files
makemigrations:
	docker-compose exec server python manage.py makemigrations

# Create a Django superuser
createsuperuser:
	docker-compose exec server python manage.py createsuperuser

# Run Django tests
test:
	docker-compose exec server python manage.py test

# Collect static files
collectstatic:
	docker-compose exec server python manage.py collectstatic --noinput

# Run a shell inside the Django app container
shell:
	docker-compose exec server /bin/sh

# Build images
build:
	docker-compose build

# Remove all containers, networks, and volumes
destroy:
	docker-compose down -v

# Rebuild and start all services
rebuild: down build up

.PHONY: up down logs migrate makemigrations createsuperuser test collectstatic shell build destroy rebuild
