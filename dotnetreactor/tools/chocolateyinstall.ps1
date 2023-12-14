$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.eziriz.com/download.php?download=dotnet_reactor_setup_6_9_8_0.exe'
  softwareName   = '.NET Reactor'
  checksum       = 'b6d6ab1c8e56d7c1ef13d380751af4b07c44a8548002b317cccf242060e0b83b'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
