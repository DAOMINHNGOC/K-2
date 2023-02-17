/*
Nội dung:
1. Viết câu truy vấn hiển thị tất cả các thông tin các phòng ban trong công ty

2. Viết câu truy vấn hiển thị thông tin các cột: tên dự án, ngày bắt đầu và ngày kết thúc dự án trong bảng DU_AN

3. Hiển thị họ, tên nhân viên có lương trên 800$

4. Hiển thị họ, tên nhân viên có lương nằm trong khoảng 800$ đến 1000$

5. Hiển thị tất cả các thông tin dự án có ngày bắt đầu từ ngày 01/01/2017

6. Hiển thị thông tin của các phòng ban có chứa chuỗi ‘Sản xuất’

7. Hiển thị thông tin họ, tên, lương của nhân viên có lương thấp hơn 800$ và mã phòng ban là ‘PB002’

8. Hiển thị mức lương cao nhất trong bảng nhân viên

9. Hiển thị mức lương trung bình của các nhân viên thuộc mã phòng ‘PB001’

10. Hiển thị số lượng dự án có ngày kết thúc trước ngày 31/12/2016

11. Tính lương trung bình của từng Phòng Ban

12. Đếm số lượng nhân viên của từng Phòng

13. Tính tổng lương công ty phải trả cho mỗi phòng ban, chỉ hiển thị nhóm nào có tổng >10000$

14. Tính tổng lương công ty phải trả cho mỗi phòng ban, chỉ nhóm hàng nào có cột lương >700$, chỉ hiển thị nhóm nào có tổng >10000$

15. Hiển thị danh sách các nhân viên có trong bảng NHAN_VIEN theo thứ tự tăng dần của trường TEN_NV

16. Hiển thị tên dự án, ngày bắt đầu, ngày kết thúc của bảng DUAN theo thứ giảm dần của trường ngày kết thúc

17. Viết câu truy vấn hiển thị mã phòng ban (PHG) và lương trung bình tương ứng từng phòng,
		chỉ lấy các hàng có mức lương trên 500$, chỉ hiển thị các phòng có lương trung bình >700$
		và sắp xếp theo thứ tự giảm dần theo cột PHG

*/
--Tạo database
-- T?O CSDL Qu?n lí nhân viên
CREATE DATABASE QuanLyNhanVien111111
GO
USE QuanLyNhanVien111111
GO	
--T?o b?ng phòng ban
CREATE TABLE PHONG_BAN
(
	MA_PB CHAR(5) PRIMARY KEY, -- KHoá chính
	TEN_PB VARCHAR(50),
	MA_TRUONGPHONG CHAR(5),
);
--ALTER TABLE PHONG_BAN ADD MO_Ta NVARCHAR(50);
--T?o b?ng nhân viên
CREATE TABLE NHAN_VIEN
(
	ID_NHANVIEN CHAR(5) PRIMARY KEY, -- Khoá chính
	HO_NV NVARCHAR(20),
	TEN_NV NVARCHAR(20),
	NAM_SINH CHAR(5),
	DIA_CHI NVARCHAR(50),
	GIOI_TINH CHAR(5),
	LUONG INT,
	PHG CHAR(5),
);


--T?o b?ng qu?n lí d? án
CREATE TABLE QUANLI_DUAN
(
	MA_DUAN CHAR(5) ,
	MA_NHANVIEN CHAR(5),
	NGAY_BATDAU DATE,
	NGAY_KETTHUC DATE,
	SO_GIO CHAR(5),
	VAI_TRO CHAR(50),
	PRIMARY KEY (MA_DUAN, MA_NHANVIEN) -- Khoá chính
);

--T?o b?ng d? án
CREATE TABLE DU_AN
(
	MA_DUAN CHAR(5) PRIMARY KEY, -- Khoá chính
	TEN_DUAN VARCHAR(50),
	NGAY_BATDAU DATE,
	NGAY_KETTHUC DATE,
);

