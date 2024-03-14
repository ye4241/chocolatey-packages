$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '9625e8e7fd5c1941363bb76b072f5650d0b2941d6f3199a62633342fb02aa820'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
