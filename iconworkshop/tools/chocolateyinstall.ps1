$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.axialis.com/downloads/IconWorkshop-Pro-32-bit.exe'
  url64bit       = 'https://www.axialis.com/downloads/IconWorkshop-Pro.exe'
  softwareName   = 'Axialis IconWorkshop*'
  checksum       = 'dfe2c9c36fc1b8568855a1d1a0398a08b5c2ca1824433ecbb1fae6be048fd850'
  checksum64     = '7ec5f959dd4d3a765ecc850f64cccf7fa0ed8b7d87485737a7f35fd1df4d8690'
  checksumType   = 'sha256'
  silentArgs     = "/q"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
