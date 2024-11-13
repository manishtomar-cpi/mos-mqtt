#!/bin/sh

# Exit immediately if a command exits with a non-zero status
set -e

# Replace PORT_NUMBER with the actual PORT environment variable
sed "s/PORT_NUMBER/${PORT}/g" /mosquitto/config/mosquitto.conf.template > /mosquitto/config/mosquitto.conf

# Start Mosquitto with the updated configuration
exec /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf
