@echo off
cls
net user Administrator /active:no
set /p choice=Press [R] to restart the device or any other key to exit: 
if /I "%choice%"=="R" (
    shutdown /r /t 0
) else (
    echo Exiting without restart...
    pause
)