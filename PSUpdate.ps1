#Requires -Module PSWindowsUpdate

Import-Module PSWindowsUpdate

# Command to get, install, accept all updates from Microsoft Update, and automatically reboot
# The process will continue after a reboot until no more updates are available
Get-WindowsUpdate -MicrosoftUpdate -AcceptAll | Install-WindowsUpdate -AcceptAll -Install -AutoReboot -Verbose
