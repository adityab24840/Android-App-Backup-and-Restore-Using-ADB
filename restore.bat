@echo off

:: Set the path to your ADB executable
set ADB_PATH= "D:\SOFTWARES\XDA\platform-tools\adb.exe"
:: Set the directory where your APK files are located
set APK_DIR="D:\SOFTWARES\XDA\backup tab"

:: Restore data using ADB
%ADB_PATH% restore %BACKUP_FILE%

:: Pause to keep the Command Prompt window open
pause

:: End of script
