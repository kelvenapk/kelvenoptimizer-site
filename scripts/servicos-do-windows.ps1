# Serviços do Windows - Kelven Optimizer
# Desativa apenas serviços DESNECESSÁRIOS e NÃO CRÍTICOS

$servicesToDisable = @(
    "Fax",
    "WerSvc",           # Windows Error Reporting
    "DiagTrack",        # Telemetria
    "dmwappushservice", # WAP Push Message Routing Service
    "MapsBroker",       # Downloaded Maps Manager
    "lfsvc",            # Geolocation Service
    "SharedAccess",     # Internet Connection Sharing
    "TrkWks",           # Distributed Link Tracking Client
    "WbioSrvc",         # Windows Biometric Service (se não usar)
    "WerSvc"            # Windows Error Reporting (repetido por segurança)
)

foreach ($svc in $servicesToDisable) {
    try {
        Set-Service -Name $svc -StartupType Disabled -ErrorAction SilentlyContinue
        Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
    } catch {}
}
