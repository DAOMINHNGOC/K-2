﻿/*
Y1. Phân tích bài toán, xác định các thực thể và các thuộc tính của chúng.

I. Mức khái niệm: Tìm ra được các tập thực thể, các thuộc tính, và các mối quan hệ của thực thể
1. Tập thực thể SÁCH: Mã sách, Tiêu đề, Nhà xuất bản, Tác giả, Số trang, Số lượng bản sao, giá tiền, ngày nhập kho, vị trí đặt sách
2. Tập thực thể LOẠI SÁCH: Mã loại, Loại sách
3. Tập thực thể SINH VIÊN (THẺ SINH VIÊN): Mã sinh viên, Tên sinh viên, ngày hết hạn, chuyên ngành học, email, số điện thoại
4. Tập thực thể PHIẾU MƯỢN: Số phiếu, ngày mượn, Tên sinh viên, mã sinh viên, mã lớp (chuyên ngành học)
5. Tập thực thể CHI TIẾT PHIẾU MƯỢN: STT, mã sách, nhà xuất bản, ghi chú, ngày mượn, ngày trả

II. Mối quan hệ:1-1, 1-n, n-n
1. SINH VIÊN === THẺ SINH VIÊN => 1-1 (GỘP)
2. '1' SÁCH === LOẠI SÁCH => N-1
3. '2' SINH VIÊN (THẺ SINH VIÊN) === PHIẾU MƯỢN => 1-N
4. SÁCH === PHIẾU MƯỢN => N-N (TÁCH)
5. '3' PHIẾU MƯỢN === CHI TIẾT PHIẾU MƯỢN => 1-N
6. '4' SÁCH === CHI TIẾT PHIẾU MƯỢN => 1-N

Y2. Thiết kế sơ đồ quan hệ ERD (Mức logic)
vẽ sơ đồ ERD theo các mối quan hệ 1,2,3,4 gồm: tập thực thể, thuộc tính, mối quan hệ (biểu diễn bằng các hình: chữ nhật, ô van, thoi)

Y3. Thiết kế cơ sở dữ liệu mức vật lý, chuẩn hoá các bảng đến dạng chuẩn 3
1. Xác định khóa chính
2. Xác định khóa ngoại
3. Tách quan hệ n-n thành 1-n (Bước chuẩn hóa)

Ví dụ: LOẠI SÁCH

THUỘC TÍNH				KIỂU DỮ LIỆU			MÔ TẢ
MaLoaiSach				nvarchar(10)			Khóa chính
.......

SACH (MaSach, TenSach, NhaXuatBan, TacGia, 'SoTrang??', SoLuong, GiaTien, NgayNhapKho, ViTri, MaLoaiSach)
LOAISACH (MaLoaiSach, TenLoaiSach)
SINHVIEN 'THESINHVIEN' (MaSV, TenSV, NgayHetHan, ChuyenNganh, Email, SoDienThoai)
PHIEUMUON (MaPM 'SoPhieu', NgayMuon, NgayTra, TrangThai, MaSV)
CHITIETPHIEUMUON (MaCTPM 'STT', MaPM, MaSach, GhiChu)

Y4. Tạo các bảng trong CSDL, tạo các ràng buộc: khoá chính, khoá ngoại, ràng buộc duy nhất, ràng buộc kiểm tra …
1. Thực hiện bằng câu lệnh T-SQL (giải thích): Tạo CSDL, Bảng, thuộc tính, kiểu dữ liệu, miền giá trị, khóa chính, khóa ngoại, mối quan hệ.
2. Chụp sơ đồ Diagrams

Y5. Nhập dữ liệu vào cho các bảng (ít nhất 5 bản ghỉ trên mỗi bảng)
1. Thực hiện theo cách nào => cú pháp (giải thích)
2. Thực hiện trên các bảng => giải thích

Y6. Viết các câu truy vấn sau:
*/
-- 1 Tạo csdl QuanLyThuVien
CREATE DATABASE QuanLyThuVien10
GO
USE QuanLyThuVien10
GO
--2. Tạo các bảng và khóa chính (Table)
CREATE TABLE SACH
(
MaSach NVARCHAR(10) PRIMARY KEY, --Khóa chính MaSach
TenSach NVARCHAR(50),
NhaXuatBan NVARCHAR(50),
TacGia NVARCHAR(50),
SoTrang INT,
SoLuong INT,
GiaTien FLOAT,
NgayNhapKho DATE,
ViTri NVARCHAR(50),
MaLoaiSach NVARCHAR(10), --Khóa ngoại MaLoaiSach
);
--3.1 Nhập dữ liệu vào bảng Sach
INSERT INTO SACH(MaSach, TenSach, NhaXuatBan, TacGia, SoTrang, SoLuong, GiaTien, NgayNhapKho, ViTri, MaLoaiSach) VALUES
(N'COM10122', N'Cơ sở dữ liệu SQL', N'FPT', N'Ngọc đào', 200, 100, 400.000,'2014-5-22', N'Thư viện', N'KS'),
(N'COM10142', N'Lập trình js', N'poly', N'Lê Duẩn', 220, 103, 150.000,'2015-4-1', N'Thư viện', N'IT'),
(N'MUU2002', N'Thiết kế đồ họa', N'poly', N'Lê Duẩn', 92, 133, 350.000, '2015-6-30', N'Thư viện', N'KS'),
(N'AC2002', N'Nhập môn lập trình', N'FPT', N'Đào Minh Ngọc', 93, 110, 100.000, '2016-4-11', N'Thư viện', N'KS'),
(N'COMM014', N'Lập trình JS', N'FPT', N'Lê Duẩn', 150, 200, 500.000, '2015-3-03', N'Thư viện', N'IT');

