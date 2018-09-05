@echo off
REM Notify users that we are rebooting server
msg * This server will be rebooted in 15 minutes. Please save your work and log out until 2:30AM.
REM Disable new user logins to this machine
REM change logon /disable
sleep 600
msg * This server will be rebooted in 5 minutes. Please save your work and log out until 2:30AM.
sleep 300
shutdown /r /f /t 0