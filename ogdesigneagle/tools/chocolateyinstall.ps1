$ErrorActionPreference = 'Stop'; 
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://eaglefile.oss-cn-shenzhen.aliyuncs.com/releases/Eagle-4.0-x64-build1.exe'
  softwareName   = 'Eagle' 
  checksum       = '41bc648c2d25f825c527255784750b6f281bf75e3e664522850bfb55e66352ee'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0) 
}
Install-ChocolateyPackage @packageArgs 
