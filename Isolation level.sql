/***Đỗ Quốc Huy****16520505****/
 --Dirty Read
--Transaction 1
--Transaction 1 thực thi UPDATE giá trị CMND='DIRTYREAD' của Khách hàng có MaKH=1
--Sau khi delay 5s, Transaction rollback có giá trị vừa thay đổi nghĩa là CMND của khách hàng có MaKH = 1 vẫn giữ như cũ
SELECT *FROM KHACHHANG WHERE MaKH=1

BEGIN TRAN
UPDATE KHACHHANG SET CMND ='DIRTYREAD' where MaKH =1
WAITFOR DELAY '00:00:05'
ROLLBACK TRAN

--Dirty Read
--Transaction 2
-- Đọc dữ liệu rác do mức cô lập Read Uncommitted không thiết lập Shared Lock lên những đơn vị dữ liệu cần đọc
-- Nên không phải chờ khi đọc dữ liệu dù dữ liệu đang bị lock bởi giao tác khác
-- Transaction 2 đọc dữ liệu update của Transaction 1 nhưng khi Transaction 1 rollback thì Transaction 2 không đọc được
-- Nên xảy ra vấn đề khi xử lí đồng thời là Dirty Read
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SELECT *FROM KHACHHANG WHERE MaKH=1

--Giải quyết đọc dữ liệu rác: Dùng mức cô lập Read committed 
--Do mức cô lập Read committed thiết lập Share Lock trên đơn vị dữ liệu được đọc nên phải chờ khi bị lock bởi giao tác khác
-- Transactoin 2 phải chờ Transaction 1 thực thi xong nên không đọc dữ liệu rác 
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT *FROM KHACHHANG WHERE MaKH=1
--Deadlock
-- Transaction 3
-- Mức cô lập mặc định của Transaction 3 là Read Committed: tạo Exclusive Lock trên đơn vị dữ liệu 
-- được ghi và giữ cho đến hết giao tác.
-- Transaction 3 xin lock trên bảng KHACHHANG trước nên tạo Exclusive Lock trên bảng PHONG.
-- Sau khi thực hiện update trên bảng PHONG thì Transaction 3 xin lock trên bảng KHACHHANG
--nhưng bảng KHACHHANG đang được Exclusive Lock bởi Transaction 4.
-- Transaction 3 chờ Transaction 4 nhả khoá trên bảng KHACHHANG.
-- 2 Transaction chờ nhau nên xảy ra hiện tượng Deadlock
SELECT * FROM KHACHHANG
SELECT * FROM PHONG
SELECT * FROM PHIEUTHUEPHONG
DROP PROC DEADLOCK1
CREATE PROC DEADLOCK1
AS
Begin 
	Begin Tran
		Update KHACHHANG Set CMND='8' where MaKH=1
		Waitfor delay '00:00:05'
		Update PHONG Set TenPhong='DEADLOCK' where MaPhong='P101'
	Commit Tran
End
Exec DEADLOCK1
DROP PROC sp_DEADLOCK1
Create Proc sp_DEADLOCK1
As
Begin 
	Begin Tran
	Update PHONG Set TenPhong='DEADLOCK' where MaPhong='P101'
	Waitfor delay '00:00:05'
	Update KHACHHANG Set CMND='8' where MaKH=1
	Commit Tran
End
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
Exec DEADLOCK1


Exec sp_DEADLOCK1
-- Giải quyết Deadlock:
-- Transaction 4 muốn xin lock trên bảng KHACHHANG nhưng bảng KHACHHANG đang được Exclusive Lock bởi Transaction 3 
--nên Transaction 4 phải chờ Transaction 3 hoàn tất và giải phóng khóa thì mới lock được bảng KHACHHANG.
-- Vì không có Transaction nào cản trở nên Transaction 4 xin lock trên bảng KHACHHANG và thực hiện update.
-- Sau đó Transaction 4 xin lock trên bảng PHONG và thực hiện update rồi commit.

--Phantom Reads
-- Cùng là 1 câu lệnh Select nhưng kết quả trả về của 2 câu lệnh Select lại có giá trị khác nhau
-- Vì trong khi Transaction 5 thực thi thì Transaction 6 đã chèn thêm 1 dòng dữ liệu vào bảng KHACHHANG
Select * From KHACHHANG

-- Transaction 5
Begin Tran
Select * from KHACHHANG where MaKH > 1

Waitfor delay '00:00:05'

Select * from KHACHHANG where MaKH > 1
Commit Tran

INSERT INTO KHACHHANG VALUES (N'Do Huy',N'Nữ',212356455, N'Vĩnh Long')

