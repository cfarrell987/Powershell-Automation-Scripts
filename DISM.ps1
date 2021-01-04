# DISM.ps1
# Written by Caleb F.
Write-Output "This is the script to activate Windows Server 2016"
Start-Sleep -s 2
Write-Output "Enter the license key when prompted"
Start-Sleep -s 1
$key = read-host "Enter the License Key"
Write-Output "When prompted to restart, press Y"
Start-Sleep -s 1
DISM /online /Set-Edition:ServerStandard /AcceptEula /ProductKey:$key 