$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'd3cb1ad7ba9553d05252c2261b5bfc8223b19a05412c0b6da5599b53dcd830b4'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
