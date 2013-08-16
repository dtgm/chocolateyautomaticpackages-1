﻿$packageName = '{{PackageName}}'
$installerType = 'msi'
#$url = 'http://download100.lavasoft.com/adaware/updates/Ad-Aware_Antivirus_Free_Setup_{version}.msi'
$url = '{{DownloadUrl}}'
$silentArgs = '/quiet /qb /promptrestart'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -validExitCodes $validExitCodes

#Another silentArgs
#'/passive /qb /promptrestart'
#'/quiet /qb /norestart'
#'/passive /qb /norestart'