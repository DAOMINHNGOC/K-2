
--Tạo database LAB08 (CSDL LAB02)

CREATE DATABASE LAB07_COM20121
GO
USE LAB07_COM201221
GO
--Phần 1
--Bài 1
--Sử dụng lệnh insert để thêm dữ liệu vào các bảng

--Tạo bảng khách hàng
CREATE TABLE KhachHang
(
  maKhachHang CHAR(5) PRIMARY KEY,		--Mã khách hàng, Khóa chính
  hoVaTenLot NVARCHAR(50),				--Họ và tên lót khách hàng
  Ten NVARCHAR(50),						--Tên khách hàng
  diaChi NVARCHAR(255),					--Địa chỉ khách hàng
  Email VARCHAR(50),					--Email khách hàng (thư điện tử)
  dienThoai varchar(13),				--Số điện thoại của khách hàng
);
-- Nhập dữ liệu cho bảng khách hàng
INSERT INTO KhachHang(maKhachHang,hoVaTenLot,Ten,diaChi,Email,dienThoai) 
VALUES  ('KH001',N'Nguyễn Thị',N'Nga',N'15 Quang Trung TP Đà Nẵng','ngant@gmail.com','0912345670'),
        ('KH002',N'Trần Công',N'Thành',N'234 Lê Lợi Quảng Nam','thanhtc@gmail.com','16109423443'),
  ('KH003',N'Lê Hoàng',N'Nam',N'23 Trần Phú TPHuế','namlt@yahoo.com','0989354556'),
  ('KH004',N'Vũ Ngọc',N'Hiền',N'37 Nguyễn Thị Thập TP Đà Nẵng','hienvn@gmail.com','0894545435');

--Kiểm tra dữ liệu bảng khách hàng
SELECT * FROM dbo.KhachHang

--SINH VIÊN MÔ TẢ CÁC BẢNG CÒN LẠI
--SINH VIÊN CÓ THỂ NHẬP DỮ LIỆU CHO CÁC BẢNG BẰNG CÁC CÁCH ĐÃ HỌC

--Tạo bảng sản phẩm 
CREATE TABLE SanPham
(
  maSanPham int PRIMARY KEY, -- Khóa chính
  moTa NVARCHAR(255),   --- mô tả
  soLuong INT,--Số lượng
  donGia MONEY,  -- đơn giá
  tenSP NVARCHAR(50),  -- tên san phẩm
);
--Nhập dữ liệu cho bảng sản phẩm
INSERT INTO SanPham(maSanPham,moTa,soLuong,donGia,tenSP) VALUES  ('1' ,N'Samsung Galaxy J7 Pro là một chiếc smartphone phù hợp với những người yêu thích một sản phẩm pin tốt, thích hệ điều hành mới cùng những tính năng đi kèm độc quyền', 800, 6600000, 'Samsung Galaxy J7 Pro'),
 ('2', 'iPhone 6 là một trong những smartphone được yêu thích nhất.Lắng nghe nhu cầu về thiết kế, khả lưu trữ và giá cả, iPhone 6' , 500 ,8990000, 'iPhone 6 32GB'),
  ('3' ,'Dell Inspiron 3467 i3 7100U/4GB/1TB/Win10/(M20NR21)', 507 ,11290000, 'Laptop Dell Inspiron 3467'),
 ('4' ,'Pin sạc dự phòng Polymer 5.000 mAh eSaver JP85', 600 ,200000, 'Pin sạc dự phòng'),
 ('5',N'Nokia phù hợp với sinh viên', 100, 700000,  N'Nokia 3100' );


--Kiểm tra dữ liệu bảng sản phẩm
SELECT * FROM dbo.SanPham
-- Tạo bảng hóa đơn
CREATE TABLE HoaDon
(
  maKhachHang char(5), -- mã khách hàng
  maHoaDon INT PRIMARY KEY, -- Khóa chính
  ngayMuaHang DATE, --ngày mua hàng
  trangThai NVARCHAR(30),  --trạng thái
);
-- Nhập dữ liệu cho bảng hóa đơn
INSERT INTO HoaDon(maKhachHang,maHoaDon,ngayMuaHang,trangThai) VALUES  ('KH001','120954','03-23-2016','Đã thanh toán'),
 ('KH002','120955','04-02-2016','Đã thanh toán'),
