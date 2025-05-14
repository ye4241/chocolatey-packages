$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.eziriz.com/download.php?download=dotnet_reactor_setup_7_3_0_0.exe'
  softwareName   = '.NET Reactor'
  checksum       = '6a408119f18448fb2bdb27213fc34733d566c122cc387197e83e25617587d12a'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
