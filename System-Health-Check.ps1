<#
.SYNOPSIS
    Automated Windows System Health Check Tool.
.DESCRIPTION
    This script automates standard CompTIA A+ Core 2 maintenance tasks.
    It verifies internet connectivity, runs the System File Checker (SFC),
    and checks the core operating system drive health.
.NOTES
    Author: [Your Name]
    Requirement: Must be run as an Administrator.
#>

Clear-Host
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "         AUTOMATED WINDOWS SYSTEM HEALTH CHECK      " -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan

# 1. Check for Administrative Privileges
\$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not \$isAdmin) {
    Write-Host "[ERROR] This script must be run as an Administrator!" -ForegroundColor Red
    Write-Host "Please close this window, right-click PowerShell, and select 'Run as administrator'." -ForegroundColor Yellow
    Exit
}

Write-Host "[OK] Administrative privileges verified.`n" -ForegroundColor Green

# 2. Check Network Connectivity
Write-Host "Checking internet connectivity..." -ForegroundColor Yellow
$pingTest = Test-Connection -ComputerName 8.8.8.8 -Count 2 -Quiet

if ($pingTest) {
    Write-Host "[SUCCESS] Internet connection is active.`n" -ForegroundColor Green
} else {
    Write-Host "[WARNING] Internet connection failed. Check your network adapter or Wi-Fi.`n" -ForegroundColor Red
}

# 3. Check Hard Drive Health via WMI
Write-Host "Checking hard drive operational status..." -ForegroundColor Yellow
$driveStatus = Get-CimInstance -ClassName Win32_DiskDrive | Select-Object Model, Status

foreach ($drive in $driveStatus) {
    if ($drive.Status -eq "OK") {
        Write-Host "[SUCCESS] $($drive.Model) status is normal ($($drive.Status)).`n" -ForegroundColor Green
    } else {
        Write-Host "[ALERT] \((\)drive.Model) reports status: \((\)drive.Status). Backup data immediately!`n" -ForegroundColor Red
    }
}

# 4. Verify System File Integrity (SFC)
Write-Host "Scanning system files for corruption (Running SFC in Verify-Only mode)..." -ForegroundColor Yellow
Write-Host "This may take a couple of minutes..." -ForegroundColor Gray
sfc /verifyonly

Write-Host "`n====================================================" -ForegroundColor Cyan
Write-Host "             HEALTH CHECK COMPLETE                  " -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan
