#Set-ExecutionPolicy -ExecutionPolicy Bypass
function Get-TimeStamp { return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date) }

$programName = "chrome"
$fullProgramPath = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe https://app.cartoncloud.com.au"
$Running = Get-Process $programName -ErrorAction SilentlyContinue
if (!$Running)
{
 "$(Get-TimeStamp) Chrome NOT running... Launching" | Out-File -FilePath "C:\scripts\chrome_running.log" -append
 Invoke-WmiMethod -Class Win32_Process -Name create -ArgumentList $fullProgramPath
}
else
{
 "$(Get-TimeStamp) Chrome is already running..." | Out-File -FilePath "C:\scripts\chrome_running.log" -append
}
