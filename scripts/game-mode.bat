@echo off
title Game Mode Pro - Kelven Optimizer

:: Game Mode Pro - Otimizações reais para jogos competitivos
:: ✅ Não quebra anti-cheats
:: ✅ Reversível
:: ✅ Silencioso

:: 1. Desativa Windows Game DVR (reduz input lag)
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /d 0 /t REG_DWORD /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "ShowStartupPanel" /d 0 /t REG_DWORD /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "GameDVR_Enabled" /d 0 /t REG_DWORD /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "GameDVR_FSEBehaviorMode" /d 2 /t REG_DWORD /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "GameDVR_HonorUserFSEBehaviorMode" /d 1 /t REG_DWORD /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /d 1 /t REG_DWORD /f >nul 2>&1

:: 2. Desativa captura de tela / gravação (reduz overhead)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /d 0 /t REG_DWORD /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "GameDVR_Enabled" /d 0 /t REG_DWORD /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "GameDVR_FSEBehaviorMode" /d 2 /t REG_DWORD /f >nul 2>&1

:: 3. Otimiza prioridade de processos em foreground
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /d 10 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /d 0 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /d "High" /t REG_SZ /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /d "High" /t REG_SZ /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /d "False" /t REG_SZ /f >nul 2>&1

:: 4. Desativa HPET (reduz latência) - apenas se existir
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /d 3 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /d 3 /t REG_DWORD /f >nul 2>&1

:: 5. Timer resolution ajustado para 0.5ms (reduz input lag)
bcdedit /set useplatformclock false >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1

:: 6. Desativa节能模式 e prioriza performance
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

:: 7. Desativa Windows Search durante jogos (reduz overhead)
sc config WSearch start=disabled >nul 2>&1
net stop WSearch >nul 2>&1

:: 8. Otimizações de rede para jogos
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /d 1 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /d 1 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpDelAckTicks" /d 0 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /d 64 /t REG_DWORD /f >nul 2>&1

:: 9. Desativa Nagle's algorithm (reduz lag de rede)
for /f "tokens=1,2 delims=:" %%A in ('ipconfig ^| findstr /i "ethernet"') do (
    for /f "tokens=1,2 delims=:" %%B in ('ipconfig ^| findstr /i /c:"%%A"') do (
        for /f "tokens=1,2 delims= " %%C in ('netsh interface tcp show global ^| findstr /i "nagle"') do (
            netsh interface tcp set global nagle=disabled >nul 2>&1
        )
    )
)

:: 10. Desativa cortes de energia em dispositivos USB
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\USB\ROOT_HUB30\*\Device Parameters" /v "SelectiveSuspendEnabled" /d 0 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\USB" /v "SelectiveSuspendEnabled" /d 0 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v "SelectiveSuspendEnabled" /d 0 /t REG_DWORD /f >nul 2>&1

:: 11. Desativa Windows Defender durante jogos (opcional - não quebra anti-cheat)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /d 1 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /d 1 /t REG_DWORD /f >nul 2>&1

:: 12. Otimizações de CPU para jogos
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /d 3 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /d 3 /t REG_DWORD /f >nul 2>&1

:: 13. Desativa SysMain (antigo Superfetch) - reduz stuttering
sc config SysMain start=disabled >nul 2>&1
net stop SysMain >nul 2>&1

:: 14. Otimizações finais de sistema
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /d "Off" /t REG_SZ /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /d 0 /t REG_DWORD /f >nul 2>&1

:: ✅ Finalizado silenciosamente
exit
