$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.proxifier.com/download/ProxifierSetup.exe'
  softwareName   = 'Proxifier*'
  checksum       = '41308eb4af59ecde0b1cc9813871a81eea30508f68990b4c25c935341b8b8c7f'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
