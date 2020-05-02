# C:\Folder should be staged with the desired user folder permissions, Domain Admins,
# SYSTEM, and CREATOR OWNER should have Full Control on "This Folder, Subfolders and Files.

$acl = Get-Acl -Path C:\folder
$folder = (Get-ChildItem -Path \\SERVER\redirectedfolders$).Name
$folder | ForEach-Object {
$user = New-Object System.Security.Principal.NTAccount ("DOMAIN", "$_")
# $acl = Get-Acl -Path "D:\FolderRedirection\$_" # EDIT: Removed this
$acl.SetOwner($user)
Set-Acl -AclObject $acl -Path "\\SERVER\redirectedfolders$\$_"
Get-ChildItem -Path "\\Server\redirectedfolders$\$_" -Recurse -Force | Set-Acl -AclObject $acl
}
