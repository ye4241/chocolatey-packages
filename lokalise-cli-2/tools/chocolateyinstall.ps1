$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = "https://github.com/lokalise/lokalise-cli-2-go/releases/download/v$packageVersion/lokalise2_windows_x86_64.zip"
  checksum      = '5bf1c9b05dedb1f4c173e1072f2f1f99910c995803d5035e6df7997c7458abdc'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$unzipDir = $toolsDir
Install-ChocolateyPath -pathToInstall $unzipDir -pathType "Machine"
