$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.eziriz.com/download.php?download=dotnet_reactor_setup_7_5_0_0.exe'
  softwareName   = '.NET Reactor'
  checksum       = 'f8e74d3cc5796b5fcfc9e1cdff0d7a860729b2c808bb1f25b687877fc484fb45'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
