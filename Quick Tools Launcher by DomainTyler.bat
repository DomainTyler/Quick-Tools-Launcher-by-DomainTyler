@echo off
title  Quick Tools Launcher by DomainTyler
color 0E

:MENU
cls
echo ====================================================
echo          Quick Tools Launcher by DomainTyler
echo ====================================================
echo.
echo   [1]  Open Task Manager
echo   [2]  Open Device Manager
echo   [3]  Open System Information
echo   [4]  Open Control Panel
echo   [5]  Clear DNS Cache
echo   [6]  Check Disk (C:)
echo   [7]  Open Windows Features
echo   [8]  Open Services Manager
echo   [9]  Open Event Viewer
echo   [10] Run Disk Cleanup
echo   [11] Run System File Checker (SFC)
echo   [12] Run DISM Health Check
echo   [13] Show IP Configuration
echo   [14] Ping Google
echo   [15] Traceroute to Google
echo   [16] Open Registry Editor
echo   [17] Open Windows Update
echo   [18] Open Startup Folder
echo   [19] Open User Accounts Settings
echo   [20] Restart Windows Explorer
echo   [21] Exit
echo.
set /p choice=Choose an option (1-21): 

if "%choice%"=="1"  start taskmgr
if "%choice%"=="2"  start devmgmt.msc
if "%choice%"=="3"  start msinfo32
if "%choice%"=="4"  start control
if "%choice%"=="5" (
    ipconfig /flushdns
    echo DNS cache flushed.
    pause
)
if "%choice%"=="6" (
    chkdsk C:
    pause
)
if "%choice%"=="7" start optionalfeatures
if "%choice%"=="8" start services.msc
if "%choice%"=="9" start eventvwr
if "%choice%"=="10" cleanmgr
if "%choice%"=="11" (
    sfc /scannow
    pause
)
if "%choice%"=="12" (
    DISM /Online /Cleanup-Image /RestoreHealth
    pause
)
if "%choice%"=="13" (
    ipconfig /all
    pause
)
if "%choice%"=="14" (
    ping 8.8.8.8
    pause
)
if "%choice%"=="15" (
    tracert google.com
    pause
)
if "%choice%"=="16" start regedit
if "%choice%"=="17" start ms-settings:windowsupdate
if "%choice%"=="18" start shell:startup
if "%choice%"=="19" control userpasswords2
if "%choice%"=="20" (
    taskkill /f /im explorer.exe
    start explorer.exe
    echo Windows Explorer restarted.
    pause
)
if "%choice%"=="21" exit

goto MENU
