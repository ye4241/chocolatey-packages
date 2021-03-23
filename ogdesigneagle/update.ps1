import-module au

$domain = 'https://eagle.cool'
$releases = "$domain/check-for-update"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $response = Invoke-RestMethod -Method Get -Uri $releases
  $url = 'https:' + $response.links.windows
  $version = $response.version
  @{
    URL32   = $url
    Version = $version
  }
}

Update-Package -ChecksumFor 32
