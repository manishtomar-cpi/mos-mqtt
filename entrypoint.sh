#!/bin/sh

set -e

# Replace PORT_NUMBER with the actual PORT environment variable for Mosquitto
sed "s/PORT_NUMBER/${PORT}/g" /mosquitto/config/mosquitto.conf.template > /mosquitto/config/mosquitto.conf

# Start Mosquitto in the background
/usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf &

# Start a simple HTTP server for health checks on a different port (e.g., PORT + 1)
HEALTH_PORT=$(($PORT + 1))
echo "Starting HTTP server on port $HEALTH_PORT for health checks..."
while true; do
    echo "HTTP/1.1 200 OK\n\nOK" | nc -l -p $HEALTH_PORT
done
