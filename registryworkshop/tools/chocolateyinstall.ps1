$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://www.torchsoft.com/download/RegistryWorkshop.exe'
  softwareName   = 'Registry Workshop*'
  checksum       = 'cabbb998557c5e883200d082853ca0db1a9f0db66332a0731019b7485c2e95d0'
  checksumType   = 'sha256'
  silentArgs     = '/S'          
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
    
