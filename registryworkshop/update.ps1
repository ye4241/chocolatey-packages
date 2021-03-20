import-module au

$domain = 'http://www.torchsoft.com'
$releases = "$domain/en/download.html"

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
  $items = ($content | Select-String '<td align="center" valign="middle">(.*?)</td>' -AllMatches).Matches
  $url = ($items[0].Groups[1].Value | Select-String 'href="(.*?)"' -AllMatches).Matches[0].Groups[1].Value
  $version = $items[3].Groups[1].Value
  @{
    URL32   = "$domain$url"
    Version = $version
  }
}

Update-Package -ChecksumFor 32
