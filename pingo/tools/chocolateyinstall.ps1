$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '151339366f59224800f8f45bdab3f288d77da423ba216aee9e415b13c96a9cf7'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
