# Define the default target, which will run 'docker-compose up'
all: up

# Start the Docker Compose services
up:
	mkdir -p /home/aababach/data && mkdir -p /home/aababach/data/wp_data\
	       && mkdir -p /home/aababach/data/db_data && docker compose -f ./srcs/docker-compose.yml up --build -d

# Stop the Docker Compose services
down:
	docker compose -f ./srcs/docker-compose.yml down
# Restart the Docker Compose services

clean:
	docker rm -f wordpress mariadb NGINX
	rm -rf /home/aababach/data/wp_data/*
	rm -rf /home/aababach/data/db_data/*
	docker system prune -af

# View the logs of the Docker Compose services
logs:
	docker compose -f ./srcs/docker-compose.yml logs -f

# Other custom targets or commands you may want to add
# ...

.PHONY: all up down restart logs
