const express = require('express');
const app = express();
const port = 3000;

// Basic route to confirm app is working
app.get('/', (req, res) => {
  res.send('Hello from Node.js app deployed via AWS CodePipeline!');
});

// Start the server
app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
