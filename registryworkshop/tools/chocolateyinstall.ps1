$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://www.torchsoft.com/download/RegistryWorkshop.exe'
  softwareName   = 'Registry Workshop*'
  checksum       = 'deb01b9d23f8b3da9dfdca87f5ca8e751abd803fc37b0927060500ac52d54a4c'
  checksumType   = 'sha256'
  silentArgs     = '/S'          
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
    
