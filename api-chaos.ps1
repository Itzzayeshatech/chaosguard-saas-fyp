# ChaosGuard API → Docker Chaos Controller
$chaosPayload = @{
    fault = "docker-kill"
    target = "nginx-target1"
} | ConvertTo-Json

$response = curl.exe -X POST -H "Content-Type: application/json" -d $chaosPayload http://localhost:5000/api/chaos/inject
Write-Host "API Response: $response" -ForegroundColor Cyan

# Execute chaos via API trigger
.\chaos-docker.ps1 nginx-target1