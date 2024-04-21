$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'a668550c5963c2c54835fe694909ddc38b2deb0b376966bfb8423a734c66e995'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
