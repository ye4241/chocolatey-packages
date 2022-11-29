$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '844f674ecdaca4c428236ba3273b3a42c34a7f8a6eb5fcae4bfeb057c3f1e838'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
