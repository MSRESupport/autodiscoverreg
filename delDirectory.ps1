Write-Host "Removing cached registry files"

# Define the registry path and the key to remove
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AAD\Storage"
$loginKey = "https://login.microsoftonline.com"
 
# Check if the registry path exists
if (Test-Path $registryPath) {
    # Check if the specific key exists
    if (Test-Path "$registryPath\$loginKey") {
        # Remove the key
        Write-Host 'Attempting to remove $registryPath'
        Remove-Item "$registryPath\$loginKey" -Recurse -Force
        Write-Host "Registry entry '$loginKey' removed successfully."
    } else {
        Write-Host "The key '$loginKey' does not exist."
    }
} else {
    Write-Host "The registry path '$registryPath' does not exist."
}

$identityRegistryPath = "HKCU:Software\Microsoft\Office\16.0\Common\Identity"
$identitiesKey = "Identities"
$profilesKey = "Profiles"
$saicKey = "ServiceAuthInfoCache"

# Check if the registry path exists
if (Test-Path $identityRegistryPath) {
    # Check if the specific key exists
    if (Test-Path "$identityRegistryPath\$identitiesKey") {
        # Remove the key
        Write-Host 'Attempting to remove $identityRegistryPath'
        Remove-Item "$identityRegistryPath\$identitiesKey" -Force -Recurse
        Write-Host "Registry entry '$identitiesKey' removed successfully."
    } else {
        Write-Host "The key '$identitiesKey' does not exist."
    }
    if (Test-Path "$identityRegistryPath\$profilesKey") {
        # Remove the key
        Write-Host 'Attempting to remove $identityRegistryPath'
        Remove-Item "$identityRegistryPath\$profilesKey" -Force -Recurse
        Write-Host "Registry entry '$profilesKey' removed successfully."
    } else {
        Write-Host "The key '$identitiesKey' does not exist."
    }
    if (Test-Path "$identityRegistryPath\$saicKey") {
        # Remove the key
        Write-Host 'Attempting to remove $identityRegistryPath'
        Remove-Item "$identityRegistryPath\$saicKey" -Force -Recurse
        Write-Host "Registry entry '$saicKey' removed successfully."
    } else {
        Write-Host "The key '$saicKey' does not exist."
    }
} else {
    Write-Host "The registry path '$identityRegistryPath' does not exist."
}

$autodisoverRegistryPath = "HKCU:\Software\Microsoft\Office\16.0\Outlook"
$autoDiscoverKey = "AutoDiscover"

# Check if the registry path exists
if (Test-Path $autodisoverRegistryPath) {
    # Check if the specific key exists
    if (Test-Path "$autodisoverRegistryPath\$autoDiscoverKey") {
        # Remove the key
        Write-Host 'Attempting to remove $registryPath'
        Remove-Item "$autodisoverRegistryPath\$autoDiscoverKey" -Force -Recurse
        Write-Host "Registry entry '$autoDiscoverKey' removed successfully."
    } else {
        Write-Host "The key '$autoDiscoverKey' does not exist."
    }
} else {
    Write-Host "The registry path '$autodisoverRegistryPath' does not exist."
}

$outlookRegistryPath = "HKCU:\Software\Microsoft\Office\16.0\Outlook\Profiles"
$outlookKey = "Outlook"

# Check if the registry path exists
if (Test-Path $outlookRegistryPath) {
    # Check if the specific key exists
    if (Test-Path "$outlookRegistryPath\$outlookKey") {
        # Remove the key
        Write-Host 'Attempting to remove $registryPath'
        Remove-Item "$outlookRegistryPath\$outlookKey" -Force -Recurse
        Write-Host "Registry entry '$outlookKey' removed successfully."
    } else {
        Write-Host "The key '$outlookKey' does not exist."
    }
} else {
    Write-Host "The registry path '$outlookRegistryPath' does not exist."
}

Write-Host 'Creating registry files'

$enableADALPath = "HKCU:\SOFTWARE\Microsoft\Office\16.0\Outlook\Common\Identity"
$enableADALKey = "EnableADAL"

# Check if the registry path exists
if (Test-Path $enableADALPath) {
    # Check if the specific key exists
    if (-NOT(Test-Path "$enableADALPath\$enableADALKey")) {
        # Remove the key
        Write-Host 'Attempting to add '$enableADALKey
        Set-ItemProperty -Path $enableADALPath -Name $enableADALKey -Value 1 -Type DWord
        Write-Host "Registry entry '$enableADALKey' added successfully."
    } else {
        Write-Host "The key '$enableADALKey' already exists."
    }
} else {
    Write-Host "The registry path '$enableADALPath' does not exist."
}

$forceMSOAuthPath = "HKCU:\Software\Microsoft\Exchange"
$forceMSOAuthKey = "AlwaysUseMSOAuthForAutodiscover"

# Check if the registry path exists
if (Test-Path $forceMSOAuthPath) {
    # Check if the specific key exists
    if (-NOT(Test-Path "$forceMSOAuthPath\$forceMSOAuthKey")) {
        # Remove the key
        Write-Host 'Attempting to add '$forceMSOAuthKey
        Set-ItemProperty -Path $forceMSOAuthPath -Name $forceMSOAuthKey -Value 1 -Type DWord
        Write-Host "Registry entry '$forceMSOAuthPath' added successfully."
    } else {
        Write-Host "The key '$forceMSOAuthKey' already exists."
    }
} else {
    Write-Host "The registry path '$forceMSOAuthPath' does not exist."
}

Write-Host 'Registry files have been updated'

Write-Host 'Flushing DNS'

ipconfig /flushdns

Start-Sleep -Seconds 60
