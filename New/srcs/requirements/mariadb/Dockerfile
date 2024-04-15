FROM debian:bullseye

RUN apt-get update \
	&& apt-get upgrade \
	&& apt-get install -y vim \
	&& apt-get install -y mariadb-server

COPY /tools/mariadb.sh /usr/local/bin/

RUN chmod 777 -R /usr/local/bin/mariadb.sh

EXPOSE 3306

ENTRYPOINT ["bash", "/usr/local/bin/mariadb.sh"]

CMD ["mariadbd"]
