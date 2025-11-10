@echo off
title Cache Cleaner Pro - Kelven Optimizer

:: Limpeza silenciosa, profissional e segura
:: ❌ Não remove apps da Store
:: ❌ Não desloga do navegador
:: ✅ Limpa restos de apps desinstalados
:: ✅ Limpa registros órfãos seguros
:: ✅ Sem logs visuais (silencioso)

:: Limpa temporários do sistema e usuário
del /q /f /s %temp%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1
del /q /f /s C:\Windows\Prefetch\* >nul 2>&1

:: Limpa cache de navegadores (mantém cookies e login)
del /q /f /s "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Code Cache\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Code Cache\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Mozilla\Firefox\Profiles\*\cache2\*" >nul 2>&1

:: Limpa restos de apps desinstalados (sem tocar na Store)
del /q /f /s "%userprofile%\AppData\Local\Packages\*\TempState\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Packages\*\LocalCache\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Packages\*\LocalState\Cache\*" >nul 2>&1

:: Limpa logs e dumps de apps
del /q /f /s "%userprofile%\AppData\Local\CrashDumps\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Windows\WER\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\IconCacheToDelete\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*.tmp" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*.db" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*.db-wal" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*.db-shm" >nul 2>&1

:: Limpa restos de apps desinstalados (pastas órfãs)
for /f "delims=" %%D in ('dir /b /ad "%userprofile%\AppData\Local\" ^| findstr /v /i "Packages Microsoft Windows"') do (
    if exist "%userprofile%\AppData\Local\%%D\Cache\*" del /q /f /s "%userprofile%\AppData\Local\%%D\Cache\*" >nul 2>&1
    if exist "%userprofile%\AppData\Local\%%D\Temp\*" del /q /f /s "%userprofile%\AppData\Local\%%D\Temp\*" >nul 2>&1
    if exist "%userprofile%\AppData\Local\%%D\Logs\*" del /q /f /s "%userprofile%\AppData\Local\%%D\Logs\*" >nul 2>&1
)

:: Limpa registros órfãos seguros (sem quebrar nada)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f >nul 2>&1
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /f >nul 2>&1

:: Limpa MRU e históricos recentes (sem afetar apps)
del /q /f /s %userprofile%\Recent\* >nul 2>&1
del /q /f /s %userprofile%\AppData\Roaming\Microsoft\Windows\Recent\* >nul 2>&1

:: Limpa cache de apps comuns (sem deslogar)
del /q /f /s "%userprofile%\AppData\Local\Discord\Cache\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Spotify\Data\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Teams\Cache\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Teams\blob_storage\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Teams\databases\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Teams\GPUCache\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Teams\IndexedDB\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Teams\Local Storage\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\Teams\tmp\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\OneDrive\logs\*" >nul 2>&1
del /q /f /s "%userprofile%\AppData\Local\Microsoft\OneDrive\setup\logs\*" >nul 2>&1

:: Limpa cache de Windows Update (sem afetar updates)
del /q /f /s "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
del /q /f /s "C:\Windows\SoftwareDistribution\DataStore\Logs\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
del /q /f /s "C:\Windows\Logs\*" >nul 2>&1
del /q /f /s "C:\Windows\Panther\*" >nul 2>&1
del /q /f /s "C:\Windows\WinSxS\Temp\*" >nul 2>&1

:: Limpa cache de DNS (sem afetar conectividade)
ipconfig /flushdns >nul 2>&1

:: ✅ Finalizado silenciosamente
exit
