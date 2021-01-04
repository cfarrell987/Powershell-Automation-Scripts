Write-Output "This Script Automates the Auto-Logon Registry Edits."
Start-Sleep -s 1
# Written by Caleb F. The coolest tech ever 
$RegPath = "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
$User = read-host "Enter the Domain"
Set-ItemProperty $RegPath "DefaultDomain" -Value $Domain -type String
Start-Sleep -s 1

Write-Output "Domain Added."



