$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'e487e4a081568d046ec044d4e7c0d030aba780089bdfa5e495c6d21e1fc4d981'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
