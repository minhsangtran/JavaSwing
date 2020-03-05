CREATE DATABASE QLHomeStay
GO
USE QLHomeStay
GO
CREATE TABLE PHONG(
	MaPhong VARCHAR(5) PRIMARY KEY NOT NULL,
	TenPhong NVARCHAR(50) NOT NULL, 
	MaLoaiP VARCHAR(10),
	TinhTrang NVARCHAR(100) NOT NULL,
	GhiChu NVARCHAR(100)
)

GO
CREATE TABLE LOAIPHONG(
	MaLoaiP VARCHAR(10) PRIMARY KEY NOT NULL,
	TenLoaiP NVARCHAR(50),
	DonGia MONEY NOT NULL

)
GO
CREATE TABLE KHACHHANG(
	MaKH INT IDENTITY(1,1) primary key not null,
	TenKH NVARCHAR(100) NOT NULL,
	GioiTinh NVARCHAR(20),
	CMND VARCHAR(12),
	DiaChi NVARCHAR(100)
)


GO
CREATE TABLE NHANVIEN(
	MaNV VARCHAR(10) PRIMARY KEY NOT NULL,
	TenNV NVARCHAR(100),
	NamSinh int,
	GioiTinh NVARCHAR(20),
	ChucVu NVARCHAR(50),
	SDT VARCHAR(10),
	DiaChi NVARCHAR(100),
	GhiChu NVARCHAR(100),
	MatKhau varchar(50)
)

GO
CREATE TABLE DICHVU(
	MaDV VARCHAR(5) PRIMARY KEY NOT NULL,
	TenDV NVARCHAR(100),
	DonGia MONEY NOT NULL,
	TinhTrang NVARCHAR(100)
)
GO
CREATE TABLE PHIEUTHUEPHONG(
	MaPhieuThue int identity(1,1) primary key not null,
	MaPhong VARCHAR(5) NOT NULL,
	MaKH int,
	NgayBDThue SMALLDATETIME NOT NULL,
	NgayKTThue SMALLDATETIME,
	KhachNuocNgoai int,
	SoLuongKH tinyint NOT NULL,  
	MaNV VARCHAR(10),
	TinhTrangPhieu int

)

SELECT *FROM PHONG
SELECT *FROM LOAIPHONG
GO
CREATE TABLE HOADON(
	MaHD int identity(1,1) primary key not null,
	MaPhieuThue int,
	TienDichVu money, 
	TienThuePhong money,
	NgayHD smalldatetime,
	TriGia MONEY,
	MaNV varchar(10) references NHANVIEN(MaNV)
)



GO
CREATE TABLE PHIEUDICHVU(
	MaPhieuDV int identity(1,1) primary key,
	MaHD int,
	TriGia money,
	NgayLap smalldatetime
)

GO
CREATE TABLE CT_PHIEUDICHVU(
	MaPhieuDV int,
	MaDV varchar(5),
	SoLuong int,
	ThanhTien money,
	primary key(MaPhieuDV,MaDV)
)	




