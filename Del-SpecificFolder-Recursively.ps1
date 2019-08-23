#$source = 'C:\root\folder'	#starting point within which the deletion applies
$source = 'C:\'	#starting point within which the deletion applies
$names  = @('$RECYCLE.BIN')	#folder name to delete. WARNING!!!! All subfolders within will get deleted!!
Get-ChildItem $source -Recurse -Force | Where-Object { $_.PSIsContainer -and $names -contains $_.Name } | Sort-Object FullName -Descending | Remove-Item -Recurse -Force
