# 🚀 **CHAOSGUARD PROJECT OVERVIEW**

## Kubernetes Chaos Engineering + Self-Healing System (10/10 Achieved)


## 🎯 PROJECT OBJECTIVE

Built a **production-grade Kubernetes chaos engineering platform** that validates **SRE resilience patterns** through controlled failure injection, automatic recovery, and a full observability stack.


## 🏗️ ARCHITECTURE & TECHNOLOGIES

CORE STACK:
├── Minikube (Docker driver) - Kubernetes cluster
├── 3-replica nginx deployment (High Availability baseline)
├── PowerShell automation (Windows-native scripting)
├── Grafana + Prometheus (SRE observability)
├── Jaeger (distributed tracing)
└── Chaos engineering workflows
```


## ✅ KEY ACHIEVEMENTS (Tier 1 Roadmap)

### 🔥 1. Real Chaos Engineering


✅ LIVE pod failure injection:
- Force deleted pods in real-time
- Terminal proof captured with timestamps
- Automated via PowerShell script

### ⚙️ 2. Kubernetes Self-Healing

✅ ReplicaSet controller auto-recovery:

BEFORE: 3 READY pods  
DURING: 2 READY (1 terminated)  
AFTER: 3 READY (new pod created automatically)

✅ Recovery time: 4–15 seconds  
✅ Zero-downtime service maintained


### 📊 3. SRE Observability Stack

✅ Grafana dashboards:
- CPU & Memory usage
- Pod count & request rate
- nginx uptime (SLA monitoring)

✅ Jaeger distributed tracing  
✅ Chaos experiment monitoring


## 📸 EVIDENCE CAPTURED


04-Screenshots/
├── 02-nginx-production.png
├── 05-pods-running.png
├── 07-nginx-uptime.png
├── 08-chaos-experiments.png
├── Grafana dashboards (3 images)
└── Jaeger tracing screenshots


## ⚡ TECHNICAL IMPLEMENTATION

### 🧪 PowerShell Automation Script

powershell
$pod = kubectl get pods -l app=nginx -o jsonpath='{.items[0].metadata.name}'
kubectl delete pod $pod --grace-period=0 --force

### 🎬 Demo Flow (Live Validation)

1. 3/3 nginx READY  
2. Delete one pod → 2/3 READY  
3. ReplicaSet auto-recovers → 3/3 READY  
4. Grafana confirms recovery metrics  


## 🎯 SRE IMPACT & LEARNING OUTCOMES

| Feature           | Benefit                | Proof                     |
| ----------------- | ---------------------- | ------------------------- |
| Self-Healing      | Zero-downtime recovery | 4–15s pod replacement     |
| High Availability | 3-replica deployment   | Continuous service uptime |
| Observability     | Real-time monitoring   | Grafana + Jaeger          |
| Chaos Engineering | Failure simulation     | Live pod deletion         |
| Automation        | Reproducibility        | PowerShell scripts        |


## 📊 PROJECT METRICS


✅ Cluster: Minikube (Docker driver)
✅ Pods: 3x nginx (ReplicaSet controlled)
✅ Recovery Time: 4–15 seconds
✅ Screenshots: 9+ (evidence)
✅ Fully reproducible setup


## 🎬 VIVA PRESENTATION SCRIPT (90 SECONDS)


ChaosGuard validates core Kubernetes SRE patterns:

1. Deployed a 3-replica nginx HA cluster  
2. Injected chaos using pod deletion  
3. Validated self-healing via ReplicaSet recovery  
4. Monitored system using Grafana and Jaeger  

Result: Zero-downtime resilience achieved with automated recovery.

This demonstrates production-grade SRE engineering.


## 🏆 FINAL DELIVERABLE STATUS

✅ Clean GitHub repository (no large files)
✅ 9+ screenshots as proof
✅ Architecture documentation included
✅ PowerShell automation scripts ready
✅ Fully reproducible chaos engineering workflow


## 👨‍💻 Author

**Ayesha Siddiqa**
DevOps & Cloud Computing Enthusiast


## 🚀 FINAL STATEMENT

**ChaosGuard transforms theoretical SRE concepts into real-world, production-grade engineering.**

From live pod failure → automatic recovery → full observability, this project demonstrates **true cloud-native resilience in action.**


**Mission accomplished 🚀**
