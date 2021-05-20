$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName

$toolsDir = $env:TEMP
$zipFilePath = "$toolsDir\mde-free-setup.zip"

$packageArgs = @{
  packageName   = $packageName
  fileFullPath  = $zipFilePath
  url           = 'https://disk-tool.com/download/mde/mde-free-setup.zip'
  checksum      = 'a35c3eba15b8e28db6fb850596610c117de705989fd4f5e31b81aaf7d8dfa2f9'
  checksumType  = 'sha256'
  forceDownload = $true
}
Get-ChocolateyWebFile @packageArgs

$packageArgs = @{
  packageName  = $packageName
  fileFullPath = $zipFilePath 
  destination  = $toolsDir
}
Get-ChocolateyUnzip @packageArgs

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  file           = "$toolsDir\mde-free-setup.exe"
  softwareName   = 'Macrorit Partition Expert Free*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs