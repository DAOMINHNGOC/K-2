CREATE DATABASE QuanLyBatDongSan82
GO
USE QuanLyBatDongSan82

CREATE TABLE VANPHONG
(
--Tạo các trường trong bảng
		MaVP NCHAR(5),
		DiaDiem nvarchar(150),
--Tạo khóa chính cho bảng
 CONSTRAINT PK_VP PRIMARY KEY(MaVP),
);
-- Nhập dữ liệu từng bản ghi, kiểu đơn giản
insert into VANPHONG values (N'H01', N'Cầu Giấy'),
                              (N'H02', N'Hà Nội'),
							  (N'H04', N'Cầu Giấy'),
							  (N'H05', N'Hà Nội'),
							  (N'H06', N'Hà Nội');

CREATE TABLE NHANVIEN
(
		MaNV nchar(5),				
		TenNV nvarchar(50),
		MaVP nchar(5),				
	CONSTRAINT PK_NV PRIMARY KEY(MaNV),
-- Tạo quan hệ bảng nhân viên với bảng văn phòng (kiểu dữ liệu và tham số phải giống nhau)
	CONSTRAINT FK_VP FOREIGN KEY (MaVP) REFERENCES VANPHONG(MaVP),						
);
-- Nhập dữ liệu vào bảng nhiều bản ghi 1 lần
insert into NHANVIEN (MaNV, TenNV, MaVP) values
 (N'N001', N'Trần Thanh Long', N'H01'),
 (N'N002', N'Trần Thanh La', N'H02');
 
 
 
CREATE TABLE NHANTHAN
(
		MaNT nchar(5),
		TenNT nvarchar(50),
		NgaySinh date,
		MoiQuanHe nvarchar(50),
		MaNV nchar(5),
	CONSTRAINT PK_NT PRIMARY KEY(MaNT),
	FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),	
);
insert into NHANTHAN(MaNT, TenNT, NgaySinh, MoiQuanHe, MaNV) values(N'ph3',N'dao minh ngoc','2003-05-22',N'chu',N'N001'),
                                                                    (N'ph4',N'dao ngoc','2004-07-22',N'cha',N'N002');
CREATE TABLE CHUSOHUU
(
		MaCSH nchar(5),
		TenCSH nvarchar(50),
		DiaChi nvarchar(50),
		SoDienThoai char(15),
	CONSTRAINT PK_CSH PRIMARY KEY(MaCSH),
);
-- Nhập dữ liệu vào bảng từng bản ghi đầy đủ
insert into CHUSOHUU(MaCSH, TenCSH, DiaChi, SoDienThoai)values (N'K01', N'Nguyễn Văn Hùng', N'Gia Lâm', '0912345678'),
                                                                 (N'K02', N'Nguyễn Văn H', N'Gia Lai', '09123456965'),
																 (N'K03', N'Nguyễn Văn H', N'Gia Lai', '09123459665');
																 
CREATE TABLE BATDONGSAN
(
		MaBDS nchar(5),
		DiaChi nvarchar(50),
		MaCSH nchar(5),
		MaVP nchar(5),
	CONSTRAINT PK_BDS PRIMARY KEY(MaBDS),	
	FOREIGN KEY (MaVP) REFERENCES VANPHONG(MaVP),			
	FOREIGN KEY (MaCSH) REFERENCES CHUSOHUU(MaCSH),
); 
insert into BATDONGSAN(MaBDS,DiaChi,MaCSH,MaVP) values(N'b01',N'Cầu Giấy',N'K01',N'H01'),
                                                       (N'b02', N'Hà Nội',N'K02',N'H02');
-- Các bạn nhập dữ liệu vào bảng bất động sản bằng 1 trong các cách trên
-- Giải thích chi tiết các dòng lệnh và khối lệnh

SELECT * FROM dbo.VANPHONG
SELECT * FROM dbo.NHANTHAN
SELECT * FROM dbo.NHANVIEN
SELECT * FROM dbo.BATDONGSAN
SELECT * FROM dbo.CHUSOHUU