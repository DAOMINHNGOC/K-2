 
CREATE DATABASE QuanLyBanHang10
GO
-- Sử dụng CSDL để tạo các bảng theo yêu cầu
USE QuanLyBanHang10
GO

 -- Tạo bảng KhachHang
CREATE TABLE KhachHang
(
	maKhachHang CHAR(5) PRIMARY KEY, --Khóa chính
	hoVaTenLot NVARCHAR(50),
	Ten NVARCHAR(50),
	diaChi NVARCHAR(255),
	Email VARCHAR(50),
	dienThoai VARCHAR(13),
);

--Nhập dữ liệu vào bảng KhachHang
INSERT KhachHang VALUES  ('KH001',N'Trần Thanh',N'Long',N'Hà Nội','longtt3@fpt.edu.vn','0988526759');

--Kiểm tra (lấy) dữ liệu trong bảng KhachHang
SELECT * FROM dbo.KhachHang

--Tạo bảng SanPham
CREATE TABLE SanPham
(
	maSanPham INT PRIMARY KEY, -- Khóa chính
	moTa NVARCHAR(255),
	soLuong INT,
	donGia MONEY,
	tenSP NVARCHAR(50),
);

--Nhập dữ liệu vào bảng SanPham
INSERT SanPham VALUES  ('001',N'Hiện đại', '50', '11200',  N'TV SamSung Full HD' );

--Kiểm tra (lấy) dữ liệu trong bảng KhachHang
SELECT * FROM dbo.SanPham

--Tạo bảng HoaDon
CREATE TABLE HoaDon
(
	maHoaDon INT PRIMARY KEY, --Khóa chính
	ngayMuaHang DATE,
	maKhachHang CHAR(5),
	trangThai NVARCHAR(30),
);

--Nhập dữ liệu vào bảng HoaDon
INSERT HoaDon VALUES  ('0041','20161212','KH001',N'Đã thanh toán');

--Kiểm tra (lấy) dữ liệu trong bảng HoaDon
SELECT * FROM dbo.HoaDon

--Tạo bảng HoaDonChiTiet
CREATE TABLE HoaDonChiTiet
(
	maHoaDon INT,
	maSanPham INT,
	soLuong INT,
	maHoaDonChiTiet INT PRIMARY KEY,	
);

--Nhập dữ liệu vào bảng HoaDonChiTiet
INSERT dbo.HoaDonChiTiet VALUES  ('0041','001','5','0061');

--Kiểm tra (lấy) dữ liệu trong bảng HoaDon
SELECT * FROM dbo.HoaDonChiTiet

ALTER TABLE HoaDon ADD CONSTRAINT FK_HD_KH FOREIGN KEY(maKhachHang) REFERENCES KhachHang(maKhachHang);
ALTER TABLE HoaDonChiTiet ADD CONSTRAINT FK_CT_HD FOREIGN KEY(maHoaDon) REFERENCES HoaDon(maHoaDon);
ALTER TABLE HoaDonChiTiet ADD CONSTRAINT FK_CT_SP FOREIGN KEY(maSanPham) REFERENCES SanPham(maSanPham);

/*////////////////////////////////////////////////////////////////////

 THAM KHẢO ĐỂ HOÀN THÀNH BÀI TỐT NHẤT

--I. Khóa chính

CONSTRAINT PK_tenbang PRIMARY KEY(tentruong)
--Ví dụng
CONSTRAINT PK_KhacHang PRIMARY KEY(maKhachHang)

maKhachHang CHAR(5) PRIMARY KEY, --Khóa chính

---------------------------------------------------------------------------
--II. Khóa ngoại

CONSTRAINT tenkhoa FOREIGN KEY(tentruong) REFERENCES bang(tentruong)

--Ví dụ
CONSTRAINT FK_KH_HD FOREIGN KEY(maKhachHang) REFERENCES KhachHang(maKhachHang)

--Tạo bằng ALTER TABLE có đặt tên
ALTER TABLE HoaDon ADD CONSTRAINT FK_KH_HD FOREIGN KEY(maKhachHang) REFERENCES KhachHang(maKhachHang);
ALTER TABLE HoaDonChiTiet ADD CONSTRAINT FK_KH_HD FOREIGN KEY(maHoaDon) REFERENCES HoaDon(maHoaDon);
ALTER TABLE HoaDonChiTiet ADD CONSTRAINT FK_KH_HD FOREIGN KEY(maSanPham) REFERENCES SanPham(maSanPham);

--Tạo bằng alter không đặt tên
ALTER TABLE HoaDon ADD FOREIGN KEY(maKhachHang) REFERENCES KhachHang(maKhachHang)
*/
