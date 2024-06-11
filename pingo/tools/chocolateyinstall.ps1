$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '65d6107034406921a99733ba8f1f721930565a5b3f0a6bfa39a2d4ce91462538'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
