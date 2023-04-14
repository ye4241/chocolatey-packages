$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://github.com/gawindx/WinNUT-Client/releases/download/v2.0.7722.30975/WinNUT-Setup.msi'
  softwareName   = 'WinNUT'
  checksum       = 'afe7bb9f696aca17fc2c4bf16dcfd4a70221f8114d987acf71d51d1c4f3eef4c'
  checksumType   = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
