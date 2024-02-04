$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '08df9d0518fb7800143b243d0b56db69b3d78be8e8229f413e8eed38fc846d86'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
