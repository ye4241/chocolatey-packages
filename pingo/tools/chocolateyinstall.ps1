$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'bde408f5769cf7a69753de3e45551397f91c15b825a1118fc020f244c83ce9e8'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
