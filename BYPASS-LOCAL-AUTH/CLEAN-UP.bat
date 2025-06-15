@echo off
cls
if exist "C:\sethc_backup.exe" (
    copy /Y "C:\sethc_backup.exe" "C:\Windows\System32\sethc.exe"
) else (
    echo Backup not found: C:\sethc_backup.exe
    echo Nothing to restore.
)
set /p choice=Press [E] to exit OR any other key to continue: 
if /I "%choice%"=="E" (
    exit
) else (
    echo Staying in Terminal
    pause
)

