@echo off
setlocal enabledelayedexpansion

:: Ask for client info
set /p CLIENT=Enter client name (no spaces, use dash if needed): 
set /p EMAIL=Enter client email: 

:: Clone template to client folder
xcopy template clients\!CLIENT! /E /I

:: Replace headline and email in index.html
powershell -Command "(Get-Content 'clients\!CLIENT!\index.html') -replace 'Client-Ready Funnel for Coaches','Client-Ready Funnel for !CLIENT!' | Set-Content 'clients\!CLIENT!\index.html'"
powershell -Command "(Get-Content 'clients\!CLIENT!\index.html') -replace 'your@email.com','!EMAIL!' | Set-Content 'clients\!CLIENT!\index.html'"

:: Commit & push to GitHub
git add .
git commit -m "Add !CLIENT! funnel"
git push

echo.
echo Client funnel for !CLIENT! is ready and live!
pause
