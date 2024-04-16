FROM debian:bullseye

RUN apt-get update \
	&& apt-get upgrade \
	&& apt-get install -y vim \
	&& apt-get -y install wget \
	&& apt-get install -y php7.3 \
	&& apt-get install -y php-fpm \
	&& apt-get install -y php-mysql \
	&& apt-get install -y mariadb-client \
	&& wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
	&& cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz \
	&& chown -R root:root /var/www/wordpress \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY /tools/auto_config.sh /usr/local/bin

RUN chmod 777 -R /usr/local/bin/auto_config.sh

EXPOSE 9090

ENTRYPOINT ["bash", "usr/local/bin/auto_config.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
