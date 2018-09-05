Set-ExecutionPolicy -ExecutionPolicy Bypass
function Get-TimeStamp { return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date) }

$programName = "WorkBook.Agent.ConsoleRunner"
$Running = Get-Process $programName -ErrorAction SilentlyContinue
if (!$Running)
{
 "$(Get-TimeStamp) WorkBook.Agent.ConsoleRunner.exe NOT running... Launching" | Out-File -FilePath "C:\scripts\WorkBook_Launch.log" -append
 Start-Process C:\inetpub\WorkBook\Agents\Production\Workbook.Agent.ConsoleRunner.exe
}
else
{
 "$(Get-TimeStamp) WorkBook.Agent.ConsoleRunner.exe is already running..." | Out-File -FilePath "C:\scripts\WorkBook_Launch.log" -append
} 