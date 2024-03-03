$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url            = 'https://github.com/ironfede/openmcdf/releases/download/v2.3.1.0/StructuredStorageXplorer.zip'
  checksum       = '0214d46faccd8c066656b2566b4ec2342a4a130065741722185feda49e004efb'
  checksumType   = 'sha256'
  specificFolder = 'StructuredStorageXplorer'
}
Install-ChocolateyZipPackage @packageArgs
