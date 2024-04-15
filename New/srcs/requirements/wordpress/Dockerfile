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
	&& chown -R root:root /var/www/wordpress
