Write-Host "========================================" -ForegroundColor Cyan
Write-Host " CHAOSGUARD SAAS v2.0 - ENTERPRISE DEMO" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Clean targets
docker stop nginx-target1 2>$null; docker rm nginx-target1 2>$null
docker stop nginx-target2 2>$null; docker rm nginx-target2 2>$null

# Deploy fresh
docker run -d --name nginx-target1 -p 8081:80 nginx:alpine
docker run -d --name nginx-target2 -p 8082:80 nginx:alpine
Write-Host "Targets deployed: 8081, 8082" -ForegroundColor Green

# Chaos attack 1
.\chaos-docker.ps1 nginx-target1
curl.exe http://localhost:8081 | Select-String "nginx"

# Chaos attack 2  
.\chaos-docker.ps1 nginx-target2
curl.exe http://localhost:8082 | Select-String "nginx"

Write-Host "========================================" -ForegroundColor Green
Write-Host " 10/10 MNC PRODUCTION DEMO COMPLETE!" -ForegroundColor Green
Write-Host " GitHub: github.com/Itzzayeshatech/chaosguard-saas-fyp" -ForegroundColor Green
docker ps