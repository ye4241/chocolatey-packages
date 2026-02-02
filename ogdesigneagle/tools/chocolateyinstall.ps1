$ErrorActionPreference = 'Stop'; 
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://eaglefile.oss-cn-shenzhen.aliyuncs.com/releases/Eagle-4.0-x64-build17.exe'
  softwareName   = 'Eagle' 
  checksum       = '0100f228326c80e1433122ec738f4511fb3ad2b23d3d488d165aaa5e062afe12'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0) 
}
Install-ChocolateyPackage @packageArgs 
