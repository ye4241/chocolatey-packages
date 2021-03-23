$ErrorActionPreference = 'Stop'; 
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://eaglefile.oss-cn-shenzhen.aliyuncs.com/releases/Eagle-2.0-build10.exe'
  softwareName   = 'Eagle' 
  checksum       = 'f567deedb2609e90d510cc0e30916bba6255592965b661ae9c0060ab0b338884'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0) 
}
Install-ChocolateyPackage @packageArgs 
