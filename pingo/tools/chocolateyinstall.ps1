$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'ef3c6bda9550409d7ffea6c4b7934defcec088ec298be9c6aee397e98cfb812c'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
