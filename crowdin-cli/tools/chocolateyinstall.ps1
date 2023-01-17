$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/crowdin/crowdin-cli/releases/download/3.9.3/crowdin-cli.zip'
  checksum      = 'a7c69b2200805e8fcb5bf0193767ac498564568820436be3e50900b1e1f05c9a'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$unzipDir = Join-Path $toolsDir $packageVersion
Install-ChocolateyEnvironmentVariable -variableName "CROWDIN_HOME" -variableValue "$unzipDir"
Add-BinFile -name crowdin -path "$unzipDir\crowdin.bat"
