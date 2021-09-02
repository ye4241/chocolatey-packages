$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  url           = 'https://disk-tool.com/download/mde/mde-free-portable.zip'
  unzipLocation = $toolsDir
  checksum      = 'b12697ca5b8dcf0b5973f79e2df134eb9b664175e760f4d2d7cb9e818015dbba'
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
