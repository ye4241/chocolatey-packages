$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = "https://github.com/crowdin/crowdin-cli/releases/download/$packageVersion/crowdin-cli.zip"
  checksum      = 'cfd735d8a2ab878855ec0f76aa29cd090193c5923a22c989dd9fb765c6599639'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$unzipLocation = Join-Path $toolsDir $packageVersion
Install-ChocolateyEnvironmentVariable -variableName "CROWDIN_HOME" -variableValue "$unzipLocation"
Install-ChocolateyPath -pathToInstall $unzipLocation -pathType "Machine"
