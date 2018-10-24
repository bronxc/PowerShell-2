`Import-Module activedirectory
#add-pssnapin Microsoft.Exchange.Management.PowerShell.E2010

$m=Get-ADUser -SearchBase "OU=Users,OU=IDPLawyers,DC=ad,DC=idplawyers,DC=com,DC=au" -Filter 'enabled -eq $true'  |? { $_.DistinguishedName -notlike "*ou=Service Accounts,*" } |select name | sort name

$count= $m.count
Write-Host "Hi Operations Team! The number of active users for Token this month is: $count"
Get-ADUser -SearchBase "OU=Users,OU=IDPLawyers,DC=ad,DC=idplawyers,DC=com,DC=au" -Filter 'enabled -eq $true'  |? { $_.DistinguishedName -notlike "*ou=Service Accounts,*" } |select name | sort name | out-file 'c:\temp\MonthlyEnabledUsersReport.txt'

#Send-MailMessage -To "email address" -Subject 'Company - Monthly Enabled Users Report' -Body "Hi Operations Team Please find 

attached a list of enabled accounts for the month. The number of enabled accounts users are: $count"  -SmtpServer localhost -From 

huonit@bstone.com.au -Attachments 'C:\Temp\MonthlyEnabledUsersReport.txt'