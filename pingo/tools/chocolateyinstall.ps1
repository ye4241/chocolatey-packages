$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '6a64d802d83be6de1e18c839362a84bb793c872937898fecfad7c3a74f85de4c'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
