FROM debian:buster

RUN apt update && apt upgrade -y && apt install wget -y

RUN apt-get install -y php7.3 \
						php-fpm \
						php-mysql \
						mariadb-client \
						vim \
						sudo

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

COPY ./conf/www.conf ./etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN chown -R root:root /var/www/wordpress

COPY ./tools/auto_config.sh /usr/local/bin/

RUN chmod 777 -R /usr/local/bin/auto_config.sh

ENTRYPOINT ["/usr/local/bin/auto_config.sh"]

CMD ["php-fpm7.3", "-F"]
