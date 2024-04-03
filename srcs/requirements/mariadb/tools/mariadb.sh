#!/bin/bash

sql_database="mariadb"
sql_user="gt-serst"
sql_password="mariadbuser"
sql_root_password="mariadbroot"

# Start MySQL service
service mysql start;

# Create database if not exists
mysql -e "CREATE DATABASE IF NOT EXISTS \`${sql_database}\`;"

# Create user if not exists
mysql -e "CREATE USER IF NOT EXISTS \`${sql_user}\`@'localhost' IDENTIFIED BY '${sql_password}';"

# Grant all privileges on database to user
mysql -e "GRANT ALL PRIVILEGES ON \`${sql_database}\`.* TO \`${sql_user}\`@'%' IDENTIFIED BY '${sql_password}';"

# Change root user password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${sql_root_password}';"

# Flush privileges to apply changes
mysql -u root -p$sql_root_password -e "FLUSH PRIVILEGES;"

# Shutdown MySQL service
mysqladmin -u root -p$sql_root_password shutdown

# Stop MySQL service
service mysql stop
