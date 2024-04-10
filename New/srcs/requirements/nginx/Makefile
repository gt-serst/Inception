all: build

build:
	@docker build -t nginx .
	@docker-compose up -d

fclean:
	@docker container rm -f $(shell docker container ls -aq)
	@docker image rm -f $(shell docker image ls -q)

prune:
	@docker system prune

re: fclean build

.PHONY: all build fclean re prune
