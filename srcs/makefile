.PHONY: all build up down clean fclean

all: build up

build:
	mkdir -p $(shell grep WP_VOLUME_PATH .env | cut -d '=' -f2)
	mkdir -p $(shell grep DB_VOLUME_PATH .env | cut -d '=' -f2)
	docker-compose -f docker-compose.yml build

up:
	docker-compose -f docker-compose.yml up -d

down:
	docker-compose -f docker-compose.yml down

clean: down
	docker system prune -a

fclean: clean
	sudo rm -rf $(shell grep WP_VOLUME_PATH .env | cut -d '=' -f2)
	sudo rm -rf $(shell grep DB_VOLUME_PATH .env | cut -d '=' -f2)
	docker volume rm $$(docker volume ls -q)

re: fclean all