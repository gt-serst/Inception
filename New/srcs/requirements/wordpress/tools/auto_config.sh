#!/bin/bash

sleep 10

wp config create --allow-root \
	--dbname=$MYSQL_DATABASE \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --url=gt-serst.42.fr --title="Hello World!" --admin_user=$MYWP_USER --admin_password=$MYWP_PASSWORD --admin_email=$MYWP_EMAIL

wp user create $MYWP_USER $MYWP_EMAIL --role=author --user_pass=$MYWP_PASSWORD
