# Use the official Eclipse Mosquitto image as the base
FROM eclipse-mosquitto:latest

# Install necessary packages: Nginx, Netcat, and Envsubst for variable substitution
RUN apt-get update && \
    apt-get install -y nginx netcat gettext && \
    rm -rf /var/lib/apt/lists/*

# Copy the Mosquitto configuration template to the container
COPY mosquitto.conf.template /mosquitto/config/mosquitto.conf.template

# Copy the Nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the entrypoint script to the container
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Expose the port specified by the PORT environment variable
# Render sets the PORT environment variable automatically
EXPOSE ${PORT}

# Set the entrypoint to the custom script
ENTRYPOINT ["/entrypoint.sh"]
