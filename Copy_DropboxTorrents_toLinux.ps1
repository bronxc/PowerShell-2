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

Set-ExecutionPolicy -ExecutionPolicy Bypass	#get higher priveledges
net use L: \\IQRA-VAIO\Linux_Share 123456 /user:mj /persistent:YES	#create mapping for robocopy to work
mkdir "C:\Users\Mj\Dropbox\TorrentsToDo\ToMove"	#create a seperate dir since robocopy /move switch deletes the source folder itself
Move-Item -Path C:\Users\Mj\Dropbox\TorrentsToDo\* -Destination C:\Users\Mj\Dropbox\TorrentsToDo\ToMove -Exclude "*.log" -Force	#move contents to this, so that by the time robocopy removes it, no new content gets added.
robocopy C:\Users\Mj\Dropbox\TorrentsToDo\ToMove L:\BinglyBT_Pickup /e /z /j /MOVE /ts /fp /np /eta /R:3 /W:10 /LOG+:C:\Users\Mj\Dropbox\TorrentsToDo\DropboxTorrents_toLinux.log	#do the magic
