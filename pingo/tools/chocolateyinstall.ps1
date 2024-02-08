$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '592a4742ec45bbafc1b49db2335813c9c33cc1667429f5a61ded94339785eae1'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
