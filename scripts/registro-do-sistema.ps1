# Registro do Sistema - Kelven Optimizer
# Remove apenas entradas órfãs seguras

$keysToClean = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths",
    "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU"
)

foreach ($key in $keysToClean) {
    if (Test-Path $key) {
        Remove-ItemProperty -Path $key -Name "*" -ErrorAction SilentlyContinue
    }
}
