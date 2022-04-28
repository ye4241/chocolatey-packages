$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.eziriz.com/download.php?download=dotnet_reactor_setup_6_8_0_0.exe'
  softwareName   = '.NET Reactor'
  checksum       = '73937d0043818fc63bf7048915899ccbbb2a459ef352b3fbd824a5035ec528a4'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
