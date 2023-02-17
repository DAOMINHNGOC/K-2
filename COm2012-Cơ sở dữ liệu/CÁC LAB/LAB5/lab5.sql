/* Lab 5
PHẦN I
Bài 1 (4 điểm) Viết các câu truy vấn sau:
a. Hiển thị tất cả thông tin có trong bảng khách hàng bao gồm tất cả các cột
b. Hiển thị 10 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã
khách hàng, họ và tên, email, số điện thoại
c. Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm,
tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng
d. Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột:
maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột
hoVaTenLot và Ten
e. Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’
f. Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500.
g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng
trong năm 2016
h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003,
KH006
Yêu cầu: Nộp lại file chứa các câu lệnh T-SQL.
PHẦN II
Bài 2 (4 điểm) Viết các câu truy vấn sau:
a. Hiển thị số lượng khách hàng có trong bảng khách hàng
--SELECT * FROM dbo.KhachHang
b. Hiển thị đơn giá lớn nhất trong bảng SanPham

c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
e. Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán
f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu
chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang,
maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
*/
--Tạo database LAB05 (CSDL LAB02)

CREATE DATABASE LAB05_COM20123
GO
USE LAB05_COM20123
GO

--Tạo bảng khách hàng theo mô tả ở bài LAB02
-- a. Tạo chỉ mục UNIQUE trên cột điện thoại của bảng khách hàng
   
CREATE TABLE KhachHang
(
  maKhachHang CHAR(5) PRIMARY KEY,		--Mã khách hàng, Khóa chính
  hoVaTenLot NVARCHAR(50),				--Họ và tên lót khách hàng
  Ten NVARCHAR(50),						--Tên khách hàng
  diaChi NVARCHAR(255),					--Địa chỉ khách hàng
  Email VARCHAR(50),					--Email khách hàng (thư điện tử)
  dienThoai varchar(13),				--Số điện thoại của khách hàng
  -- a. Tạo chỉ mục UNIQUE trên cột điện thoại của bảng khách hàng
   
);
CREATE INDEX dienThoai_index ON dbo.KhachHang(dienThoai);
-- Nhập dữ liệu cho bảng khách hàng
INSERT KhachHang VALUES  ('KH001',N'Trần Thu',N'Huyền',N'Vĩnh Phúc','Huyentt@gmail.com','0966011728');
INSERT KhachHang VALUES  ('KH002',N'Lê Thị',N'Giang',N'Thanh Hóa','Gianglt@gmail.com','0966011980');
INSERT KhachHang VALUES  ('KH003',N'Đặng Văn',N'Thành',N'Đà Nẵng','Thanhdv@gmail.com','0966011880');
INSERT KhachHang VALUES  ('KH004',N'Trần Bảo',N'Linh',N'Cao Bằng','Linhtb@gmail.com','0966011978');
INSERT KhachHang VALUES  ('KH005',N'Vũ Thị', N'Hường',N'Thanh Hóa','Huongvt@gmail.com','0966011543');
INSERT KhachHang VALUES  ('KH006',N'Khổng Thị',N'Quỳnh',N'Vĩnh Phúc','Quynhkt@gmail.com','0966011165');
INSERT KhachHang VALUES  ('KH007',N'Lê Anh',N'Quân',N'Sơn La','Quanla@gmail.com','0966011532');
INSERT KhachHang VALUES  ('KH008',N'Đặng Quốc',N'Chiến', N'PhúThọ','Chiendq@gmail.com','0966011443');
INSERT KhachHang VALUES  ('KH009',N'Trần Trường',N'Sơn' , N'Đà Nẵng' , 'Sontt@gmail.com','0966011512');
INSERT KhachHang VALUES  ('KH010',N'Nguyễn Thanh',N'Trang',N'Vĩnh Phúc','Trangnt@gmail.com','0966011109');
INSERT KhachHang VALUES  ('KH011',N'Đặng Thị',N'Thủy',N'Sơn La','Thuydt@gmail.com','0966011089');
INSERT KhachHang VALUES  ('KH012',N'Vũ Văn',N'Oai',N'Đà Nẵng','Oaivv@gmail.com','0966011769');

--Kiểm tra dữ liệu bảng khách hàng
SELECT * FROM dbo.KhachHang

--SINH VIÊN MÔ TẢ CÁC BẢNG CÒN LẠI
--SINH VIÊN CÓ THỂ NHẬP DỮ LIỆU CHO CÁC BẢNG BẰNG CÁC CÁCH ĐÃ HỌC

--Tạo bảng sản phẩm 
CREATE TABLE SanPham
(
  maSanPham int PRIMARY KEY,
  moTa NVARCHAR(255),
  soLuong INT,
  donGia MONEY,
  tenSP NVARCHAR(50),
);

INSERT SanPham VALUES  ('001',N'Hiện đại', 50, 11200,  N'TV SamSung' );
INSERT SanPham VALUES  ('002',N'Sang trọng', 450, 1500,  N'Đồng hồ nam' );
INSERT SanPham VALUES  ('003',N'Tiện nghi', 300, 1400,  N'Máy tính xách tay' );
INSERT SanPham VALUES  ('004',N'Hữu ích', 800, 1100,  N'Nồi cơm điện' );
INSERT SanPham VALUES  ('005',N'Tiện dụng', 30, 10800,  N'Tủ lạnh' );
INSERT SanPham VALUES  ('006',N'Phù hợp', 500, 11500,  N'Điều hòa' );
INSERT SanPham VALUES  ('007',N'Thanh lịch', 30, 18000,  N'Iphone 7 32GB');
INSERT SanPham VALUES  ('008',N'Chạy mượt', 500, 15000,  N'Iphone 6');

