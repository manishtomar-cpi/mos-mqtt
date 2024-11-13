# Mosquitto MQTT Broker on Render

## Overview
This repository sets up a lightweight MQTT broker using Mosquitto and hosts it on Render.

## Configuration
- MQTT broker listens on port `1883`.
- Anonymous access is allowed (no authentication or encryption).

## Deployment
1. Push this repository to GitHub.
2. Connect it to Render as a **Web Service**.
   - Use Docker as the environment.
   - Specify `Dockerfile` for deployment.
3. Expose port `1883` in the Render dashboard.

## Testing
Use an MQTT client (e.g., `mosquitto_pub` and `mosquitto_sub`):
```bash
# Publish a message
mosquitto_pub -h <render-service-url> -t "test/topic" -m "Hello from Render!"

# Subscribe to a topic
mosquitto_sub -h <render-service-url> -t "test/topic"
