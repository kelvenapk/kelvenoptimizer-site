# Power Plan Ultimate - Kelven Optimizer
Write-Host "⚡ Ativando plano de alta performance..." -ForegroundColor Green

try {
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    Write-Host "✅ Plano de alta performance ativado com sucesso!" -ForegroundColor Green
} catch {
    Write-Host "⚠️ Erro ao ativar plano de energia." -ForegroundColor Red
}

pause