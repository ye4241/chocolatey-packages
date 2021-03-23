$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://www.axialis.com/downloads/IconWorkshop-Pro.exe'
  softwareName   = 'Axialis IconWorkshop*' 
  checksum       = '8052ae36dacd4eba3923d6bd6735294d74a3732b3cf1ea8660ddabe78519df8f'
  checksumType   = 'sha256'
  silentArgs     = "/q"
  validExitCodes = @(0) 
}
Install-ChocolateyPackage @packageArgs