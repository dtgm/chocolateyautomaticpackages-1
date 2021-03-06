$version = '{{PackageVersion}}'

$versioninstalledpath=Get-ItemProperty "hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\EC7EE32C3A1C49F48A0FE9A09C6CEDE6\InstallProperties" | Select -expand DisplayVersion
	
$versioninstalled=Get-ItemProperty $versioninstalledpath | Select -expand DisplayVersion

if ($versioninstalled -eq $version) {
       Write-Host "Adblock Plus for Internet Explorer $version is already installed."

	} elseif ($versioninstalled -eq $null) {
	   Write-Host "Adblock Plus for Internet Explorer isn't installed yet."
	
	} elseif ($versioninstalled -lt $version) {
       Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -validExitCodes $validExitCodes
	   Write-Host "Adblock Plus for Internet Explorer $version has been installed."
	   
	} elseif ($versioninstalled -gt $version) {
       Write-Host "Wait for package update on the choco feed."
    }