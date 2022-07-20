$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/dnSpy/dnSpy/releases/download/v6.1.8/dnSpy-netframework.zip'
  checksum      = '99c4bbc73d82c3d0d79f4d50ac08e86c569495a330f770ad2272fbe3843066d3'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs