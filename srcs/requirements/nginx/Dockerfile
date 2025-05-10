FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/www/wordpress



# Self-signed cert
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=MA/ST=KH/L=KH/O=SELF/OU=Dev/CN=aibn-che.42.fr"
	# DOMAIN_NAME = aibn-che.42.fr


COPY conf/nginx.conf /etc/nginx/conf.d/default.conf


COPY conf/indexx.php /var/www/wordpress/indexx.php
COPY conf/index.html /var/www/wordpress/index.html

# COPY tools/ngx_ctl.sh /ngx_ctl.sh

# RUN chmod +x /ngx_ctl.sh

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
