@echo off
title Otimização de Rede - Kelven Optimizer
:: Otimiza TCP/IP, DNS, cache - sem quebrar conectividade

ipconfig /flushdns >nul 2>&1
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1
netsh int ip reset >nul 2>&1
netsh winsock reset >nul 2>&1
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global chimney=enabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global netdma=enabled >nul 2>&1
netsh int tcp set global ecncapability=disabled >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /d 1 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /d 1 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpDelAckTicks" /d 0 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /d 64 /t REG_DWORD /f >nul 2>&1
exit
