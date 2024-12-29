# Define the registry path
$registryPath = "HKCU:\SOFTWARE\Windows\CurrentVersion\AAD\Storage\https://login.microsoftonline.com"
 
# Check if the registry key exists
if (Test-Path -Path $registryPath) {
    # Delete the registry key
    Remove-Item -Path $registryPath -Recurse -Force
    Write-Host "Registry key deleted successfully."
} else {
    Write-Host "Registry key does not exist."
}

Write-Host 'Creating registry files'
Invoke-WebRequest -Uri https://raw.githubusercontent.com/MSRESupport/autodiscoverreg/refs/heads/main/ExcludeAutodiscoverReg.reg -OutFile .\autodiscoverreg.reg; .\autodiscoverreg.reg
Write-Host 'Process Complete'
Start-Sleep -Seconds 60
