@echo off
setlocal enabledelayedexpansion

:: Set the path to your ADB executable
set ADB_PATH= "D:\SOFTWARES\XDA\platform-tools\adb.exe"
:: Set the directory where your APK files are located
set APK_DIR="D:\SOFTWARES\XDA\backup tab"

:: Change to the APK directory
cd %APK_DIR%

:: Loop through all APK files in the directory and install them
for %%f in (*.apk) do (
    echo Installing "%%f"...
    %ADB_PATH% install "%%f"
    echo Installation of "%%f" completed.
    echo.
)

:: Pause to keep the Command Prompt window open
pause

:: End of script
