net stop wuauserv
net stop cryptSvc
net Stop DoSvc
net stop bits
net stop msiserver
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
#Rename-Item -path 'C:\Windows\SoftwareDistribution' -NewName 'C:\Windows\SoftwareDistribution.old'
ren C:\Windows\System32\catroot2 Catroot2.old
#Rename-Item -path 'C:\Windows\System32\catroot2' -NewName 'C:\Windows\System32\catroot2.old'
net start msiserver
net start bits
net start DoSvc
net start cryptSvc
net start wuauserv
pause
exit
