$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '234852b61b95342b8f27d1ee924ece13aa4a3836577ed81250fc2ecda6e9aa2d'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
