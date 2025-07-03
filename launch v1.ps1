$exeUrl = "https://raw.githubusercontent.com/DomainTyler/Quick-Tools-Launcher-by-DomainTyler/main/Quick%20Tools%20Launcher%20by%20DomainTyler.exe"
$localPath = "$env:TEMP\QuickToolsLauncher.exe"

Write-Host "Downloading Quick Tools Launcher..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $exeUrl -OutFile $localPath -UseBasicParsing -ErrorAction Stop
    Write-Host "Download complete. Launching the app..." -ForegroundColor Green
    Start-Process -FilePath $localPath
}
catch {
    Write-Host "Failed to download or launch the app: $_" -ForegroundColor Red
    exit 1
}
