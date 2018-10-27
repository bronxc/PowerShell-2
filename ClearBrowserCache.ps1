# Export list of users to C:\Temp\users.csv
dir C:\Users | select Name | Export-Csv -Path C:\Temp\users.csv -NoTypeInformation
$list=Test-Path C:\temp\users.csv

if ($list) {
    #Clear Google Chrome Cache for all users
    Import-CSV -Path C:\Temp\users.csv -Header Name | foreach {
        	Remove-Item -path "C:\Users\$($_.Name)\AppData\Roaming\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -EA SilentlyContinue
		Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -EA SilentlyContinue
        	Remove-Item -path "C:\Users\$($_.Name)\AppData\Roaming\Google\Chrome\User Data\Default\Media Cache\*" -Recurse -Force -EA SilentlyContinue
		Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Media Cache\*" -Recurse -Force -EA SilentlyContinue
            }
    #Clear Internet Explorer cache, temp files and WER logs
    Import-CSV -Path C:\temp\users.csv | foreach {
        Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -EA SilentlyContinue
		Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\WER\*" -Recurse -Force -EA SilentlyContinue
		Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Temp\*" -Recurse -Force -EA SilentlyContinue
            }
	Exit
	}