-- Giải quyết Phantom Reads: Dùng mức cô lập Serializale
-- Khi Transaction 5 thực thi thì Shared Lock được tạo trên bảng KHACHHANG và được giữ cho đến hết giao tác
-- Transaction 6 phải chờ Transaction 5 kết thúc mới chèn dữ liệu vào bảng NhanVien được
-- Do Transaction 6 không thể chèn dữ liệu vào bảng KHACHHANG trong quá trình Transaction 5 thực thi
--nên kết quả trả về của hai câu lệnh Select của Transaction 5 là giống nhau

Set Tran Isolation Level Serializable
Begin Tran
Select * from KHACHHANG where MaKH > 1

Waitfor delay '00:00:05'

Select * from KHACHHANG where MaKH > 1
Commit Tran


--LOSTUPDATE
--TRANSACTION 7   Select * from KHACHHANG where MaKH=2
Begin Tran
Declare @CMND varchar(10)
Select @CMND = CMND from KHACHHANG where MaKH=2
Waitfor Delay '00:00:10'
Set @CMND = 'LOST100'
Update KHACHHANG Set CMND = @CMND where MaKH=2
Print @CMND
Commit Transaction
--TRANSACTION 8
Begin Tran
Declare @CMND varchar(10)
Select @CMND = CMND from KHACHHANG where MaKH=2
Waitfor Delay '00:00:10'
Set @CMND = 'LOST200'
Update KHACHHANG Set CMND = @CMND where MaKH=2
Print @CMND
Commit Transaction

--T7 hoàn thành trước,sau đó T8 hoàn thành sau và giữ kết quả update của T8
--cả 2 mức cô lập Read Uncommitted và Read Committed đều làm mất dữ liệu update ở T7

--LOSTUPDATE GIẢI QUYẾT
--Giải quyết bằng cách thiết lập mức cô lập Repeatable Read cho cả 2 Tran

--UNREPEATABLE READ
--TRANSACTION 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
Begin Transaction
Select CMND from KHACHHANG where MaKH=2
waitfor delay '00:00:10'
Select CMND from KHACHHANG where MaKH=2
Commit Transaction
--TRANSACTION 2
Update KHACHHANG set CMND = '45' where MaKH=2
-- 2 Select trả về 2 kết quả khác nhau -> vấn đề không thể đọc lại

--Giải quyết bằng cách thiết lập Repeatable Read cho T1
--T2 phải đợi T1 Read rồi mới update

/***Trần Minh Sang***16521023****/
-- DIRTYREAD
SELECT * FROM HOADON WHERE MaHD= 10
--TRANSACTION 1
Begin Tran
Update HOADON set TriGia = 3450000 where MaHD= 10
Waitfor Delay '00:00:10'
Rollback Transaction
----TRANSACTION 2
Set Transaction Isolation Level Read Uncommitted
Select * from HOADON where MaHD= 10
-- Do mức cô lập Read Uncommitted không thiết lập Shared Lock trên những đơn vị dữ liệu cần đọc 
-- nên không phải chờ khi đọc dữ liệu dù dữ liệu đang bị lock bởi giao tác khác.
-- Tracsaction 2 đọc được dữ liệu update của Transaction 1 nhưng khi Transaction 1 Rollback thì Transaction 2 không đọc được.
-- Nên xảy ra vấn đề khi xử lý đồng thời là Dirty Reads.

--giải quyết DIRTYREAD
-- Giải quyết đọc dữ liệu rác: Dùng mức cô lập Read Committed mặc định của MS SQL Sever
-- Do mức cô lập Read Committed tạo Shared Lock trên đơn vị dữ liệu được đọc nên phải chờ khi đọc dữ liệu đang bị lock bởi giao tác khác
-- Transaction 2 phải chờ Transaction 1 thực hiện xong mới tiến hành thao tác nên không đọc phải dữ liệu rác. 
Set Transaction isolation level Read Committed
Select * from HOADON where MaHD= 10



--Deadlock
 --Mức cô lập mặc định của Transaction 1 là Read Committed: tạo Exclusive Lock trên đơn vị dữ liệu được ghi và
 --giữ cho đến hết giao tác.
-- Transaction 1 xin lock trên bảng DICHVU trước nên tạo Exclusive Lock trên bảng DICHVU.
-- Sau khi thực hiện update trên bảng DICHVU thì Transaction 1 xin lock trên bảng NHANVIEN
--nhưng bảng NHANVIEN đang được Exclusive Lock bởi Transaction 2.
-- Transaction 1 chờ Transaction 2 nhả khoá trên bảng NHANVIEN.
-- 2 Transaction chờ nhau nên xảy ra hiện tượng Deadlock.

