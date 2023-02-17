/*
--1. Các quan hệ của CSDL quản lý bán hàng
	Cho cơ sở dữ liệu quản lý bán hàng gồm có các quan hệ sau:

	KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)

	--Diễn giải: Quan hệ khách hàng sẽ lưu trữ thông tin của khách hàng thành viên gồm có các thuộc tính: mã khách hàng, họ tên, địa chỉ, số điện thoại, ngày sinh, ngày đăng ký và doanh số (tổng trị giá các hóa đơn của khách hàng thành viên này).

	NHANVIEN (MANV,HOTEN, NGVL, SODT)

	--Diễn giải: Mỗi nhân viên bán hàng cần ghi nhận họ tên, ngày vào làm, điện thọai liên lạc, mỗi nhân viên phân biệt với nhau bằng mã nhân viên.

	SANPHAM (MASP,TENSP, DVT, NUOCSX, GIA)

	--Diễn giải: Mỗi sản phẩm có một mã số, một tên gọi, đơn vị tính, nước sản xuất và một giá bán.

	HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)

	--Diễn giải: Khi mua hàng, mỗi khách hàng sẽ nhận một hóa đơn tính tiền, trong đó sẽ có số hóa đơn, ngày mua, nhân viên nào bán hàng, trị giá của hóa đơn là bao nhiêu và mã số của khách hàng nếu là khách hàng thành viên.

	CTHD (SOHD,MASP,SL)

	--Diễn giải: Diễn giải chi tiết trong mỗi hóa đơn gồm có những sản phẩm gì với số lượng là bao nhiêu.

----------------------------------------------------------------
--2. Bảng thuộc tính của CSDL quản lý bán hàng

			Quan hệ			Thuộc tính		Diễn giải										Kiểu dữ liệu
			KHACHHANG		MAKH			Mã khách hàng									char(4)
							HOTEN			Họ tên											varchar(40)
							DCHI			Địa chỉ											varchar(50)
							SODT			Số điện thọai									varchar(20)
							NGSINH			Ngày sinh										smalldatetime
							NGDK			Ngày đăng ký thành viên							smalldatetime
							DOANHSO			Tổng trị giá các hóa đơn khách hàng đã mua		money
				
			NHANVIEN		MANV			Mã nhân viên									char(4)
							HOTEN			Họ tên											varchar(40)
							SODT			Số điện thoại									varchar(20)
							NGVL			Ngày vào làm									smalldatetime
				
			SANPHAM			MASP			Mã sản phẩm										char(4)
							TENSP			Tên sản phẩm									varchar(40)
							DVT				Đơn vị tính										varchar(20)
							NUOCSX			Nước sản xuất									varchar(40)
							GIA				Giá bán											money
				
			HOADON			SOHD			Số hóa đơn										int
							NGHD			Ngày mua hàng									smalldatetime
							MAKH			Mã khách hàng nào mua							char(4)
							MANV			Nhân viên bán hàng								char(4)
							TRIGIA			Trị giá hóa đơn									money
				
			CTHD			SOHD			Số hóa đơn										int
							MASP			Mã sản phẩm										char(4)
							SL				Số lượng										int

----------------------------------------------------------------

--Các bạn chạy SQL sau để thêm vào các dữ liệu ban đầu
*/
----------------------------------------------------------------
----------------------------------------------------------------

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
----------------------------------------------------------------
----------------------------------------------------------------
SELECT * FROM KHACHHANG
SELECT * FROM NHANVIEN
SELECT * FROM SANPHAM
SELECT * FROM HOADON
SELECT * FROM CTHD

=========================================================================================

--Câu 1: In ra danh sách các sản phẩm chỉ lấy (MASP,TENSP) do “Trung Quoc” sản xuất.
			SELECT MASP,TENSP, NUOCSX
			FROM SANPHAM
			WHERE NUOCSX = 'TRUNG QUOC'

