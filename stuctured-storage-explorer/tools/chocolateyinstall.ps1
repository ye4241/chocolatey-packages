$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url            = 'https://github.com/ironfede/openmcdf/releases/download/v2.2.1.9/StructuredStorageXplorer.zip'
  checksum       = '2f3f74c59e6aec63dfbe34cc2128d0feb87e712da599da16da49d5c085a6b185'
  checksumType   = 'sha256'
  specificFolder = 'StructuredStorageXplorer'
}
Install-ChocolateyZipPackage @packageArgs
