# Use the official Eclipse Mosquitto image
FROM eclipse-mosquitto:latest

# Set environment variable for the port
ENV PORT 1883

# Copy the Mosquitto configuration file to the appropriate location
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Expose the MQTT port (defined in environment variables)
EXPOSE ${PORT}

# Default command to start the Mosquitto broker
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
