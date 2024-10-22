FROM debian:bullseye

ARG MYWP_DATABASE \
	MYWP_USER \
	MYWP_PASSWORD \
	MYWP_URL \
	MYWP_ADMIN_USER \
	MYWP_ADMIN_PASSWORD \
	MYWP_ADMIN_EMAIL \
	MYWP_EMAIL \
	MYWP_SUB_USER \
	MYWP_SUB_EMAIL \
	MYWP_SUB_ROLE \
	MYWP_SUB_PASSWORD

RUN apt-get update \
	&& apt-get upgrade \
	&& apt-get -y install wget \
	&& apt-get install -y php7.4 \
	&& apt-get install -y php7.4-fpm \
	&& apt-get install -y php7.4-mysql \
	&& apt-get install -y sendmail \
	&& apt-get install -y mariadb-client \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	&& mkdir /run/php

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY /tools/auto_config.sh /usr/local/bin

RUN chmod 777 -R /usr/local/bin/auto_config.sh

ENTRYPOINT ["bash", "usr/local/bin/auto_config.sh"]
