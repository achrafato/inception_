#!/bin/bash

set -e

# Start MariaDB
service mariadb start
sleep 5

# Execute all SQL commands in one heredoc block
mariadb << EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';
EOF

# Shutdown and restart securely
mysqladmin -u root -p"root_pass123" shutdown
exec mysqld_safe --bind-address=0.0.0.0