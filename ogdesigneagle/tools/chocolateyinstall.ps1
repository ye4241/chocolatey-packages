$ErrorActionPreference = 'Stop'; 
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://eaglefile.oss-cn-shenzhen.aliyuncs.com/releases/Eagle-3.0-build1.exe'
  softwareName   = 'Eagle' 
  checksum       = 'd1cf045b812eaa8bd1131f5c841cb557307a26ffd728a768ccc5ce44fdba8598'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0) 
}
Install-ChocolateyPackage @packageArgs 
