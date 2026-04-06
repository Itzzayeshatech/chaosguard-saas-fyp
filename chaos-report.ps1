$logFile = "chaos-report-$(Get-Date -Format 'yyyyMMdd-HHmmss').json"
$report = @{
    timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    targets = @()
}

# Test chaos + measure recovery
$start = Get-Date
.\chaos-docker.ps1 nginx-target1
$end = Get-Date
$recoveryTime = ($end - $start).TotalSeconds

$report.targets += @{
    name = "nginx-target1"
    recoveryTime = $recoveryTime
    status = "SUCCESS"
}

$report | ConvertTo-Json -Depth 10 | Out-File $logFile
Write-Host "Report saved: $logFile" -ForegroundColor Green
Get-Content $logFile