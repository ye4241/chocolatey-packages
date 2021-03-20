$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.proxifier.com/download/ProxifierSetup.exe'
  softwareName   = 'Proxifier'
  checksum       = 'f62aabdd02cda18fb1e3d1b89379f91ae7e89a12ee156c23897d43c7375c95aa'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
