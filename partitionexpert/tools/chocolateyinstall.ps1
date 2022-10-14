$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  url           = 'https://disk-tool.com/download/mde/mde-free-portable.zip'
  unzipLocation = $toolsDir
  checksum      = '47349320a6fa64ece85bbfce7fa5e98464e923c3b0f1a1389a5d8d7360e4a7c7'
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
