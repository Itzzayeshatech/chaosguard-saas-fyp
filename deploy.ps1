Write-Host "🚀 ChaosGuard SaaS Deploy" -ForegroundColor Green
docker build -t chaosguard-backend .
docker stop chaosguard-api 2>$null; docker rm chaosguard-api 2>$null
docker run -d -p 5000:5000 --name chaosguard-api chaosguard-backend
Start-Sleep 3
curl.exe http://localhost:5000/api/status
Write-Host "✅ LIVE: http://localhost:5000" -ForegroundColor Green
docker ps