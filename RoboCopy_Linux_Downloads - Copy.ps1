<#
robocopy source destination options
/e copy subfolders incluisive of empty
/z copy files in restartable mode
/j copy using unbuffered I/O (for big files)
/move del source after copy success (deletes the source folder itself!!!)
/ts inlude source file timestamps in output
/fp inlcude full pathnames of files in output
/np don't show progress in log
/eta show eta of copied files
/LOG+:filename.log output log file
#>

Set-ExecutionPolicy Bypass	#get higher priveledges
net use Z: \\IQRA-VAIO\linux_share 123456 /user:mj /persistent:YES	#create mapping for robocopy to work
mkdir "Z:\Movies\ToMove"	#create a seperate dir since robocopy /move switch deletes the source folder itself
Move-Item -Path Z:\Movies\* -Destination Z:\Movies\ToMove -Force	#move contents to this, so that by the time robocopy removes it, no new content gets added.
robocopy Z:\Movies\ToMove D:\Movies /e /z /j /MOVE /ts /fp /np /eta /R:24 /W:300 /LOG+:C:\Scripts\robocopy.log	#do the magic
shutdown -s -t 600
