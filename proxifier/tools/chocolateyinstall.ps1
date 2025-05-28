$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.proxifier.com/download/ProxifierSetup.exe'
  softwareName   = 'Proxifier*'
  checksum       = 'db20473361892bef8a3516b7017ea414790edd12ba2ef1b41a7350375c31b4c4'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
