-- Tạo CSDL cho bài toán Quản lý bất động sản
CREATE DATABASE QuanLyBatDongSan111111191
GO
USE QuanLyBatDongSan111111191

CREATE TABLE VANPHONG
(
--Tạo các trường trong bảng
		MaVP nchar(5), -- KHÓA CHÍNH
		DiaDiem nvarchar(150),
--Tạo khóa chính cho bảng
 CONSTRAINT PK_VP PRIMARY KEY(MaVP),
);
-- Nhập dữ liệu từng bản ghi, kiểu đơn giản
insert into VANPHONG values (N'H01', N'Cầu Giấy'),
(N'H011', N'Cầu Giấy'),
(N'H012', N'PHÚ THỌ'),
(N'H013', N'VIỆT NAM'),
(N'H014', N'Cầu Giấy'),
(N'H015', N'Cầu Giấy');

CREATE TABLE NHANVIEN
(
		MaNV nchar(5),--	KHÓA CHÍNH			
		TenNV nvarchar(50),
		MaVP nchar(5),	--Khóa ngoại			
	CONSTRAINT PK_NV PRIMARY KEY(MaNV),
-- Tạo quan hệ bảng nhân viên với bảng văn phòng (kiểu dữ liệu và tham số phải giống nhau)
	CONSTRAINT FK_VP FOREIGN KEY (MaVP) REFERENCES VANPHONG(MaVP),						
);
-- Nhập dữ liệu vào bảng nhiều bản ghi 1 lần
insert into NHANVIEN (MaNV, TenNV, MaVP) values
 (N'N0011', N'Trần Thanh Long', N'H011'),
 (N'N0012', N'ĐÀO MINH NGỌC', N'H012'),
 (N'N0013', N'CHU TUẤN PHƯƠNG', N'H013'),
 (N'N0014', N'LÊ QUANG LINH', N'H014'),
 (N'N0015', N'Trần Thanh Long', N'H015');

 
CREATE TABLE NHANTHAN
(
		MaNT nchar(5),--KHÓA CHÍNH
		TenNT nvarchar(50),
		NgaySinh date,
		MoiQuanHe nvarchar(50),
		MaNV nchar(5),--Khóa ngoại
	CONSTRAINT PK_NT PRIMARY KEY(MaNT),
	FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),	
);
INSERT INTO NHANTHAN(MaNT,TenNT,NgaySinh,MoiQuanHe,MaNV) VALUES
(N'A01',N'ĐÀO MINH NGỌC',N'2003/2/5',N'CHỦ',N'N0011'),
(N'A02',N'ĐÀO VĂN NGỌC',N'2003/2/5',N'CHỦ',N'N0012'),
(N'A03',N'ĐÀO THÚY NGỌC',N'2003/2/5',N'CHỦ',N'N0013'),
(N'A04',N'ĐÀO THỊ NGỌC',N'2003/2/5',N'CHỦ',N'N0014'),
(N'A05',N'ĐÀO MINH NGỌC',N'2003/2/5',N'CHỦ',N'N0015');

CREATE TABLE CHUSOHUU
(
		MaCSH nchar(5),--KHÓA CHÍNH
		TenCSH nvarchar(50),
		DiaChi nvarchar(50),
		SoDienThoai char(15),
	CONSTRAINT PK_CSH PRIMARY KEY(MaCSH),
);
-- Nhập dữ liệu vào bảng từng bản ghi đầy đủ
insert into CHUSOHUU(MaCSH, TenCSH, DiaChi, SoDienThoai)values 
(N'K011', N'Nguyễn Văn Hùng', N'Gia Lâm', '0912345678'),
(N'K012', N'Nguyễn TẤT Hùng', N'Gia Lâm', '0912345678'),
(N'K013', N'Nguyễn Văn Hùng', N'Gia LAI', '0912421678'),
(N'K014', N'Nguyễn NGỌC Hùng', N'Gia LA', '0912343456'),
(N'K015', N'Nguyễn Văn Hùng', N'Gia Lâm', '0912754678');

CREATE TABLE BATDONGSAN
(
		MaBDS nchar(5),--KHÓA CHÍNH
		DiaChi nvarchar(50),
		MaCSH nchar(5),--Khóa ngoại
		MaVP nchar(5),--Khóa ngoại
	CONSTRAINT PK_BDS PRIMARY KEY(MaBDS),	
	FOREIGN KEY (MaVP) REFERENCES VANPHONG(MaVP),			
	FOREIGN KEY (MaCSH) REFERENCES CHUSOHUU(MaCSH),
); 
INSERT INTO BATDONGSAN(MaBDS,DiaChi,MaCSH,MaVP) VALUES
(N'C01',N'PHÚ THỌ',N'K011',N'H011'),
(N'C02',N'PHÚ THI',N'K012',N'H012'),
(N'C03',N'PHÚ TỌ',N'K013',N'H013'),
(N'C04',N'PHÚ THỌ',N'K014',N'H014'),
(N'C05',N'PHA THỌ',N'K015',N'H015');


SELECT * FROM dbo.NHANTHAN
SELECT * FROM dbo.NHANVIEN
SELECT * FROM dbo.BATDONGSAN
SELECT * FROM dbo.CHUSOHUU
