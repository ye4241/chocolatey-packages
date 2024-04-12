$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '741242908c10df977fef11dc8ffe68901383714c06386725236da4f350a1ddbb'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
