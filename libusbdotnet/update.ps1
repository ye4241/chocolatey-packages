import-module au

$domain = 'https://sourceforge.net'
$releases = "$domain/projects/libusbdotnet/files"

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
  $items = ($content | Select-String 'title="(/LibUsbDotNet/LibUsbDotNet v(.*?)/LibUsbDotNet_Setup.(.*?).exe):' -AllMatches).Matches[0]
  $url = "$releases" + ($items.Groups[1].Value -replace " ", "%20") + "/download"
  $version = $items.Groups[2].Value
  @{
    URL32   = $url
    Version = $version
  }
}

Update-Package -ChecksumFor 32
