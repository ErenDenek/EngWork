@echo off
chcp 65001 > nul
title LinguaQuest AI — iPhone Yerel Wi-Fi Sunucusu
cd /d "%~dp0"

echo ========================================================
echo   LinguaQuest AI — iPhone / Mobil Yerel Wi-Fi Sunucusu
echo ========================================================
echo.

for /f "delims=" %%i in ('python -c "import socket; s=socket.socket(socket.AF_INET, socket.SOCK_DGRAM); s.connect(('8.8.8.8',80)); print(s.getsockname()[0]); s.close()" 2^>nul') do set LOCAL_IP=%%i

if "%LOCAL_IP%"=="" set LOCAL_IP=BILGISAYAR_IP_ADRESINIZ

echo   1. iPhone'unuzun bu bilgisayar ile AYNI Wi-Fi aginda oldugundan emin olun.
echo   2. iPhone Safari tarayicisinda su adresi acin:
echo.
echo      http://%LOCAL_IP%:8080
echo.
echo   3. Safari alt menuden Paylas (yukari ok) -> "Ana Ekrana Ekle" dokunun.
echo   4. Durdurmak icin bu pencereyi kapatin veya CTRL+C basin.
echo ========================================================
echo.

python -m http.server 8080 --bind 0.0.0.0
pause
