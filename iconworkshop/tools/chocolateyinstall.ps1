$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.axialis.com/downloads/IconWorkshop-Pro.exe'
  softwareName   = 'Axialis IconWorkshop*' 
  checksum       = '814ea8d54df9d91e45380111dd477641ce40fba72f57ae6c076ccd5d05b92a83'
  checksumType   = 'sha256'
  silentArgs     = "/q"
  validExitCodes = @(0) 
}
Install-ChocolateyPackage @packageArgs
