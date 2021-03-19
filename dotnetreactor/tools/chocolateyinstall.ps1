$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.eziriz.com/download.php?download=dotnet_reactor_setup_6_5_0_0.exe'
  softwareName   = '.NET Reactor'
  checksum       = '091c8065ee1ea24de3eacd70d4ec6b7fcb3f419d834d4f1aca7cecc6e3ce36b0'
  checksumType   = 'sha256'
  silentArgs     = "/s"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
