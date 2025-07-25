# 🎤 HƯỚNG DẪN TẠO FILE .EXE CHO VOICE CLONING APP

## 📋 TỔNG QUAN
Để tạo file .exe, chúng ta sẽ sử dụng **pkg** hoặc **nexe** để đóng gói ứng dụng Next.js thành file thực thi.

## 🔧 PHƯƠNG PHÁP 1: SỬ DỤNG PKG (Khuyến nghị)

### Bước 1: Cài đặt pkg
```bash
npm install -g pkg
```

### Bước 2: Tạo file package script
Thêm vào `package.json`:
```json
{
  "scripts": {
    "build-exe": "next build && pkg . --target node18-win-x64 --output voice-cloning-app.exe"
  },
  "pkg": {
    "assets": [
      ".next/**/*",
      "public/**/*",
      "node_modules/**/*"
    ],
    "targets": [
      "node18-win-x64"
    ]
  }
}
```

### Bước 3: Build exe
```bash
npm run build
npm run build-exe
```

## 🔧 PHƯƠNG PHÁP 2: SỬ DỤNG ELECTRON (Giao diện desktop)

### Bước 1: Cài đặt Electron
```bash
npm install --save-dev electron electron-builder
```

### Bước 2: Tạo main.js cho Electron
```javascript
const { app, BrowserWindow } = require('electron');
const { spawn } = require('child_process');
const path = require('path');

let mainWindow;
let serverProcess;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1200,
    height: 800,
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true
    },
    icon: path.join(__dirname, 'icon.ico')
  });

  // Start Next.js server
  serverProcess = spawn('npm', ['run', 'start'], {
    cwd: __dirname,
    shell: true
  });

  // Load the app
  setTimeout(() => {
    mainWindow.loadURL('http://localhost:3000');
  }, 3000);
}

app.whenReady().then(createWindow);

app.on('window-all-closed', () => {
  if (serverProcess) {
    serverProcess.kill();
  }
  app.quit();
});
```

### Bước 3: Cấu hình build
Thêm vào `package.json`:
```json
{
  "main": "main.js",
  "scripts": {
    "electron": "electron .",
    "build-electron": "electron-builder",
    "dist": "npm run build && electron-builder"
  },
  "build": {
    "appId": "com.voicecloning.app",
    "productName": "Voice Cloning App",
    "directories": {
      "output": "dist"
    },
    "files": [
      "**/*",
      "!src",
      "!docs",
      "!*.md"
    ],
    "win": {
      "target": "nsis",
      "icon": "icon.ico"
    },
    "nsis": {
      "oneClick": false,
      "allowToChangeInstallationDirectory": true
    }
  }
}
```

### Bước 4: Build Electron app
```bash
npm run dist
```

## 🔧 PHƯƠNG PHÁP 3: PORTABLE APP (Đơn giản nhất)

### Tạo file portable-app.bat
```batch
@echo off
title Voice Cloning App - Portable
echo Starting Voice Cloning App...

REM Check if Node.js is available
node --version >nul 2>&1
if errorlevel 1 (
    echo Node.js not found. Starting portable Node.js...
    REM Include portable Node.js in the package
    .\node-portable\node.exe .\server.js
) else (
    npm start
)

pause
```

## 📦 PHƯƠNG PHÁP 4: SỬ DỤNG NEXE

### Bước 1: Cài đặt nexe
```bash
npm install -g nexe
```

### Bước 2: Build
```bash
nexe -i server.js -o voice-cloning-app.exe -t windows-x64-18.0.0
```

## 🎯 KHUYẾN NGHỊ

**Cho người dùng cuối:** Sử dụng **Electron** (Phương pháp 2)
- ✅ Giao diện desktop đẹp
- ✅ Dễ sử dụng như ứng dụng thông thường
- ✅ Tự động start server
- ✅ Có installer

**Cho developer:** Sử dụng **pkg** (Phương pháp 1)
- ✅ File exe nhỏ gọn
- ✅ Không cần cài đặt
- ✅ Chạy trực tiếp

## 📝 LƯU Ý

1. **Next.js** là framework web, không phải desktop app
2. File .exe sẽ vẫn cần mở trình duyệt
3. Electron tạo app desktop hoàn chỉnh
4. Pkg tạo server executable

## 🚀 CÁCH NHANH NHẤT

Nếu muốn có ngay file .exe:
1. Cài đặt pkg: `npm install -g pkg`
2. Build: `npm run build`
3. Tạo exe: `pkg . --target node18-win-x64 --output voice-cloning-app.exe`

File .exe sẽ được tạo và có thể chạy trực tiếp!
