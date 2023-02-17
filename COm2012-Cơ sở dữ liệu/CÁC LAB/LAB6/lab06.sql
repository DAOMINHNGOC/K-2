/*LAB06
Bài 01:
Bài 1 (4 điểm) Xác định các thực thể và tập thực thể
Cho bài toán như sau
Một Công ty Bất Động Sản có một số văn phòng tại nhiều địa điểm.
Mỗi văn phòng gồm 2 thông tin là mã số văn phòng và địa điểm đặt trụ sở.

– Mỗi văn phòng có một số nhân viên trực thuộc.
Mỗi nhân viên có mã số nhân viên và tên. Với mỗi văn phòng có một nhân viên làm trưởng văn phòng.
Một nhân viên có một hay nhiều thân nhân vợ / con.  Thông tin về  nhân thân gồm tên, ngày sinh và mối liên hệ với nhân viên  
– Công ty có danh sách các sản phẩm bất động sản cần bán.
Thông tin về  BĐS gồm mã số BĐS và địa chỉ. Mỗi BĐS được rao bán tại 1 và chỉ 1 văn phòng.
Mỗi văn phòng có nhiều BĐS rao bán và có thể không có BĐS nào rao bán.  
– Môi BĐS có một chủ sở hữu. Chủ nhân được xác định bởi mã số chủ sở hữu.
Một người có thể có nhiều BĐS. Thông tin về chủ sở hữu còn có tên, địa chỉ và số điện thoại  
Xác định các thực thể và tập thực thể cho bài toán trên. Xác định các thuộc tính cho từng loại thực thể.
Xác định mối quan hệ giữa các tập thực thể và loại quan hệ đó (1-1, 1-N, hay N-N)*/

--1. Xác định thực thể và tập thực thể
--2. Xác định các thuộc tính cho từng loại thực thể và tập thực thể
--3. Xác định mối quan hệ giữ các tập thực thể
--4. Xác định loại mối quan hệ giữa các tập thực thể (1-1, 1-n, n-n) "Nhân viên - Bất động sản" "n-n"
/*
a. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua
b. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với
điều kiện maKhachHang = ‘KH001’
c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột
sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành
tiền. Với thành tiền= donGia* soLuong
d. Hiển thị thông tin từ bảng khách hàng, bảng hoá đơn, hoá đơn chi tiết gồm các
cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và
tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh
toán.
e. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ
hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần
của cột tổng tiền.
*/
/*PHẦN II
Bài 2 (4 điểm) Viết các câu truy vấn sau:
a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016
b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016
c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016
d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên
“Iphone 7 32GB” trong tháng 12/2016
e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản
phẩm.


--Dùng công cụ T-SQL thực hiện

*/
--Tạo database LAB06 (CSDL LAB02)

CREATE DATABASE LAB06_COM20121111111
GO
USE LAB06_COM20121111111
GO

--Tạo bảng khách hàng theo mô tả ở bài LAB02
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
INSERT KhachHang VALUES  ('KH001',N'Đào Minh ',N'Ngọc',N'Vĩnh Phúc','Huyentt@gmail.com','0966011728');
INSERT KhachHang VALUES  ('KH002',N'Lê Thị',N'Thảo',N'Thanh Hóa','Gianglt@gmail.com','0966011980');
INSERT KhachHang VALUES  ('KH003',N'Đặng Văn',N'Thành',N'Đà Nẵng','Thanhdv@gmail.com','0966011880');
INSERT KhachHang VALUES  ('KH004',N'Trần Thị Bảo',N'Linh',N'Cao Bằng','Linhtb@gmail.com','0966011978');
INSERT KhachHang VALUES  ('KH005',N'Vũ Thị', N'Hằng',N'Thanh Hóa','Huongvt@gmail.com','0966011543');
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
INSERT HoaDon VALUES  ('0042','20170818','KH002',N'Chưa thanh toán');
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
  maHoaDonChiTiet int PRIMARY KEY, 
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

Select * from HoaDon
Select * from HoaDonChiTiet
Select * from KhachHang
Select * from SanPham
---PHẦN I
--Bài 1 (4 điểm) Viết các câu truy vấn sau:
--a. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua

SELECT HoaDon.maHoaDon, HoaDon.maKhachHang, HoaDon.trangThai, HoaDonChiTiet.maSanPham, HoaDonChiTiet.soLuong, HoaDon.ngayMuaHang
FROM     dbo.HoaDon INNER JOIN
         dbo.HoaDonChiTiet ON dbo.HoaDon.maHoaDon = dbo.HoaDonChiTiet.maHoaDon

--b. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với điều kiện maKhachHang = ‘KH001’

SELECT HoaDon.maHoaDon, HoaDon.maKhachHang, HoaDon.trangThai, HoaDonChiTiet.maSanPham, HoaDonChiTiet.soLuong, HoaDon.ngayMuaHang
FROM dbo.HoaDon JOIN dbo.HoaDonChiTiet ON dbo.HoaDon.maHoaDon = dbo.HoaDonChiTiet.maHoaDon

--c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành tiền. Với thành tiền= donGia* soLuong

