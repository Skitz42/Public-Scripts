# Set the execution policy temporarily to allow script execution
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force

# Check if the PSWindowsUpdate is installed
if (Get-Module -ListAvailable | Where-Object { $_.Name -eq "PSWindowsUpdate" }) {
} else {
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
    Install-Module -Name PSWindowsUpdate -Force
    Import-Module PSWindowsUpdate
}

# Install Windows updates, accepting all updates and ignoring reboots
Get-WindowsUpdate -AcceptAll -Install -IgnoreReboot

# Restore the original execution policy
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine -Force