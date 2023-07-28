$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  url           = 'https://disk-tool.com/download/mde/mde-free-portable.zip'
  unzipLocation = $toolsDir
  checksum      = '3b734c8cc27d135aeea665dba6cfa0c3539d6e9cc084adac50a6e8faf4ac1c22'
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
