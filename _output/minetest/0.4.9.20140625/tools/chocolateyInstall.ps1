﻿$packageName = 'minetest'
$url = 'https://github.com/minetest/minetest/releases/download/0.4.9/minetest-0.4.9-win32-mingw.zip'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-ChocolateyZipPackage $packageName $url $unzipLocation

#$targetFilePath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\minetest-$version-win32\bin\minetest.exe"
$targetFilePath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\minetest-0.4.9-win32\bin\minetest.exe"

Install-ChocolateyDesktopLink $targetFilePath
