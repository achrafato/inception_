#!/bin/bash

set -e

#---------------------------------------------------wp installation---------------------------------------------------#
# wp-cli installation
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# wp-cli permission
chmod +x wp-cli.phar
# wp-cli move to bin
mv wp-cli.phar /usr/local/bin/wp



mkdir -p /var/www/wordpress 
# go to wordpress directory
cd /var/www/wordpress
# give permission to wordpress directory
chmod -R 755 .
# change owner of wordpress directory to www-data
chown -R www-data:www-data .


#---------------------------------------------------wp installation---------------------------------------------------##---------------------------------------------------wp installation---------------------------------------------------#

# download wordpress core files
wp core download --allow-root
# create wp-config.php file with the specified database details (Configure database)
wp core config --dbhost=mariadb:3306 --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --allow-root
# install wordpress with the given title, admin username, password and email
wp core install --url="https://${DOMAIN_NAME}" --title="$WP_TITLE" --admin_user="$WP_ADMIN_N" --admin_password="$WP_ADMIN_P" --admin_email="$WP_ADMIN_E" --allow-root
#create a new user with the given username, email, password and role
wp user create "$WP_U_NAME" "$WP_U_EMAIL" --user_pass="$WP_U_PASS" --role="$WP_U_ROLE" --allow-root



#---------------------------------------------------php config---------------------------------------------------#

# change listen port from unix socket to 9000
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
# "sed" purpose is to find and replace text in files.






# create a directory for php-fpm
mkdir -p /run/php
# start php-fpm service in the foreground to keep the container running
/usr/sbin/php-fpm7.4 -F