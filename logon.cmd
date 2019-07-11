@echo off
for %%o in (A: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: V: W: X: Y: Z: ) do net use %%o /delete /yes

NET USE G: \\10.1.1.14\shared
NET USE S: \\HOT-ALEX-NAS-1\Shared-Archive
NET USE P: \\10.1.1.12\pictures
NET USE V: \\10.1.1.12\vbnet
NET USE X: \\10.1.1.12\reports
NET USE T: \\AX2009-APP\AX2009-Shared

rem "ACCOUNTS & FINANCE F:"
%logonserver%\netlogon\ifmember Finance
if %errorlevel% EQU 1 (
   NET USE F: \\10.1.1.14\finance
   NET USE I: \\HOT-ALEX-NAS-1\Finance-Archive
)

rem "Finance SMT"
%logonserver%\netlogon\ifmember Finance_SMT
if %errorlevel% EQU 1 (
   NET USE Y: \\10.1.1.14\Finance_SMT
)

rem "Management M:"
%logonserver%\netlogon\ifmember Management
if %errorlevel% EQU 1 (
   NET USE M: \\10.1.1.14\management
)

rem "Cooper St"
%logonserver%\netlogon\ifmember CooperSt
if %errorlevel% EQU 1 (
   NET USE Y: \\10.1.1.14\Cooper_St
)

rem "QA Management Q:"
%logonserver%\netlogon\ifmember QA_Management
if %errorlevel% EQU 1 (
   NET USE Q: \\10.1.1.14\QA_Management
)

rem "HR R:"
%logonserver%\netlogon\ifmember HR 
if %errorlevel% EQU 1 (
   NET USE R: \\10.1.1.14\HR
)

rem "HTT I:"
%logonserver%\netlogon\ifmember HTT_CORP 
if %errorlevel% EQU 1 (
   NET USE I: \\10.1.1.14\HTT_CORP
)


rem "10.1.1.14 Styleguides O:"
%logonserver%\netlogon\ifmember DriveO
if %errorlevel% EQU 1 (
  net use O: "\\10.1.1.14\All-Divisions"
)


rem "10.1.1.14 - Lic & Gen Division H:"
%logonserver%\netlogon\ifmember Div_Generic
if %errorlevel% EQU 1 (
  net use H: "\\10.1.1.14\Div_Licensed"
)

rem "PE-Nation N:"
%logonserver%\netlogon\ifmember PE-Nation
if %errorlevel% EQU 1 (
   NET USE N: "\\10.1.1.14\PE-Nation"
   NET USE J: "\\HOT-ALEX-NAS-1\PE-Archive"
)

rem "10.1.1.14 - Branded Division K:"
%logonserver%\netlogon\ifmember Div_Branded
if %errorlevel% EQU 1 (
  net use K: "\\10.1.1.14\Div_Branded"
)

rem =========== Drive L 
%logonserver%\netlogon\ifmember DriveL
if NOT %errorlevel% EQU 0 (
   NET USE L: \\10.1.1.13\i4 
)

rem =========== Drive Z:
%logonserver%\netlogon\ifmember DriveZ
if %errorlevel% EQU 1 (
    NET USE Z: \\10.1.3.16\data
)

rem "Sources Y:"
%logonserver%\netlogon\ifmember Source
if %errorlevel% EQU 1 (
   NET USE Y: \\n10850\Sources
)

rem "Archive W:"
%logonserver%\netlogon\ifmember Art-Archive
if %errorlevel% EQU 1 (
   NET USE W: \\N10850\GA-Archive
)

rem "Rebecca Vallance W:"
%logonserver%\netlogon\ifmember RV_Team
if %errorlevel% EQU 1 (
   NET USE W: \\HOSRV03\Rebecca_Vallance
)

if '%username%'=='teezed' (
 NET USE L: \\10.1.1.13\i4\edidocs\TZ
 NET USE G: /delete
 NET USE P: /delete
 NET USE V: /delete
 NET USE X: /delete
)

if '%username%'=='HSguest' (
 NET USE G: /delete
 NET USE P: /delete
 NET USE V: /delete
 NET USE X: /delete
)


::==========================================================

:init_env
%logonserver%\netlogon\ifmember HS_Users

if %errorlevel% EQU 1 (
	del "%USERPROFILE%\desktop\NetworkDrive.lnk"
	del "%USERPROFILE%\desktop\NetworkDrive-SI.lnk"
	del "%USERPROFILE%\desktop\AXECLIPSE.lnk"
	del "%USERPROFILE%\desktop\AXAPTA Live.lnk"
	del "%USERPROFILE%\desktop\AXECLIPSE2.lnk"
	del "%USERPROFILE%\desktop\AXAPTA Live2.lnk"
	del "%USERPROFILE%\desktop\New UAT.lnk"

   if not exist "%USERPROFILE%\desktop\NetworkDr*.lnk" (
     %logonserver%\netlogon\bin\robocopy.exe "%logonserver%\netlogon" "%USERPROFILE%\desktop" NetworkDrive.lnk
	)
   if not exist "%USERPROFILE%\desktop\AXECL*.lnk" (
     %logonserver%\netlogon\bin\robocopy.exe "%logonserver%\netlogon" "%USERPROFILE%\desktop" AXECLIP*.lnk
	)
   if not exist "%USERPROFILE%\desktop\Axapta*.lnk" (
     %logonserver%\netlogon\bin\robocopy.exe "%logonserver%\netlogon" "%USERPROFILE%\desktop" "Axapta*.lnk"
	)
   if not exist "%USERPROFILE%\desktop\New UAT.lnk" (
     %logonserver%\netlogon\bin\robocopy.exe "%logonserver%\netlogon" "%USERPROFILE%\desktop" "New UAT.lnk"
	)     
)

:chk_inv
%logonserver%\netlogon\bin\LSclient.exe hosrv05
if exist \\HOSRV01\netlogon\LanSweeper\. (
   if not exist \\HOSRV01\netlogon\LanSweeper\%COMPUTERNAME%.smt (
      %logonserver%\netlogon\bin\smart.exe  >  \\HOSRV01\netlogon\LanSweeper\%COMPUTERNAME%.smt
   )
)

goto :eof