net stop spooler
del %systemroot%\System32\spool\printers\* /Q
del %systemroot%\System32\spool\printers\* /Q
net start spooler
