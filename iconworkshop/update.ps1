Import-Module Chocolatey-AU

$domain = 'https://www.axialis.com'
$releases = "$domain/download/iw.html"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"            = "`$1'$($Latest.Url32)'"
      "(?i)(^\s*url64bit\s*=\s*)('.*')"      = "`$1'$($Latest.Url64)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"      = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
      "(?i)(^\s*checksumType\s*=\s*)('.*')"  = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $response = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $content = $response.Content

  $versionMatch = ($content | Select-String -Pattern 'var i3v\s*=\s*"([^"]+)"').Matches[0]
  $version = $versionMatch.Groups[1].Value

  $url64Match = ($content | Select-String -Pattern 'File:.*?href="(https://[^"]+/IconWorkshop-Pro\.exe)"').Matches[0]
  $url64 = $url64Match.Groups[1].Value
  $url32Match = ($content | Select-String -Pattern 'File:.*?href="(https://[^"]+/IconWorkshop-Pro-32-bit\.exe)"').Matches[0]
  $url32 = $url32Match.Groups[1].Value

  @{
    Url32   = $url32
    Url64   = $url64
    Version = $version
  }
}

Update-Package -ChecksumFor all