--Trans 1
Create Proc sp_DeadLock1
As
Begin 
	Begin Tran
		Update DICHVU Set TenDV='Deadlock' where MaDV='BHL'
		Waitfor delay '00:00:05'
		Update NHANVIEN Set TenNV='Deadlock' where MaNV='NV01'
	Commit Tran
End
Exec sp_Deadlock1

--TRANS 2
Create Proc sp_DeadLock2
As
Begin 
	Begin Tran
		Update NHANVIEN Set TenNV='Ten' where MaNV='NV01'
		Waitfor delay '00:00:05'
		
		Update DICHVU Set TenDV='Ten' where MaDV='BHL'
	Commit Tran
End
Exec sp_Deadlock2

-- Giải quyết Deadlock:
-- Transaction 2 muốn xin lock trên bảng DICHVU nhưng bảng DICHVU đang được Exclusive Lock bởi Transaction 1 
--nên Transaction 2 phải chờ Transaction 1 hoàn tất và giải phóng khóa thì mới lock được bảng DICHVU.
-- Vì không có Transaction nào cản trở nên Transaction 2 xin lock trên bảng DICHVU và thực hiện update.
-- Sau đó Transaction 2 xin lock trên bảng NHANVIEN và thực hiện update rồi commit.

Create Proc sp_DeadLock3
As
Begin 
	Begin Tran
		Update DICHVU Set TenDV='Solve Deadlock' where MaDV='BHL'
		Waitfor delay '00:00:05'
		Update NHANVIEN Set TenNV='Solve Deadlock' where MaNV='NV01'
	Commit Tran
End
Exec sp_Deadlock3




--PHANTOM READ
--TRANSACTION 1
Begin Transaction
Select * from HOADON where MaHD between '1' and '3'
waitfor delay '00:00:10'
Select * from HOADON where MaHD between '1' and '3'
Commit Transaction
--TRANSACTION 2

Insert into HOADON values('11', 200000, 3000000, '12-12-2017', 500000, 'NV01')

-- Trong khi TRANS 1 vẫn đang thực hiện thì TRANS 2 đã insert thêm 1 row
-- TRANS 1 select thứ hai kết quả trả về nhiều hơn 1 row -> vấn đề phantom read

--giải quyết
--Giải quyết bằng cách thiết lập mức cô lập serializable cho TRANS 1
-- Số lượng row sẽ bị lock ,TRANS 2 không thể insert được cho đến khi TRANS 1 hoàn thành
Set transaction isolation level serializable



--LOSTUPDATE
--TRANSACTION 1  
select * from HOADON where MaHD=13 

Set Transaction isolation level Repeatable Read
Begin Tran
Declare @TriGia money
Select @TriGia = TriGia from HOADON where MaHD=13
Waitfor Delay '00:00:10'
Set @TriGia = @TriGia + 100000
Update HOADON Set TriGia = @TriGia where MaHD=13
Print @TriGia
Commit Transaction
--TRANSACTION 2
Begin Tran
Declare @TriGia money
Select @TriGia = TriGia from HOADON where MaHD=13
Waitfor Delay '00:00:01'
Set @TriGia = @TriGia + 200000
Update HOADON Set TriGia = @TriGia where MaHD=13
Print @TriGia
Commit Transaction
--T2 hoàn thành trước,sau đó TRANS 1 hoàn thành sau và giữ kết quả update của TRANS 1
--cả 2 mức cô lập Read Uncommitted và Read Committed đều làm mất dữ liệu update ở TRANS 2

--giải quyết
--Giải quyết bằng cách thiết lập mức cô lập Repeatable Read cho cả 2 TRANS
--Khi đó TRANS 1 chạy thành công còn TRANS 2 thì báo lỗi
--Chạy lại TRANS 2 là update thành công
Set Transaction isolation level Repeatable Read


--UNREPEATABLE READ
--TRANSACTION 1
Set Transaction isolation level Repeatable Read

Begin Transaction
Select TriGia from HOADON where MaHD=10
waitfor delay '00:00:10'
Select TriGia from HOADON where MaHD=10
Commit Transaction
--TRANSACTION 2
Update HOADON set TriGia = 765000 where MaHD=10
-- 2 Select trả về 2 kết quả khác nhau -> vấn đề không thể đọc lại

--giải quyết
--Giải quyết bằng cách thiết lập mức cô lập Repeatable Read cho TRANS 1 
--TRANS 2 phải đợi TRANS 1 read rồi mới update
Set Transaction isolation level Repeatable Read





