$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFileLocation = Join-Path $toolsDir "VisualCppRedist_AIO_x86_x64.zip"
$unzipDir = $env:TEMP
$exeFileLocation = Join-Path $unzipDir "VisualCppRedist_AIO_x86_x64.exe"

$unzipArgs = @{
    fileFullPath = $zipFileLocation
    destination  = $unzipDir
}
Get-ChocolateyUnzip @unzipArgs

$processArgs = @{
    exeToRun       = $exeFileLocation
    statements     = "-aiR"
    validExitCodes = @(0)
}
Start-ChocolateyProcessAsAdmin @processArgs