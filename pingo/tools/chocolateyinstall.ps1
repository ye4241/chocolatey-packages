$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = 'e7d9b3ae70f40c85f9180e7e2bd4f39dfffe2b1e836e6cc61fc45ca9864ce65f'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