CREATE TABLE LOAISACH
(
MaLoaiSach NVARCHAR(10) PRIMARY KEY, --Khóa chính MaLoaiSach
TenLoaiSach NVARCHAR(50),
);
--3.2 Nhập dữ liệu vào bảng LoaiSach
INSERT INTO LOAISACH(MaLoaiSach, TenLoaiSach) VALUES 
(N'IT', N'Công nghệ'),
(N'EN', N'Tiếng Anh'),
(N'KT', N'Trung Tâm'),
(N'KS', N'Nhà hàng'),
(N'DH', N'Đồ Họa');

CREATE TABLE SINHVIEN
(
MaSV NVARCHAR(10)PRIMARY KEY, --Khóa chính MaSV
TenSV NVARCHAR(50),
NgayHetHan DATE,
ChuyenNganh NVARCHAR(50),
Email NVARCHAR(50),
SoDienThoai NVARCHAR(11),
);
--3.3 Nhập dữ liệu vào bảng SinhVien
INSERT INTO SINHVIEN(MaSV, TenSV, NgayHetHan, ChuyenNganh, Email, SoDienThoai) VALUES
(N'SV01', N'Đào Minh Ngọc', '2022-3-1',  N'Công nghệ thông tin', N'ngocg@fpt.edu.vn', N'03354757885'),
(N'SV02', N'Đỗ Huy Hoàng', '2022-3-2',  N'Công nghệ thông tin', N'hoang@fpt.edu.vn', N'0335099867'),
(N'SV03', N'Phạm Ta Ngan', '2022-3-3',  N'Công nghệ thông tin', N'ngan@fpt.edu.vn', N'0335094567'),
(N'SV04', N'Phạm Dolla', '2022-3-4',  N'Thiết kế đồ họa', N'pham@fpt.edu.vn', N'0335009876'),
(N'SV05', N'Phạm Văn Ta', '2022-3-5',  N'Quản Trị Khách Sạn', N'ta@fpt.edu.vn', N'0123456789');

CREATE TABLE PHIEUMUON
(
MaPM NVARCHAR(10) PRIMARY KEY, --Khóa chính MaPhieuMuon
NgayMuon DATE,
NgayTra DATE,
TrangThai NVARCHAR(50),
MaSV NVARCHAR(10), --Khóa ngoại MaSV
);
--3.4 Nhập dữ liệu vào bảng PhieuMuon
INSERT INTO PHIEUMUON(MaPM, NgayMuon, NgayTra, TrangThai, MaSV) VALUES 
(N'PM001','2017-1-2', '2017-1-30', N'Chưa trả', N'SV01'),
(N'PM002','2022-1-4', '2022-1-13', N'Đã Trả', N'SV02'),
(N'PM003','2010-1-8', '2010-1-18', N'Đã trả', N'SV03'),
(N'PM004','2009-1-8', '2009-1-25', N'Chưa trả', N'SV04'),
(N'PM005','2022-1-9', '2022-2-2', N'Đã trả', N'SV05');

