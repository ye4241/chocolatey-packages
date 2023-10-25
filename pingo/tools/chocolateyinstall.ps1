$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'c4e3732361e87f04e32f918692f51709c5170b44888104d9a3e5c9cc5c88aba6'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
