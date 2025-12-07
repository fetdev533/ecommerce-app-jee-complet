$services = @(
    "discovery-service",
    "config-service",
    "gateway-service",
    "billing-service",
    "customer-service",
    "inventory-service"
)

$baseDir = "c:\Users\huawei\OneDrive\Desktop\ecommerce-app-jee-complet\ecom-app"

foreach ($service in $services) {
    Write-Host "Starting $service..."
    $serviceDir = Join-Path $baseDir $service
    Start-Process -FilePath "java" -ArgumentList "-jar", "(Get-Item '$serviceDir\target\*.jar').FullName" -WorkingDirectory $serviceDir -WindowStyle Minimized
    Start-Sleep -Seconds 5
}

Write-Host "All backend services started."
Write-Host "Please start frontend manually after upgrading Node.js."