--Nhập dữ liệu phòng ban
INSERT INTO PHONG_BAN VALUES ( 'P001', N'THINHVUONG','T001');
INSERT INTO PHONG_BAN VALUES ( 'P002', N'VINHHANG','T002');
INSERT INTO PHONG_BAN VALUES ( 'P003', N'NHUY','T003');
INSERT INTO PHONG_BAN VALUES ( 'P004', N'CATTAI','T004');
INSERT INTO PHONG_BAN VALUES ( 'P005', N'THANGLONG','T005');
--Nhập dữ liệu nhân viên
INSERT INTO NHAN_VIEN VALUES ( 'N001', N'TRẦN HOÀNG',N'PHI','2003',N'ĐỐNG ĐA','NAM',1500,'P001');
INSERT INTO NHAN_VIEN VALUES ( 'N008', N'TRẦN VĂN',N'PHONG','2003',N'ĐỐNG ĐA','NAM',1100,'P001');
INSERT INTO NHAN_VIEN VALUES ( 'N002', N'TRẦN VĂN',N'CHÍNH','2003',N'TỪ LIÊM','NAM',700,'P002');
INSERT INTO NHAN_VIEN VALUES ( 'N007', N'TRẦN THỊ',N'HẰNG','2003',N'ĐỐNG ĐA','NỮ',1200,'P002');
INSERT INTO NHAN_VIEN VALUES ( 'N003', N'NGUYỄN BÌNH',N'DƯƠNG','2003',N'NAM TỪ LIÊM','NAM',600,'P003');
INSERT INTO NHAN_VIEN VALUES ( 'N006', N'NGUYỄN VĂN',N'HẢI','2003',N'TỪ LIÊM','NAM',1000,'P003');
INSERT INTO NHAN_VIEN VALUES ( 'N004', N'TRẦN VĂN',N'CHƯƠNG','2003',N'CẦU GIẤY','NAM',1000,'P004');
INSERT INTO NHAN_VIEN VALUES ( 'N009', N'TRẦN THỊ',N'YẾN','2003',N'CẦU GIẤY','NỮ',1300,'P004');
INSERT INTO NHAN_VIEN VALUES ( 'N005', N'CHU VĂN',N'HIỆP','2003',N'CẦU DIỄN','NAM',1200,'P005');
INSERT INTO NHAN_VIEN VALUES ( 'N0010', N'NGUYỄN VĂN',N'TRUNG','2003',N'HAI BÀ TRƯNG','NAM',800,'P005');
--Nhập dữ liệu bảng quản lý dự án
INSERT INTO QUANLI_DUAN VALUES ( 'D001', 'N001','01-01-2017','2-25-2017','72','LEADER');
INSERT INTO QUANLI_DUAN VALUES ( 'D001', 'N008','01-01-2017','2-25-2017','72','DEV');
INSERT INTO QUANLI_DUAN VALUES ( 'D002', 'N002','2-22-2022','2-23-2022','23','DEV');
INSERT INTO QUANLI_DUAN VALUES ( 'D002', 'N007','2-22-2022','2-23-2022','23','LEADER');
INSERT INTO QUANLI_DUAN VALUES ( 'D003', 'N003','2-15-2022','2-20-2022','120','ACCOUNTANT');
INSERT INTO QUANLI_DUAN VALUES ( 'D003', 'N006','2-15-2022','2-20-2022','120','LEADER');
INSERT INTO QUANLI_DUAN VALUES ( 'D004', 'N004','2-18-2022','2-20-2022','48','PERSONNAL');
INSERT INTO QUANLI_DUAN VALUES ( 'D004', 'N009','2-18-2022','2-20-2022','48','LEADER');
INSERT INTO QUANLI_DUAN VALUES ( 'D005', 'N005','2-21-2022','2-24-2022','72','WORKER');
INSERT INTO QUANLI_DUAN VALUES ( 'D005', 'N0010','2-21-2022','2-24-2022','72','LEARDER');
--Nhập dữ liệu bảng dự án
INSERT INTO DU_AN VALUES ( 'D001', N'PROJECT A','01-01-2017','2-25-2017');
INSERT INTO DU_AN VALUES ( 'D002', N'PROJECT B','2-22-2022','2-23-2022');
INSERT INTO DU_AN VALUES ( 'D003', N'PROJECT C','2-15-2022','2-20-2022');
INSERT INTO DU_AN VALUES ( 'D004', N'PROJECT D','2-18-2022','2-20-2022');
INSERT INTO DU_AN VALUES ( 'D005', N'PROJECT X','2-21-2022','2-24-2022');

--Ràng bu?c khoá chính và khoá ngo?i c?a b?ng NHAN_VIEN và PHONG_BAN
ALTER TABLE NHAN_VIEN ADD CONSTRAINT NV_PK FOREIGN KEY(PHG) REFERENCES PHONG_BAN(MA_PB);
--Ràng bu?c khoá chính và khoá ngo?i c?a b?ng NHAN_VIEN và QUANLI_DUAN
ALTER TABLE QUANLI_DUAN ADD CONSTRAINT QLDA_PRIMARY FOREIGN KEY(MA_NHANVIEN) REFERENCES NHAN_VIEN(ID_NHANVIEN);
--Ràng bu?c khoá chính và khoá ngo?i c?a b?ng DU_AN và QUANLI_DUAN
ALTER TABLE QUANLI_DUAN ADD CONSTRAINT QLDA_PK FOREIGN KEY(MA_DUAN) REFERENCES DU_AN(MA_DUAN);
--Thêm c?t MO_Ta vào b?ng PHONG_BAN