--Câu 2: In ra danh sách các sản phẩm chỉ lấy (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”
		--HD: Có thể so sánh bằng trực tiếp tương tự như câu trên bằng cách tình những dòng thỏa DVT = ‘CAY’ OR DVT = ‘QUYEN’

			SELECT MASP,TENSP, DVT
			FROM SANPHAM
			WHERE DVT = 'CAY' OR DVT = 'QUYEN'
			
		--Hoặc
		
			SELECT MASP,TENSP
			FROM SANPHAM
			WHERE DVT IN ('CAY','QUYEN')

--Câu 3: In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.

			SELECT MASP, TENSP
			FROM SANPHAM
			WHERE MASP LIKE 'B%01'

-- Câu 4: In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.

			SELECT MASP,TENSP,NUOCSX,GIA
			FROM SANPHAM
			WHERE NUOCSX = 'TRUNG QUOC' 
				AND GIA BETWEEN 30000 AND 40000

		    
--Câu 5: In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Viet Nam” sản xuất có giá từ 30.000 đến 40.000.

			SELECT MASP,TENSP, NUOCSX,GIA
			FROM SANPHAM
			WHERE (NUOCSX = 'TRUNG QUOC' OR NUOCSX = 'VIET NAM') AND GIA>=30000 AND GIA<=40000
			
		--Hoặc
		
			SELECT MASP,TENSP, NUOCSX,GIA
			FROM SANPHAM
			WHERE NUOCSX in ('VIET NAM', 'TRUNG QUOC') AND GIA BETWEEN 30000 AND 40000

-- Câu 6: In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.

			SELECT SOHD,TRIGIA
			FROM HOADON
			WHERE NGHD = '1/1/2007' OR NGHD = '2/1/2007'
			  
		-- Hoặc

			SELECT SOHD,TRIGIA
			FROM HOADON
			WHERE NGHD in ('1/1/2007','2/1/2007')  

--Câu 7: In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
		--HD: Các bạn lấy tháng và năm bằng hàm Month và Year.
		--Sắp xếp các dòng bằng cách sử dụng ORDER BY (tên thuộc tính) (cách sắp xếp ASC(tăng dần)|DESC(giảm dần))

			SELECT SOHD,NGHD,TRIGIA
			FROM HOADON
			WHERE MONTH(NGHD)=1 AND YEAR(NGHD)=2007
			ORDER BY NGHD ASC, TRIGIA DESC

--Câu 8: In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.

			SELECT KHACHHANG.MAKH,HOTEN
			FROM KHACHHANG, HOADON
			WHERE KHACHHANG.MAKH = HOADON.MAKH and HOADON.NGHD = '1/1/2007'   

		--Hoặc

			SELECT KHACHHANG.MAKH,HOTEN
			FROM KHACHHANG JOIN HOADON ON KHACHHANG.MAKH = HOADON.MAKH
			WHERE NGHD = '1/1/2007' 

--Câu 9: In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.

			SELECT HOADON.SOHD, HOADON.TRIGIA, NHANVIEN.HOTEN
			FROM NHANVIEN, HOADON
			WHERE NHANVIEN.HOTEN = 'Nguyen Van B' AND NHANVIEN.MANV = HOADON.MANV AND HOADON.NGHD = '28/10/2006'

--Câu 10: In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.

			SELECT sp.MASP, sp.TENSP
			FROM KHACHHANG kh, HOADON hd, CTHD ct, SANPHAM sp
			WHERE kh.HOTEN='Nguyen Van A' AND hd.MAKH = kh.MAKH AND 
				year(hd.NGHD)=2006 AND month(hd.NGHD)=10 AND ct.SOHD=hd.SOHD AND sp.MASP=ct.MASP
    
-- Câu 11: Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.

			SELECT distinct hd.SOHD
			FROM HOADON hd, CTHD ct
			WHERE hd.SOHD = ct.SOHD AND ct.MASP IN ('BB01','BB02')

--Câu 12: Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
		--HD: Tuy nhiên lời giải 1 trên khá thừa, vì chỉ hỏi mã hóa đơn,
			--trên thực tế không cần thiết kết bảng HOADON và CTHD trừ khi cần khai thác thêm thông tin của HOADON như vậy có thể sửa tối ưu cho câu này phần sau:


			SELECT distinct hd.SOHD
			FROM HOADON hd, CTHD ct
			WHERE hd.SOHD = ct.SOHD AND ct.MASP IN ('BB01','BB02') AND ct.SL BETWEEN 10 AND 20
			
		--Hoặc

			SELECT distinct ct.SOHD
			FROM CTHD ct
			WHERE ct.MASP IN ('BB01','BB02') AND ct.SL BETWEEN 10 AND 20

--Câu 13: Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.

			SELECT distinct hd.SOHD
			FROM HOADON hd, CTHD ct
			WHERE hd.SOHD = ct.SOHD AND ct.MASP='BB01' AND ct.SL BETWEEN 10 AND 20
			INTERSECT
			SELECT distinct hd.SOHD
			FROM HOADON hd, CTHD ct
			WHERE hd.SOHD = ct.SOHD AND ct.MASP = 'BB02' AND ct.SL BETWEEN 10 AND 20

--Câu 14: In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất và được bán ra trong ngày 1/1/2007.

			SELECT sp.MASP, sp.TENSP
			FROM SANPHAM sp, HOADON hd, CTHD ct
			WHERE sp.NUOCSX='Trung Quoc' AND hd.NGHD='1/1/2007' AND hd.SOHD = ct.SOHD and sp.MASP=ct.MASP

--Câu 15: In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
		--HD: Sử dụng NOT IN và Sử dụng NOT EXISTS

			SELECT sp.MASP,sp.TENSP
			FROM SANPHAM sp
			WHERE sp.MASP NOT IN (SELECT ct.MASP FROM CTHD ct)
			
		--Hoặc

			SELECT sp.MASP,sp.TENSP
			FROM SANPHAM sp
			WHERE not exists (SELECT ct.MASP FROM CTHD ct WHERE sp.MASP=ct.MASP)

-- Câu 16: In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
		--HD: Sử dụng NOT IN, Sử dụng EXISTS và Sử dụng EXCEPT

			SELECT sp.MASP,sp.TENSP
			FROM SANPHAM sp
			WHERE sp.MASP not in ( SELECT ct.MASP FROM HOADON hd, CTHD ct WHERE hd.SOHD = ct.SOHD AND YEAR(hd.NGHD)=2006)

		-- Hoặc
			SELECT sp.MASP,sp.TENSP
			FROM SANPHAM sp
			WHERE not exists ( SELECT ct.MASP FROM CTHD ct, HOADON hd WHERE HD.SOHD=CT.SOHD AND sp.MASP=ct.MASP AND  YEAR(hd.NGHD)=2006)

		-- Hoặc
		
			SELECT MASP, TENSP
			FROM SANPHAM
			EXCEPT 
			SELECT distinct sp.MASP, sp.TENSP
			FROM CTHD ct, HOADON hd, SANPHAM sp
			WHERE ct.SOHD = hd.SOHD AND ct.MASP = sp.MASP AND year(hd.NGHD)=2006
		
		
-- Câu 17:  In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.

			SELECT MASP, TENSP
			FROM SANPHAM
			WHERE NUOCSX='Trung Quoc'
			EXCEPT
			SELECT distinct sp.MASP, sp.TENSP
			FROM HOADON hd, CTHD ct, SANPHAM sp
			WHERE year(hd.NGHD)=2006 and hd.SOHD=ct.SOHD and sp.MASP = ct.MASP

-- Câu 18: Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.

			SELECT SOHD
			FROM HOADON
			WHERE
			NOT EXISTS
			( 
				SELECT *
				FROM SANPHAM
				WHERE NUOCSX= 'Singapore' AND MASP NOT IN
				( 
					SELECT masp
					FROM CTHD
					WHERE SOHD = HOADON.SOHD and CTHD.MASP = SANPHAM.MASP
				)
			);

--Câu 19: Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
				SELECT SOHD
				FROM HOADON
				WHERE year(NGHD)=2006
				and NOT EXISTS
				(
					SELECT *
					FROM SANPHAM
					WHERE NUOCSX = 'Singapore' and MASP NOT IN
					(
						SELECT masp 
						FROM CTHD 
						WHERE SOHD = HOADON.SOHD
					)
				);

--Câu 20: Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?

				SELECT count(SOHD) as SL
				FROM HOADON
				WHERE MAKH is null

--Câu 21: Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.

			SELECT count(distinct ct.MASP)
			FROM HOADON hd, CTHD ct
			WHERE YEAR(hd.NGHD) = 2006 and ct.SOHD=hd.SOHD

--Câu 22: Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?

		SELECT MAX(HOADON.TRIGIA), MIN(HOADON.TRIGIA)
		FROM HOADON

--Câu 23: Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?

		SELECT AVG(hd.TRIGIA)
		FROM HOADON hd
		WHERE YEAR(hd.NGHD) = 2006

--Câu 24: Tính doanh thu bán hàng trong năm 2006.

		SELECT sum(hd.TRIGIA)
		FROM HOADON hd
		WHERE YEAR(hd.NGHD) = 2006

--Câu 25: Tìm số hóa đơn có trị giá cao nhất trong năm 2006.

		SELECT SOHD
		FROM HOADON
		WHERE TRIGIA IN (
			SELECT max(hd.TRIGIA)
			FROM HOADON hd
			WHERE YEAR(hd.NGHD) = 2006
			)

--Câu 26: Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.

		SELECT kh.HOTEN
		FROM KHACHHANG kh, HOADON
		WHERE HOADON.MAKH=KH.MAKH AND HOADON.TRIGIA in 
		(
			SELECT MAX(hd.TRIGIA)
			FROM HOADON hd
			WHERE year(hd.NGHD)=2006
		)

		--Hoặc

		SELECT	HOTEN
		FROM	KHACHHANG kh, HOADON
		WHERE HOADON.MAKH = kh.MAKH and HOADON.TRIGIA >=ALL ( SELECT max(hd.TRIGIA) FROM HOADON hd WHERE year(hd.NGHD)=2006 )

--Câu 27: In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.

		SELECT top 3 MAKH, HOTEN
		FROM KHACHHANG 
		order by DOANHSO desc

--Câu 28: In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.

		SELECT MASP, TENSP
		FROM SANPHAM
		WHERE GIA IN
		(
			SELECT DISTINCT TOP 3 sp.GIA
			FROM SANPHAM sp
			ORDER BY sp.GIA DESC
		)

--Câu 29: In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).

		SELECT SANPHAM.MASP, SANPHAM.TENSP
		FROM SANPHAM
		WHERE SANPHAM.NUOCSX='Thai Lan' AND SANPHAM.GIA IN
		(
			SELECT DISTINCT TOP 3 sp.GIA
			FROM SANPHAM sp
			ORDER BY sp.GIA DESC
		)

