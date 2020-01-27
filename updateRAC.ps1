<######################################  
SYNOPSIS  
     RemoteAppConnection Fix
DESCRIPTION 
    Checks for RemoteAppConnection updates and recreates desktop shortcuts to RemoteAppConnection directory. 
NOTES  
    File Name  : updateRAC.ps1
    Author     : Luke Encrapera
    Email      : luke.encrapera@gianteagle.com
    Requires   : PowerShell V2+       
######################################>
Start-Process rundll32 -ArgumentList "tsworkspace,TaskUpdateWorkspaces2"
Write-Host "Connections updated!"

$logondomain = whoami
$username = $logondomain -replace ".*\\"

$path = "C:\"
New-Item .\RemoteAppConnections -ItemType Directory -Force
 
$wshshell = New-Object -ComObject WScript.Shell
$desktop = [System.Environment]::GetFolderPath('Desktop')
  $lnk = $wshshell.CreateShortcut($desktop+"\Remote App Connections.lnk")
  $lnk.TargetPath = "C:\Users\"+$username+"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Work Resources (RADC)"
  $lnk.Save() 
Write-Host "Folders and Shortcut created!"
