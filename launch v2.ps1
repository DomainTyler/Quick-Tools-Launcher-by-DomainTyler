$exeUrl = "https://raw.githubusercontent.com/DomainTyler/Quick-Tools-Launcher-by-DomainTyler/main/Quick%20Tools%20Launcher%20by%20DomainTyler%20v2.exe"
$localPath = "$env:TEMP\QuickToolsLauncherV2.exe"

Invoke-WebRequest -Uri $exeUrl -OutFile $localPath -UseBasicParsing

Start-Process -FilePath $localPath
