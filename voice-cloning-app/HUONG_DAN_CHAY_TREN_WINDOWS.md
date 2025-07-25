# 🎤 HƯỚNG DẪN CHẠY ỨNG DỤNG NHÂN BẢN GIỌNG NÓI TRÊN WINDOWS

## 📋 YÊU CẦU HỆ THỐNG

### Bước 1: Cài đặt Node.js
1. Truy cập: https://nodejs.org/
2. Tải phiên bản **LTS** (khuyến nghị)
3. Chạy file .msi và cài đặt theo hướng dẫn
4. Khởi động lại máy tính

### Bước 2: Kiểm tra cài đặt
Mở **Command Prompt** (cmd) hoặc **PowerShell** và chạy:
```bash
node --version
npm --version
```
Nếu hiển thị số phiên bản thì đã cài đặt thành công.

## 🚀 CHẠY ỨNG DỤNG

### Bước 1: Giải nén và mở thư mục
1. Giải nén file `voice-cloning-app.zip` 
2. Mở **Command Prompt** hoặc **PowerShell**
3. Điều hướng đến thư mục ứng dụng:
```bash
cd đường_dẫn_đến_thư_mục\voice-cloning-app
```

### Bước 2: Cài đặt dependencies
```bash
npm install
```
Chờ quá trình cài đặt hoàn tất (có thể mất vài phút).

### Bước 3: Chạy ứng dụng
```bash
npm run dev
```

### Bước 4: Mở trình duyệt
Sau khi thấy thông báo "Ready", mở trình duyệt và truy cập:
```
http://localhost:3000
```
hoặc
```
http://localhost:3001
```

## 🎯 CÁCH SỬ DỤNG

### Tùy chọn 1: Sử dụng Web Speech API (Miễn phí)
1. **Bỏ qua** phần API Key
2. **Upload** file âm thanh mẫu (MP3, WAV, OGG)
3. **Nhập văn bản** (mỗi dòng = 1 file MP3)
4. **Điều chỉnh tốc độ** nếu cần
5. **Click** "Tạo giọng nói nhân bản (Web Speech)"
6. **Nghe và tải xuống** các file MP3

### Tùy chọn 2: Sử dụng ElevenLabs AI (Chất lượng cao)
1. **Đăng ký tài khoản** tại: https://elevenlabs.io
2. **Lấy API key** từ Profile → API Keys
3. **Nhập API key** vào ứng dụng
4. **Upload** file âm thanh mẫu của bạn
5. **Nhập văn bản** cần chuyển đổi
6. **Click** "Tạo giọng nói nhân bản (AI)"
7. **Tải xuống** các file MP3 chất lượng cao

## 🔧 XỬ LÝ LỖI THƯỜNG GẶP

### Lỗi: "Port 3000 is already in use"
- Ứng dụng sẽ tự động chuyển sang port khác (3001, 3002...)
- Kiểm tra thông báo trong terminal để biết port chính xác

### Lỗi: "npm not found"
- Cài đặt lại Node.js từ nodejs.org
- Khởi động lại Command Prompt

### Lỗi: "Permission denied"
- Chạy Command Prompt với quyền Administrator
- Hoặc sử dụng PowerShell

### Lỗi khi upload file
- Đảm bảo file âm thanh có định dạng: MP3, WAV, OGG
- Kích thước file không quá 50MB

## 📁 CẤU TRÚC THỦ MỤC
```
voice-cloning-app/
├── src/
│   ├── app/
│   │   ├── page.tsx          # Trang chính
│   │   └── api/
│   │       └── voice-clone/  # API backend
│   └── components/           # Các component UI
├── package.json              # Dependencies
└── README.md                # Hướng dẫn này
```

## 🎵 TÍNH NĂNG

✅ **Upload file âm thanh mẫu** (drag & drop)  
✅ **Nhập văn bản nhiều dòng** (mỗi dòng = 1 file)  
✅ **Điều chỉnh tốc độ giọng nói**  
✅ **Preview trước khi tạo**  
✅ **Phát và tải xuống từng file**  
✅ **Tải xuống tất cả dưới dạng ZIP**  
✅ **Hỗ trợ tiếng Việt**  
✅ **Giao diện hiện đại, responsive**  

## 🆘 HỖ TRỢ

Nếu gặp vấn đề:
1. Đảm bảo đã cài đặt Node.js phiên bản mới nhất
2. Chạy `npm install` lại
3. Kiểm tra firewall/antivirus có chặn không
4. Thử chạy với quyền Administrator

**Chúc bạn sử dụng ứng dụng thành công! 🎤✨**
