#!/bin/sh

# Exit immediately if a command exits with a non-zero status
set -e

# Configure Mosquitto to listen on internal port 9001 for WebSockets
sed "s/PORT_NUMBER/9001/g" /mosquitto/config/mosquitto.conf.template > /mosquitto/config/mosquitto.conf

# Start Mosquitto in the background
/usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf &

# Replace ${PORT} in nginx.conf with the actual PORT environment variable
envsubst '$PORT' < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf.temp
mv /etc/nginx/nginx.conf.temp /etc/nginx/nginx.conf

# Start Nginx in the foreground
nginx -g 'daemon off;'
