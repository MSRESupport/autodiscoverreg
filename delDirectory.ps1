# Define the registry path and the key to remove
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AAD\Storage"
$keyToRemove = "https://login.microsoftonline.com"
 
# Check if the registry path exists
if (Test-Path $registryPath) {
    # Check if the specific key exists
    if (Test-Path "$registryPath\$keyToRemove") {
        # Remove the key
        Remove-Item "$registryPath\$keyToRemove" -Force
        Write-Host "Registry entry '$keyToRemove' removed successfully."
    } else {
        Write-Host "The key '$keyToRemove' does not exist."
    }
} else {
    Write-Host "The registry path '$registryPath' does not exist."
}

Write-Host 'Creating registry files'
Invoke-WebRequest -Uri https://raw.githubusercontent.com/MSRESupport/autodiscoverreg/refs/heads/main/ExcludeAutodiscoverReg.reg -OutFile .\autodiscoverreg.reg; .\autodiscoverreg.reg
Write-Host 'Process Complete'
Start-Sleep -Seconds 60
