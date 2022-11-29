$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFileLocation = Join-Path $toolsDir "VisualCppRedist_AIO_x86_x64.zip"
$unzipDir = $env:TEMP
$exeFileLocation = Join-Path $unzipDir "VisualCppRedist_AIO_x86_x64.exe"

$webFileArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = $zipFileLocation
  url          = 'https://github.com/abbodi1406/vcredist/releases/download/v0.64.0/VisualCppRedist_AIO_x86_x64_64.zip'
  checksum     = '365628a5d67cb99fc48f7f823d57bb3a812adc74584d798582d70f69aeffd7f1'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @webFileArgs

$unzipArgs = @{
  fileFullPath = $zipFileLocation
  destination  = $unzipDir
}
Get-ChocolateyUnzip @unzipArgs

$processArgs = @{
  exeToRun       = $exeFileLocation
  statements     = "-y"
  validExitCodes = @(0)
}
Start-ChocolateyProcessAsAdmin @processArgs
