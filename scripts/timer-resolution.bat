@echo off
title Timer Resolution - Kelven Optimizer
:: Ajusta timer para 0.5ms - reduz input lag

bcdedit /set useplatformclock false >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
exit
