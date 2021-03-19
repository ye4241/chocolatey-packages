$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.eziriz.com/download.php?download=dotnet_reactor_setup_6_5_0_0.exe'
  softwareName   = '.NET Reactor'
  checksum       = ''
  checksumType   = ''
  silentArgs     = "/s"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
