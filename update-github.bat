@echo off
title Update GitHub — Portfolio
cd /d "%~dp0"

set GIT=C:\Program Files\Git\bin\git.exe
if not exist "%GIT%" (
    echo Git not found at: %GIT%
    echo Install Git from https://git-scm.com/download/win
    pause
    exit /b 1
)

echo.
echo  Portfolio folder: %CD%
echo.

"%GIT%" status --short
echo.

set /p MSG=Commit message (Enter for default): 
if "%MSG%"=="" set MSG=Update portfolio site

"%GIT%" add -A
"%GIT%" -c user.name="Naveen Kumar T" -c user.email="voiceactornaveen@gmail.com" commit -m "%MSG%"
if errorlevel 1 (
    echo.
    echo  Nothing new to commit, or commit failed.
    pause
    exit /b 1
)

echo.
echo  Pushing to GitHub...
"%GIT%" push origin main
if errorlevel 1 (
    echo.
    echo  Push failed. Check your internet and GitHub login.
    pause
    exit /b 1
)

echo.
echo  Done! Site updates in 1-2 minutes:
echo  https://voiceactornaveen.github.io/Portfolio/
echo.
pause
