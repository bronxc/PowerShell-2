$Servers = Get-Content servers.txt
#add * infront and behind username for wildcard
$user = "*administrator*"

$findings = foreach ($computername in $Servers){

    $schtask = schtasks.exe /query /s $computername /V /FO CSV | ConvertFrom-Csv | Where { $_."Run As User" -like $user} | Select TaskName 
    if ($schtask) {Write-Host "`nTask" + $computername + $schtask }
	
	$displayname = Get-WmiObject -class win32_service -computername $computername |where-object startname -like $user | Select displayname
	if ($displayname){Write-Host "`n Service" + $computername + $displayname }
	
}