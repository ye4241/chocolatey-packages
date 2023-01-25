$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/crowdin/crowdin-cli/releases/download/3.10.0/crowdin-cli.zip'
  checksum      = 'e0e13079eee2cddda0c6fec732ae738aef3cb23efc411b461f86e0a286572e8c'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$unzipDir = Join-Path $toolsDir $packageVersion
Install-ChocolateyEnvironmentVariable -variableName "CROWDIN_HOME" -variableValue "$unzipDir"
Add-BinFile -name crowdin -path "$unzipDir\crowdin.bat"
