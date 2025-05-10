#!/bin/bash

set -e

# Start MariaDB with skip-grant-tables to bypass authentication
mysqld_safe --skip-grant-tables &
sleep 5

# Now connect without password and set up everything
mysql -u root << EOF
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

# Shutdown and restart normally
mysqladmin -u root -p"$DB_ROOT_PASS" shutdown
sleep 2
exec mysqld_safe --bind-address=0.0.0.0