-- 1 Tạo csdl QuanLyThuVien
CREATE DATABASE QLyThuVien19999901
GO
USE QLyThuVien19999901
GO
--2. Tạo các bảng và khóa chính (Table)
CREATE TABLE SACH
(
MaSach NVARCHAR(10) PRIMARY KEY, --Khóa chính MaSach
TenSach NVARCHAR(50),    --Tên sách
NhaXuatBan NVARCHAR(50), --Nhà sản xuất
TacGia NVARCHAR(50),   --Tác giả
SoTrang INT, --số trang
SoLuong INT,   -- số lượng
GiaTien FLOAT,  -- Giá tiền
NgayNhapKho DATE,  -- Ngày nhập kho
ViTri NVARCHAR(50), -- vị trí
MaLoaiSach NVARCHAR(10), --Khóa ngoại MaLoaiSach
);
--Nhập dữ liệu vào bảng Table
INSERT INTO SACH(MaSach, TenSach, NhaXuatBan, TacGia, SoTrang, SoLuong, GiaTien, NgayNhapKho, ViTri, MaLoaiSach) VALUES
(N'S001', N'TS01', N'Kim Đồng', N'Xuân Diệu', 90, 3, 15.000,'2022-3-22', N'Thư viện', N'LS01'),
(N'S002', N'TS02', N'vietnam', N'Xuân Quỳnh', 91, 3, 15.000, '2022-3-23', N'Thư viện', N'LS02'),
(N'S003', N'TS03', N'vietnam', N'Nhà Văn A', 92, 3, 15.000, '2022-3-24', N'nhà trường', N'LS03'),
(N'S004', N'TS04', N'vietnam', N'Nhà Văn B', 93, 3, 15.000, '2022-3-25', N'Thư viện', N'LS04'),
(N'S005', N'TS05', N'DPT', N'Nhà Văn C', 94, 3, 15.000, '2022-3-26', N'Thư viện', N'LS05');

CREATE TABLE LOAISACH
(
MaLoaiSach NVARCHAR(10) PRIMARY KEY, --Khóa chính MaLoaiSach
TenLoaiSach NVARCHAR(50),
);
INSERT INTO LOAISACH(MaLoaiSach, TenLoaiSach) VALUES 
(N'LS01', N'Văn học'),
(N'LS02', N'Công nghệ'),
(N'LS03', N'Trinh Thám'),
(N'LS04', N'tài chính'),
(N'LS05', N'Toán học');
CREATE TABLE SINHVIEN
(
MaSV NVARCHAR(10)PRIMARY KEY, --Khóa chính MaSV
TenSV NVARCHAR(50),
NgayHetHan DATE,
ChuyenNganh NVARCHAR(50),
Email NVARCHAR(50),
SoDienThoai NVARCHAR(11),
);
INSERT INTO SINHVIEN(MaSV, TenSV, NgayHetHan, ChuyenNganh, Email, SoDienThoai) VALUES
(N'SV01', N'Chu Tuan Phuong', '2022-3-1',  N'CNTT', N'phuong@fpt.edu.vn', N'0335099885'),
(N'SV02', N'Lê Quang Linh', '2022-3-2',  N'CNTT', N'linh@fpt.edu.vn', N'0335099867'),
(N'SV03', N'Đào Minh Ngọc', '2022-3-3',  N'CNTT', N'ngoc@fpt.edu.vn', N'0335094567'),
(N'SV04', N'Phạm Đình Nhu', '2022-3-4',  N'CNTT', N'nhu@fpt.edu.vn', N'0335009876'),
(N'SV05', N'Phạm Anh Tuấn', '2022-3-5',  N'CNTT', N'anhtuan@fpt.edu.vn', N'0123456789');
CREATE TABLE PHIEUMUON
(
MaPM NVARCHAR(10) PRIMARY KEY, --Khóa chính MaPhieuMuon
NgayMuon DATE,
NgayTra DATE,
TrangThai NVARCHAR(50),
MaSV NVARCHAR(10), --Khóa ngoại MaSV
);
INSERT INTO PHIEUMUON(MaPM, NgayMuon, NgayTra, TrangThai, MaSV) VALUES 
(N'PM01','2022-1-5', '2022-5-12', N'Đang mượn', N'SV01'),
(N'PM02','2022-1-6', '2022-5-13', N'Đang mượn', N'SV02'),
(N'PM03','2022-1-7', '2022-5-14', N'Đang mượn', N'SV02'),
(N'PM04','2022-1-8', '2022-5-15', N'Đang mượn', N'SV02'),
(N'PM05','2022-1-9', '2022-5-16', N'Đang mượn', N'SV02');

