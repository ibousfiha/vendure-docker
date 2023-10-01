DOCKER_COMPOSE_DEV = docker compose
DOCKER_COMPOSE_PROD = docker compose -f docker-compose.yml -f docker-compose.prod.yml

restart: down up
up:
	$(DOCKER_COMPOSE_DEV) up --build --remove-orphans -d database

	@if [ ! -f "./db_synced.flag" ]; then \
		touch db_synced.flag; \
		DB_SYNCHRONIZE=true $(DOCKER_COMPOSE_DEV) up --build server; \
	else \
	  	$(DOCKER_COMPOSE_DEV) up --build server; \
	fi

down:
	$(DOCKER_COMPOSE_DEV) down
	$(DOCKER_COMPOSE_PROD) down
	docker system prune -f

reset-db:
	docker compose down
	VOLUME_NAME=$$(docker volume ls --filter name=db_data -q); \
	if [ ! -z "$$VOLUME_NAME" ]; then \
		docker volume rm $$VOLUME_NAME; \
	fi
	rm db_synced.flag

deploy: env-prod up-prod
env-prod:
	@if ! grep -q 'APP_ENV=' .env.local 2>/dev/null; then \
  		echo 'APP_ENV=prod' >> .env.local; \
	fi

up-prod:
	$(DOCKER_COMPOSE_PROD) up --build -d database

	@if [ ! -f "./db_synced.flag" ]; then \
		touch db_synced.flag; \
		DB_SYNCHRONIZE=true $(DOCKER_COMPOSE_PROD) up --build server; \
	else \
	  	$(DOCKER_COMPOSE_PROD) up --build server; \
	fi

	$(DOCKER_COMPOSE_PROD) up --build worker

