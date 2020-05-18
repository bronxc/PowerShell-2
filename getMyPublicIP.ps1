Function insertTimeStamp { return '[' + (Get-Date).ToString('yyyy-MM-dd HH:mm:ss') + '] : ' }
"$(insertTimeStamp) Public IP is: " + (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content | Out-File -FilePath "C:\Scripts\myPublicIP.log" -append
