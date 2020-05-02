Function insertTimeStamp { return (Get-Date).ToString('yyyy-MM-dd HH:mm:ss') + ' : ' }
#$path     = 'C:\Scripts'
$path     = '\\ieisf001\UserLogons$'
$log      = $path + "\$env:UserName.log"
(insertTimeStamp) + "$env:UserDomain\$env:UserName logged on $env:ComputerName ..." | Out-File $log -append
