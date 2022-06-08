import-module au

$domain = 'https://www.eziriz.com'
$releases = "$domain/reactor_history.htm"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.Url32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $content = $downloadPage.Content
  $match = ($content | Select-String 'download.php\?download=dotnet_reactor_setup_(\d_\d_\d_\d).exe' -AllMatches).Matches[0]
  $url = $domain + "/" + $match.Groups[0].Value
  $version = $match.Groups[1].Value -replace "_", "."
  @{
    Url32   = $url
    Version = $version
  }
}

Update-Package -ChecksumFor 32
