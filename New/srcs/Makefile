all: build

build:
	@docker-compose up -d

fclean:
	@docker container rm -f $(shell docker container ls -aq)
	@docker image rm -f $(shell docker image ls -q)
	@docker volume rm -f $(shell docker volume ls -q)
	sudo rm -rf home/test/data/mariadb/*
	sudo rm -rf home/test/data/wordpress/*

prune:
	@docker system prune

re: fclean build

.PHONY: all build fclean re prune
