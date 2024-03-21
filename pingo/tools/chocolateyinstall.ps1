$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '957fe07ffa413512532c08a81d05a622a92718805a3c0d3d542994f26c602564'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