--Kiểm tra dữ liệu bảng sản phẩm
SELECT * FROM dbo.SanPham

CREATE TABLE HoaDon
(
  maHoaDon INT PRIMARY KEY,
  ngayMuaHang DATE,
  maKhachHang char(5),
  trangThai NVARCHAR(30),
);

INSERT HoaDon VALUES  ('0041','20161212','KH001',N'Đã thanh toán');
INSERT HoaDon VALUES  ('0042','20170818','KH002',N'Đã thanh toán');
INSERT HoaDon VALUES  ('0043','20151230','KH003',N'Đã thanh toán');
INSERT HoaDon VALUES  ('0044','20160426','KH005',N'Chưa thanh toán');
INSERT HoaDon VALUES  ('0045','20181218','KH004',N'Đã thanh toán');
INSERT HoaDon VALUES  ('0046','20210819','KH006',N'Chưa thanh toán');
INSERT HoaDon VALUES  ('0047','20191215','KH007',N'Đã thanh toán');
INSERT HoaDon VALUES  ('0048','20131104','KH008',N'Chưa thanh toán');
INSERT HoaDon VALUES  ('0049','20121210','KH006',N'Chưa thanh toán');
INSERT HoaDon VALUES  ('0050','20201204','KH002',N'Chưa thanh toán');
INSERT HoaDon VALUES  ('0051','20111207','KH005',N'Chưa thanh toán');

--Kiểm tra dữ liệu bảng hóa đơn
SELECT * FROM dbo.HoaDon

CREATE TABLE HoaDonChiTiet
(
  maHoaDon INT,
  maSanPham INT,
  soLuong INT,
  maHoaDonChiTiet INT PRIMARY KEY, 
);

INSERT dbo.HoaDonChiTiet VALUES  ('0041','001',5,'0061');
INSERT dbo.HoaDonChiTiet VALUES  ('0042','002',6,'0062');
INSERT dbo.HoaDonChiTiet VALUES  ('0043','002',8,'0063');
INSERT dbo.HoaDonChiTiet VALUES  ('0044','003',10,'0064');
INSERT dbo.HoaDonChiTiet VALUES  ('0045','004',2,'0065');
INSERT dbo.HoaDonChiTiet VALUES  ('0046','005',11,'0066');
INSERT dbo.HoaDonChiTiet VALUES  ('0047','006',15,'0067');
INSERT dbo.HoaDonChiTiet VALUES  ('0048','007',25,'0068');
INSERT dbo.HoaDonChiTiet VALUES  ('0049','008',14,'0069');
INSERT dbo.HoaDonChiTiet VALUES  ('0050','006',30,'0070');
INSERT dbo.HoaDonChiTiet VALUES  ('0051','008',10,'0071');

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
-- PHẦN I

-- a. Hiển thị tất cả thông tin có trong bảng khách hàng bao gồm tất cả các cột

		SELECT * FROM KhachHang

-- b. Hiển thị 10 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã khách hàng, họ và tên, email, số điện thoại

		SELECT TOP 10 hoVaTenLot+' '+Ten AS 'Họ và Tên', Email, dienThoai, maKhachHang  FROM KhachHang

-- c. Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm, tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng

		SELECT maSanPham, tenSP, (donGia*soLuong) AS 'Tổng tiền tồn kho' FROM SanPham
        
-- d. Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột: maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột hoVaTenLot và Ten

		SELECT maKhachHang, hoVaTenLot+' '+Ten AS 'Họ và Tên',diaChi FROM KhachHang WHERE Ten LIKE'H%'

-- e. Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’

		SELECT * FROM KhachHang WHERE diaChi = N'Đà Nẵng'

-- f. Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500

		SELECT COUNT(*) AS 'SỐ LƯỢNG SẢN PHẨM' FROM SanPham WHERE soLuong BETWEEN 100 AND 500

-- g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng trong năm 2016

		SELECT * FROM HoaDon WHERE trangThai = N'Chưa thanh toán' AND ngayMuaHang LIKE '2016%'
		SELECT * FROM HoaDon WHERE trangThai = N'Chưa thanANDoán' and YEAR(ngayMuaHang) = 2016

-- h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003,KH0SELECT		SFROMt * FromWHEREon Where maKhachHang = ORH001' or maKhachHang = ORH003' or maKhachHang = 'KH006'

-- PHẦN II

-- a. Hiển thị số lượng khách hàng có trong bảng khách hàng

		Select count(*) as 'SỐ LƯỢNG KHÁCH HÀNG' From KhachHang

-- b. Hiển thị đơn giá lớn nhất trong bảng SanPham

		Select Max(donGia) as 'ĐƠN GIÁ LỚN NHẤT' From SanPham

-- c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm

		Select * From SanPham Order by soLuong asc
		
-- d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm

		Select * From SanPham
        
-- e. Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán

		Select maHoaDon From HoaDon where trangThai = N'Chưa thanh toán' and YEAR(ngayMuaHang) = 2016 AND MONTH(ngayMuaHang) = 12

-- f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn

		Select maHoaDon, maSanPham, soLuong From HoaDonChiTiet

-- g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5

		Select maHoaDon, maSanPham, soLuong From HoaDonChiTiet where soLuong >= 10

-- h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang, maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
		
		Select maHoaDon, ngayMuaHang, maKhachHang From HoaDon Order by ngayMuaHang desc

