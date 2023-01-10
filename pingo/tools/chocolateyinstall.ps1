$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '4a7622ccb2263e6f767f0792c491d4c081a9f6c3bae2374d658d23fbeac0e3df'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
