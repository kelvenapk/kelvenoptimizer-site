@echo off
title CPU Extrema - Kelven Optimizer
:: Plano de alta performance + otimizações CPU

powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /d 3 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /d 3 /t REG_DWORD /f >nul 2>&1
sc config SysMain start=disabled >nul 2>&1
net stop SysMain >nul 2>&1
sc config "WerSvc" start=disabled >nul 2>&1
net stop WerSvc >nul 2>&1
sc config "DiagTrack" start=disabled >nul 2>&1
net stop DiagTrack >nul 2>&1
exit
