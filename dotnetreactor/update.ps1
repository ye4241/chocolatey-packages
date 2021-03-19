import-module au

$domain = 'https://www.eziriz.com'
$releases = "$domain/reactor_history.htm"

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
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $re = '^download.php\?download=dotnet_reactor_setup_(\d_\d_\d_\d).exe'
  $url = $downloadPage.Links | Where-Object href -match $re | Select-Object -First 1 -expand href
  $version = ($url | Select-String -AllMatches $re).Matches.Groups[1].Value -replace "_", "."
  @{
    URL32 = "$domain/$url"
    Version = $version
    # ReleaseNotes = $releaseNotesUrl
  }
}

update -ChecksumFor 32
