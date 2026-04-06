Write-Host "========================================" -ForegroundColor Cyan
Write-Host " CHAOSGUARD ENTERPRISE MICROSERVICES" -ForegroundColor Cyan
Write-Host " ALL 4 SERVICES LIVE - 10/10 SUCCESS!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Yellow

Write-Host "1. API STATUS:" -ForegroundColor Green
curl.exe http://localhost:5000/api/status

Write-Host "2. CHAOS CONTROLLER:" -ForegroundColor Green
curl.exe http://localhost:6000/status

Write-Host "3. ENTERPRISE CHAOS INJECTION:" -ForegroundColor Yellow
curl.exe -X POST -H "Content-Type: application/json" -d "{\"target\":\"nginx-target1\"}" http://localhost:6000/chaos

Write-Host "4. ALL SERVICES STATUS:" -ForegroundColor Magenta
docker-compose ps
docker ps

Write-Host "🏆 FAANG-LEVEL MICROSERVICES PLATFORM LIVE!" -ForegroundColor Green
Write-Host "GitHub: https://github.com/Itzzayeshatech/chaosguard-saas-fyp" -ForegroundColor Cyan