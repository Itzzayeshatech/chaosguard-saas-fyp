# Docker-native self-healing validator
$targets = @("nginx-target1", "nginx-target2")
$before = @()

foreach ($target in $targets) {
    $status = docker inspect $target --format="{{.State.Status}}" 2>$null
    if ($status -eq "running") { $before += $target }
}

Write-Host "BEFORE chaos: $($before.Count) healthy" -ForegroundColor Yellow

# Inject chaos
.\chaos-docker.ps1 nginx-target1

Start-Sleep 10

$after = @()
foreach ($target in $targets) {
    $status = docker inspect $target --format="{{.State.Status}}" 2>$null
    if ($status -eq "running") { $after += $target }
}

if ($after.Count -ge $before.Count) {
    Write-Host "✅ SELF-HEALING SUCCESS! ($($before.Count) → $($after.Count))" -ForegroundColor Green
} else {
    Write-Host "❌ HEALING FAILED ($($before.Count) → $($after.Count))" -ForegroundColor Red
}

docker ps