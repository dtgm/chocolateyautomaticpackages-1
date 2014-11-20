﻿$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$executable = "Client.bat"
$shortcut_to_modify = "$Home\Desktop\Client.bat.lnk"
$shortcut_modified = "$Home\Desktop\AssaultCube Reloaded.lnk"

Install-ChocolateyZipPackage $packageName $url $unzipLocation

$targetFilePath = "$unzipLocation\$executable"

	if (Test-Path $shortcut_modified){
		Remove-Item $shortcut_modified
	}

Install-ChocolateyDesktopLink $targetFilePath

Rename-Item $shortcut_to_modify $shortcut_modified


$targetFilePath.TargetPath = "$targetFilePath"
$targetFilePath.IconLocation = "$unzipLocation\bin_win32\ac_client.exe"
$targetFilePath.WorkingDirectory = "$unzipLocation"
$targetFilePath.Save()