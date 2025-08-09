$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '4b308b274d5e3aa672cb5376d951e4b1566f064400d835b0c15ca0590db2fe82'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
