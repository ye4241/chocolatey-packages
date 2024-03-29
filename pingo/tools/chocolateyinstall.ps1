$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '99ad43dd44c5b6c1f32390bb634061ba1fe6ad1653cf2180342752a37da70f58'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
