# Android App Backup and Restore Using ADB

This guide provides instructions for backing up and restoring Android apps and data using ADB (Android Debug Bridge). ADB is a command-line tool that allows you to interact with your Android device from a computer.

## Prerequisites

- An Android device with Developer Options and USB Debugging enabled.
- A computer with ADB installed. You can install ADB by downloading the Android SDK Platform Tools or using a package manager like `adb` on Linux.

## Backup Apps

1. **Connect Your Android Device**: Connect your Android device to your computer via USB.

2. **Open PowerShell Script**: Run the PowerShell script for backing up apps. Make sure to edit the script (`backup.ps1`) to set the correct path to your ADB executable and the backup directory.

   ```powershell
   # Define the ADB path or use 'adb' if it's in your system's PATH
   $adbPath = "D:\SOFTWARES\XDA\platform-tools\adb.exe"  # Replace with the actual path to ADB

   # Get a list of package names for third-party apps
   $packages = & $adbPath shell pm list packages -3 -f

   # Loop through the packages and pull the APK files
   foreach ($package in $packages.Split([Environment]::NewLine)) {
       if ($package -match "package:(.*?)=([^=]+\.apk)") {
           $packagePath = $matches[1]
           $packageName = $matches[2]
           & $adbPath pull "$packagePath" "$packageName.apk"
       }
   }
   ```

3. **Run Backup Script**: Execute the PowerShell script to backup the apps from your Android device. This script will pull the APK files into the specified backup directory.

4. **Backup Complete**: After the script finishes running, you can find the backup APK files in the backup directory (`D:\SOFTWARES\XDA\backup tab` in this case).

## Install Apps

1. **Connect Your Android Device**: Connect your Android device to your computer via USB.

2. **Open Command Prompt Script**: Run the batch script for installing apps. Make sure to edit the script (`install.bat`) to set the correct path to your ADB executable and the directory containing the APK files.

   ```batch
   @echo off
   setlocal enabledelayedexpansion

   :: Set the path to your ADB executable
   set ADB_PATH="D:\SOFTWARES\XDA\platform-tools\adb.exe"
   :: Set the directory where your APK files are located
   set APK_DIR="D:\SOFTWARES\XDA\backup tab"

   :: Change to the APK directory
   cd %APK_DIR%

   :: Loop through all APK files in the directory and install them
   for %%f in (*.apk) do (
       echo Installing "%%f"...
       %ADB_PATH% install "%%f"
   )
   ```

3. **Run Install Script**: Execute the batch script to install the APK files onto your Android device.

## Restore Data

1. **Connect Your Android Device**: Connect your Android device to your computer via USB.

2. **Open Command Prompt Script**: Run the batch script for restoring data. Make sure to edit the script (`restore.bat`) to set the correct path to your ADB executable and the backup file.

   ```batch
   @echo off

   :: Set the path to your ADB executable
   set ADB_PATH="D:\SOFTWARES\XDA\platform-tools\adb.exe"
   :: Set the path to your backup file
   set BACKUP_FILE="D:\SOFTWARES\XDA\backup tab\your_backup_file.ab"

   :: Restore data using ADB
   %ADB_PATH% restore %BACKUP_FILE%
   ```

3. **Run Restore Script**: Execute the batch script to restore data from the specified backup file to your Android device.

## Additional Notes

- Make sure to keep your backup files in a safe location.
- Be cautious when restoring data, as it may overwrite existing data.
- These scripts may require you to unlock your device's screen during backup and restore operations.

That's it! You've successfully backed up and restored Android apps and data using ADB. Customize the scripts and instructions as needed for your specific setup.
