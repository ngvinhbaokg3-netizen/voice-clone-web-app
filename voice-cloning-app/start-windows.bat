@echo off
chcp 65001 >nul
title Voice Cloning App - Khoi Dong
color 0A

echo ========================================
echo    VOICE CLONING APP - KHOI DONG
echo ========================================
echo.

echo Dang kiem tra Node.js...
node --version >nul 2>&1
if errorlevel 1 (
    echo [LOI] Node.js chua duoc cai dat!
    echo.
    echo Vui long tai va cai dat Node.js tu: https://nodejs.org/
    echo Chon phien ban LTS (Long Term Support)
    echo.
    echo Nhan phim bat ky de dong...
    pause >nul
    exit /b 1
)

echo [OK] Node.js da duoc cai dat
for /f "tokens=*" %%i in ('node --version') do echo Phien ban: %%i
echo.

echo Dang kiem tra dependencies...
if not exist "node_modules" (
    echo Dang cai dat dependencies... (co the mat 2-5 phut)
    echo Vui long doi...
    echo.
    call npm install
    if errorlevel 1 (
        echo.
        echo [LOI] Khong the cai dat dependencies!
        echo Thu lai bang cach:
        echo 1. Kiem tra ket noi internet
        echo 2. Chay Command Prompt voi quyen Administrator
        echo 3. Xoa thu muc node_modules va thu lai
        echo.
        echo Nhan phim bat ky de dong...
        pause >nul
        exit /b 1
    )
    echo.
    echo [OK] Da cai dat xong dependencies!
) else (
    echo [OK] Dependencies da san sang
)
echo.

echo ========================================
echo    DANG KHOI DONG UNG DUNG...
echo ========================================
echo.
echo Vui long doi trong giay lat...
echo.
echo SAU KHI THAY THONG BAO "Ready":
echo.
echo 1. MO TRINH DUYET (Chrome, Firefox, Edge...)
echo 2. TRUY CAP DUONG DAN:
echo    http://localhost:3000
echo    HOAC
echo    http://localhost:3001
echo.
echo DE DUNG UNG DUNG: 
echo - Nhan Ctrl+C trong cua so nay
echo - Hoac dong cua so nay
echo.
echo ========================================
echo.

call npm run dev

echo.
echo ========================================
echo UNG DUNG DA DUNG HOAC GAP LOI!
echo.
echo Neu gap loi, thu:
echo 1. Chay lai file nay
echo 2. Kiem tra Node.js da cai dat chua
echo 3. Kiem tra ket noi internet
echo.
echo Nhan phim bat ky de dong...
echo ========================================
pause >nul
