Write-Output "This Script Automates the Auto-Logon Registry Edits."
Start-Sleep -s 1
# Written by Caleb F.
# For use by AHTPOS staff ONLY!
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
Set-ItemProperty $RegPath "AutoAdminLogon" -Value "1" -type String

$User = read-host "Enter the Username"
Set-ItemProperty $RegPath "DefaultUsername" -Value $User -type String
Start-Sleep -s 1
$Pass = read-host "Enter the Password" -AsSecureString
Set-ItemProperty $RegPath "DefaultPassword" -Value $Pass -type String
Start-Sleep -s 1
