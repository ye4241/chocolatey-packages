$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/SychicBoy/NETReactorSlayer/releases/download/v6.4.0.0/NETReactorSlayer-windows.zip'
  checksum      = '4e0eaa4c0b33da23c792abc4f097478a772700939945c8c3e7956a09c32b7b6c'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
