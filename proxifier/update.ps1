﻿import-module au

$domain = 'https://www.proxifier.com'
$releases = "$domain/download/"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
    # ".\dotnetreactor.nuspec"        = @{
    #   "\<releaseNotes\>.+" = "<releaseNotes>$($Latest.ReleaseNotes)</releaseNotes>"
    # }
  }
}

function global:au_GetLatest {
  $response = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $content = $response.Content
  $version = ($content | Select-String 'class="download-item__description"><p>Version: <a href=".*">(.*?)</a>' -AllMatches).Matches[0].Groups[1].Value
  $url = ($content | Select-String '<a href="(.*)" class="installer">' -AllMatches).Matches[0].Groups[1].Value
  @{
    URL32   = "$releases/$url"
    Version = $version
    # ReleaseNotes = $releaseNotesUrl
  }
}

Update-Package -ChecksumFor 32
