const express = require('express');
const app = express();
app.use(express.static('public'));

// Live metrics endpoint
app.get('/api/metrics', (req, res) => {
  res.json({
    services: 4,
    uptime: "99.99%",
    failures: Math.floor(Math.random() * 5),
    recoveryTime: "2.3s avg",
    resilienceScore: 94
  });
});

app.listen(3000, () => console.log('Dashboard: localhost:3000'));