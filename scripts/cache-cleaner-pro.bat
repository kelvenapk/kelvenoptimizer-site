@echo off
title Cache Cleaner Pro - Kelven Optimizer
echo 🧹 Limpando arquivos temporários...
del /q /f /s %temp%\* >nul 2>&1
del /q /f /s C:\Windows\Prefetch\* >nul 2>&1
del /q /f /s %userprofile%\Recent\* >nul 2>&1
echo ✅ Limpeza concluída!
pause
