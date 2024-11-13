$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.eziriz.com/download.php?download=dotnet_reactor_setup_7_0_0_0.exe'
  softwareName   = '.NET Reactor'
  checksum       = 'e8ef7e09d59f5924c0bffc36b51ba5449f7c97c55782872363475e2900848bbe'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
