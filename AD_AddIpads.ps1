Import-Module activedirectory

Write-Output = "This Script will automatically import the Ipad Users from the provided CSV."
Write-Output = "**REMEMBER** Change the domain section in the OU of the CSV to match that of the server you are setting up."

$FQDN = Read-Host = "What is the Domain name?"


$Users = Import-Csv -Delimiter "," -Path "C:\ADDIpads.csv"            
foreach ($User in $Users)            
{            
    $Displayname = $User.Firstname         
    $UserFirstname = $User.Firstname            
    $OU = "$User.OU"            
    $SAM = $User.SAM            
    $UPN = $User.Firstname + "@" + $FQDN.RM.LOCAL            
    $Description = $User.Description            
    $Password = $User.Password            
    New-ADUser -Name "$Displayname" -DisplayName "$Displayname" -SamAccountName $SAM -UserPrincipalName $UPN -GivenName "$UserFirstname"  -Description "$Description" -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -Path "$OU" -ChangePasswordAtLogon $false –PasswordNeverExpires $true -server $FQDN.RM.LOCAL            
}
Pause