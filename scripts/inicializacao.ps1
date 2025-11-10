# Inicialização - Kelven Optimizer
# Remove apenas programas NÃO ESSENCIAIS do startup

$startupPaths = @(
    "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup",
    "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
)

$whitelist = @("Windows Security", "OneDrive", "Spotify", "Discord", "Steam", "Epic Games Launcher")

Get-ChildItem -Path $startupPaths -Filter *.lnk -ErrorAction SilentlyContinue | ForEach-Object {
    $name = $_.BaseName
    if ($whitelist -notcontains $name) {
        Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue
    }
}
