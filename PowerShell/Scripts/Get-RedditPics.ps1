<#
.SYNOPSIS
  Downloads image and video files from Reddit.

.DESCRIPTION
  This script downloads 100 image and video files from Reddit via its JSON API.

  When this script is run it will create a sub-directory in the script path
  based on the Subreddit and SortBy names.

  The files will not be downloaded if:
    - The file extension is invalid.
    - The file already exist.

  Clean Subreddit values you can try for great photos:
  - pic (default)
  - pics
  - itookapicture
  - TheWayWeWere
  - Cinemagraphs
  - Eyebleach
  - astrophotography
  - notitle


.PARAMETER Subreddit
  Default: pic

  The subreddit to download image and video files from.

.PARAMETER SortBy
  Default: top

  The Reddit sort options which include:
    Top, Hot, Best, New, Rising, Controversial
#>
[CmdletBinding()]
Param (
  [Parameter(Mandatory=$false)]
  $Subreddit = 'pic',

  [Parameter(Mandatory=$false)]
  [ValidateSet('top','hot','best','new','rising','controversial')]
  $SortBy = 'top'
)

$url = "https://www.reddit.com/r/$Subreddit/$SortBy.json?t=all&limit=100"
$imgExt = '.jpg','.jpeg','.jpe','.jif','.jfif','.jfi',
          '.jp2','.j2k','.jpf','.jpx','.jpm','.mj2',
          '.png','.gif','.gifv','.webp','.tiff','.tif',
          '.mp4','.m4p','.m4v','.webm','.mpg','.mp2','.mpeg','mpe','mpv',
          '.ogg','.avi','.wmv','.mov','.qt','.flv','.swf',
          '.psd','.bmp','.dib',
          '.heif','.heic',
          '.indd','.indd','.indt',
          '.svg','.svgz','.ai','.eps',
          '.raw','.arw','.cr2','.nrw','.k25'

$dir = Join-Path -Path $Subreddit -ChildPath $SortBy
if (-not (Test-Path -Path $Subreddit)) {
  New-Item -Path $Subreddit -ItemType Directory | Out-Null
  New-Item -Path $dir -ItemType Directory | Out-Null
} elseif (-not (Test-Path -Path $dir)) {
  New-Item -Path $dir -ItemType Directory | Out-Null
}

$res = Invoke-RestMethod -Uri $url

Write-Host -Object "Downloading pictures from: $Subreddit"
$count = 0
foreach ($item in $res.data.children) {
  Write-Host -Object "$($count) Name: $($item.data.name) URL: $($item.data.url)"

  # Extracts the file extension from the URL
  $fileExt = [RegEx]::Match($item.data.url.split('?')[0], '\.[a-z]*$').Value.Trim()
  if ([string]::IsNullOrEmpty($fileExt) -or  $fileExt -notin $imgExt) {
    Write-Warning -Message "Invalid Ext: $($item.data.url)"
    continue
  }

  $fileName = $item.data.name + $fileExt
  $path = Join-Path -Path $dir -ChildPath $fileName
  if (Test-Path -Path $path) {
    Write-Warning -Message "File Exists: $($path)"
    continue
  }

  try {
    Invoke-WebRequest -Uri $item.data.url -OutFile $path
    $count++
  } catch {
    Write-Warning -Message "Error URL: $($item.data.url) Detail: $($Error[0])"
  }
}
Write-Host -Object "Downloaded $($count) pictures."
