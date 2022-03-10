# Name: memusage.ps1
# Created on: March 10, 2022
# Updated on: March 10, 2022
# Created by: Caleb Farrell<caleb.farrell@introhive.com>
# Description: This script is for use with Intune Endpoint Analtics and Proactive Remediation. Provides a readout of the current memory used in percentage.
#         If the memory usage is above 85.5% it will raise a warning in Intune otherwise will exit as normal.

$MemUsageLimit = 85.5
#Create a custom variable attached to the Win32_OS class, this is for simplicity in writing and readablity
$CompObject = Get-WmiObject -Class WIN32_OperatingSystem
#Retrieve the Total Available Memory, Divide  by Total Free * 100 to get a percentage
$Memory = ((($CompObject.TotalVisibleMemorySize - $CompObject.FreePhysicalMemory)*100)/$CompObject.TotalVisibleMemorySize)
# Round the decimal places to 2 for readability.
$MemRounded = [math]::Round($Memory,2)
​
Write-Host $MemRounded
try {
    if($MemRounded -ge $MemUsageLimit) {
        exit 1
    }
    else{
        exit 0
    }
}catch {
    $errMsg = $_.Exception.Message
    return $errMsg
    exit 1
}
