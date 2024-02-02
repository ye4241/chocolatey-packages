$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '3c96b2f083f381318034856367c34fef174237c90bfb681a73b6a9b437b70923'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