--Câu 30: In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).

		SELECT SANPHAM.MASP, SANPHAM.TENSP
		FROM SANPHAM
		WHERE SANPHAM.NUOCSX='Trung Quoc' AND SANPHAM.GIA IN
		(
			SELECT DISTINCT TOP 3 sp.GIA
			FROM SANPHAM sp
			WHERE sp.NUOCSX = 'Trung Quoc'
			ORDER BY sp.GIA DESC
			)

--Câu 31: In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).

		SELECT TOP 3 RANK() OVER (order by kh.DOANHSO DESC) ThuHang, *
		FROM KHACHHANG kh
		ORDER BY kh.DOANHSO DESC

--Câu 32: Tính tổng số sản phẩm do “Trung Quoc” sản xuất.

		SELECT COUNT(MASP)
		FROM SANPHAM
		WHERE NUOCSX='Trung Quoc'

--Câu 33: Tính tổng số sản phẩm của từng nước sản xuất.

		SELECT NUOCSX, COUNT(MASP)
		FROM SANPHAM
		GROUP BY NUOCSX

--Câu 34: Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.

		SELECT MAX(GIA) CaoNhat, MIN(GIA) ThapNhat, AVG(GIA) TrungBinh
		FROM SANPHAM
		GROUP BY NUOCSX

