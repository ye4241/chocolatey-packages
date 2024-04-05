$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '3f0593edb7aff97a828c4e974958d70383836ba3391e47e293f44ec5916d2ee9'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
