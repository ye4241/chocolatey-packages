$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://sourceforge.net/projects/libusbdotnet/files/LibUsbDotNet/LibUsbDotNet%20v2.2.8/LibUsbDotNet_Setup.2.2.8.exe/download'
  softwareName  = 'LibUsbDOtNet*'
  checksum      = 'e2076c4eb22b187daea0f563de99cb3eaeca565c1030b3f3ba6932e665adb691'
  checksumType  = 'sha256'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'                          
  validExitCodes= @(0)
}
Install-ChocolateyPackage @packageArgs
    
