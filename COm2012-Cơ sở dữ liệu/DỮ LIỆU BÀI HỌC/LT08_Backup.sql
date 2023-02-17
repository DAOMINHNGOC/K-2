
--Cú pháp

--Backup dữ liệu đầy đủ nhất, vì vậy máy chủ sẽ mất nhiều thời gian để thực hiện nếu database lớn
BACKUP DATABASE <TEN DATABASE>
TO DISK = '<DUONG DAN FILE BACKUP + TEN FILE>'


--Backup những dữ liệu phát sinh tính từ lần backup full gần nhất.
--Như vậy trước khi chúng ta thực hiện different backup thì full backup phải được thực hiện trước.
--Chính vì vậy, khi chúng ta sử dụng loại backup này sẽ tiết kiệm được thời gian backup dữ liệu
BACKUP DATABASE <TEN DATABASE>
TO DISK = '<DUONG DAN FILE BACK UP + TEN FILE>' WITH differential

--Backup dữ liệu sử dụng tập tin log.
--log backup được sử dụng để backup dữ liệu tại thời điểm cụ thể ví dụ như mỗi giờ trong ngày.
BACKUP LOG <TEN DATABASE>
TO DISK = '<DUONG DAN FILE BACKUP + TEN FILE>'
--==================================================================

--Thực hành

USE Lab05
GO
BACKUP DATABASE Lab05
	TO  DISK = N'D:\Work_TTLong\03.Poly\COM2012  - Cơ sở dữ liệu Fall17 (Tích hợp)\Backup\Gaixinh.bak'


RESTORE DATABASE LAB08 FROM DISK = N'D:\Work_TTLong\03.Poly\COM2012  - Cơ sở dữ liệu Fall17 (Tích hợp)\Backup\LAB08.bak'
--==================================================================

BACKUP DATABASE Lab05
	TO  DISK = N'D:\Work_TTLong\03.Poly\COM2012  - Cơ sở dữ liệu Fall17 (Tích hợp)\Backup\LAB05.bak'
	WITH DIFFERENTIAL;

RESTORE DATABASE LAB05 FROM disk = N'D:\Work_TTLong\03.Poly\COM2012  - Cơ sở dữ liệu Fall17 (Tích hợp)\Backup\LAB05.bak'
--==================================================================
Use Lab05
go

BACKUP LOG Lab05
   TO  DISK = N'D:\Work_TTLong\03.Poly\COM2012  - Cơ sở dữ liệu Fall17 (Tích hợp)\Backup\LAB05.trn'

Restore log LAB05 from disk = N'D:\Work_TTLong\03.Poly\COM2012  - Cơ sở dữ liệu Fall17 (Tích hợp)\Backup\LAB05.trn'

--==================================================================

--Phần tạo các chỉ mục của CSDL
-- a. Tạo chỉ mục UNIQUE trên cột điện thoại của bảng khách hàng
   CREATE INDEX sđt_index ON dbo.KhachHang(SĐT);

--- b. Tạo chỉ mục UNIQUE trên cột email của bảng khách hàng
   CREATE INDEX email_index ON dbo.KhachHang(Email);
   --backup/restore
   --export/inport
   --detail/attch
   --thuc hien bao mat