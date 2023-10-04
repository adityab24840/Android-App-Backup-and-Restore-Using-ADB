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