GO
CREATE TABLE BCDOANHTHU(
	MaBC int identity(1,1),
	MaHD int,
	DoanhThu MONEY,
 )




 GO
 ALTER TABLE PHONG			ADD CONSTRAINT FK_PHONG_LOAIPHONG	FOREIGN KEY(MaLoaiP)	REFERENCES LOAIPHONG(MaLoaiP)
 GO
 ALTER TABLE PHIEUTHUEPHONG	ADD CONSTRAINT FK_PTHUEP_PHONG		FOREIGN KEY(MaPhong)	REFERENCES PHONG(MaPhong)
 GO
 ALTER TABLE PHIEUTHUEPHONG	ADD CONSTRAINT FK_PTHUEP_KHACHHANG	FOREIGN KEY(MAKH)		REFERENCES KHACHHANG(MAKH)
 GO
 ALTER TABLE PHIEUTHUEPHONG	ADD CONSTRAINT FK_PTHUEP_NHANVIEN	FOREIGN KEY(MaNV)		REFERENCES NHANVIEN(MaNV)
 GO
 ALTER TABLE HOADON			ADD CONSTRAINT FK_HOADON_PTHUEP		FOREIGN KEY(MaPhieuThue)REFERENCES PHIEUTHUEPHONG(MaPhieuThue)
 GO
 ALTER TABLE PHIEUDICHVU		ADD CONSTRAINT FK_HDDV_HOADON		FOREIGN KEY(MaHD)		REFERENCES HOADON(MaHD)
 GO
 ALTER TABLE CT_PHIEUDICHVU		ADD CONSTRAINT FK_CTDV_PDV			FOREIGN KEY(MaPhieuDV)		REFERENCES PHIEUDICHVU(MaPhieuDV)
 GO
 ALTER TABLE CT_PHIEUDICHVU ADD CONSTRAINT FK_CTDV_DV		FOREIGN KEY(MaDV)   REFERENCES DICHVU(MaDV)
 GO
 ALTER TABLE BCDOANHTHU		ADD CONSTRAINT FK_BCDOANHTHU_HOADON FOREIGN KEY(MaHD)		REFERENCES HOADON(MaHD)
 GO
 ALTER TABLE NHANVIEN ADD CONSTRAINT Check_Tuoi CHECK (NamSinh between 1966 and 1998 )
 GO
 SET DATEFORMAT DMY

GO 
INSERT INTO LOAIPHONG VALUES ('LP001',N'Thường đơn', '80000')
INSERT INTO LOAIPHONG VALUES ('LP002',N'Thường đôi','140000')
INSERT INTO LOAIPHONG VALUES ('LP003',N'VIP đơn', '200000')
INSERT INTO LOAIPHONG VALUES ('LP004',N'VIP đôi', '250000')



