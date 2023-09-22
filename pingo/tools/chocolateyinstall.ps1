$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '0efd85f196430f897a664931839f178ad0ce32c313ce2c6716629550ea2ff09f'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
