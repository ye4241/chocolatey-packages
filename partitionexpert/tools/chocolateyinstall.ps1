$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  url           = 'https://disk-tool.com/download/mde/mde-free-portable.zip'
  unzipLocation = $toolsDir
  checksum      = '36e7830f9071a03fad83ab059132cc9593b60a0e9a2c4e6c286af4ecbadfd29d'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$zipFolderPath = "$toolsDir\mde-free-portable"
if ([Environment]::Is64BitProcess -eq [Environment]::Is64BitOperatingSystem) {
  $exePath = Join-Path -Path $zipFolderPath -ChildPath "x64\dm.exe"
} else {
  $exePath = Join-Path -Path $zipFolderPath -ChildPath "x86\dm.exe"
}
if (Test-ProcessAdminRights) {
    $specialFolder = [Environment+SpecialFolder]::CommonPrograms
} else {
    $specialFolder = [Environment+SpecialFolder]::Programs
}
$linkPath = [Environment]::GetFolderPath($specialFolder) | Join-Path -ChildPath 'Macrorit Partition Expert Free.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $linkPath -TargetPath $exePath
