$ErrorActionPreference = 'Stop'; 
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://eaglefile.oss-cn-shenzhen.aliyuncs.com/releases/Eagle-4.0-x64-build1.exe'
  softwareName   = 'Eagle' 
  checksum       = '666594b17fd953304adf15e6c7133ec1e5bc4121be742e7946a81e75685f95ff'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0) 
}
Install-ChocolateyPackage @packageArgs 
