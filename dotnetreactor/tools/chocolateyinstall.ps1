$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.eziriz.com/download.php?download=dotnet_reactor_setup_6_9_0_0.exe'
  softwareName   = '.NET Reactor'
  checksum       = 'ecaadef3c08296bb6e561fbd157f65a10f776a6c6e8eea75bc30105c2408efcb'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
