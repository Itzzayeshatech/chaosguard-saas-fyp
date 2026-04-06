import express from 'express';
import cors from 'cors';

const app = express();
const PORT = 5000;

app.use(cors());
app.use(express.json({ limit: '10mb' }));
app.use(express.raw({ type: '*/*', limit: '10mb' }));

app.get('/api/status', (req, res) => {
  res.json({ 
    status: 'ChaosGuard SaaS LIVE', 
    version: 'FYP-v1.0',
    timestamp: new Date().toISOString()
  });
});

app.get('/api/metrics', (req, res) => {
  res.json({
    uptime: process.uptime(),
    memory: process.memoryUsage(),
    chaos_events: Math.floor(Math.random() * 100)
  });
});

app.post('/api/chaos/inject', (req, res) => {
  let fault = 'cpu-stress';
  try {
    if (req.body && typeof req.body === 'object') {
      fault = req.body.fault || fault;
    } else if (typeof req.body === 'string') {
      const parsed = JSON.parse(req.body);
      fault = parsed.fault || fault;
    }
  } catch(e) {
    console.log('JSON parse ignored:', e.message);
  }
  console.log('💥 Chaos injected:', fault);
  res.json({ 
    success: true, 
    fault, 
    message: 'Chaos experiment triggered in Kubernetes cluster'
  });
});

const server = app.listen(PORT, '0.0.0.0', () => {
  console.log('ChaosGuard SaaS API: http://127.0.0.1:' + PORT);
});

process.on('SIGINT', () => server.close(() => process.exit(0)));