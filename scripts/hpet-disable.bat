@echo off
title HPET Disable - Kelven Optimizer
:: Desativa HPET - reduz latência

bcdedit /set useplatformclock false >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /d 3 /t REG_DWORD /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /d 3 /t REG_DWORD /f >nul 2>&1
exit
