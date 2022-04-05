$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.proxifier.com/download/ProxifierSetup.exe'
  softwareName   = 'Proxifier*'
  checksum       = '1d5bb3a15a0a0b5c95a62352c8439da00a2aca5136006a63a62290a593818c04'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
