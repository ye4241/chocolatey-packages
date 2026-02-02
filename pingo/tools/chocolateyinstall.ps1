$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '037e7c3cc5ca355361ecc328eec50a41adc2faa6cdc18e1b1de4304de51b1b42'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
