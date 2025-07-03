# launch v2.ps1 - Manual progress with Invoke-WebRequest

function Write-Log {
    param(
        [string]$Message,
        [ConsoleColor]$Color = 'White'
    )
    $timestamp = Get-Date -Format "HH:mm:ss"
    Write-Host "[$timestamp] $Message" -ForegroundColor $Color
}

function Show-ProgressBar($percent) {
    $width = 40
    $filled = [Math]::Round($percent * $width / 100)
    $empty = $width - $filled
    $bar = ('█' * $filled) + ('░' * $empty)
    Write-Progress -Activity "Downloading Quick Tools Launcher" -Status "$percent% Complete" -PercentComplete $percent
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
    $response = Invoke-WebRequest -Uri $exeUrl -UseBasicParsing -OutFile $outputPath -Verbose -TimeoutSec 60 -Headers @{}

    # Unfortunately Invoke-WebRequest doesn't provide progress, so just show 100% at end
    Show-ProgressBar 100
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
