CREATE DATABASE Quanlysanpham
go
use Quanlysanpham


--Tạo bảng 
IF OBJECT_ID('MATHANG',N'U') IS NOT NULL DROP TABLE MATHANG;
create table MATHANG(
MAHANG VARCHAR(5) PRIMARY KEY, --KHÓA CHÍNH
TENHANG nvarchar(50),
DONGIA int,
);

-- DỮ LIỆU BẢNG
INSERT INTO MATHANG(MAHANG,TENHANG,DONGIA) VALUES('M1',N'Dưỡng môi Ohui',200000),
('M2',N'Tinh chất Ohui',1000000),
('M3',N'kem dưỡng Ohui',550000);
--
IF OBJECT_ID('KHACHHANG',N'U') IS NOT NULL DROP TABLE KHACHHANG;
CREATE TABLE KHACHHANG(
MAKH VARCHAR(5) PRIMARY KEY,  --KHÓA CHÍNH
TENKH NVARCHAR(50),
GIOITINH NVARCHAR(50),
QUEQUAN NVARCHAR(255),
);

-- dữ liệu
insert into KHACHHANG(MAKH,TENKH,GIOITINH,QUEQUAN) VALUES ('K1',N'Trần Triệu Vy',N'Nữ',N'Hà Nội'),
('K2',N'Trần Đình Trọng',N'nam',N'Thái Bình'),
('K3',N'Minh Hà',N'Nữ',N'Sài Gòn'),
('K4',N'Nguyễn thị Hà',N'Nữ',N'Hà Nội');
--
IF OBJECT_ID('HOADON',N'U') IS NOT NULL DROP TABLE HOADON;
CREATE TABLE HOADON(
SOPHIEU NVARCHAR(50) PRIMARY KEY, --KHÓA CHÍNH
NGAYLAP DATE,
MAKH VARCHAR(7) ,  --KHÓA NGOẠI

 --constraint FK_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH),
);

insert into HOADON(SOPHIEU,NGAYLAP,MAKH) VALUES('P1','3/3/2019','K1'),
('P2','8/3/2019','K1'),
('P3','8/4/2019','K3');

---------------------------------------
IF OBJECT_ID('CTHOADON',N'U') IS NOT NULL DROP TABLE CTHOADON;
CREATE TABLE CTHOADON(
SOPHIEU VARCHAR(7),   --KHÓA CHÍNH
MAHANG VARCHAR(7),     --KHÓA CHÍNH
SOLUONG INT,

CONSTRAINT PK_CTHD PRIMARY KEY(SOPHIEU,MAHANG),
);

insert into CTHOADON(SOPHIEU,MAHANG,SOLUONG) VALUES('P1','M1',2),
('P1','M2',3),
('P2','M2',1),
('P2','M3',0);

--KIỂM TRA DƯ LIỆU BẢNG
SELECT* FROM KHACHHANG
SELECT* FROM HOADON
SELECT* FROM CTHOADON
SELECT* FROM MATHANG

--RÀNG BUỘC KHÓA NGOẠI
 ALTER TABLE CTHOADON ADD CONSTRAINT FK_CTHD FOREIGN KEY(MAHANG) REFERENCES MATHANG(MAHANG)
 ALTER TABLE CTHOADON DROP CONSTRAINT FK_CTHD
 ALTER TABLE CTHOADON ADD CONSTRAINT FK_CTHD FOREIGN KEY(SOPHIEU) REFERENCES HOADON(SOPHIEU)
 ALTER TABLE CTHOADON DROP CONSTRAINT FK_CTHD
 ALTER TABLE HOADON ADD CONSTRAINT FK_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
 ALTER TABLE HOADON DROP CONSTRAINT FK_HD

 --Câu 1: Viết lệnh SQL thực hiện như sau: (3đ)
--a. tạo Database có tên: Quanlysanpham
--b. Tạo các bảng trên (Xác định khóa chính, khóa ngoại) (1.5đ)
--c. Chèn dữ liệu vào các bảng trên (1.5đ)
--Câu 2: Truy Vấn dữ liệu SQL (4đ)
--a. Đưa ra thông tin: Makh, Tenkh, Gioitinh của những khách hàng có Họ
--Nguyễn và Quequan là ‘Hà Nội’. (1đ).

SELECT MAKH,TENKH,GIOITINH FROM KHACHHANG
WHERE TENKH like N'Nguyễn%' and QUEQUAN like N'Hà Nội'
--b. Đưa ra thông tin danh sách các khách hàng (Makh, Tenkh, tổng tiền) có
--tổng thành tiền của các hóa đơn từ 1.000.000 trở lên. Trong đó tổng tiền=số
--lượng*Đơn giá (1đ)

select MAKH,TENKH,SOLUONG*DONGIA AS TONGTIEN from KHACHHANG,CTHOADON,MATHANG
WHERE SOLUONG*DONGIA>100000

--c. Cho biết thông tin khách hàng chưa đặt đơn hàng nào. Thông tin gồm:
--Makh, Tenkh (1đ)

SELECT KH.MAKH,TENKH,CTHD.SOLUONG FROM  KHACHHANG KH
INNER JOIN HOADON HD ON HD.MAKH = KH.MAKH
INNER JOIN CTHOADON CTHD ON CTHD.SOPHIEU = HD.SOPHIEU
WHERE CTHD.SOLUONG = 0
--d. Liệt kê thông tin: Makh, Tenkh, Mahang, Tenhang, Dongia, Soluong của
--khách hàng có tên khách hàng là Trần Triệu Vy . (1đ)

SELECT KH.MAKH,TENKH,MH.MAHANG,TENHANG,DONGIA FROM KHACHHANG KH
INNER JOIN HOADON HD ON HD.MAKH = KH.MAKH
INNER JOIN CTHOADON CTHD ON CTHD.SOPHIEU = HD.SOPHIEU
INNER JOIN MATHANG MH ON  MH.MAHANG = CTHD.MAHANG
WHERE  TENKH LIKE N'Trần Triệu Vy'

--Câu 3. Hãy viết lệnh SQL thực hiện các thao tác sau: (3đ)
--a. Thêm một bản ghi mới vào chitiethoadon,dữ liệu phù hợp( không được


 insert into CTHOADON(SOPHIEU,MAHANG,SOLUONG) VALUES('P2','M3',2);

--nhập giá trị null). (1đ)
--b. Thay đổi quê quán của khách hàng Minh Hà thành ‘Miền Tây’ (1đ)
 update KHACHHANG set QUEQUAN = N'Miền Tây'
 WHERE QUEQUAN = N'Sài Gòn'
--c. Xóa mặt hàng có tên hàng ‘Kem dưỡng Ohui’ (1đ)
DELETE MATHANG
WHERE TENHANG LIKE N'Kem dưỡng Ohui'