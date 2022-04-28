$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://download-cdn.getsync.com/2.7.3/windows/Resilio-Sync.exe'
  url64bit       = 'https://download-cdn.getsync.com/2.7.3/windows64/Resilio-Sync_x64.exe'
  softwareName   = 'Resilio Sync'
  checksum       = 'f68ce817832191f8b8c5fe5bfcaa47dcba548db995571eb220473ff92ad14d23'
  checksumType   = 'sha256'
  checksum64     = 'dc9c72e709cc7a2ea74999ce3756e6f4879cd6eae50a888a1f8ca011a1d6efa3'
  checksumType64 = 'sha256'
  silentArgs     = "/PERFORMINSTALL /S"
  validExitCodes = @(0, 1)
}
Install-ChocolateyPackage @packageArgs
