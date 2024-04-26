$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '4a28ab56c4dd6b778901134c07cc37a6ff224ce658520bee684a8017ffcf9369'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
