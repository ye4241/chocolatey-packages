$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'f2d40cf7017f057bc0682905425907498c10141cb855624b9c02fec40733e6ff'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
