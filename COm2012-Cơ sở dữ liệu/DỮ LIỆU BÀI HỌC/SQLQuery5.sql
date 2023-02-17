create database Quanlysanpham
go 
use Quanlysanpham

--taoj bangr mặt hàng
IF OBJECT_ID ('MATHANG',N'U') IS NOT NULL DROP TABLE MATHANG
create table MATHANG 
(
MAHANG VARCHAR(5), --KHÓA CHÍNH
TENHANG NVARCHAR(50),
DONGIA INT,

constraint PK_MH primary key(MAHANG),
);
INSERT INTO MATHANG(MAHANG,TENHANG,DONGIA) VALUES('M1',N'Dưỡng môi Ohui',200000),
('M2',N'Tinh chất Ohui',1000000),
('M3',N'Kem dưỡng Ohui',550000);


--Tạo bảng khach hàng
IF OBJECT_ID ('KHACHHANG',N'U') IS NOT NULL DROP TABLE KHACHHANG
CREATE TABLE KHACHHANG
(
MAKH VARCHAR(5) PRIMARY KEY,--KHÓA CHÍNH
TENKH NVARCHAR(50),
GIOITINH NVARCHAR(50),
QUEQUAN NVARCHAR(50),
--CONSTRAINT PK_KH PRIMARY KEY(MAKH)
);

INSERT INTO KHACHHANG VALUES('K1',N'Trần Triệu Vy',N' Nữ',N'Hà Nội'),
('K2',N'Trần Đình Trọng',N' Nam',N'Thái Bình'),
('K3',N'Minh Hà',N' Nữ',N'Sài Gòn'),
('K4',N'Nguyễn Thúy Hiền',N' Nữ',N'Hà Nội');


--Tọa bảng hóa đơn
IF OBJECT_ID ('HOADON',N'U') IS NOT NULL DROP TABLE HOADON
CREATE TABLE HOADON
(
SOPHIEU VARCHAR(5), --KHÓA CHÍNH
NGAYLAP DATE,
MAKH VARCHAR(5), --KHÓA NGOẠI
CONSTRAINT PK_HD PRIMARY KEY(SOPHIEU),
);

INSERT INTO HOADON VALUES('P1', '3/3/2019','K1'),
('P2', '8/3/2019',' K1'),
('P3', '8/4/2019',' K3');
IF OBJECT_ID('CTHOADON',N'U') IS NOT NULL DROP TABLE CTHOADON
CREATE TABLE CTHOADON
(
SOPHIEU VARCHAR(5), --KHÓA CHÍNH
MAHANG VARCHAR(5),  --KHÓA CHÍNH
SOLUONG INT,

CONSTRAINT PK_CTHD PRIMARY KEY(SOPHIEU,MAHANG),
);
INSERT INTO CTHOADON(SOPHIEU,MAHANG,SOLUONG) VALUES('P1','M1',2),
('P1','M2',3),
('P2','M2',1);
-- kiểm tra dữ liệu
SELECT* FROM MATHANG
SELECT*FROM KHACHHANG
SELECT *FROM HOADON
SELECT*FROM CTHOADON

--KHÓA NGOẠI BẢNG CTHÓA ĐƠN
ALTER TABLE CTHOADON ADD CONSTRAINT FK_CTHD FOREIGN KEY(MAHANG) REFERENCES MATHANG(MAHANG)
--KHÓA NGOẠI CỦA BẢNG HÓA ĐƠN
ALTER TABLE HOADON ADD CONSTRAINT FK_HD1 FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)

-- TRUY VẪN
-- a. Đưa ra thông tin: Makh, Tenkh, Gioitinh của những khách hàng có Họ
--Nguyễn và Quequan là ‘Hà Nội’. (1đ).

SELECT MAKH,TENKH,GIOITINH  FROM KHACHHANG
WHERE TENKH LIKE N'Nguyễn%' and QUEQUAN LIKE N'Hà Nội'

--b,Đưa ra thông tin danh sách các khách hàng (Makh, Tenkh, tổng tiền) có
--tổng thành tiền của các hóa đơn từ 1.000.000 trở lên. Trong đó tổng tiền=số
--lượng*Đơn giá (1đ)
select MAKH,TENKH, SOLUONG*DONGIA AS TONGTIEN from KHACHHANG,CTHOADON,MATHANG
WHERE SOLUONG*DONGIA>1000000
--c. Cho biết thông tin khách hàng chưa đặt đơn hàng nào. Thông tin gồm:
--Makh, Tenkh (1đ)

SELECT KHACHHANG.MAKH,TENKH FROM KHACHHANG
INNER JOIN HOADON ON HOADON.MAKH = KHACHHANG.MAKH
INNER JOIN CTHOADON ON  CTHOADON.MAHANG = MATHANG.MAHANG
INNER JOIN MATHANG ON MATHANG.MAHANG = CTHOADON.MAHANG


WHERE CTHOADON.SOLUONG = 0
--d. Liệt kê thông tin: Makh, Tenkh, Mahang, Tenhang, Dongia, Soluong của
--khách hàng có tên khách hàng là Trần Triệu Vy . (1đ)
--Câu 3. Hãy viết lệnh SQL thực hiện các thao tác sau: (3đ)
--a. Thêm một bản ghi mới vào chitiethoadon,dữ liệu phù hợp( không được
--nhập giá trị null). (1đ)

--b. Thay đổi quê quán của khách hàng Minh Hà thành ‘Miền Tây’ (1đ)
UPDATE 
--c. Xóa mặt hàng có tên hàng ‘Kem dưỡng Ohui’
DELETE*FROM MATHANG FROM MATHANG WHERE TENHANG ='Kem dưỡng Ohui'
delete FROM MAHANG from MAHANG where TENHANG ='Kem dưỡng Ohui'