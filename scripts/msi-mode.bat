@echo off
title MSI Mode - Kelven Optimizer
:: Ativa MSI Mode para GPU - reduz DPC latency

:: NVIDIA
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\PCI\VEN_10DE&DEV_*\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /d 1 /t REG_DWORD /f >nul 2>&1

:: AMD
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\PCI\VEN_1002&DEV_*\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /d 1 /t REG_DWORD /f >nul 2>&1
exit
