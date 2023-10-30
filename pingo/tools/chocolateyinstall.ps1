$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '21e85868a7ee275607224b0b16fc8b17b695fb1f9844d81c1da67da250b62b1d'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
