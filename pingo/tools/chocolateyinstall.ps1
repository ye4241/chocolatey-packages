$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'ec8d49b6baef0ab10d67b152d41e9c47137c3a5019c2279fe8dec70991c4ff10'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
