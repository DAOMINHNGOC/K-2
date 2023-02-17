create database QLKH6
GO
use QLKH6

 --T?O B?NG M� TH�NG
 create table MATHANG
 (
 MSMH varchar(5),  --Kh�a ch�nh
 TENHANG nvarchar(50), 
 DONGIA money,
 DVT nvarchar(50),
 
 constraint pk_mt primary key(MSMH),
 );
 insert into MATHANG(MSMH, TENHANG, DONGIA,DVT) values('A1',N'S�CH',7000,N'vnd'),
 ('A2',N'S�CH',7000,N'vnd'),
 ('A3',N'S�CH',7000,N'vnd');

 select*from MATHANG

 --T?O B?NG KH�CH H�NG
 create table KHACHHANG 
 (
 MAKH varchar(7),    -- kh�a ch�nh
 TENKH nvarchar(50),
 DCHI nvarchar(255),

 constraint pk_kh primary key(MAKH),
 );
 insert into KHACHHANG(MAKH, TENKH, DCHI) values('PH20534','?�o Minh Ng?c',N'Ph� th?'),
 ('PH20535','?�o V?n Ng?c',N'Ph� th?'),
 ('PH20536','?�o L�m Ng?c',N'Ph� th?');
 SELECT*FROM KHACHHANG

 --T?O B?NG PHI?U NH?P
 create table PHIEUNHAP
 (
 SOPN INT,  -- kh�a ch�nh
 NGAYLAP DATE, 
 MAKH VARCHAR(7),    --Kh�a ngo?i
 KHO INT,
 constraint pk_pn primary key(SOPN),
 );
 insert into PHIEUNHAP(SOPN,NGAYLAP,MAKH,KHO) values('5','2003-2-05','PH20534','5'),
 ('6','2016-02-05','PH20535','6'),
 ('7','2016-02-05','PH20536','7');
 SELECT *FROM PHIEUNHAP
 drop table PHIEUNHAP;

 --T?a b?ng ct nh?p
 create table CTNHAP 
 (
 SOPN int,  -- kh�a ch�nh
 MSMH varchar(5),  -- kh�a ngo?i
 SOLUONG int,

 constraint pk_ctn primary key(SOPN,MSMH),
 )
 insert into CTNHAP(SOPN,MSMH,SOLUONG) values('5','A1','5'),
 ('6','A2','6'),
 ('7','A3','7');
 SELECT*FROM CTNHAP

 --Kho� ngo?i PHI?U NH?P
 alter table dbo.PHIEUNHAP ADD CONSTRAINT pk_pn foreign key(MAKH) references dbo.KHACHHANG(MAKH)
 ALTER TABLE dbo.PHIEUNHAP DROP CONSTRAINT PK_PN
 --Kh�a ngo?i ct nh?p
 ALTER TABLE dbo.CTNHAP ADD CONSTRAINT pk_ctn foreign key(MAKH) REFERENCES dbo.KHACHHANG(MAKH)
 ALTER TABLE dbo.CTNHAP DROP CONSTRAINT PK_CTN

 --
 select PHIEUNHAP.SOPN, KHACHHANG.TENKH,PHIEUNHAP.NGAYLAP,PHIEUNHAP.KHO FROM dbo.PHIEUNHAP;
