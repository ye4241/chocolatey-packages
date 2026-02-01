Import-Module Chocolatey-AU

$download = "https://www.resilio.com/platforms/desktop/"
$release = "https://raw.githubusercontent.com/bt-sync/sync-docker/master/Dockerfile"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"            = "`$1'$($Latest.Url32)'"
      "(?i)(^\s*url64bit\s*=\s*)('.*')"       = "`$1'$($Latest.Url64)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
      "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $responseCotent = (Invoke-WebRequest -UseBasicParsing -Uri $release).Content
  $version = ($responseCotent | Select-String 'LABEL com.resilio.version="(.*?)"' -AllMatches).Matches[0].Groups[1].Value
  $url32 = "https://download-cdn.getsync.com/$version/windows/Resilio-Sync.exe"
  $url64 = "https://download-cdn.getsync.com/$version/windows64/Resilio-Sync_x64.exe"
  @{
    Url32   = $url32
    Url64   = $url64
    Version = $version
  }
}

Update-Package 
