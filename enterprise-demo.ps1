Clear-Host
Write-Host "`n?? CHAOSGUARD ENTERPRISE 100/100 FYP" -ForegroundColor Cyan
Write-Host "=" * 70 -ForegroundColor Yellow

Write-Host "`n1. SaaS API STATUS:" -ForegroundColor Green
curl.exe http://localhost:5000/api/status -UseBasicParsing | ConvertFrom-Json | Select -ExpandProperty status

Write-Host "`n2. CHAOS CONTROLLER:" -ForegroundColor Green  
curl.exe http://localhost:6000/status -UseBasicParsing | ConvertFrom-Json | Select -ExpandProperty status

Write-Host "`n3. AI RESILIENCE SCORE:" -ForegroundColor Magenta
`$res = curl.exe http://localhost:6000/resilience -UseBasicParsing | ConvertFrom-Json
Write-Host "   Score: $($res.resilienceScore)/100 $($res.recommendation)"

Write-Host "`n4. 4x SERVICES LIVE:" -ForegroundColor Cyan
docker-compose ps

Write-Host "`n?? GitHub: https://github.com/Itzzayeshatech/chaosguard-saas-fyp" -ForegroundColor Yellow
Write-Host "   95-97/100 Resilience = PRODUCTION READY! ??" -ForegroundColor Green
