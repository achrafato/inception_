# Description: Wordpress Dockerfile

# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# install the required packages
RUN apt-get install -y curl php php7.4-fpm php-mysql mariadb-client

# copy the wordpress configuration script to the root directory in the container
COPY ./tools/wp_ctl.sh /

# change the permission of the script to make it executable
RUN  chmod +x wp_ctl.sh

# define the entrypoint command to run when the container starts
ENTRYPOINT ["/wp_ctl.sh"]