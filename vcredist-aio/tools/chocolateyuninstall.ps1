$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exeFileLocation = Join-Path $toolsDir "VisualCppRedist_AIO_x86_x64.exe"

$packageArgs = @{
  exeToRun = $exeFileLocation
  silentArgs     = "/aiR"
  validExitCodes = @(0)
}
Start-ChocolateyProcessAsAdmin @packageArgs