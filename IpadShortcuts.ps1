$RMWIN = Read-Host "Enter RMWIN Folder Directory"

$nIPadNumStart = Read-Host "Enter Ipad User Starting Index"
$nIPadNumEnd = Read-Host "Enter Ipad User Ending Index"

$nIPadNumStart = [int]$nIPadNumStart - 1
$nIPadNum = $nIPadNumEnd - $nIPadNumStart



$nIPadStnNumStart = Read-Host "Enter Station Starting Index"
$nIPadStnNumEnd = Read-Host "Enter Station Ending Index"

$nIPadStnNumStart = [int]$nIPadStnNumStart - 1
$nIPadStnNum = $nIPadStnNumEnd - $nIPadStnNumStart

for ($i=1; $i -le $nIPadStnNum; $i++) {

    $nTrueIndexStn = $i + $nIPadStnNumStart
    Write-Output "Station Number: $nTrueIndexStn"


    $nTrueIndex = $i + $nIPadNumStart
    Write-Output "Ipad User Number: $nTrueIndex"
    
    $WshShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut("C:\Users\RMIPAD$nTrueIndex\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\rmpos.lnk")
    $Shortcut.TargetPath = $RMWIN + "\rmpos.exe"
    $Shortcut.Arguments = $nTrueIndexStn
    $Shortcut.WorkingDirectory = $RMWIN
    $Shortcut.Save()

    $Shortcut = $WshShell.CreateShortcut("C:\Users\RMIPAD$nTrueIndex\Desktop\rmpos.lnk")
    $Shortcut.TargetPath = $RMWIN + "\rmpos.exe"
    $Shortcut.Arguments = $nTrueIndexStn
    $Shortcut.WorkingDirectory = $RMWIN
    $Shortcut.Save()


    }