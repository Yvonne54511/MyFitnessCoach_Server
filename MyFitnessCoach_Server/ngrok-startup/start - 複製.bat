@echo off
setlocal
title ngrok Starter

echo ==========================================
echo       ngrok Interactive Starter
echo ==========================================
echo.

:: 預設連接埠
set "DEFAULT_PORT=7212"

set /p PORT="Enter port number (default: %DEFAULT_PORT%): "
if "%PORT%"=="" set PORT=%DEFAULT_PORT%

echo.
echo Starting ngrok on port %PORT%...
echo Close this window to stop ngrok.
echo.

:: 殺掉舊的 ngrok 進程
taskkill /f /im ngrok.exe 2>nul

:: 偵測 ngrok 執行檔路徑
if exist "%~dp0ngrok.exe" (
    set "NGROK_PATH=%~dp0ngrok.exe"
) else (
    set "NGROK_PATH=C:\Users\ispan\AppData\Local\ngrok\ngrok.exe"
)

:: 啟動 ngrok
ngrok http https://localhost:7212

pause
