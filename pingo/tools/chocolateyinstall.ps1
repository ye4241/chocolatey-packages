$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'ac1ef50d533fe390f827be74bdd841ea4431480ff9ae20a1dd1de0e88b822110'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
