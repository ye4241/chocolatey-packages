﻿$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url64bit       = 'https://css-ig.net/bin/pingo-win64.zip'
  checksum64     = '61810495d8303db3d3f03c639d017a41ac923891d4343a354a823555a4800555'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
