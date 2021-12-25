$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.eziriz.com/download.php?download=dotnet_reactor_setup_6_8_0_0.exe'
  softwareName   = '.NET Reactor'
  checksum       = '6a80bb553edf5aea6d54590e059586441ff42bd0e2bedc9323bc048753e18939'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
