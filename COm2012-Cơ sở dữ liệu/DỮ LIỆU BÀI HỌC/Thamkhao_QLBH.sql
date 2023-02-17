CREATE DATABASE QLBH
GO
-----------------------------------------------------
-----------------------------------------------------
USE QLBH
GO
---------------------------------------------
-- KHACHANG
CREATE TABLE KHACHHANG(
 MAKH char(4) not null, 
 HOTEN varchar(40),
 DCHI varchar(50),
 SODT varchar(20),
 NGSINH smalldatetime,
 NGDK smalldatetime,
 DOANHSO money,
 constraint pk_kh primary key(MAKH)
)
---------------------------------------------
-- NHANVIEN
CREATE TABLE NHANVIEN(
 MANV char(4) not null, 
 HOTEN varchar(40),
 SODT varchar(20),
 NGVL smalldatetime 
 constraint pk_nv primary key(MANV)
)
---------------------------------------------
-- SANPHAM
CREATE TABLE SANPHAM(
 MASP char(4) not null,
 TENSP varchar(40),
 DVT varchar(20),
 NUOCSX varchar(40),
 GIA money,
 constraint pk_sp primary key(MASP) 
)
---------------------------------------------
-- HOADON
CREATE TABLE HOADON(
 SOHD int not null,
 NGHD smalldatetime,
 MAKH char(4),
 MANV char(4),
 TRIGIA money,
 constraint pk_hd primary key(SOHD)
)
---------------------------------------------
-- CTHD
CREATE TABLE CTHD(
 SOHD int,
 MASP char(4),
 SL int,
 constraint pk_cthd primary key(SOHD,MASP)
)
 
-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON DROP CONSTRAINT FK01_HD
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
ALTER TABLE HOADON DROP CONSTRAINT FK02_HD
-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD DROP CONSTRAINT FK01_CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
ALTER TABLE CTHD DROP CONSTRAINT FK02_CTHD
-----------------------------------------------------
-----------------------------------------------------
set dateformat dmy
-------------------------------
-- KHACHHANG
insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)
 
-------------------------------
-- NHANVIEN
insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')
 
-------------------------------
-- SANPHAM
insert into sanpham values('BC01','But chi','cay','Singapore',3000)
insert into sanpham values('BC02','But chi','cay','Singapore',5000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000)
insert into sanpham values('ST09','But long','cay','Viet Nam',5000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000)
 
-------------------------------
-- HOADON
insert into hoadon values(1001,'23/07/2006','KH01','NV01',320000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',840000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',100000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',180000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',3800000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',2430000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',510000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',440000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',200000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',250000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',5000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',3150000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',910000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',12500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',35000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',30000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',70000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',7000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000)
 
-------------------------------
-- CTHD
insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)

SELECT * FROM KHACHHANG
SELECT * FROM NHANVIEN
SELECT * FROM SANPHAM
SELECT * FROM HOADON
SELECT * FROM CTHD;




-- 1. In ra danh sách các sản phẩm chỉ lấy (MASP,TENSP) do “Trung Quoc” sản xuất.
   SELECT MASP,TENSP FROM dbo.SANPHAM
   WHERE NUOCSX = 'Trung Quoc';

