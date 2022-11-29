import-module au

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
  $match = ($content | Select-String ">a(.*?) — <a id=""download"" href=""(.*?)"">" -AllMatches).Matches[0]
  $version = '0.' + $match.Groups[1].Value
  $url = $match.Groups[2].Value
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
