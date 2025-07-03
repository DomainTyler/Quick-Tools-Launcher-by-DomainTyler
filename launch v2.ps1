# launch v2.ps1

$exeUrl = "https://github.com/DomainTyler/Quick-Tools-Launcher-by-DomainTyler/raw/main/Quick%20Tools%20Launcher%20by%20DomainTyler%20v2.exe"
$outputPath = "$env:TEMP\QuickToolsLauncher.exe"

Write-Host "Downloading Quick Tools Launcher..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $exeUrl -OutFile $outputPath -UseBasicParsing -ErrorAction Stop
    Write-Host "Download complete. Launching the app..." -ForegroundColor Green
    Start-Process $outputPath
}
catch {
    Write-Host "Failed to download or launch the app: $_" -ForegroundColor Red
    exit 1
}


