# 🛡️ Automatización de Auditoría de Sistemas y Reporte de Eventos con PowerShell

## 🎯 Objetivo del Proyecto
Elaborar una solución automatizada para la auditoría periódica del estado de seguridad y operativo de sistemas Windows, enfocada en reducir el tiempo de revisión manual y estandarizar los informes de riesgo.

## 💡 Problema Resuelto
El proceso manual de revisión del estado de seguridad de los puntos finales (ej. inventario de software, cuentas inactivas y estado de parches) consumía mucho tiempo y era propenso a errores.

## ✅ Solución Implementada
Desarrollé un script en **PowerShell básico** para automatizar la recopilación de datos de sistemas Windows, realizando una auditoría rápida y precisa de los principales vectores de riesgo.

### Funcionalidades Clave:

* **Auditoría de Cuentas:** Identifica y lista cuentas de usuario inactivas y cuentas con privilegios de administrador local.
* **Inventario de Software:** Genera un listado del software instalado para identificar aplicaciones no autorizadas.
* **Verificación de Parches:** Reporta el estado de las últimas actualizaciones de seguridad.
* **Generación de Reporte:** Compila los resultados en un informe estructurado (HTML/TXT) para una revisión centralizada.

---

## 🚀 Guía de Uso

### 1. Configuración de la Política de Ejecución (¡Importante!)

Windows PowerShell restringe la ejecución de scripts por motivos de seguridad. Si el script no se ejecuta, sigue estos pasos:

1.  Abre PowerShell **como Administrador** (clic derecho > Ejecutar como administrador).
2.  **Verifica tu política actual:**
    ```powershell
    Get-ExecutionPolicy
    ```
3.  **Habilita temporalmente la ejecución** de scripts locales (solo para la sesión actual):

    ```powershell
    Set-ExecutionPolicy RemoteSigned -Scope Process
    ```
    *Nota: Si la sesión de PowerShell se cierra, la política vuelve a su estado original, manteniendo tu sistema seguro.*

### 2. Ejecutar el Script

1.  Navega hasta la carpeta del script en PowerShell.
2.  Ejecuta el script:

    ```powershell
    .\Audit_Report.ps1
    ```

3.  El informe se generará automáticamente en la ruta especificada en el script (ej. `C:\Temp\AuditReport_AAAA-MM-DD.html`).

## ⚙️ Tecnologías Utilizadas
* **Lenguaje de Scripting:** PowerShell básico
* **Sistema Operativo:** Windows
