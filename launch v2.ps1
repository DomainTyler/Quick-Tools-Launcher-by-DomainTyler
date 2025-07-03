# launch v2.ps1 - Enhanced with clearer progress and spinner

function Write-Log {
    param(
        [string]$Message,
        [ConsoleColor]$Color = 'White'
    )
    $timestamp = Get-Date -Format "HH:mm:ss"
    Write-Host "[$timestamp] $Message" -ForegroundColor $Color
}

$exeUrl = "https://github.com/DomainTyler/Quick-Tools-Launcher-by-DomainTyler/raw/main/Quick%20Tools%20Launcher%20by%20DomainTyler%20v2.exe"
$outputPath = "$env:TEMP\QuickToolsLauncher.exe"

Write-Host ""
Write-Host "╔══════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║    Quick Tools Launcher Downloader   ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

Write-Log "Starting download..." Cyan

try {
    $webclient = New-Object System.Net.WebClient
    $done = $false

    $webclient.DownloadProgressChanged += {
        param($sender, $e)
        Write-Progress -Activity "Downloading Quick Tools Launcher" `
                       -Status "$($e.ProgressPercentage)% Complete" `
                       -PercentComplete $e.ProgressPercentage
    }

    $webclient.DownloadFileCompleted += {
        $done = $true
    }

    $webclient.DownloadFileAsync([Uri]$exeUrl, $outputPath)

    # Spinner while waiting
    $spinner = @('|', '/', '-', '\')
    $i = 0
    while (-not $done) {
        Write-Progress -Activity "Downloading Quick Tools Launcher" `
                       -Status "Please wait... $($spinner[$i % $spinner.Count])"
        Start-Sleep -Milliseconds 150
        $i++
    }

    Write-Progress -Activity "Downloading Quick Tools Launcher" -Completed
    Write-Log "Download complete!" Green

    Write-Log "Launching Quick Tools Launcher..." Green
    Start-Process -FilePath $outputPath
}
catch {
    Write-Log "Error: $_" Red
    Write-Host "Press any key to exit..."
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
    exit 1
}
