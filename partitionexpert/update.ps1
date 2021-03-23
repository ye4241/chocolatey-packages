import-module au

$domain = 'https://macrorit.com'
$releases = "$domain/js/arrlang.json"
$price = "$domain/js/mde-price.json"

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
  $response = Invoke-RestMethod -Method Get -Uri $price
  $url = $response.free.downloads[0].link
  $response = Invoke-RestMethod -Method Get -Uri $releases
  $version = ($response | Select-String '"mde":[\s\S]*?"ver": "(.*?)"' -AllMatches).Matches[0].Groups[1].Value
  @{
    URL32   = $url
    Version = $version
  }
}

Update-Package -ChecksumFor 32
