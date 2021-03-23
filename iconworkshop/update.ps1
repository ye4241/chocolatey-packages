import-module au

$domain = 'https://www.axialis.com'
$releases = "$domain/download/iw.html"

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
  $response = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $content = $response.Content
  $url = ($content | Select-String '<a href="(.*?\.exe)">' -AllMatches).Matches[0].Groups[1].Value
  $version = ($content | Select-String '<a href="\/iconworkshop">Axialis IconWorkshop (.*?)</a>' -AllMatches).Matches[0].Groups[1].Value
  @{
    URL32   = $url
    Version = $version
  }
}

Update-Package -ChecksumFor 32
