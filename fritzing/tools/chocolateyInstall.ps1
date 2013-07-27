﻿$packageName = 'fritzing'
$fileFullPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\{anchor1}.zip"
#$url = 'http://fritzing.org/download{version}b/windows/{anchor1}.zip'
$url = '{{DownloadUrl}}'
$exeFullPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\{anchor1}\fritzing.exe"
Get-ChocolateyWebFile $packageName $fileFullPath $url
Get-ChocolateyUnzip "$fileFullPath" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyDesktopLink $exeFullPath