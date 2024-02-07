$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'a797b17b0c76e6c3a06e70d612f3c142512ce1550a065ce0a990173a325f283f'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
