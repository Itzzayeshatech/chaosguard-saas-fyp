param([string]$chaosType = "cpu")

Write-Host "Injecting $chaosType chaos..." -ForegroundColor Red

switch ($chaosType) {
  "cpu" { kubectl run stress-cpu --image=progrium/stress --rm -i --tty -- stress --cpu 2 --timeout 30s -n chaosguard }
  "memory" { kubectl run stress-mem --image=progrium/stress --rm -i --tty -- stress --vm 1 --vm-bytes 256M --timeout 30s -n chaosguard }
  "pod-kill" { 
    $pods = kubectl get pods -n chaosguard -o jsonpath=''{.items[*].metadata.name}''
    $podArray = $pods -split " "
    $target = Get-Random -InputObject $podArray
    kubectl delete pod $target -n chaosguard --now
    Write-Host "Killed: $target" -ForegroundColor Red
  }
}