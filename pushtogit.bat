@echo off
cd /d "%~dp0"

echo ============================================
echo   Chemistry Class 12 - Auto Push to GitHub
echo ============================================
echo.

:: Initialize git if not already done
if not exist ".git" (
    echo Initializing git repository...
    git init
    git branch -M main
)

:: Set remote if not already set
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo Adding remote origin...
    git remote add origin https://github.com/abhinaba75/chemistry.git
)

:: Stage all changes
echo.
echo Staging all changes...
git add -A

:: Show what's being committed
echo.
echo Changes to be committed:
git status --short
echo.

:: Commit with timestamp
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set mydate=%%c-%%b-%%a
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set mytime=%%a:%%b

git commit -m "Update: %mydate% %mytime%"

:: Push to main
echo.
echo Pushing to GitHub...
git push -u origin main

echo.
echo ============================================
echo   Done! Changes pushed to GitHub.
echo ============================================
echo.
pause
