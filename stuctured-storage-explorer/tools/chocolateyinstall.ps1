$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url            = 'https://github.com/ironfede/openmcdf/releases/download/v2.3.0.0/StructuredStorageXplorer.zip'
  checksum       = '5cfbd5c12ebf6e7b6ca97591ea7ddd971dae54b881326a824b16cfad00b67b9a'
  checksumType   = 'sha256'
  specificFolder = 'StructuredStorageXplorer'
}
Install-ChocolateyZipPackage @packageArgs
