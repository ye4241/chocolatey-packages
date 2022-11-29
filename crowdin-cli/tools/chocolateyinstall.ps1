$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/crowdin/crowdin-cli/releases/download/3.9.1/crowdin-cli.zip'
  checksum      = '9f97837b6f7e1e11f860734bcd1848a71d9c787d69c344da5dd4ed55960d4f8f'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$unzipDir = Join-Path $toolsDir $packageVersion
Install-ChocolateyEnvironmentVariable -variableName "CROWDIN_HOME" -variableValue "$unzipDir"
Add-BinFile -name crowdin -path "$unzipDir\crowdin.bat"
