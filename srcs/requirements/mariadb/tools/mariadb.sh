#!/bin/bash

# Start MySQL service
service mysql start;

# Create database if not exists
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create user if not exists
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Grant all privileges on database to user
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Change root user password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Flush privileges to apply changes
mysql -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

# Shutdown MySQL service
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Stop MySQL service
service mysql stop
