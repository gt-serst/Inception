all: srcs/.env hosts build

build:
	mkdir -p /home/test/data/mariadb
	mkdir -p /home/test/data/wordpress
	@docker-compose --file=srcs/docker-compose.yml up -d

fclean:
	@docker container rm -f $(shell docker container ls -aq)
	@docker image rm -f $(shell docker image ls -q)
	@docker volume rm -f $(shell docker volume ls -q)
	sudo rm -rf /home/test/data/mariadb
	sudo rm -rf /home/test/data/wordpress
	@sudo mv ./hosts_bkp /etc/hosts || echo "hosts_bkp does not exist"

prune:
	@docker system prune

hosts:
	@if [ "${DOMAIN}" = "${LOOKDOMAIN}" ]; then \
		echo "Host already set"; \
	else \
		cp /etc/hosts ./hosts_bkp; \
		sudo rm /etc/hosts; \
		sudo cp ./srcs/requirements/tools/hosts /etc/hosts; \
	fi

srcs/.env:
	@echo "Missing .env file in srcs folder" && exit 1

re: fclean build

.PHONY: all build fclean re prune
