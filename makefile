# Define the default target, which will run 'docker-compose up'
all: up

# Start the Docker Compose services
up:
	docker compose -f ./srcs/docker-compose.yml up --build -d

# Stop the Docker Compose services
down:
	docker-compose -f ./srcs/docker-compose.yml down
# Restart the Docker Compose services
re:
	docker-compose -f ./srcs/docker-compose.yml  restart

clean:
	docker-compose -f ./srcs/docker-compose.yml down -v --rmi all
	sudo rm -rf /home/hsaidi/data/wp_data/*
	sudo rm -rf /home/hsaidi/data/m_data/*

# View the logs of the Docker Compose services
logs:
	docker-compose -f ./srcs/docker-compose.yml logs -f

# Other custom targets or commands you may want to add
# ...

.PHONY: all up down restart logs