--Câu 35. Tính doanh thu bán hàng mỗi ngày.

		SELECT NGHD, SUM(TRIGIA) DoanhThu
		FROM HOADON
		GROUP BY NGHD

--Câu 36: Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.

		SELECT ct.MASP, sum(ct.SL)
		FROM CTHD ct, HOADON hd
		WHERE ct.SOHD=hd.SOHD AND month(NGHD)=10 AND year(NGHD)=2006 
		GROUP BY ct.MASP

--Câu 37. Tính doanh thu bán hàng của từng tháng trong năm 2006.

		SELECT month(hd.NGHD) Thang , sum(hd.TRIGIA) Tong
		FROM HOADON hd 
		WHERE year(hd.NGHD)=2006
		GROUP BY month(hd.NGHD)

--Câu 38: Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.

		SELECT *
		FROM HOADON
		WHERE SOHD in
		(
			SELECT HD.SOHD
			FROM (SELECT ct.sohd, COUNT(CT.MASP) SL
				FROM CTHD ct
				GROUP BY CT.SOHD) HD
				WHERE HD.SL>=4
		)

		-- Sử dụng HAVING

		SELECT SOHD, COUNT(MASP)
		FROM CTHD
		GROUP BY SOHD
		HAVING COUNT(MASP)>=4
		
