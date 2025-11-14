# ====================================================================
# SCRIPT: Audit_Report.ps1
# DESCRIPCION: Script de PowerShell para automatizar la auditoría básica 
#              de seguridad y generar un reporte.
# AUTOR: Marcos Ruiz Arroyo
# ====================================================================

# 1. Definir Variables y Parámetros
$ReportPath = "C:\Temp\AuditReport_" + (Get-Date -Format "yyyyMMdd") + ".html"

# 2. Recopilación de Datos del Sistema (Ejemplo: Cuentas Inactivas)

Write-Host "Iniciando auditoria de cuentas de usuario..."

# Obtener todas las cuentas locales
$Users = Get-LocalUser | Select-Object Name, Enabled, LastLogon

# Simular la identificación de cuentas inactivas (ajustar la lógica según el sistema)
$InactiveUsers = @()
foreach ($User in $Users) {
    # Lógica simplificada: Cuentas que nunca han iniciado sesión o son genéricas.
    if ($User.LastLogon -eq $null -or $User.Name -like "*test*") {
        $InactiveUsers += $User
    }
}


# 3. Recopilación de Datos del Inventario (Ejemplo: Software Instalado)

Write-Host "Obteniendo inventario de software..."
$SoftwareList = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | 
                Select-Object DisplayName, DisplayVersion, InstallDate | 
                Where-Object {$_.DisplayName -ne $null} | Sort-Object DisplayName


# 4. Generación del Reporte (Usando HTML para un informe profesional)

# Inicio del archivo HTML
$HTML = @"
<html>
<head>
    <title>Informe de Auditoria de Sistemas - $(hostname)</title>
    <style>
        body { font-family: Arial; }
        h1 { color: #333; }
        table { border-collapse: collapse; width: 80%; margin-bottom: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Informe de Auditoria de Sistemas para $(hostname)</h1>
    <p>Fecha de Generacion: $(Get-Date)</p>
    <h2>Cuentas Inactivas/Sospechosas</h2>
    <p>Cuentas encontradas: $($InactiveUsers.Count)</p>
    $($InactiveUsers | ConvertTo-Html -Fragment)
    
    <h2>Inventario de Software</h2>
    <p>Total de aplicaciones: $($SoftwareList.Count)</p>
    $($SoftwareList | ConvertTo-Html -Fragment)
    
</body>
</html>
"@

# 5. Guardar el Reporte
$HTML | Out-File $ReportPath -Encoding UTF8

Write-Host "Auditoria finalizada. Reporte guardado en: $ReportPath"