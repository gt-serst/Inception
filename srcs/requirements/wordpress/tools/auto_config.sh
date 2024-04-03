#!/bin/bash

# Create directory for PHP run-time files
mkdir -p /run/php/

# Sleep for 10 seconds to allow services to start
sleep 10

# Use WP-CLI to generate WordPress configuration file
wp config create --allow-root \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb:3306 --path='/var/www/wordpress'

# Create directory for WordPress site files
mkdir -p /var/www/html/gt-serst.42.fr/public_html

# Set ownership of WordPress files to www-data user and group
chown -R www-data:www-data /var/www/html/gt-serst.42.fr/public_html

# Set ownership of WordPress files to www-data user and group
chown www-data:www-data /var/www/html/gt-serst.42.fr/public_html

# Change directory to WordPress site directory
cd /var/www/html/gt-serst.42.fr/public_html

# Download WordPress core files using WP-CLI
sudo -u www-data wp core download --allow-root

# Generate WordPress configuration file using WP-CLI
sudo -u www-data wp core config --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --dbprefix='wp_' --allow-root

# Install WordPress using WP-CLI with provided configuration
sudo -u www-data wp core install --url='https://gt-serst.42.fr' --title='Inception' --admin_user='gt-serst' --admin_password='wpadmin' --admin_email='gt-serst@student.s19.be' --allow-root