--Câu 39: Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).

		SELECT ct.SOHD, count(CT.MASP)
		FROM CTHD ct, SANPHAM sp
		WHERE ct.MASP = sp.MASP AND sp.NUOCSX='Viet Nam'
		GROUP BY ct.SOHD
		HAVING count(ct.masp)>=3

--Câu 40: Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.

		SELECT TOP 1 HOADON.MAKH, KH.HOTEN
		FROM HOADON, KHACHHANG kh
		WHERE HOADON.MAKH is not null and HOADON.MAKH = KH.MAKH
		GROUP BY HOADON.MAKH, KH.HOTEN
		ORDER BY count(HOADON.MAKH) DESC

		--Cách khác

		select makh, count(SOHD)
		from hoadon
		where makh is not null
		group by makh
		having count(SOHD)=(
		select max(a.slmh)
		from
		(select makh,count(sohd) slmh
		from hoadon
		where makh is not null
		group by makh) a

		-- Cách khác

		select makh, count(sohd)
		from hoadon
		where makh is not null
		group by makh
		having count(sohd) >= all(
		select count(sohd) slmh
		from hoadon
		where makh is not null
		group by makh)

--Câu 41: Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?

		SELECT MONTH(hd2.NGHD)
		FROM HOADON hd2
		WHERE year(hd2.NGHD)=2006
		GROUP BY MONTH(hd2.NGHD)
		HAVING SUM(hd2.TRIGIA)>=ALL
		(
		   SELECT sum(hd.TRIGIA)
		   FROM HOADON hd
		   WHERE year(hd.NGHD) = 2006
		   GROUP BY month(hd.NGHD)
		)

--Câu 42: Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.

			SELECT ct1.MASP, sp.TENSP
			FROM CTHD ct1, HOADON hd1, SANPHAM sp 
			WHERE ct1.SOHD = hd1.SOHD AND year(hd1.NGHD)=2006 and sp.MASP = ct1.MASP
			GROUP BY ct1.MASP, sp.TENSP
			HAVING sum(ct1.SL) <= ALL
			(
				SELECT sum(ct.SL)
				FROM CTHD ct, HOADON hd 
				WHERE ct.SOHD = hd.SOHD AND year(hd.NGHD)=2006
				GROUP BY ct.MASP
			)


--Câu 43: Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.

			SELECT sp1.NUOCSX, sp1.MASP, sp1.TENSP
			FROM SANPHAM sp1, 
				(SELECT sp.NUOCSX, max(sp.GIA) giamax
				FROM SANPHAM sp
				GROUP BY sp.NUOCSX) gia_QG
			WHERE sp1.NUOCSX = gia_QG.NUOCSX and sp1.GIA=gia_QG.giamax

			--Cách khác

			SELECT sp1.NUOCSX, sp1.MASP, sp1.TENSP
			FROM SANPHAM sp1
			WHERE sp1.GIA in
			(
				SELECT max(sp.GIA)
				FROM SANPHAM sp
				WHERE sp1.NUOCSX = sp.NUOCSX
			)

--Câu 44: Tìm nước sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.

			SELECT sp1.NUOCSX
			FROM SANPHAM sp1,
			(
				SELECT sp.NUOCSX, sp.GIA, count(sp.MASP) SL
				FROM SANPHAM sp
				GROUP BY sp.NUOCSX, sp.GIA
			) groupgia

			WHERE groupgia.NUOCSX = SP1.NUOCSX AND groupgia.GIA = sp1.GIA
			group by sp1.NUOCSX
			HAVING count(groupgia.SL)>=3

			-- Hoặc

			SELECT sp.NUOCSX
			FROM SANPHAM sp
			GROUP BY sp.NUOCSX
			HAVING count(distinct sp.GIA)>=3

--Câu 45: Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.

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
