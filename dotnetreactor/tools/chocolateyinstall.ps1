$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.eziriz.com/download.php?download=dotnet_reactor_setup_6_8_0_0.exe'
  softwareName   = '.NET Reactor'
  checksum       = '5bb7aa6aa09e547ffb30bf32c8f5b4f853ae9ce236dcea5d1c8f6bd2c5a81417'
  checksumType   = 'sha256'
  silentArgs     = "/s"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
