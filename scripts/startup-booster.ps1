# Startup Booster - Kelven Optimizer
Write-Host "🚀 Iniciando Startup Booster..." -ForegroundColor Green

# Lista programas ativados no startup
$startup = Get-CimInstance Win32_StartupCommand |
           Where-Object { $_.Location -like "*Startup*" } |
           Select-Object Name, Command, Location

if ($startup.Count -eq 0) {
    Write-Host "✅ Nenhum programa desnecessário encontrado no startup." -ForegroundColor Yellow
} else {
    Write-Host "📋 Programas encontrados no startup:" -ForegroundColor Cyan
    $startup | Format-Table -AutoSize

    $disable = Read-Host "Deseja desativar todos os programas listados? (s/n)"
    if ($disable -eq 's') {
        foreach ($item in $startup) {
            try {
                Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\$($item.Name).lnk" -ErrorAction SilentlyContinue
                Write-Host "✅ Desativado: $($item.Name)" -ForegroundColor Green
            } catch {
                Write-Host "⚠️ Erro ao desativar: $($item.Name)" -ForegroundColor Red
            }
        }
    } else {
        Write-Host "❌ Nenhuma alteração foi feita." -ForegroundColor Yellow
    }
}

Write-Host "✅ Startup Booster finalizado!" -ForegroundColor Green
pause