-- TẠO CƠ SỞ DỮ LIỆU QUẢN LÝ BÁN HÀNG
CREATE DATABASE quanLyNhanVien22222222
go 
use quanLyNhanVien22222222
GO
-- TẠO BẢNG PHÒNG BAN
CREATE TABLE PHONGBAN
(
maPB nchar(5),      -- Khóa chính
tenPB nvarchar(50),
maTruongPhong nchar(5),
moTa nvarchar(50),
CONSTRAINT PK_PB PRIMARY KEY(MaPB),	

);
--NHẬP DỮ LIỆU VÀO BẢNG PHÒNG BAN
INSERT INTO PHONGBAN(maPB,tenPB,maTruongPhong,moTa) VALUES(N'A01',N'ĐÀO MINH NGỌC',N'P01',N'VIP'),
                                                     (N'A02',N'ĐÀO THỊ NGỌC',N'P02',N'VIPA'),
													 (N'A03',N'ĐÀO TÚ NGỌC',N'P03',N'VIPAY');
-- TẠO BẢNG NHÂN VIÊN
CREATE TABLE NHANVIEN
(
IDNhanVien nchar(5), --Khóa chính
hoNhanVien nvarchar(50),
tenNhanVien nvarchar(50),
namSinh DATE,
diaChi nvarchar(50),
gioiTinh nvarchar(255),
luong nchar(50),
maPB NCHAR(50) , -- KHÓA NGOẠI
CONSTRAINT PK_NhanVien PRIMARY KEY(IDNhanVien),

);
-- NHẬP DỮ LIỆU VÀO BẢNG NHÂN VIÊN
INSERT INTO NHANVIEN(IDNhanVien,hoNhanVien,tenNhanVien,namSinh,diaChi,gioiTinh,luong,maPB) VALUES
(N'B01',N'ĐÀO',N'MINH NGOC','2003/5/22',N'HÀ NỘI',N'NAM',N'7000000',N'23'),
(N'B02',N'ĐÀO',N'VĂN NGOC','2003/7/22',N'HÀ NỘI',N'NỮ',N'8000000',N'234'),
(N'B03',N'ĐÀO',N'THỊ NGOC','2003/8/22',N'HÀ NAM',N'NỮ',N'9000000',N'34');

-- TẠO BẢNG QUẢN LÝ DỰ ÁN
CREATE TABLE QUANLYDUAN
(
maDuan nchar(5),   -- Khóa chính
IDNhanVien nchar(5) ,    -- Khóa chính 
ngayThamGia DATE,
ngayKetThuc DATE,
soGio time,
vaiTro nvarchar(50),

CONSTRAINT PK_NV PRIMARY KEY(IDNhanVien),
);
-- NHẬP DỮU LIỆU VÀO BẢNG QUẢN LÝ DỰ ÁN
INSERT INTO QUANLYDUAN(maDuan,IDNhanVien,ngayThamGia,ngayKetThuc,soGio,vaiTro) values 
(N'C01',N'K001','2022/4/22','2022/07/22','3:2:6',N'CHỦ'),
(N'C02',N'K002','2022/8/22','2022/09/22','3:2:4',N'CHA'),
(N'C02',N'K003','2022/3/22','2022/4/22','4:5:6',N'CHỦ');

-- TỌA BẢNG DỰ ÁN
CREATE TABLE DUAN
(
maDuan nchar(5),    -- Khóa chính
tenDuan nvarchar(50),
ngayBatDau DATE,
ngayKetThuc DATE,
CONSTRAINT PK_Duan PRIMARY KEY(maDuan),

);
-- NHẬP DỮ LIỆU VÀO BẢNG DỰ ÁN
INSERT INTO DUAN(maDuan,tenDuan,ngayBatDau,ngayKetThuc) VALUES
(N'D001',N'QUẢN LÝ BÁN HÀNG',N'2022/6/23',N'2022/8/25'),
(N'D002',N'QUẢN LÝ NHÂN VIÊN',N'2022/8/23',N'2022/9/25'),
(N'D003',N'QUẢN LÝ BÁN HÀNG',N'2022/9/23',N'2022/12/25'); 

--KIỂM TRA (LẤY) DỮ LIỆU
SELECT * FROM dbo.PHONGBAN
SELECT * FROM dbo.NHANVIEN
SELECT * FROM dbo.QUANLYDUAN
SELECT * FROM dbo.DUAN
ALTER TABLE PHONGBAN ADD CONSTRAINT FK_NV_PB FOREIGN KEY(maPB) REFERENCES PHONGBAN(maPB);
ALTER TABLE NHANVIEN ADD CONSTRAINT FK_NV_QLDA FOREIGN KEY(IDNhanVien) REFERENCES NHANVIEN(IDNhanVien);

ALTER TABLE dbo.NHANVIEN ADD CONSTRAINT NhanVien_Check_luong CHECK(luong => 800);




