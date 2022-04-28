
$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Registry Workshop' 
  fileType       = 'exe'
  silentArgs     = "/S"
  validExitCodes = @(0)
}
[array]$keys = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']
if ($keys.Count -eq 1) {
  $uninstallString = $keys[0].UninstallString
  if ($uninstallString.Contains('"')) {
    $uninstallString = ($uninstallString | Select-String '"(.*?)"' -AllMatches).Matches[0].Groups[1].Value
  }
  $packageArgs['file'] = $uninstallString
  Uninstall-ChocolateyPackage @packageArgs
}
elseif ($keys.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
}
elseif ($keys.Count -gt 1) {
  Write-Warning "$($keys.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $keys | ForEach-Object { Write-Warning "- $($_.DisplayName)" }
}