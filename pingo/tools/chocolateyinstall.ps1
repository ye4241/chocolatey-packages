$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '04f7ca18347a55573df7fd2963c9826653e210c1d4dd62f59b154ec96c70850f'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
