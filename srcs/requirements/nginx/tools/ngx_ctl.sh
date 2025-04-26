#!/bin/sh

# Create necessary directory
mkdir -p /run/nginx

# Run NGINX in foreground
nginx -g 'daemon off;'
