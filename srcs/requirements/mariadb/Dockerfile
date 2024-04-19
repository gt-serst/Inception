FROM debian:bullseye

ARG MYSQL_DATABASE \
	MYSQL_ROOT \
	MYSQL_ROOT_PASSWORD \
	MYSQL_USER \
	MYSQL_PASSWORD

RUN apt-get update \
	&& apt-get upgrade \
	&& apt-get install -y mariadb-server

COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY /tools/mariadb.sh /usr/local/bin/

RUN chmod 777 -R /usr/local/bin/mariadb.sh

RUN /usr/local/bin/mariadb.sh

EXPOSE 3306

ENTRYPOINT ["mysqld_safe"]