CREATE TABLE CHITIETPHIEUMUON
(
MaCTPM NVARCHAR(10) PRIMARY KEY, --Khóa chính MaCTPM
MaPM NVARCHAR(10), --Khóa ngoại MaPM
MaSach NVARCHAR(10), --Khóa ngoại MaSach
GhiChu NVARCHAR(250),
);
INSERT INTO CHITIETPHIEUMUON(MaCTPM, MaPM, MaSach, GhiChu) VALUES 
(N'CT01',N'PM01', N'S001', N'Chỉ mượn 1 tuần'),
(N'CT02',N'PM02', N'S002', N'Chỉ mượn 1 tuần'),
(N'CT03',N'PM03', N'S003', N'Chỉ mượn 1 tuần'),
(N'CT04',N'PM04', N'S001', N'Chỉ mượn 1 tuần'),
(N'CT05',N'PM05', N'S001', N'Chỉ mượn 1 tuần');


--3. Tạo các ràng buộc khóa ngoại, duy nhất và kiểm tra
--3.1 Tạo ràng buộc khóa ngoại từng bảng

ALTER TABLE dbo.PHIEUMUON ADD CONSTRAINT FK_PM_SV FOREIGN KEY(MaSV) REFERENCES dbo.SINHVIEN(MaSV);
ALTER TABLE dbo.CHITIETPHIEUMUON ADD CONSTRAINT FK_CTPM_PM FOREIGN KEY(MaPM) REFERENCES dbo.PHIEUMUON(MaPM);
ALTER TABLE dbo.SACH ADD CONSTRAINT FK_S_LS FOREIGN KEY(MaLoaiSach) REFERENCES dbo.LOAISACH(MaLoaiSach);
ALTER TABLE dbo.CHITIETPHIEUMUON ADD CONSTRAINT FK_CTPM_S FOREIGN KEY(MaSach) REFERENCES dbo.SACH(MaSach);
--3.2 Tạo ràng buộc duy nhất

ALTER TABLE dbo.SINHVIEN ADD CONSTRAINT SinhVien_UNQ_Email UNIQUE (Email);
ALTER TABLE dbo.SINHVIEN ADD CONSTRAINT SinhVien_UNQ_SoDienThoai UNIQUE (SoDienThoai);
ALTER TABLE dbo.SINHVIEN ADD CONSTRAINT SinhVien_UNQ_MaSV UNIQUE (MaSV);
--3.3 Tạo ràng buộc kiểm tra

ALTER TABLE dbo.SACH ADD CONSTRAINT Sach_Check_SoLuong CHECK(SoLuong <= 3);
ALTER TABLE dbo.PHIEUMUON ADD CONSTRAINT PhieuMuon_Check_Ngayphaitra CHECK( NgayTra >= NgayMuon);

--Truy vấn dữ liệu các bảng: 
SELECT * FROM dbo.SACH;
SELECT * FROM dbo.LOAISACH;
SELECT * FROM dbo.SINHVIEN;
SELECT * FROM dbo.PHIEUMUON; 
SELECT * FROM dbo.CHITIETPHIEUMUON;
