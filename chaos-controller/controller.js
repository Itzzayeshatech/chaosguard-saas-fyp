const express = require('express');
const { exec } = require('child_process');
const app = express();
app.use(express.json());

app.post('/chaos', (req, res) => {
  const { target, type = "kill" } = req.body;
  
  // Execute Docker chaos
  const cmd = `docker stop ${target} && sleep 3 && docker start ${target}`;
  exec(cmd, (err, stdout, stderr) => {
    res.json({ 
      success: true, 
      target, 
      type,
      healed: true,
      output: stdout 
    });
  });
});

app.get('/status', (req, res) => {
  res.json({ status: 'Chaos Controller LIVE', targets: ['nginx-target1', 'nginx-target2'] });
});

app.listen(6000, () => {
  console.log('Chaos Controller: http://localhost:6000');
});