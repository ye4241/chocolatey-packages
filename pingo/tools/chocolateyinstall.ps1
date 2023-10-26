$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '704563ff22ba54752c1fd2e09ae92ec25a24e4e6dbe813d0a769aa5cf67092b1'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
