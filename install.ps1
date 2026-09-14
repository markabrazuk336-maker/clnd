#Requires -Version 5.1
<#
  CLND installer - curl/Homebrew style.

  Run:
    irm https://markabrazuk336-maker.github.io/clnd/install.ps1 | iex

  Downloads clnd.exe from the update site into %LOCALAPPDATA%\clnd, adds it to
  your PATH and fetches the starter formulas. No source code is downloaded.
#>
$ErrorActionPreference = 'Stop'

$Base = if ($env:CLND_BASE) { $env:CLND_BASE.TrimEnd('/') } else { 'https://markabrazuk336-maker.github.io/clnd' }
$Root = if ($env:CLND_ROOT) { $env:CLND_ROOT } else { Join-Path $env:LOCALAPPDATA 'clnd' }
$Bin = Join-Path $Root 'bin'

Write-Host ''
Write-Host '  CLND - Command-Line Native Distributor' -ForegroundColor Cyan
Write-Host "  Installing from $Base" -ForegroundColor DarkCyan
Write-Host ''

foreach ($d in @($Root, $Bin, (Join-Path $Root 'apps'), (Join-Path $Root 'cache'), (Join-Path $Root 'formulas'))) {
    New-Item -ItemType Directory -Path $d -Force | Out-Null
}

# version.json tells us the current version
$manifest = Invoke-RestMethod -Uri "$Base/version.json" -UseBasicParsing
Write-Host "Latest version: $($manifest.version)"

Write-Host 'Downloading clnd.exe ...'
Invoke-WebRequest -Uri "$Base/clnd.exe" -OutFile (Join-Path $Bin 'clnd.exe') -UseBasicParsing
Set-Content -LiteralPath (Join-Path $Root 'version') -Value $manifest.version -NoNewline

# starter formulas so `clnd install jq` works before `clnd update`
foreach ($f in @('jq', 'fd', '7zip')) {
    try {
        Invoke-WebRequest -Uri "$Base/formulas/$f.json" -OutFile (Join-Path $Root "formulas\$f.json") -UseBasicParsing
    } catch { }
}

# add to PATH and repair it (clnd keeps User PATH as REG_EXPAND_SZ)
if (-not $env:CLND_NO_PATH) {
    & (Join-Path $Bin 'clnd.exe') doctor --fix | Out-Null
}

Write-Host ''
Write-Host 'CLND installed successfully.' -ForegroundColor Green
Write-Host ''
Write-Host 'Next steps:'
Write-Host '  1. Open a new terminal (so PATH refreshes)'
Write-Host '  2. clnd update'
Write-Host '  3. clnd install ripgrep'
Write-Host '  4. clnd up        (to update clnd itself later)'
Write-Host ''
