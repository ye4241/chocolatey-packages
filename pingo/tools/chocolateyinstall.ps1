$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '1b045f586fa9fe03722eef9e7f0df7d42dd25019133b14cbe16537a782ed3bf0'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
