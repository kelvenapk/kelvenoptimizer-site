@echo off
title RAM Extrema - Kelven Optimizer
:: Otimiza memória + desativa coisas pesadas

sc config SysMain start=disabled >nul 2>&1
net stop SysMain >nul 2>&1
sc config "WerSvc" start=disabled >nul 2>&1
net stop WerSvc >nul 2>&1
sc config "DiagTrack" start=disabled >nul 2>&1
net stop DiagTrack >nul 2>&1
sc config "MapsBroker" start=disabled >nul 2>&1
net stop MapsBroker >nul 2>&1
sc config "lfsvc" start=disabled >nul 2>&1
net stop lfsvc >nul 2>&1
sc config "SharedAccess" start=disabled >nul 2>&1
net stop SharedAccess >nul 2>&1
sc config "TrkWks" start=disabled >nul 2>&1
net stop TrkWks >nul 2>&1
sc config "WbioSrvc" start=disabled >nul 2>&1
net stop WbioSrvc >nul 2>&1
exit