CREATE TABLE CHITIETPHIEUMUON
(
MaCTPM NVARCHAR(10) PRIMARY KEY, --Khóa chính MaCTPM
MaPM NVARCHAR(10), --Khóa ngoại MaPM
MaSach NVARCHAR(10), --Khóa ngoại MaSach
GhiChu NVARCHAR(250),
);
--3.5 Nhập dữ liệu vào bảng ChiTietPhieuMuon
INSERT INTO CHITIETPHIEUMUON(MaCTPM, MaPM, MaSach, GhiChu) VALUES 
(N'CTPM1',N'PM01', N'COM1012', N'Chỉ mượn 2 tuần'),
(N'CTPM2',N'PM02', N'COM1014', N'Chỉ mượn 3 tuần'),
(N'CTPM3',N'PM03', N'MU200', N'Chỉ mượn 7 tuần'),
(N'CTPM4',N'PM04', N'AC200', N'Chỉ mượn 5 tuần'),
(N'CTPM5',N'PM05', N'COM1014', N'Chỉ mượn 1 tuần');


--4. Tạo các ràng buộc khóa ngoại, duy nhất và kiểm tra
--4.1 Tạo ràng buộc khóa ngoại từng bảng

ALTER TABLE dbo.PHIEUMUON ADD CONSTRAINT FK_PM_SV FOREIGN KEY(MaSV) REFERENCES dbo.SINHVIEN(MaSV);
ALTER TABLE dbo.CHITIETPHIEUMUON ADD CONSTRAINT FK_CTPM_PM FOREIGN KEY(MaPM) REFERENCES dbo.PHIEUMUON(MaPM);
ALTER TABLE dbo.SACH ADD CONSTRAINT FK_S_LS FOREIGN KEY(MaLoaiSach) REFERENCES dbo.LOAISACH(MaLoaiSach);
ALTER TABLE dbo.CHITIETPHIEUMUON ADD CONSTRAINT FK_CTPM_S FOREIGN KEY(MaSach) REFERENCES dbo.SACH(MaSach);
--4.2 Tạo ràng buộc duy nhất

ALTER TABLE dbo.SINHVIEN ADD CONSTRAINT SinhVien_UNQ_Email UNIQUE (Email);
ALTER TABLE dbo.SINHVIEN ADD CONSTRAINT SinhVien_UNQ_SoDienThoai UNIQUE (SoDienThoai);
ALTER TABLE dbo.SINHVIEN ADD CONSTRAINT SinhVien_UNQ_MaSV UNIQUE (MaSV);
--4.3 Tạo ràng buộc kiểm tra

ALTER TABLE dbo.SACH ADD CONSTRAINT Sach_Check_SoLuong CHECK(SoLuong <= 3);
ALTER TABLE dbo.PHIEUMUON ADD CONSTRAINT PhieuMuon_Check_Ngayphaitra CHECK( NgayTra >= NgayMuon);

--Truy vấn dữ liệu các bảng: 
SELECT * FROM dbo.SACH;
SELECT * FROM dbo.LOAISACH;
SELECT * FROM dbo.SINHVIEN;
SELECT * FROM dbo.PHIEUMUON; 
SELECT * FROM dbo.CHITIETPHIEUMUON;
-- ̉6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền , tác giả thuộc loại sách có mã “IT”.

SELECT MaSach, TenSach, MaLoaiSach, TacGia, GiaTien 
FROM SACH WHERE MaLoaiSach = 'IT'

--6.2 Liệt kê các phiếu mượn gồm các thông tin mã phiếu mượn, mã sách , ngày mượn, mã sinh viên có ngày mượn trong tháng 01/2017.

SELECT dbo.PHIEUMUON.MaPM,MaSV,NgayMuon, dbo.CHITIETPHIEUMUON.MaSach 
FROM dbo.PHIEUMUON INNER JOIN dbo.CHITIETPHIEUMUON ON dbo.PHIEUMUON.MaPM = dbo.CHITIETPHIEUMUON.MaPM
WHERE dbo.PHIEUMUON.NgayMuon LIKE '2017-01%'

--6.3 Liệt kê các phiếu mượn chưa trả sách cho thư viên theo thứ tự tăng dần của ngày mượn sách.

SELECT * FROM PHIEUMUON 
WHERE TrangThai LIKE N'Chưa trả'
ORDER BY NgayMuon

