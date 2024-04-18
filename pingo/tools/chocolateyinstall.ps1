$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '71f1bde72dca9d62b8922ef15b001f9ca92aec629107e8ef2149a89ed7138046'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
