# Base image for Mosquitto
FROM eclipse-mosquitto:latest

# Copy configuration file to the container
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Expose MQTT ports
EXPOSE 1883 9001
