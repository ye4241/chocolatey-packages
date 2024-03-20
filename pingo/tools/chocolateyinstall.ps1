$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '9c2ae654944090d88d4cfacace3ebbb6b3d311f60a60ff95a6e4a2f0e1d8aef3'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
