set executionpolicy bypass -force

# Create a Shortcut with Windows PowerShell

$SourceFileLocation = "$env:SystemRoot\System32\notepad.exe"

#$ShortcutLocation = "C:\Users\thiyagu.a.selvaraj\Desktop\Notepad.lnk"
#$ShortcutLocation = "C:\Users\muhammad majid\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Notepad.lnk"
#$ShortcutLocation = "C:\Users\$env:username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Notepad.lnk"
#$ShortcutLocation = "$env:appdata\Microsoft\Windows\Start Menu\Programs\Startup\Notepad.lnk"
$ShortcutLocation = "C:\Users\muhammad majid\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Notepad.lnk"

#New-Object : Creates an instance of a Microsoft .NET Framework or COM object.
#-ComObject WScript.Shell: This creates an instance of the COM object that represents the WScript.Shell for invoke CreateShortCut
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutLocation)
$Shortcut.TargetPath = $SourceFileLocation

#Save the Shortcut to the TargetPath
$Shortcut.Save()
