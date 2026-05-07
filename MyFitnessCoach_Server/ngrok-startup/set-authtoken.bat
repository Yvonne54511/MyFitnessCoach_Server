@echo off
setlocal
title ngrok Authtoken Setup

echo ==========================================
echo       ngrok Authtoken Setup
echo ==========================================
echo.
echo Please get your authtoken from https://dashboard.ngrok.com/get-started/your-authtoken
echo.

set /p TOKEN="Paste your authtoken here: "

if "%TOKEN%"=="" (
    echo No token entered. Exiting...
    pause
    exit /b
)

:: 偵測 ngrok 執行檔路徑
if exist "%~dp0ngrok.exe" (
    set "NGROK_PATH=%~dp0ngrok.exe"
) else (
    set "NGROK_PATH=C:\Users\ispan\AppData\Local\ngrok\ngrok.exe"
)

"%NGROK_PATH%" config add-authtoken %TOKEN%

echo.
echo Authtoken has been set successfully!
echo.
pause
