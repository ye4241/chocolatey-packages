$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '41699e11bd78d1b0491b427a1881fc3bb6849c43ab94a69f43e963dfa7e79f39'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
