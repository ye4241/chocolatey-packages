$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'c1dde3b39075d9ab99ca17571561b1ca53497ec1ef40d86495289157ba5b12fe'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
