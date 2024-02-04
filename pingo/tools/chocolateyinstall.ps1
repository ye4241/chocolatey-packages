$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'c524fc231f6616f75f637e5b4d5fe1154f9080c5eaaefa63042addbd7591460f'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