--6.4 Liệt kê tổng số đầu sách của mỗi loại sách ( gồm mã loại sách, tên loại sách, tổng số lượng sách mỗi loại).
SELECT s.MaLoaiSach, ls.TenLoaiSach, COUNT(ls.MaLoaiSach) AS 'SoDauSach' 
FROM dbo.SACH s INNER JOIN dbo.LOAISACH ls ON ls.MaLoaiSach = s.MaLoaiSach
GROUP BY s.MaLoaiSach, ls.TenLoaiSach

--6.5 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.

SELECT MaSV, COUNT(MaSV) AS 'SoLuotMuon' 
FROM dbo.PHIEUMUON
GROUP BY MaSV

--6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ khoá “SQL”.

SELECT * FROM dbo.SACH 
WHERE TenSach LIKE N'%SQL%'

--6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã sinh viên, tên sinh viên, mã phiếu mượn, tiêu đề sách, ngày mượn, ngày trả.
--Sắp xếp thứ tự theo ngày mượn sách.

SELECT pm.MaSV, sv.TenSV, ctpm.MaPM,s.TenSach, pm.NgayMuon, pm.NgayTra FROM SINHVIEN sv INNER JOIN PHIEUMUON pm
ON pm.MaSV = sv.MaSV INNER JOIN dbo.CHITIETPHIEUMUON ctpm 
ON ctpm.MaPM = pm.MaPM INNER JOIN dbo.SACH s 
ON s.MaSach = ctpm.MaSach ORDER BY pm.NgayMuon

--6.8 Liệt kê các đầu sách có lượt mượn lớn hơn 20 lần.

SELECT dbo.SACH.MaSach, COUNT(dbo.CHITIETPHIEUMUON.MaSach) AS 'Số lần mượn' FROM dbo.SACH JOIN dbo.CHITIETPHIEUMUON ON CHITIETPHIEUMUON.MaSach = SACH.MaSach
GROUP BY dbo.SACH.MaSach
HAVING COUNT(dbo.CHITIETPHIEUMUON.MaSach) > 20

--6.9 Viết câu lệnh cập nhật lại giá tiền của các quyển sách có ngày nhập kho trước năm 2014 giảm 30%.

UPDATE dbo.SACH SET GiaTien = GiaTien - GiaTien*0.3 
WHERE YEAR(NgayNhapKho) <= '2017'

--6.10 Viết câu lệnh cập nhật lại trạng thái đã trả sách cho phiếu mượn của sinh viên có mã sinh viên PD12301 (ví dụ).

UPDATE PHIEUMUON SET TrangThai = N'Đã trả' 
WHERE MaSV = N'SV01'

--6.11 Lập danh sách các phiếu mượn quá hạn chưa trả gồm các thông tin:
--mã phiếu mượn, tên sinh viên, email, danh sách các sách đã mượn, ngày mượn.

SELECT sv.TenSV, sv.Email, pm.NgayMuon, pm.NgayTra, pm.TrangThai, 
DATEDIFF(DAY, pm.NgayTra, GETDATE()) AS 'SoNgayQuaHan'
FROM dbo.PHIEUMUON pm
INNER JOIN dbo.SINHVIEN sv ON  sv.MaSV = pm.MaSV
WHERE pm.TrangThai LIKE N'Chưa trả'
AND DATEDIFF(DAY, pm.NgayTra, GETDATE()) >= 1

--6.12 Viết câu lệnh cập nhật lại số lượng bản sao tăng lên 5 đơn vị đối với các đầu sách có lượt mượn lớn hơn 10

--6.12 Viết câu lệnh cập nhật lại số lượng bản sao tăng lên 5 đơn vị đối với các đầu sách có lượt mượn lớn hơn 10

UPDATE SACH SET SoLuong = SoLuong + 5
WHERE MaSach IN (SELECT s.MaSach FROM SACH s INNER JOIN CHITIETPHIEUMUON ctpm ON ctpm.MaSach = s.MaSach
GROUP BY s.MaSach
HAVING COUNT(ctpm.MaSach) > 10)

--6.13 Viết câu lệnh xoá các phiếu mượn có ngày mượn và ngày trả trước "1/1/2010"

DELETE PHIEUMUON WHERE NgayMuon < '2010-01-01'

--Y7. Tổ chức sao lưu dự phòng cho cơ sở dữ liệu
BACKUP DATABASE [QuanLyThuVien10] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\PH20534' WITH NOFORMAT, NOINIT,  NAME = N'QuanLyThuVien10-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
