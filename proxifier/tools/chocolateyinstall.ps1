$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.proxifier.com/download/ProxifierSetup.exe'
  softwareName   = 'Proxifier*'
  checksum       = 'f02d73ca30d025db6ed338ea97e57b6545067777253730db6303dffe96f59545'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
