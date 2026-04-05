Write-Host "=== ChaosGuard Self-Healing Demo ===" -Foreground Green
kubectl get pods -l app=nginx

$pod = kubectl get pods -l app=nginx -o jsonpath='{.items[0].metadata.name}'
Write-Host "Killing pod: $pod" -Foreground Red
kubectl delete pod $pod --grace-period=0 --force

Write-Host "Watch recovery (15s):" -Foreground Yellow
kubectl get pods -l app=nginx -w
