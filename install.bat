@echo off
title Install Script
color 0a

powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell -Command "$env:SCOOP='%USERPROFILE%\scoop'; [Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User'); Write-Host 'Installing Scoop...' -ForegroundColor Green; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"

:install-git
echo Installing Git...
powershell -Command "scoop install main/git"
pause

:install-bucket
echo Adding Scoop buckets...
powershell -Command "scoop bucket add main"
powershell -Command "scoop bucket add extras"
pause

:install-apps
echo Installing applications...
powershell -Command "scoop install main/nodejs-lts"
powershell -Command "scoop install extras/vscode"
powershell -Command "scoop install extras/cursor"
powershell -Command "scoop install extras/wave-terminal"
powershell -Command "scoop install extras/warp-terminal"
powershell -Command "scoop install extras/hyper"
powershell -Command "scoop install main/micro"
powershell -Command "scoop install main/neovim"
powershell -Command "scoop install main/everything-cli"
powershell -Command "scoop install extras/everything"
powershell -Command "scoop install extras/masscode"
powershell -Command "scoop install extras/flow-launcher"
powershell -Command "scoop install extras/ueli"

echo Installation complete!
pause