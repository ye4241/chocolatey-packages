$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.eziriz.com/download.php?download=dotnet_reactor_setup_6_7_0_0.exe'
  softwareName   = '.NET Reactor'
  checksum       = '1eb688ed25bdf0ac3ff8ca4dba4dd39e78ab5dc6c719a8a3568703226ee03da8'
  checksumType   = 'sha256'
  silentArgs     = "/s"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