GO
INSERT INTO PHONG VALUES ('P101',N'Phòng 101','LP001', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P102',N'Phòng 102','LP001', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P103',N'Phòng 103','LP002', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P104',N'Phòng 104','LP002', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P105',N'Phòng 105','LP001', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P106',N'Phòng 106','LP001', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P107',N'Phòng 107','LP001', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P108',N'Phòng 108','LP001', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P109',N'Phòng 109','LP002', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P110',N'Phòng 110','LP003', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P201',N'Phòng 201','LP003', N'Trống','OK')
INSERT INTO PHONG VALUES ('P202',N'Phòng 202','LP003', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P203',N'Phòng 203','LP003', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P204',N'Phòng 204','LP004', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P205',N'Phòng 205','LP004', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P206',N'Phòng 206','LP004', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P207',N'Phòng 207','LP004', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P208',N'Phòng 208','LP003', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P209',N'Phòng 209','LP003', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P210',N'Phòng 210','LP003', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P301',N'Phòng 301','LP003', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P302',N'Phòng 302','LP002', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P303',N'Phòng 303','LP002', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P304',N'Phòng 304','LP002', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P305',N'Phòng 305','LP002', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P306',N'Phòng 306','LP002', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P307',N'Phòng 307','LP001', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P308',N'Phòng 308','LP001', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P309',N'Phòng 309','LP001', N'Trống','OK' )
INSERT INTO PHONG VALUES ('P310',N'Phòng 310','LP001', N'Trống','OK' )



GO
INSERT INTO KHACHHANG VALUES (N'Khách hàng ảo',N'Không rõ',000000000, N'Không có')
INSERT INTO KHACHHANG VALUES (N'Nguyen Van A',N'Nam',212326455, N'Bình Sơn')
INSERT INTO KHACHHANG VALUES (N'Tran Ngoc Han',N'Nữ',53455126455, N'Quảng Ngãi')
INSERT INTO KHACHHANG VALUES (N'Tran Ngoc Linh',N'Nam',784126455, N'Sơn Tịnh')
INSERT INTO KHACHHANG VALUES (N'Tran Minh Long',N'Nữ',4562326455, N'Nha Trang')
INSERT INTO KHACHHANG VALUES (N'Le Nhat Minh',N'Nam',76546455, N'Phan Thiết')
INSERT INTO KHACHHANG VALUES (N'Le Hoai Thuong',N'Nữ',3451326455, N'Bình Định')
INSERT INTO KHACHHANG VALUES (N'Nguyen Van Tam',N'Nam',13436455, N'Huế')
INSERT INTO KHACHHANG VALUES (N'Phan Thi Thanh',N'Nam',12334526455, N'HCM')
INSERT INTO KHACHHANG VALUES (N'Le Ha Vinh',N'Nam',345326455, N'Hà Nội')
INSERT INTO KHACHHANG VALUES (N'Ha Duy Lap',N'Nam',345316455, N'Đà Nẵng')
INSERT INTO KHACHHANG VALUES (N'Nguyen Nhu Nhut',N'Nam',643326455,N'Quảng Nam')
INSERT INTO KHACHHANG VALUES (N'Le Thi Phi Yen',N'Nam',435326455, N'Phú Yên')
INSERT INTO KHACHHANG VALUES (N'Nguyen Van B',N'Nữ',4654626455, N'Thanh Hóa')
INSERT INTO KHACHHANG VALUES (N'Ngo Thanh Tuan',N'Nữ',4351236455, N'Hà Tĩnh')
INSERT INTO KHACHHANG VALUES (N'Nguyen Thi Truc Thanh',N'Nữ',212326455, N'Nghệ AN')
INSERT INTO KHACHHANG VALUES (N'Ho Thanh Son',N'Nữ',2123412455, N'Hải Phòng')
INSERT INTO KHACHHANG VALUES (N'Tran Tam Thanh',N'Nữ',432126455, N'Cà Mau')
INSERT INTO KHACHHANG VALUES (N'Do Nghiem Phung',N'Nữ',212326455, N'Bến Tre')
INSERT INTO KHACHHANG VALUES (N'Tran Nam Son',N'Nữ',212334555, N'An Giang')
INSERT INTO KHACHHANG VALUES (N'Mai Thanh Danh',N'Nữ',2112326455, N'Long An')
INSERT INTO KHACHHANG VALUES (N'Tran Doan Hung',N'Nữ',212356455, N'Vĩnh Long')





GO
INSERT INTO NHANVIEN VALUES('NV01','Do Nghiem Phung','1987',N'Nữ',N'Quản lý', 32432123, N'Bình Sơn',  N'ok',123)
INSERT INTO NHANVIEN VALUES('NV02','Tran Nam Son','1989',N'Nam',N'Quản lý', 3123412, N'Quảng Ngãi', N'ok',123)
INSERT INTO NHANVIEN VALUES('NV03','Mai Thanh Danh','1991',N'Nam',N'Lễ Tân', 6542312, N'Đồng Nai',  N'ok',123)
INSERT INTO NHANVIEN VALUES('NV04','Tran Doan Hung','1996',N'Không rõ',N'Lễ Tân', 76423432, N'Nha Trang',  N'ok',123)
INSERT INTO NHANVIEN VALUES('NV05','Nguyen Minh Thien','1996',N'Nam',N'Lễ Tân', 14520868, N'Đồng Nai',  N'ok',123)
INSERT INTO NHANVIEN VALUES('NV06','Le Thi Tran','1986',N'Nữ',N'Lễ Tân', 234252, 'Gia Lai', N'ok',123)


SELECT * FROM DICHVU

GO
INSERT INTO DICHVU VALUES('BHL',N'Bia Heieneken lon','35000',N'Còn hàng')
INSERT INTO DICHVU VALUES('BSL',N'Bia Sapporo lon','25000',N'Còn hàng')
INSERT INTO DICHVU VALUES('BTL',N'Bia Tiger lon','20000',N'Còn hàng')
INSERT INTO DICHVU VALUES('B3L',N'Bia 333 lon','17000',N'Còn hàng')
INSERT INTO DICHVU VALUES('BSGL',N'Bia Sài gòn lon','15000',N'Còn hàng')
INSERT INTO DICHVU VALUES('CCL',N'Cocacola lon','10000',N'Còn hàng')
INSERT INTO DICHVU VALUES('PSlon',N'Pepsi lon','10000',N'Còn hàng')
INSERT INTO DICHVU VALUES('MnL',N'Mirinda Cam lon','10000',N'Còn hàng')
INSERT INTO DICHVU VALUES('MXL',N'Mirinda Xá xị lon','10000',N'Còn hàng')
INSERT INTO DICHVU VALUES('NiC',N'Nutri Boost Cam ','15000',N'Còn hàng')
INSERT INTO DICHVU VALUES('NiD',N'Nutri Boost Dâu','15000',N'Còn hàng')
INSERT INTO DICHVU VALUES('Sn',N'String dâu đỏ','15000',N'Còn hàng')
INSERT INTO DICHVU VALUES('NB1',N'Number 1','25000',N'Còn hàng')
INSERT INTO DICHVU VALUES('RB',N'Redbull','30000',N'Còn hàng')
INSERT INTO DICHVU VALUES('RV',N'Revive','15000',N'Còn hàng')
INSERT INTO DICHVU VALUES('NS',N'Nước Suối','7000',N'Còn hàng')
INSERT INTO DICHVU VALUES('0D',N'Trà xanh 0 độ','15000',N'Còn hàng')

GO
INSERT INTO BCDOANHTHU VALUES(1,0)


INSERT INTO PHIEUTHUEPHONG VALUES('P105','1','30-11-2016', '1-12-2016','1','2','NV01', null)
INSERT INTO PHIEUTHUEPHONG VALUES('P106','2','30-12-2016', '6-1-2017','1','2','NV02', null)
INSERT INTO PHIEUTHUEPHONG VALUES('P103','3','30-11-2016', '1-12-2016','1','2','NV02', null)
INSERT INTO PHIEUTHUEPHONG VALUES('P108','4','30-12-2016', '6-1-2017','1','2','NV02', null)
INSERT INTO PHIEUTHUEPHONG VALUES('P107','5','30-11-2016', '1-12-2016','1','2','NV03', null)
INSERT INTO PHIEUTHUEPHONG VALUES('P110','6','30-12-2016', '6-1-2017','1','2','NV05', null)
INSERT INTO PHIEUTHUEPHONG VALUES('P121','7','30-11-2016', '1-12-2016','1','2','NV06', null)
INSERT INTO PHIEUTHUEPHONG VALUES('P122','8','30-12-2016', '6-1-2017','1','2','NV04', null)



INSERT INTO HOADON VALUES('7', 1000000, 200000, '12-11-2016',300000, 'NV01')
INSERT INTO HOADON VALUES('8', 2000000, 300000, '9-2-2016',500000, 'NV02')
INSERT INTO HOADON VALUES('9', 600000, 200000, '12-11-2016',800000, 'NV03')
INSERT INTO HOADON VALUES('10', 200000, 300000, '9-2-2016',700000, 'NV04')
INSERT INTO HOADON VALUES('11', 100000, 200000, '12-11-2016',400000, 'NV05')
INSERT INTO HOADON VALUES('12', 700000, 300000, '9-2-2016',600000, 'NV06')
INSERT INTO HOADON VALUES('13', 800000, 200000, '12-11-2016',800000, 'NV07')
INSERT INTO HOADON VALUES('14', 900000, 300000, '9-2-2016',1100000, 'NV08')

SELECT * FROM LOAIPHONG

GO
/***Đỗ Quốc Huy****16520505****/ 
/******** Object:  StoredProcedure spTaoMaLoaiPhong    *******/
CREATE PROCEDURE spTaoMaLoaiPhong
@MaLoaiPhong varchar(10) output
AS
begin
    declare @stt_so int
    declare @stt_chu varchar(8)
        -- Kiểm tra Bảng có trống không
    if exists( select * from LOAIPHONG)
	Begin
        -- Nếu bảng đã có dữ liệu, tìm STT tiếp theo = STT max + 1
        set @stt_so =(select cast(SUBSTRING(Max(MaLoaiP),3,3) as int) +1 from LOAIPHONG)
        set @stt_chu = (select right(concat('000', @stt_so),3))
	end
    else
	begin 
	set @stt_chu='001';
	end
    set @MaLoaiPhong = concat('LP',@stt_chu)
end;
GO
Declare @MaLP varchar(10)
execute spTaoMaLoaiPhong @MaLP output 
print @MaLP
GO
/******** Object:  StoredProcedure spTaoMaNhanVien  *******/
CREATE PROCEDURE spTaoMaNhanVien
@MaNhanVien   varchar(10) output
AS
begin
    declare @stt_so int
    declare @stt_chu varchar(8)
        -- Kiểm tra Bảng có trống không
    if exists( select * from LOAIPHONG)
	Begin
        -- Nếu bảng đã có dữ liệu, tìm STT tiếp theo = STT max + 1
        set @stt_so =(select cast(SUBSTRING(Max(MaNV),3,3) as int) +1 from NHANVIEN)
        set @stt_chu = (select right(concat('000', @stt_so),3))
	end
    else
	begin 
	set @stt_chu='001';
	end
    set @MaNhanVien = concat('NV',@stt_chu)
end;
Declare @MaNV varchar(10)
execute spTaoMaNhanVien @MaNV output 
print @MaNV
GO
/****** object: StoredProcedure spLietKePhongDangChoThue ************/
INSERT INTO PHIEUTHUEPHONG VALUES('P101',1,'2018/12/20 00:00:00','2018/12/20 00:00:00',0,2,'NV01',0)
INSERT INTO HOADON VALUES (1,0,0,'2019-9-1 00:00:00',0,'NV01')
INSERT INTO PHIEUDICHVU VALUES(1,0,GETDATE())
UPDATE PHONG SET TinhTrang = 'Thuê' WHERE MaPhong='P101'
GO
CREATE PROCEDURE spLietKePhongDangChoThueSuDungDV
AS
BEGIN
	PRINT N'Những phòng đang cho thuê và sử dụng dịch vụ là'
	SELECT P.MaPhong AS N'Mã phòng' ,P.TenPhong AS N'Tên Phòng' 
	FROM PHONG P inner join PHIEUTHUEPHONG PTP on P.MaPhong=PTP.MaPhong 
	inner join HOADON HD on HD.MaPhieuThue=PTP.MaPhieuThue 
	inner join PHIEUDICHVU DV on HD.MaHD=DV.MaHD  
	WHERE TinhTrang=N'Thuê'
END
EXEC spLietKePhongDangChoThueSuDungDV
GO
/******object: StoredProcedure spTraPhong *****/
CREATE PROCEDURE spTraPhong
@MaP varchar(10)
AS
BEGIN
	UPDATE PHIEUTHUEPHONG SET TinhTrangPhieu = 1 WHERE MaPhong = @MaP
	UPDATE PHONG SET TinhTrang = N'Trống' WHERE MaPhong =@MaP
END
EXECUTE spTraPhong 'P101'
GO
/*******object: Trigger spTuDongTaoHDRong *************/
CREATE TRIGGER TDTaoHD ON PHIEUTHUEPHONG
AFTER INSERT
AS
	DECLARE @MaPT int
	BEGIN
		SELECT @MaPT = MAX(MaPhieuThue) FROM inserted
		INSERT INTO HOADON VALUES (@MaPT,0,0,GETDATE(),0,'NV01')
	END
GO
/******object: Trigger spTuDongTaoPhieuDichVu ************/
CREATE TRIGGER TDTaoPDV ON PHIEUTHUEPHONG
AFTER INSERT
AS 
	DECLARE @MaPT int
	BEGIN
		SELECT @MaPT = MAX(MaPhieuThue) FROM inserted
		INSERT INTO PHIEUDICHVU VALUES (@MaPT,0,GETDATE())
	END
GO
SELECT * FROM PHONG
SELECT *FROM PHIEUTHUEPHONG
SELECT * FROM PHIEUDICHVU
SELECT * FROM HOADON
GO		
/****** Object: Trigger KiemtraSDT ***************/
CREATE TRIGGER CHECK_SDT ON NHANVIEN
FOR INSERT, UPDATE
AS
	DECLARE @SDT VARCHAR(10)
	BEGIN 
		SELECT @SDT = TRIM(SDT) FROM inserted
		IF (ISNUMERIC(@SDT) <> 1) OR (DATALENGTH(@SDT) < 10) OR (LEFT(@SDT, 1) <> '0')
			BEGIN
				PRINT N'Sai thông tin số điện thoại'
				ROLLBACK TRAN
			END
	END
UPDATE NHANVIEN SET SDT='asdf' WHERE MaNV='NV03'
/**trigger tinh tien hoa don**/
DROP TRIGGER IF EXISTS UPDATE_HD
GO
CREATE TRIGGER UPDATE_HD ON PHIEUTHUEPHONG FOR UPDATE
AS
DECLARE @MAPHIEUTHUEPHONG INT, @MAPHONG VARCHAR(5), 
@NGAYBD DATE, @NGAYKT DATE, @DONGIA MONEY, @MALOAIPHONG VARCHAR(10), @MAHD INT
	BEGIN
		IF UPDATE(TinhTrangPhieu) 
		BEGIN
			SELECT @MAPHIEUTHUEPHONG = MaPhieuThue FROM inserted
			SELECT @MAPHONG = MaPhong FROM inserted
			SELECT @NGAYBD = NgayBDThue FROM inserted
			SELECT @NGAYKT = NgayKTThue	FROM inserted
			SELECT @MAHD = MaHD FROM HOADON WHERE MaPhieuThue = @MAPHIEUTHUEPHONG
			DECLARE @SONGAYTHUE INT
			IF (@NGAYBD = @NGAYKT) 
			BEGIN
				SET @SONGAYTHUE = 1 
			END
			ELSE BEGIN
					SET @SONGAYTHUE = DATEDIFF(DAY, @NGAYBD, @NGAYKT)
				END
			SELECT @MALOAIPHONG = MaLoaiP FROM PHONG WHERE MaPhong = @MAPHONG
			SELECT @DONGIA = DonGia FROM LOAIPHONG WHERE MaLoaiP = @MALOAIPHONG
			DECLARE @TIENDICHVU MONEY
			SELECT @TIENDICHVU = TriGia FROM PHIEUDICHVU WHERE MaHD = @MAHD
			DECLARE @TONGTIEN MONEY
			SET @TONGTIEN = (@DONGIA * @SONGAYTHUE) + @TIENDICHVU
			UPDATE HOADON SET TriGia = @TONGTIEN WHERE @MAHD = @MAHD
		END
	END
-- TRIGGER UPDATE TONG TIEN PHIEU DICH VU
	GO
	CREATE TRIGGER UPDATE_TIEN_PHIEU_DV ON CT_PHIEUDICHVU FOR INSERT 
	AS DECLARE @MAPHIEUDV INT, @THANHTIEN MONEY
		BEGIN
			SELECT @MAPHIEUDV = MaPhieuDV FROM inserted
			SELECT @THANHTIEN = ThanhTien FROM inserted
			UPDATE PHIEUDICHVU SET TriGia = TriGia + @THANHTIEN WHERE MaPhieuDV = @MAPHIEUDV
		END
						
						
						
						
/***Trần Minh Sang***16521023****/
--SP Tạo mã phòng tự động
CREATE PROC sp_TaoMaPhongTuDong
AS
BEGIN
    DECLARE @MAPHONG VARCHAR(20)
    DECLARE @MAX INT
    SELECT @MAX = COUNT(MaPhong) + 1 FROM PHONG
    SET @MAPHONG = RIGHT('P' + CAST(@MAX AS VARCHAR(18)),18)
    WHILE(EXISTS(SELECT MaPhong FROM PHONG
                 WHERE MaPhong = @MAPHONG))
    BEGIN
    SET @MAX = @MAX + 1
    SET @MAPHONG = RIGHT('P' + CAST(@MAX AS VARCHAR(18)),18)
END
SELECT @MAPHONG
END
exec sp_TaoMaPhongTuDong

----------------------------------------------------------------------------------------------------------------------
/** SP Thêm hóa đơn**/
CREATE PROC sp_ThemHoaDon
	
	@MaPhieuThue INT,
	@TienDichVu money,
	@TienThuePhong money, 
	@NgayHD smalldatetime,
	@TriGia MONEY,
	@MaNV char(10) 
AS
BEGIN 
	--Tạo mã hóa đơn tự động
    BEGIN
        DECLARE @MAHD INT
        DECLARE @MAX INT
        SELECT @MAX = COUNT(MaHD) + 1 FROM HOADON
        SET @MAHD = @MAX
        WHILE(EXISTS(SELECT MaHD 
                     FROM HOADON
                     WHERE MaHD = @MAHD))
        BEGIN
            SET @MAX = @MAX + 1
            SET @MAHD = @MAX
        END

    END
    --Thêm hóa đơn với mã hóa đơn vừa tạo
	BEGIN
	    INSERT INTO HOADON (MaPhieuThue, TienDichVu,TienThuePhong, NgayHD, TriGia, MaNV)
	    VALUES( @MaPhieuThue ,@TienDichVu,@TienThuePhong, @NgayHD, @TriGia, @MaNV)

    END
END
exec sp_ThemHoaDon '8',10000,20000,'11-12-2018',20000, 'NV02'
select *from HOADON
select *from PHIEUTHUEPHONG
---------------------------------------------------------------------------------------------------------------------

/**SP Xóa hóa đơn**/
CREATE PROC sp_XoaHoaDon
	@MaHD INT
AS
BEGIN 
    --Kiểm tra xem hóa đơn có tồn tại hay không
	IF NOT EXISTS (SELECT * FROM HOADON WHERE MaHD = @MaHD)
	BEGIN
        print(N'Lỗi: Hóa đơn không tồn tại!')
		RETURN -1
	END
	
	--Xóa hóa đơn
	BEGIN
		DELETE FROM HOADON 
		WHERE MaHD = @MaHD
	END
END
exec sp_XoaHoaDon 30
select * from HOADON where MaHD = 30
--------------------------------------------------------------------------------------------------------------------------
/**SP Sửa hóa đơn**/
CREATE PROC sp_SuaHoaDonUpdate
	@MaHD int ,
	@MaPhieuThue int,
	@TienDichVu money,
	@TienThuePhong money,
	@NgayHD smalldatetime,
	@TriGia money
	 
AS
BEGIN 
	--Kiểm tra xem hóa đơn có tồn tại hay không
	IF NOT EXISTS (SELECT * FROM HOADON WHERE MaHD = @MaHD)
	BEGIN
		print(N'Lỗi: Hóa đơn không tồn tại!')
		RETURN -1
	END
	
	--Sửa hóa đơn
	BEGIN
	    
	    UPDATE HOADON 
	    SET MaPhieuThue = @MaPhieuThue, TienDichVu = @TienDichVu,TienThuePhong = @TienThuePhong,
	    NgayHD = @NgayHD, TriGia = @TriGia
	    WHERE MaHD = @MaHD
	END 
	
END
exec sp_SuaHoaDonUpdate 25, 8,60000,300000, '12-10-2017', 4000000
select * from HOADON WHERE MaHD = 25
select * from HOADON



---------------------------------------------------------------------------------------------------------------------------------

/**SP Thêm khách hàng**/
CREATE PROC sp_ThemKH
    
	@TenKH NVARCHAR(100),
	@GioiTinh NVARCHAR(20),
	@CMND NVARCHAR(12),
	@DiaChi NVARCHAR(100)
	
AS
BEGIN
    --Tạo mã khách hàng tự động
    BEGIN
        DECLARE @MAKH INT
        DECLARE @MAX INT
        SELECT @MAX = COUNT(MaKH) + 1 FROM KHACHHANG
        SET @MAKH = @MAX
        WHILE(EXISTS(SELECT MaKH FROM KHACHHANG
                 WHERE MaKH = @MAKH))
        BEGIN
            SET @MAX = @MAX + 1
            SET @MAKH = @MAX
        END
    END
	--Thêm khách hàng với mã khách hàng vừa tạo
	BEGIN
	
		INSERT INTO KHACHHANG (TenKH, GioiTinh, CMND, DiaChi) VALUES (@TenKH,@GioiTinh, @CMND, @DiaChi)
	END
END
exec sp_ThemKH N'Trần Minh Sang', N'Nam', 23415678, N'Bình Định'
select * from KHACHHANG WHERE CMND = '23415678'
-------------------------------------------------------------------------------------------------------------------------


/**SP Sửa thông tin khách hàng**/
CREATE PROC sp_SuaTTKhachHang
	@MaKH int ,
	@TenKH nvarchar(100),
	@DiaChi nvarchar(100)
	
AS
BEGIN 
	--Kiểm tra xem khách hàng có tồn tại hay không
	IF NOT EXISTS (SELECT * FROM KHACHHANG WHERE MaKH = @MaKH)
	BEGIN
		print(N'Lỗi: Khách hàng không tồn tại!')
		RETURN -1
	END
	
	--Sửa tt khách hàng
	BEGIN
	    UPDATE KHACHHANG 
	    SET DiaChi = @DiaChi, TenKH = @TenKH
	    WHERE MaKH = @MaKH
	END 
	
END
exec sp_SuaTTKhachHang 1, N'Le Minh' , N'quận 7'
select * from KHACHHANG WHERE MaKH = 1
---------------------------------------------------------------------------------------------------------------------------

/**SP Tra cứu thông tin khách hàng**/

CREATE PROC sp_TraCuuTTkhachHang
@MaKH INT
AS
BEGIN
--Kiểm tra xem khách hàng có tồn tại hay không
	IF NOT EXISTS (SELECT * FROM KHACHHANG WHERE MaKH = @MaKH)
	BEGIN
		print(N'Lỗi: Khách hàng không tồn tại!')
		RETURN -1
	END
	
	--Tra cứu thông tin khách hàng
	
	SELECT * FROM KHACHHANG WHERE MaKH = @MaKH
END
exec sp_TraCuuTTKhachHang 2
-------------------------------------------------------------------------------------------------------------------------


-- Trigger update mã hóa đơn
CREATE TRIGGER tg_update_MaHD 
ON HOADON
FOR UPDATE 
AS 
IF UPDATE (MaHD) 
BEGIN 
PRINT 'Khong the thay doi gia tri cua MaHD'
ROLLBACK TRANSACTION 
END 
update HOADON set MaHD='NV12' where MaHD='NV01'


--Trigger Khi có thao tác cập nhật hóa đơn thì không được phép cập nhật MaNV
CREATE TRIGGER tg_update_HoaDon
on HOADON
FOR UPDATE
AS
BEGIN
	DECLARE @MaHD INT
	DECLARE @MaNV INT
	SELECT @MaHD = MaHD 
	FROM inserted
	if UPDATE (MaNV)
		BEGIN
			print N'Không được cập nhật'
			rollback transaction
		END
END

update HOADON set MaNV='NV02' where MaHD='10'



		     
		     
-- Trigger kiểm tra CMND, họ tên của khách hàng khi insert và update

CREATE TRIGGER trg_Check_KhachHang 
ON KHACHHANG
FOR INSERT, UPDATE
AS
	DECLARE @CMND VARCHAR(12)
	DECLARE @TenKH NVARCHAR(100)
	BEGIN 
		SELECT @CMND = CMND FROM inserted
		IF (ISNUMERIC(@CMND) = 0)
			BEGIN
				PRINT N'Sai thông tin CMND'
				ROLLBACK TRAN
			END
		 
		SELECT @TenKH = TenKH FROM inserted
		IF (ISNUMERIC(@TenKH) = 1)
			BEGIN
				PRINT N'Sai thông tin TENKH'
				ROLLBACK TRAN
			END
	END



	