('KH001','120956','07-12-2016','Chưa thanh toán'),
 ('KH004','120957','12-04-2016','Chưa thanh toán');



--Kiểm tra dữ liệu bảng hóa đơn
SELECT * FROM dbo.HoaDon
-- Tạo bảng hóa đơn chi tiết
CREATE TABLE HoaDonChiTiet
(
maHoaDonChiTiet INT PRIMARY KEY, -- Khóa chính
  maHoaDon INT,  -- mã hóa đơn
  maSanPham INT, -- mã sản phẩm
  soLuong INT,  -- số lượng
   
);
-- Nhập dữ liệu vào bảng hoa sđơn chi tiết
INSERT INTO dbo.HoaDonChiTiet 
VALUES  ('1','120954',3,'40'),
 ('2','120954',1,'20'),
 ('3','120955',2,'100'),
 ('4','120956',4,'6'),
 ('5','120956',2,'60'),
 ('6','120956',1,'10'),
 ('7','120957',2,'50');


-- Kiểm tra dữ liệu bảng chi tiết hóa đơn
SELECT * FROM dbo.HoaDonChiTiet

--Tạo các quan hệ cho CSDL (khóa ngoại Foreign Key)
ALTER TABLE HoaDonChiTiet ADD FOREIGN KEY(maHoaDon) REFERENCES HoaDon(maHoaDon)
ALTER TABLE HoaDonChiTiet ADD FOREIGN KEY(maSanPham) REFERENCES SanPham(maSanPham)
ALTER TABLE HoaDon ADD FOREIGN KEY(maKhachHang) REFERENCES KhachHang(maKhachHang)

--Cách 2
ALTER TABLE HoaDon ADD CONSTRAINT FK_HD_KH FOREIGN KEY(maKhachHang) REFERENCES KhachHang(maKhachHang);
ALTER TABLE HoaDonChiTiet ADD CONSTRAINT FK_CT_HD FOREIGN KEY(maHoaDon) REFERENCES HoaDon(maHoaDon);
ALTER TABLE HoaDonChiTiet ADD CONSTRAINT FK_CT_SP FOREIGN KEY(maSanPham) REFERENCES SanPham(maSanPham);

--Kiểm tra dữ liệu trong các bảng

SELECT * FROM HoaDon
SELECT * FROM HoaDonChiTiet
SELECT * FROM KhachHang
SELECT * FROM SanPham

ALTER TABLE dbo.SanPham ADD CONSTRAINT check_donGia_Min CHECK(donGia>=0)
ALTER TABLE dbo.SanPham ADD CONSTRAINT check_soLuong_Min CHECK(soLuong>=0)
ALTER TABLE dbo.KhachHang ADD CONSTRAINT KhachHang_UNQ_Email UNIQUE([Email])
ALTER TABLE dbo.HoaDon ADD CONSTRAINT HoaDon_DPT_FK1 FOREIGN KEY(maKhachHang) REFERENCES dbo.KhachHang(maKhachHang)
ALTER TABLE dbo.HoaDonChiTiet ADD CONSTRAINT HoaDonChiTiet_DEPT_FL3 FOREIGN KEY(maSanPham) REFERENCES dbo.SanPham(maSanPham)


--Bài 1 tạo các chỉ mục của CSDL
-- a. Tạo chỉ mục UNIQUE trên cột điện thoại của bảng khách hàng
   CREATE INDEX sđt_index ON dbo.KhachHang(SĐT);

--- b. Tạo chỉ mục UNIQUE trên cột email của bảng khách hàng
   CREATE INDEX email_index ON dbo.KhachHang(Email);
   ---Phần 2
--   Bài 2 Thao tác sao lưu dự phòng, import, export và bảo mật dữ liệu
--a. Sử dụng hệ quản trị csdl Access để lưu trữ dữ liệu
-- Đặt password cho cơ sở dữ liệu
-- Sao lưu dự phòng
-- Chuyển đổi Access sang SQL Server
--b. Sử dụng hệ quản trị csdl My SQL hoặc SQL Server để lưu trữ dữ liệu
-- Thực hiện các thao tác import/export DB ra file .sql
-- Sao lưu dự phòng
-- Tạo user trong my sql
   BACKUP DATABASE LAB08_COM20128
	TO  DISK = N'C:\ProgramData\QLBH.bak'
	Restore database LAB08 from disk = N'C:\ProgramData\QLBH.bak'
	
--Cú pháp


