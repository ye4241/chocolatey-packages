$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '4c2b6159ea548f8d702b875f9bf0282bbe238cf75f9815c7ef87d810f63d2b79'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
