$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://www.digicert.com/StaticFiles/SafeNetAuthenticationClient-x32.msi'
  url64bit       = 'https://www.digicert.com/StaticFiles/SafeNetAuthenticationClient-x64.msi'
  softwareName   = 'SafeNet Authentication Client*'
  checksum       = '5c6e4d67b60b2baa06fa4d9a9ffbd95932c24145bd51f83522ded748bfe68b78'
  checksumType   = 'sha256'
  checksum64     = '2955aa25ef4eb03e0fb59feb7c62eefbb46614fd0575ecc59b96307c8d96db18'
  checksumType64 = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