SELECT hd.maHoaDon,  hd.ngayMuaHang, sp.tenSP, sp.donGia, hdct.soLuong, hdct.soLuong*sp.donGia AS 'Thanh Tien' FROM dbo.HoaDon hd
INNER JOIN dbo.HoaDonChiTiet hdct
ON hd.maHoaDon = hdct.maHoaDon
INNER JOIN dbo.SanPham sp
ON hdct.maSanPham = sp.maSanPham

--d. Hiển thị thông tin từ bảng khách hàng, bảng hoá đơn, hoá đơn chi tiết gồm các cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh toán.

SELECT kh.hoVaTenLot +' '+ Ten AS 'HovaTen', kh.Email, kh.dienThoai, hd.maHoaDon, hd.trangThai, 
hdct.soLuong * sp.donGia AS 'TongTien'
FROM KhachHang kh 
INNER JOIN HoaDon hd
ON kh.maKhachHang = hd.maKhachHang
INNER JOIN HoaDonChiTiet hdct 
ON hdct.maHoaDon = hd.maHoaDon
INNER JOIN dbo.SanPham sp 
ON sp.maSanPham = hdct.maSanPham
WHERE hd.trangThai LIKE N'Chưa thanh toán'

--e. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần của cột tổng tiền.

SELECT hd.maHoaDon,hd.ngayMuaHang, hdct.soLuong* donGia AS 'Tong tien' 
FROM HoaDon hd
INNER JOIN HoaDonChiTiet hdct
ON hdct.maHoaDon = hd.maHoaDon
INNER JOIN SanPham sp
ON sp.maSanPham = hdct.maSanPham




--PHẦN II
--Bài 2 (4 điểm) Viết các câu truy vấn sau:
--a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016

SELECT * FROM dbo.KhachHang 
WHERE maKhachHang NOT IN(SELECT maKhachHang FROM dbo.HoaDon WHERE ngayMuaHang >= '2016-07-01')
SELECT maKhachHang, ngayMuaHang 
FROM dbo.HoaDon WHERE ngayMuaHang >= '2016-07-01'

--b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016

SELECT a.maSanPham, c.tenSP, count(*) AS LuotMua
FROM dbo.HoaDonChiTiet a
INNER JOIN dbo.HoaDon b ON b.maHoaDon = a.maHoaDon
INNER JOIN dbo.SanPham c ON a.maSanPham= c.maSanPham
WHERE b.ngayMuaHang LIKE'2016-12%' 
GROUP BY a.maSanPham, c.tenSP
HAVING COUNT(*)> =ALL(SELECT COUNT (*) FROM dbo.HoaDonChiTiet
INNER JOIN dbo.HoaDon 
ON HoaDon.maHoaDon = HoaDonChiTiet.maHoaDon
WHERE HoaDon.ngayMuaHang LIKE'2016-12%'
GROUP BY HoaDonChiTiet.maSanPham)

SELECT HoaDonChiTiet.maSanPham,count (*) FROM dbo.HoaDonChiTiet
INNER JOIN dbo.HoaDon 
ON HoaDon.maHoaDon = HoaDonChiTiet.maHoaDon
WHERE HoaDon.ngayMuaHang LIKE'2016-12%'
GROUP BY HoaDonChiTiet.maSanPham


--c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016

SELECT TOP 5 KhachHang.*, SUM(dbo.HoaDonChiTiet.soLuong * SanPham.donGia) AS 'Tong tien'
FROM dbo.SanPham
INNER JOIN HoaDonChiTiet ON SanPham.maSanPham = HoaDonChiTiet.maSanPham
INNER JOIN HoaDon ON HoaDon.maHoaDon = HoaDonChiTiet.maHoaDon
INNER JOIN KhachHang ON KhachHang.maKhachHang = HoaDon.maKhachHang
WHERE YEAR(HoaDon.ngayMuaHang) ='2016'
GROUP BY KhachHang.maKhachHang, KhachHang.hoVaTenLot,KhachHang.Ten,KhachHang.diaChi,KhachHang.Email,KhachHang.dienThoai
ORDER BY [Tong tien] DESC

--d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên “Iphone 7 32GB” trong tháng 12/2016

SELECT KhachHang.* FROM	HoaDonChiTiet
INNER JOIN SanPham ON SanPham.maSanPham = HoaDonChiTiet.maSanPham
INNER JOIN HoaDon ON HoaDon.maHoaDon = HoaDonChiTiet.maHoaDon
INNER JOIN KhachHang ON KhachHang.maKhachHang = HoaDon.maKhachHang
WHERE KhachHang.diaChi LIKE N'%Đà Nẵng%' AND
SanPham.tenSP LIKE N'Iphone 6 32GB' AND HoaDon.ngayMuaHang LIKE '2016-12%'

--e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản phẩm.
SELECT AVG(soLuong) FROM	dbo.HoaDonChiTiet
WHERE soLuong < (SELECT AVG(soLuong) FROM dbo.HoaDonChiTiet)

SELECT*FROM dbo.SanPham
INNER JOIN dbo.HoaDonChiTiet ON dbo.SanPham.maSanPham = HoaDonChiTiet.maSanPham
WHERE dbo.HoaDonChiTiet.soLuong <(SELECT AVG(soLuong) AS Tbc FROM dbo.HoaDonChiTiet)

