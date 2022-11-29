import-module au

$domain = 'https://www.axialis.com'
$releases = "$domain/download/iw.html"

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
  $response = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $content = $response.Content
  $match = ($content | Select-String -Pattern '<p>File: <b><a href="(.*?\.exe)">IconWorkshop-Pro.exe</a></b> - Version: <b>(.*?)</b><br>').Matches[0]
  $url = $match.Groups[1].Value
  $version = $match.Groups[2].Value
  @{
    Url32   = $url
    Version = $version
  }
}

Update-Package -ChecksumFor 32
