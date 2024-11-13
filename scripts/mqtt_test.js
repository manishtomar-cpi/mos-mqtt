const mqtt = require('mqtt');

// Replace with your actual Render service URL and PORT
const brokerUrl = 'wss://mos-mqtt-server.onrender.com/mqtt';
const topic = 'test/topic';

// MQTT client options with SSL verification disabled
const options = {
    rejectUnauthorized: false // ⚠️ Disables SSL certificate verification
};

// Connect to the broker
const client = mqtt.connect(brokerUrl, options);

client.on('connect', () => {
    console.log('Connected to MQTT broker over WebSockets');
    
    // Subscribe to the topic
    client.subscribe(topic, (err) => {
        if (!err) {
            // Publish a message
            client.publish(topic, 'Hello MQTT over WebSockets!');
        } else {
            console.error('Subscription error:', err);
        }
    });
});

client.on('message', (topic, message) => {
    console.log(`Received message: ${message.toString()} on topic: ${topic}`);
});

client.on('error', (error) => {
    console.error('Connection error:', error);
    client.end();
});
