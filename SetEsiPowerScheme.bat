POWERCFG /CREATE ESI-Scheme
POWERCFG /CHANGE ESI-Scheme /monitor-timeout-ac 15
POWERCFG /CHANGE ESI-Scheme /monitor-timeout-dc 10
POWERCFG /CHANGE ESI-Scheme /disk-timeout-ac 0
POWERCFG /CHANGE ESI-Scheme /disk-timeout-dc 15
POWERCFG /CHANGE ESI-Scheme /standby-timeout-ac 0
POWERCFG /CHANGE ESI-Scheme /standby-timeout-dc 20
POWERCFG /CHANGE ESI-Scheme /hibernate-timeout-ac 0
POWERCFG /CHANGE ESI-Scheme /hibernate-timeout-dc 30
POWERCFG /CHANGE ESI-Scheme /processor-throttle-ac ADAPTIVE
POWERCFG /CHANGE ESI-Scheme /processor-throttle-dc ADAPTIVE
POWERCFG /SETACTIVE ESI-Scheme
