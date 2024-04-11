#!/bin/bash

service mariadb start

mysql -e "CREATE DATABASE wordpress;"

mysql -e "SHOW DATABASES;"

mysql -e "CREATE USER test@localhost IDENTIFIED BY 'mariadbuser';"

mysql -e "SELECT User FROM mysql.user;"

mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO test@localhost IDENTIFIED BY 'mariadbuser';"

# mysql -e "ALTER USER root@localhost IDENTIFIED BY 'debianroot';"

mysql -e "FLUSH PRIVILEGES;"

mysql -e "SHOW GRANTS FOR test@localhost;"
