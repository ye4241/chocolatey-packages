import-module au

$releases = 'https://knowledge.digicert.com/generalinformation/INFO1982.html'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"            = "`$1'$($Latest.Url32)'"
      "(?i)(^\s*url64bit\s*=\s*)('.*')"       = "`$1'$($Latest.Url64)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
      "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $url32 = 'https://www.digicert.com/StaticFiles/SafeNetAuthenticationClient-x32.msi'
  $url64 = 'https://www.digicert.com/StaticFiles/SafeNetAuthenticationClient-x64.msi'
  $version = "10.8"
  @{
    Url32   = $url32
    Url64   = $url64
    Version = $version
  }
}

Update-Package
