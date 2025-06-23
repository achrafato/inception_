FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nginx \
    openssl

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/www/wordpress


# Self-signed cert
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=MA/ST=KH/L=KH/O=SELF/OU=Dev/CN=aibn-che.42.fr"


COPY conf/nginx.conf /etc/nginx/conf.d/default.conf


COPY conf/indexx.php /var/www/wordpress/indexx.php
COPY conf/index.html /var/www/wordpress/index.html


EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
