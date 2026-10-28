@echo off
setlocal
cd /d "%~dp0"

echo ======================================================
echo   Ceylon Trails - Auto Sync to GitHub
echo ======================================================

"C:\Program Files\Git\cmd\git.exe" add .

:: Check if there are changes to commit
"C:\Program Files\Git\cmd\git.exe" diff --cached --quiet
if errorlevel 1 (
    echo Changes detected. Committing...
    "C:\Program Files\Git\cmd\git.exe" commit -m "Auto update blog content: %date% %time%"
) else (
    echo No new changes to commit.
)

echo Pushing updates to origin main...
"C:\Program Files\Git\cmd\git.exe" push -u origin main

if errorlevel 0 (
    echo.
    echo [SUCCESS] Synced successfully to GitHub!
) else (
    echo.
    echo [ERROR] Push failed. If this is your first time pushing,
    echo make sure you are signed in or enter your GitHub credentials.
)

echo ======================================================
pause

