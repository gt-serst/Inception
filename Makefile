all: srcs/.env build

build:
	mkdir -p /home/test/data/mariadb
	mkdir -p /home/test/data/wordpress
	@docker-compose --file=srcs/docker-compose.yml up -d

fclean:
	@docker stop $(shell docker ps -qa)
	@docker rm $(shell docker ps -qa)
	@docker image rm -f $(shell docker images -qa)
	@docker volume rm $(shell docker volume ls -q)
	@docker network rm srcs_inception
	sudo rm -rf /home/test/data/mariadb
	sudo rm -rf /home/test/data/wordpress

prune:
	@docker system prune

srcs/.env:
	@echo "Missing .env file in srcs folder" && exit 1

re: fclean build

.PHONY: all build fclean re prune
