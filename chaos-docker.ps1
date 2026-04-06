param([string]$target="nginx-target1")

Write-Host "=== Docker Chaos Engine: $target ===" -ForegroundColor Red

# Kill chaos target
docker stop $target
Write-Host "$target DOWN" -ForegroundColor Red

# Self-healing (restart)
Start-Sleep 3
docker start $target
Write-Host "$target RESTARTED" -ForegroundColor Green

# Verify recovery
$status = docker inspect $target --format="{{.State.Status}}"
if ($status -eq "running") {
    Write-Host "SELF-HEALING SUCCESS!" -ForegroundColor Green
} else {
    Write-Host "Healing failed" -ForegroundColor Red
}

docker ps