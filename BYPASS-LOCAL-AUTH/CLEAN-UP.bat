@echo off
cls
copy /Y "C:\sethc_backup.exe" "C:\Windows\System32\sethc.exe"
set /p choice=Press [E] to exit OR any other key to continue: 
if /I "%choice%"=="E" (
    exit
) else (
    echo Staying in Terminal
    pause
)

