# -----------------------------
# PowerShell Script: run-all-jars.ps1 (fixed version)
# -----------------------------

# Create logs directory if not exists
$logDir = Join-Path $PSScriptRoot "logs"
if (-not (Test-Path $logDir)) {
    New-Item -Path $logDir -ItemType Directory | Out-Null
}

# Get all .jar files in current folder
$jarFiles = Get-ChildItem -Path $PSScriptRoot -Filter "*.jar"

if ($jarFiles.Count -eq 0) {
    Write-Host "❌ No JAR files found in current directory: $PSScriptRoot"
    exit
}

# Launch each JAR in parallel with logging
foreach ($jar in $jarFiles) {
    $jarPath = $jar.FullName
    $jarName = $jar.Name
    $stdoutLog = Join-Path $logDir ("$($jar.BaseName)-out.log")
    $stderrLog = Join-Path $logDir ("$($jar.BaseName)-err.log")

    Write-Host "🚀 Starting $jarName ..."
    Write-Host "   ↳ stdout: logs\$($jar.BaseName)-out.log"
    Write-Host "   ↳ stderr: logs\$($jar.BaseName)-err.log"

    Start-Process `
        -FilePath "java" `
        -ArgumentList "-jar `"$jarPath`"" `
        -RedirectStandardOutput $stdoutLog `
        -RedirectStandardError $stderrLog `
        -WindowStyle Normal
}

Write-Host "`n✅ All JARs started. Check 'logs/' folder for output."
