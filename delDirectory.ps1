# Define the registry path and the key to remove
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AAD\Storage"
$keyToRemove = "https://login.microsoftonline.com"

$identityRegistryPath = "HKCU:Software\Microsoft\Office\16.0\Common\Identity"
$identityKeyToRemove = "Identities"
 
# Check if the registry path exists
if (Test-Path $registryPath) {
    # Check if the specific key exists
    if (Test-Path "$registryPath\$keyToRemove") {
        # Remove the key
        Write-Host 'Attempting to remove $registryPath'
        Remove-Item "$registryPath\$keyToRemove" -Force
        Write-Host "Registry entry '$keyToRemove' removed successfully."
    } else {
        Write-Host "The key '$keyToRemove' does not exist."
    }
} else {
    Write-Host "The registry path '$registryPath' does not exist."
}

# Check if the registry path exists
if (Test-Path $identityRegistryPath) {
    # Check if the specific key exists
    if (Test-Path "$identityRegistryPath\$identityKeyToRemove") {
        # Remove the key
        Write-Host 'Attempting to remove $identityRegistryPath'
        Remove-Item "$identityRegistryPath\$identityKeyToRemove" -Force
        Write-Host "Registry entry '$identityKeyToRemove' removed successfully."
    } else {
        Write-Host "The key '$identityKeyToRemove' does not exist."
    }
} else {
    Write-Host "The registry path '$identityRegistryPath' does not exist."
}

Write-Host 'Creating registry files'
Invoke-WebRequest -Uri https://raw.githubusercontent.com/MSRESupport/autodiscoverreg/refs/heads/main/ExcludeAutodiscoverReg.reg -OutFile .\autodiscoverreg.reg; .\autodiscoverreg.reg
Write-Host 'Registry files have been updated'
Write-Host 'Flushing DNS'
ipconfig /flushdns
Start-Sleep -Seconds 60
