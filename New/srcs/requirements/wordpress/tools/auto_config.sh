#!/bin/bash

sleep 10

# if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
# 	rm -rf /var/www/html/wordpress/wp-config.php
# fi

if [ ! -d "/var/www/html/wordpress" ]; then
	mkdir -p /var/www/html/wordpress
fi

cd /var/www/html/wordpress
rm -rf /var/www/html/wordpress/*

wp core download	--allow-root

wp config create	--allow-root \
					--dbname=$MYWP_DATABASE \
					--dbuser=$MYWP_USER \
					--dbpass=$MYWP_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/html/wordpress/'

wp core install	--allow-root \
				--url=$MYWP_URL \
				--title="Hello World !" \
				--admin_user=$MYWP_ADMIN_USER \
				--admin_password=$MYWP_ADMIN_PASSWORD \
				--admin_email=$MYWP_ADMIN_EMAIL

wp user create	--allow-root \
				$MYWP_SUB_USER \
				$MYWP_SUB_EMAIL \
				--role=$MYWP_SUB_ROLE \
				--user_pass=$MYWP_SUB_PASSWORD

ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

exec "$@"
