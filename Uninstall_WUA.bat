@echo off
mkdir C:\Scripts

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

REM echo datestamp: "%datestamp%"
REM echo timestamp: "%timestamp%"
REM echo fullstamp: "%fullstamp%"

@echo "%datestamp%-%timestamp% - Runing Uninstall_WUA.bat" >> C:\Scripts\Uninstall_WUA.log
C:\Windows10Upgrade\Windows10UpgraderApp.exe /ForceUninstall
Timeout /T 30 /NOBREAK
Del C:\Windows\UpdateAssistant\*.* /F /Q
Del C:\Windows\UpdateAssistantV2\*.* /F /Q
Del C:\Windows\UpdateAssistantV3\*.* /F /Q
Del C:\Windows\UpdateAssistantV4\*.* /F /Q


for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
@echo "%datestamp%-%timestamp% - Script execution completed.." >> C:\Scripts\Uninstall_WUA.log


