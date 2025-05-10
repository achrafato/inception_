.PHONY: all build up down clean fclean

all: build up

build:
	docker-compose -f docker-compose.yml build

up:
	docker-compose -f docker-compose.yml up -d

down:
	docker-compose -f docker-compose.yml down

clean: down
	docker system prune -a

fclean: clean
	docker volume rm $$(docker volume ls -q)

re: fclean all
