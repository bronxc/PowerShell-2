Set-ExecutionPolicy -ExecutionPolicy Bypass
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
shutdown -r -f -t 10
