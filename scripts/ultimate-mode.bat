@echo off
title ULTIMATE MODE - Kelven Optimizer
:: Executa TODAS as otimizações anteriores em sequência

start /b "" "%~dp0cpu-extrema.bat"
start /b "" "%~dp0ram-extrema.bat"
start /b "" "%~dp0msi-mode.bat"
start /b "" "%~dp0timer-resolution.bat"
start /b "" "%~dp0hpet-disable.bat"
start /b "" "%~dp0game-mode.bat"
start /b "" "%~dp0limpeza-de-sistema.bat"
start /b "" "%~dp0otimizacao-de-rede.bat"
start /b "" "%~dp0servicos-do-windows.ps1"
start /b "" "%~dp0inicializacao.ps1"
start /b "" "%~dp0registro-do-sistema.ps1"
start /b "" "%~dp0efeitos-visuais.bat"

echo ✅ ULTIMATE MODE aplicado!
exit
