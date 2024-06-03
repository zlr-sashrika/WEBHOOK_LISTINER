const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const port = process.env.PORT || 3000;

// Use body-parser middleware to parse JSON payloads
app.use(bodyParser.json());

// Define the webhook endpoint
app.post('/domain', (req, res) => {
    console.log('Webhook received!');
    console.log('Headers:', req.headers);
    console.log('Body:', req.body);
    
    // Send a response to acknowledge receipt of the webhook
    res.status(200).send('Webhook received');
});

// Start the server
app.listen(port, () => {
    console.log(`Webhook listener is running on port ${port}`);
});
