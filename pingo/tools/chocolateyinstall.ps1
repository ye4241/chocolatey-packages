$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '2b0c848571b4dfc398750fa8bccddc800431427b00ae8a2a6927cdfd04780147'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