-- 2. In ra danh sách các sản phẩm chỉ lấy (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”
    SELECT MASP,TENSP FROM dbo.SANPHAM
	WHERE DVT = 'cay' OR DVT = 'quyen';

-- 3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
     SELECT MASP,TENSP FROM dbo.SANPHAM
	 WHERE MASP LIKE 'B_01';

-- 4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
     SELECT MASP,TENSP FROM dbo.SANPHAM
	 WHERE NUOCSX = 'Trung Quoc' AND GIA BETWEEN 30000 AND 40000;

-- 5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Viet Nam” sản xuất có giá từ 30.000 đến 40.000.
      SELECT MASP,TENSP FROM dbo.SANPHAM
	  WHERE (NUOCSX = 'Trung Quoc' OR NUOCSX = 'Viet Nam')
	  AND GIA BETWEEN 30000 AND 40000;

-- 6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
      SELECT SOHD,TRIGIA FROM dbo.HOADON
	  WHERE NGHD = '1/1/2007' OR NGHD = '2/1/2007'

-- 7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
      SELECT * FROM dbo.HOADON
	  WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
	  ORDER BY NGHD ASC , TRIGIA DESC;

-- 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
      SELECT HOADON.MAKH, HOTEN FROM dbo.KHACHHANG JOIN dbo.HOADON ON HOADON.MAKH = KHACHHANG.MAKH
	  WHERE NGHD = '1/1/2007';
	

-- 9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
      SELECT SOHD,TRIGIA FROM dbo.HOADON JOIN dbo.NHANVIEN ON NHANVIEN.MANV = HOADON.MANV
	  WHERE HOTEN = 'Nguyen Van B' AND NGHD = '28/10/2006';

-- 10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
      SELECT CTHD.MASP,TENSP FROM dbo.SANPHAM JOIN dbo.CTHD ON CTHD.MASP = SANPHAM.MASP
	  JOIN dbo.HOADON ON HOADON.SOHD = CTHD.SOHD JOIN dbo.KHACHHANG ON KHACHHANG.MAKH = HOADON.MAKH
	  WHERE MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006
	  AND HOTEN = 'Nguyen Van A';

-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
      SELECT SOHD FROM dbo.CTHD 
	  WHERE MASP = 'BB01' OR MASP ='BB02';

-- 12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
      SELECT DISTINCT SOHD FROM dbo.CTHD
	  WHERE (MASP = 'BB01' OR MASP = 'BB02')
	  AND SL BETWEEN 10 AND 20;

-- 13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
	  SELECT SOHD FROM CTHD A
      WHERE A.MASP = 'BB01' AND SL BETWEEN 10 AND 20
      AND EXISTS(SELECT * FROM CTHD B
      WHERE B.MASP = 'BB02' AND SL BETWEEN 10 AND 20
      AND A.SOHD = B.SOHD);

-- 14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất và được bán ra trong ngày 1/1/2007.
       SELECT CTHD.MASP,TENSP FROM dbo.SANPHAM JOIN dbo.CTHD ON CTHD.MASP = SANPHAM.MASP JOIN dbo.HOADON ON HOADON.SOHD = CTHD.SOHD
	   WHERE NUOCSX = 'Trung Quoc' AND NGHD = '1/1/2007';

-- 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
       SELECT MASP,TENSP FROM dbo.SANPHAM 
	   WHERE MASP NOT IN ( SELECT CTHD.MASP FROM dbo.CTHD JOIN dbo.HOADON ON HOADON.SOHD = CTHD.SOHD
	   WHERE SL >= 1);

-- 16. IN ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
       SELECT MASP,TENSP FROM dbo.SANPHAM 
	   WHERE MASP NOT IN ( SELECT CTHD.MASP FROM dbo.CTHD JOIN dbo.HOADON ON HOADON.SOHD = CTHD.SOHD
	   WHERE YEAR(NGHD) = 2006);

-- 17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
       SELECT MASP,TENSP FROM dbo.SANPHAM 
	   WHERE NUOCSX = 'Trung Quoc' AND MASP NOT IN ( SELECT MASP FROM dbo.CTHD JOIN dbo.HOADON ON HOADON.SOHD = CTHD.SOHD
	   WHERE YEAR(NGHD) = 2006);

-- 18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
       SELECT SOHD FROM HOADON 
	   WHERE NOT EXISTS ( SELECT * FROM SANPHAM WHERE NUOCSX= 'Singapore' AND MASP NOT IN
       ( SELECT masp FROM CTHD WHERE SOHD = HOADON.SOHD and CTHD.MASP = SANPHAM.MASP ));

-- 19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
       SELECT * FROM dbo.HOADON
	   WHERE YEAR(NGHD) = 2006 AND NOT EXISTS ( SELECT * FROM dbo.SANPHAM WHERE NUOCSX = 'Singapore' AND MASP NOT IN
	   ( SELECT MASP FROM dbo.CTHD WHERE SOHD= SOHD));

-- 20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
       SELECT COUNT(SOHD) FROM dbo.HOADON 
	   WHERE MAKH IS NULL ;

-- 21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
       SELECT COUNT(DISTINCT CTHD.MASP) FROM dbo.HOADON JOIN dbo.CTHD ON CTHD.SOHD = HOADON.SOHD
	   WHERE YEAR(NGHD) = 2006;

-- 22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
       SELECT MIN(TRIGIA) AS 'thấp nhất', MAX(TRIGIA) AS 'cao nhất' FROM dbo.HOADON; 

-- 23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
       SELECT AVG(TRIGIA) AS 'trị giá TB' FROM dbo.HOADON
	   WHERE YEAR(NGHD) = 2006;

-- 24. Tính doanh thu bán hàng trong năm 2006.
       SELECT SUM(DOANHSO) AS 'doanh thu' 
	   FROM dbo.HOADON JOIN dbo.KHACHHANG ON KHACHHANG.MAKH = HOADON.MAKH
	   WHERE YEAR(NGHD) = '2006';

-- 25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
	   SELECT SOHD FROM dbo.HOADON
	   WHERE TRIGIA IN ( SELECT MAX(TRIGIA) FROM dbo.HOADON WHERE YEAR(NGHD) = 2006 );

-- 26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
       SELECT HOTEN FROM dbo.KHACHHANG JOIN dbo.HOADON ON HOADON.MAKH = KHACHHANG.MAKH
	   WHERE TRIGIA IN ( SELECT MAX(TRIGIA) FROM dbo.HOADON WHERE YEAR(NGHD) = 2006);

-- 27. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
       SELECT TOP(3) MAKH,HOTEN FROM dbo.KHACHHANG
	   ORDER BY DOANHSO DESC;

-- 28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
       SELECT MASP,TENSP FROM dbo.SANPHAM
	   WHERE GIA IN ( SELECT DISTINCT TOP(3) GIA FROM dbo.SANPHAM ORDER BY GIA DESC);

-- 29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
       SELECT MASP,TENSP FROM dbo.SANPHAM 
	   WHERE NUOCSX = 'Thai Lan' AND GIA IN ( SELECT DISTINCT TOP(3) GIA FROM dbo.SANPHAM ORDER BY GIA DESC);

-- 30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất 
--(của sản phẩm do “Trung Quoc” sản xuất).
      SELECT TENSP,MASP FROM dbo.SANPHAM
	  WHERE NUOCSX = 'Trung Quoc' 
	  AND GIA IN ( SELECT DISTINCT TOP(3) GIA FROM dbo.SANPHAM WHERE NUOCSX = 'Trung Quoc' ORDER BY GIA DESC);

-- 31. * In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
      SELECT TOP 3  RANK() OVER (order by DOANHSO DESC) ThuHang,* FROM dbo.KHACHHANG
	  ORDER BY DOANHSO DESC;

-- 32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
      SELECT COUNT(MASP) FROM dbo.SANPHAM
	  WHERE NUOCSX = 'Trung Quoc';

-- 33. Tính tổng số sản phẩm của từng nước sản xuất.
      SELECT NUOCSX, COUNT(MASP) AS 'tổng sp' FROM dbo.SANPHAM
	  GROUP BY NUOCSX;

-- 34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
       SELECT NUOCSX, MAX(GIA) AS 'giá bán max', MIN(GIA) AS 'giá bán min', AVG(GIA) AS 'trung bình'
	   FROM dbo.SANPHAM
	   GROUP BY NUOCSX;

-- 35. Tính doanh thu bán hàng mỗi ngày.
       SELECT NGHD, SUM(TRIGIA) 'doanh thu' FROM dbo.HOADON
	   GROUP BY NGHD;

-- 36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
      SELECT MASP, SUM(SL) 'tổng' FROM dbo.HOADON JOIN dbo.CTHD ON CTHD.SOHD = HOADON.SOHD
	  WHERE MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006
	  GROUP BY MASP;

-- 37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
       SELECT MONTH(NGHD) thang , SUM(TRIGIA) 'doanh thu' FROM dbo.HOADON
	   WHERE YEAR(NGHD) = 2006
	   GROUP BY MONTH(NGHD);

-- 38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
       SELECT SOHD, COUNT(MASP) FROM dbo.CTHD
	   GROUP BY SOHD
	   HAVING COUNT(MASP) >=4;

-- 39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
       SELECT SOHD, COUNT(CTHD.MASP) FROM dbo.CTHD JOIN dbo.SANPHAM ON SANPHAM.MASP = CTHD.MASP
	   WHERE NUOCSX = 'Viet Nam'
	   GROUP BY SOHD
	   HAVING COUNT(CTHD.MASP) = 3;

-- 40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
       SELECT TOP 1 HOADON.MAKH, HOTEN
	   FROM dbo.KHACHHANG JOIN dbo.HOADON ON HOADON.MAKH = KHACHHANG.MAKH 
	   WHERE HOADON.MAKH IS NOT NULL
	   GROUP BY HOADON.MAKH,HOTEN
	   ORDER BY COUNT(SOHD) DESC;

-- 41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
        SELECT MONTH(NGHD) thang FROM dbo.HOADON 
		WHERE YEAR(NGHD)=2006
		GROUP BY MONTH(NGHD)
		HAVING SUM(TRIGIA) >= ALL (SELECT SUM(TRIGIA) FROM dbo.HOADON WHERE YEAR(NGHD)=2006 GROUP BY MONTH(NGHD));

-- 42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
        SELECT TOP 1 CTHD.MASP, TENSP FROM dbo.SANPHAM JOIN dbo.CTHD ON CTHD.MASP = SANPHAM.MASP
		JOIN dbo.HOADON ON HOADON.SOHD = CTHD.SOHD
		WHERE YEAR(NGHD) = 2006
		GROUP BY CTHD.MASP, TENSP
		ORDER BY SUM(SL) ASC;

-- 43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
       SELECT NUOCSX,MASP,TENSP FROM dbo.SANPHAM SP
	   WHERE SP.GIA IN ( SELECT MAX(SP1.GIA) FROM dbo.SANPHAM SP1 WHERE SP1.NUOCSX=SP.NUOCSX);

-- 44. Tìm nước sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
       SELECT NUOCSX FROM dbo.SANPHAM 
	   GROUP BY NUOCSX
	   HAVING COUNT( DISTINCT GIA) >=3;

-- 45. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
  SELECT TOP 10* FROM dbo.KHACHHANG 
  ORDER BY DOANHSO DESC;

  SELECT hd1.MAKH, DS1.HOTEN
FROM 
(
    SELECT TOP 10 kh1.MAKH, KH1.HOTEN
    FROM KHACHHANG kh1
    WHERE kh1.MAKH is not null
    ORDER BY kh1.DOANHSO DESC
) DS1, HOADON hd1
WHERE DS1.MAKH = hd1.MAKH
GROUP BY hd1.MAKH, DS1.HOTEN

HAVING COUNT(HD1.SOHD)>=
ALL(
 
    SELECT count(hd.SOHD)
    FROM 
    (
        SELECT TOP 10 kh.MAKH
        FROM KHACHHANG kh
        WHERE kh.MAKH is not null
        ORDER BY kh.DOANHSO DESC
    ) DS, HOADON hd
    WHERE DS.MAKH = hd.MAKH
    GROUP BY hd.MAKH 
)