--Thêm ràng bu?c vào b?ng QUANLI_DUAN yêu c?u c?t s? gi? ch? ch?a giá tr? l?n h?n 0
ALTER TABLE QUANLI_DUAN ADD CONSTRAINT SO_GIO CHECK(SO_GIO > 20);
--Thêm thuộc tính luong vào bảng NHAN_VIEN 
-- Viết câu truy vấn hiển thị tất cả các thông tin các phòng ban trong công ty
SELECT *FROM dbo.PHONG_BAN;
-- Viết câu truy vấn hiển thị thông tin các cột: tên dự án, ngày bắt đầu và ngày kết thúc dự án trong bảng DU_AN
SELECT  TEN_DUAN,NGAY_BATDAU,NGAY_KETTHUC FROM dbo.DU_AN;
-- Hiển thị họ, tên nhân viên có lương trên 800$
SELECT HO_NV +' '+TEN_NV AS 'HỌ VÀ TÊN'FROM dbo.NHAN_VIEN WHERE LUONG>800;
--Hiển thị họ, tên nhân viên có lương nằm trong khoảng 800$ đến 1000$
SELECT HO_NV +' '+TEN_NV AS 'HỌ VÀ TÊN'FROM dbo.NHAN_VIEN WHERE LUONG>=800 AND LUONG<=1000;
--Hiển thị tất cả các thông tin dự án có ngày bắt đầu từ ngày 01/01/2017
SELECT * FROM dbo.DU_AN WHERE NGAY_BATDAU = '01-01-2017';
--Hiển thị thông tin họ, tên, lương của nhân viên có lương thấp hơn 800$ và mã phòng ban là ‘P002’
SELECT HO_NV+ ' ' +TEN_NV AS 'HỌ VÀ TÊN',LUONG FROM dbo.NHAN_VIEN WHERE LUONG<800 AND PHG='P002';
-- Hiển thị mức lương cao nhất trong bảng nhân viên
SELECT   MAX(LUONG) AS 'LƯƠNG CAO NHẤT' FROM dbo.NHAN_VIEN;
-- Hiển thị mức lương trung bình của các nhân viên thuộc mã phòng ‘P001’
SELECT AVG(LUONG) AS 'LƯƠNG TRUNG BÌNH(P001)' FROM dbo.NHAN_VIEN WHERE PHG='P001';
-- Hiển thị số lượng dự án có ngày kết thúc trước ngày 31/12/2022
SELECT COUNT(MA_DUAN) AS 'SỐ LƯỢNG DỰ ÁN CÓ NGÀY KẾT THÚC TRƯỚC NGÀY 31/12/2022' FROM dbo.DU_AN WHERE NGAY_KETTHUC <= '12-31-2022';
-- Tính lương trung bình của từng Phòng Ban
SELECT PHG AS 'PHG',AVG(LUONG) AS 'LƯƠNG TRUNG BÌNH' FROM dbo.NHAN_VIEN GROUP BY PHG;
-- Đếm số lượng nhân viên của từng Phòng
SELECT PHG,COUNT(ID_NHANVIEN) AS 'SỐ LƯỢNG NHÂN VIÊN' FROM dbo.NHAN_VIEN GROUP BY PHG;
-- Tính tổng lương công ty phải trả cho mỗi phòng ban, chỉ hiển thị nhóm nào có tổng >1000$
SELECT PHG,SUM(LUONG) AS 'TỔNG LƯƠNG' FROM dbo.NHAN_VIEN GROUP BY PHG HAVING SUM(LUONG)>1000;
-- Tính tổng lương công ty phải trả cho mỗi phòng ban, chỉ nhóm hàng nào có cột lương >700$, chỉ hiển thị nhóm nào có tổng >1000$
SELECT PHG,SUM(LUONG) AS 'TỔNG LƯƠNG' FROM dbo.NHAN_VIEN WHERE LUONG>700 GROUP BY PHG HAVING SUM(LUONG)>1000;
-- Hiển thị danh sách các nhân viên có trong bảng NHAN_VIEN theo thứ tự tăng dần của trường TEN_NV
SELECT  HO_NV+ ' '+ TEN_NV AS 'HỌ VÀ TÊN(GIẢM DẦN)' FROM dbo.NHAN_VIEN ORDER BY TEN_NV ASC;
-- Hiển thị tên dự án, ngày bắt đầu, ngày kết thúc của bảng DUAN theo thứ giảm dần của trường ngày kết thúc
SELECT TEN_DUAN,NGAY_BATDAU, NGAY_KETTHUC FROM dbo.DU_AN ORDER BY NGAY_KETTHUC DESC;
-- Viết câu truy vấn hiển thị mã phòng ban (PHG) và lương trung bình tương ứng từng phòng,
--		chỉ lấy các hàng có mức lương trên 700$, chỉ hiển thị các phòng có lương trung bình >1000$
--		và sắp xếp theo thứ tự giảm dần theo cột PHG
SELECT PHG,AVG(LUONG) AS 'LƯƠNG TRUNG BÌNH(>1000)' FROM dbo.NHAN_VIEN WHERE LUONG >700 GROUP BY PHG HAVING AVG(LUONG)>1000 ORDER BY PHG DESC