$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'b84c7d8f8d27be0e94872579e70f9392fbfdd9d91c544a8345575f530ed449b4'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
