$packageName = 'light'
$installerType = 'EXE'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

try {

$unpath = "$Env:ProgramFiles\Light\uninstall\helper.exe"

  Uninstall-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$unpath" -validExitCodes $validExitCodes

  Remove-Item "$Home\Desktop\light.exe.lnk"
  
  # the following is all part of error handling
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}
