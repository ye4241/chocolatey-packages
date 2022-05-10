$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = 'https://www.digicert.com/StaticFiles/SafeNetAuthenticationClient-x32.msi'
  url64bit      = 'https://www.digicert.com/StaticFiles/SafeNetAuthenticationClient-x64.msi'
  softwareName  = 'SafeNet Authentication Client*'
  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = ''
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs