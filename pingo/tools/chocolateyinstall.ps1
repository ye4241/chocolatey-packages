$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '6e1a4e559c2c19b98357cbb85ca7767cf26cf5cdfa0a59d00f075ed6b5099bf2'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
