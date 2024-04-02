FROM debian:buster

RUN apt update && apt upgrade -y

RUN apt-get install mariadb-server -y \
	vim

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.cnf

COPY ./tools/mariadb.sh /usr/local/bin/

RUN chmod 777 -R /usr/local/bin/mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

CMD ["mysqld_safe"]
