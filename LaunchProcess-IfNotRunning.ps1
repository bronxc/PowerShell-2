#Set-ExecutionPolicy -ExecutionPolicy Bypass
Function insertTimeStamp { return '[' + (Get-Date).ToString('yyyy-MM-dd HH:mm:ss') + '] : ' }	#//use by (insertTimeStamp)

$programName = "PQRefreshManager"
$fullProgramPath = "C:\Program Files\PowerPlanner\Power Update\PQRefreshManager.exe"
$Running = Get-Process $programName -ErrorAction SilentlyContinue
if (!$Running)
{
 "$(insertTimeStamp) PQRefreshManager NOT running... Launching" | Out-File -FilePath "C:\scripts\PQRefreshManager_running.log" -append
 Invoke-WmiMethod -Class Win32_Process -Name create -ArgumentList $fullProgramPath
}
else
{
 "$(insertTimeStamp) PQRefreshManager is already running..." | Out-File -FilePath "C:\scripts\PQRefreshManager_running.log" -append
}
