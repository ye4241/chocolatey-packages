$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '263581a47ca54b6d1f72a3ab3aacc6a4bc059b9cfaa07cfa4d7e5395b49dcb30'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
