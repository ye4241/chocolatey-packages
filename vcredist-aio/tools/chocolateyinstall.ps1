$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFileLocation = Join-Path $toolsDir "VisualCppRedist_AIO_x86_x64.zip"
$exeFileLocation = Join-Path $toolsDir "VisualCppRedist_AIO_x86_x64.exe"

$webFileArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $zipFileLocation
  url          = 'https://github.com/abbodi1406/vcredist/releases/download/v0.61.0/VisualCppRedist_AIO_x86_x64_61.zip'
  checksum     = ''
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @webFileArgs

$unzipArgs = @{
  fileFullPath = $zipFileLocation
  destination  = $toolsDir
}
Get-ChocolateyUnzip @unzipArgs

$processArgs = @{
  exeToRun       = $exeFileLocation
  statements     = "-y"
  validExitCodes = @(0)
}
Start-ChocolateyProcessAsAdmin @processArgs