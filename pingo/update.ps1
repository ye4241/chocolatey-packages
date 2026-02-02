Import-Module Chocolatey-AU

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url64bit\s*=\s*)('.*')"       = "`$1'$($Latest.Url64)'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
      "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $releasePage = Invoke-WebRequest -UseBasicParsing -Uri "https://css-ig.net/pingo"
  $content = $releasePage.Content
  $version = $null
  $url = $null
  if ($content -match 'id="download-menu">.*?>v(\d+\.\d+\.\d+)</a>') { $version = $Matches[1] }
  if ($content -match 'id="download"[^>]*href="([^"]+)"') { $url = $Matches[1] }
  if (-not $version -or -not $url) {
    throw "au_GetLatest: could not parse version or download URL from page (version=$version, url=$url)"
  }
  $options = @{
    Headers = @{
      'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56'
    }
  }
  @{
    Version = $version
    Url64   = $url
    Options = $options
  }
}

Update-Package -ChecksumFor 64
