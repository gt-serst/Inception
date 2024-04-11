FROM debian:bullseye

# ARG MYSQL_DATABASE
# 	MYSQL_USER
# 	MYSQL_PASSWORD
# 	MYSQL_ROOT_PASSWORD

RUN apt-get update \
	&& apt-get upgrade \
	&& apt-get install sudo \
	&& apt-get install -y vim \
	&& apt-get install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb.sh ./usr/local/bin/

RUN chmod 777 -R /usr/local/bin/mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

#CMD ["mariadb"]
