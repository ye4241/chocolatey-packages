﻿$ErrorActionPreference = 'Stop'; 
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Axialis IconWorkshop*'
  fileType       = 'exe'
  silentArgs     = "/q"
  validExitCodes = @(0)
}

$uninstalled = $false
[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -eq 1) {
  $key | ForEach-Object { 
    $uninstallString = $_.UninstallString.Substring(0, $_.UninstallString.IndexOf('"') - 1)
    $packageArgs['file'] = "$($uninstallString)"
    Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyuninstall.ahk`""
    Uninstall-ChocolateyPackage @packageArgs
  }
}
elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
}
elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | ForEach-Object { Write-Warning "- $($_.DisplayName)" }
}


