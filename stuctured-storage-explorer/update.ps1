import-module au

$domain = 'https://github.com'
$project = "ironfede/openmcdf"
$file = "StructuredStorageXplorer.zip"

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
  $releasePage = Invoke-WebRequest -UseBasicParsing -Uri "$domain/$project/releases/latest"
  $content = $releasePage.Content
  $match = ($content | Select-String "href=""/$project/releases/tag/(.*?)""" -AllMatches).Matches[0]
  $tag = $match.Groups[1].Value
  $version = $tag -replace "v", ""
  $match = ($content | Select-String "href=""(/$project/releases/download/$tag/$file)""" -AllMatches).Matches[0]
  $url = $domain + $match.Groups[1].Value
  @{
    Version = $version
    Url32   = $url
  }
}

Update-Package -ChecksumFor 32
