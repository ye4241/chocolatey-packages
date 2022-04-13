import-module au

$domain = 'https://github.com'
$project = "crowdin/crowdin-cli"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $releasePage = Invoke-WebRequest -UseBasicParsing -Uri "$domain/$project/releases/latest"
  $content = $releasePage.Content
  $match = ($content | Select-String "href=""/$project/releases/tag/(.*?)""" -AllMatches).Matches[0]
  $version = $match.Groups[1].Value
  @{
    Version = $version
  }
}

Update-Package -ChecksumFor 32
