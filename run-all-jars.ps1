$basePath = "D:\Workspace\E-Commerce"  # Update as needed

$logDir = "$basePath\logs"
if (-Not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir | Out-Null
}

function Start-Service {
    param($name, $jar)
    $jarPath = "$basePath\$jar"
    $logOut = "$logDir\$name.out.log"
    $logErr = "$logDir\$name.err.log"

    if (Test-Path $jarPath) {
        Write-Host "🚀 Starting $jar ... Logs: $logOut / $logErr"
        Start-Process "java" -ArgumentList "-jar `"$jarPath`"" `
            -RedirectStandardOutput $logOut `
            -RedirectStandardError $logErr `
            -WindowStyle Hidden
        Start-Sleep -Seconds 10   # Wait 10 seconds for service to start
    } else {
        Write-Host "❌ JAR not found: $jarPath"
    }
}

# 1. Check/Start MongoDB manually outside this script or start it here if needed.
Write-Host "🔔 Make sure MongoDB is running on localhost:27017 before proceeding."
Read-Host "Press Enter when MongoDB is ready..."

# 2. Start backend JARs one by one with delay
Start-Service -name "Admin" -jar "E-comm-Admin-1.0.jar"
Start-Service -name "User" -jar "E-comm-User-1.0.jar"
Start-Service -name "Vendor" -jar "E-commerce-1.0.jar"
Start-Service -name "DeliveryPartner" -jar "E-comm-delivery-partner-1.0.jar"
Start-Service -name "DeliveryBoy" -jar "DieliveryBoy-1.0.jar"

# 3. Start frontend last
Start-Service -name "FrontendServer" -jar "serve-0.0.1-SNAPSHOT.jar"

Write-Host "`n✅ All services started in correct order. MongoDB must be running."
