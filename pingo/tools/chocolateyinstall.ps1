$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'effb363e81538e8a41a2b2368a4f339912f85ad55cabb1d71815466637071d89'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
