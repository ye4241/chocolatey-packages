$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '63bc3b00852436e432f854b089a5a359e734c1a78a266703a36e2543ea246cae'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
