[CmdletBinding()]
Param (
  $subreddit = 'pics'
)

$url = "https://www.reddit.com/r/$subreddit/top.json"
$dir = '.\pics'
$dirExists = Test-Path -Path $dir
if (!$dirExists) {
  New-Item -Path $dir -ItemType Directory
}

$res = Invoke-RestMethod -Uri $url

Write-Host -Object "Downloading pictures from: $subreddit"
$count = 0
foreach ($item in $res.data.children) {
  Write-Host -Object "Name: $($item.data.name) URL: $($item.data.url)"
  $fileName = $item.data.name + '.jpg'
  $path = Join-Path -Path $dir -ChildPath $fileName
  Invoke-WebRequest -Uri $item.data.url -OutFile $path
  $count++
}
Write-Host -Object "Downloaded $($count) pictures.
