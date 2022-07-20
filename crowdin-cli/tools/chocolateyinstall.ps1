$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = $env:ChocolateyPackageName
$packageVersion = $env:ChocolateyPackageVersion
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = "https://github.com/crowdin/crowdin-cli/releases/download/3.7.9/crowdin-cli.zip"
  checksum      = '82846a8ffdc133b0cf5a57c91fd9205bd2503f5946590a1de833bc7e67113ea7'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$unzipDir = Join-Path $toolsDir $packageVersion
Install-ChocolateyEnvironmentVariable -variableName "CROWDIN_HOME" -variableValue "$unzipDir"
Add-BinFile -name crowdin -path "$unzipDir\crowdin.bat"
