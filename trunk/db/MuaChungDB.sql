------------------------------------------------------------------------------
-----------------------------------Tao CSDL-----------------------------------
------------------------------------------------------------------------------

create database MuaChung
go
use MuaChung
go


create table LoaiVoucher
(
MALOAIVOUCHER INT NOT NULL,
TENLOAIVOUCHER NVARCHAR(100) NOT NULL,

primary key (MALOAIVOUCHER)
)

create table TaiKhoanThuong
(
MAKH INT NOT NULL,
DIACHI NVARCHAR(100) NOT NULL,
EMAIL NVARCHAR(100) NOT NULL,
SDT NVARCHAR(100) NOT NULL,

primary key (MAKH)
)

create table DiaChiDoanhNghiep
(
MADC INT NOT NULL,
DC1 NVARCHAR(500) NOT NULL,
DC2 NVARCHAR(500),
DC3 NVARCHAR(500),

primary key (madc)
)

create table TaiKhoanDoanhNghiep
(
MADN INT NOT NULL,
TENDN NVARCHAR(100) NOT NULL,
SDTDN NVARCHAR(100) NOT NULL,
GIOITHIEU NVARCHAR(500) NOT NULL,
WEBSITE NVARCHAR(100) NOT NULL,
EMAIL NVARCHAR(100) NOT NULL,
KINHDO NVARCHAR(100) NOT NULL,
VIDO NVARCHAR(100) NOT NULL,

MADIACHIDN INT references DiaChiDoanhNghiep(MADC) NOT NULL,

primary key (MADN)
)

create table TAIKHOAN
(
USERNAME NVARCHAR(100) NOT NULL,
PASSWORD NVARCHAR(100) NOT NULL,
MADN INT FOREIGN KEY REFERENCES TaiKhoanDoanhNghiep(MADN),
MAKH INT FOREIGN KEY REFERENCES TaiKhoanThuong(MAKH),
TKISAVAILABLE INT NOT NULL,

primary key (USERNAME)
)

create table KhuVuc
(
MAKHUVUC INT NOT NULL,
TENKHUVUC NVARCHAR(100) NOT NULL,

primary key (MAKHUVUC)
)

create table Email
(
EMAIL NVARCHAR(100)
)

create table HinhAnh
(
MAHINHANH INT NOT NULL,
HINHDAIDIEN NVARCHAR(500) NOT NULL,
HINHTHUMBNAIL NVARCHAR(500) NOT NULL,
HINH1 NVARCHAR(500) NOT NULL,
HINH2 NVARCHAR(500) NOT NULL,
HINH3 NVARCHAR(500) NOT NULL,

primary key (MAHINHANH)
)

create table Voucher
(
MAVOUCHER INT NOT NULL,
TENVOUCHER NVARCHAR(100) NOT NULL,
THOIGIANBDKM DATETIME NOT NULL,
THOIGIANKTKM DATETIME NOT NULL,
NOIDUNG TEXT NOT NULL,
GIAGOC INT NOT NULL,
GIAKHUYENMAI INT NOT NULL,
SOLUONGTRONGKHO INT NOT NULL,
SOLUONGDAMUA INT NOT NULL,
THUOCTINHVIP INT NOT NULL,
TONGSOGIOBAN INT NOT NULL,
TRANGTHAIDUYET INT NOT NULL,

MAHINH INT REFERENCES HINHANH(MAHINHANH) NOT NULL,
MALOAIVOUCHER INT REFERENCES LOAIVOUCHER(MALOAIVOUCHER) NOT NULL,
MAKHUVUC INT REFERENCES KHUVUC(MAKHUVUC) NOT NULL,
MADOANHNGHIEP INT REFERENCES TaiKhoanDoanhNghiep(MADN) NOT NULL,

ISAVAILABLE INT NOT NULL,

primary key (MAVOUCHER)
)

create table DonHang
(
MADONHANG INT NOT NULL,
TONGTIEN INT NOT NULL,
NGAYMUA DATETIME NOT NULL,

TKUSERNAME NVARCHAR(100) REFERENCES TAIKHOAN(USERNAME) NOT NULL,

primary key (MADONHANG)
)

create table ChiTietDonHang
(
SOLUONGMUA INT NOT NULL,
TRANGTHAIGIAOHANG NVARCHAR(100) NOT NULL,
TRANGTHAISUDUNG NVARCHAR(100) NOT NULL,
LANGIAOHANGTHU INT NOT NULL,
NGAYGIAOHANG DATETIME NOT NULL,

MADH INT REFERENCES DonHang(MADONHANG) NOT NULL,
VOUCHERDH INT REFERENCES Voucher(MAVOUCHER) NOT NULL,

primary key (MADH, VOUCHERDH, LANGIAOHANGTHU)
)

create table Comment
(
NOIDUNG TEXT NOT NULL,
THOIGIAN DATETIME NOT NULL,

TKCOMMENT NVARCHAR(100) REFERENCES TAIKHOAN(USERNAME) NOT NULL,
MAVOUCHERCOMMENT INT REFERENCES VOUCHER(MAVOUCHER) NOT NULL,
primary key (TKCOMMENT, MAVOUCHERCOMMENT, THOIGIAN)
)

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

------------------------------------------------------------------------------
-----------------------------------Rang Buoc----------------------------------
------------------------------------------------------------------------------

---------------------
------Voucher--------
---------------------
--1
alter table Voucher add constraint c_ngay check (THOIGIANBDKM < THOIGIANKTKM);

--5
alter table Voucher add constraint c_gia check (GIAKHUYENMAI < GIAGOC);

--6
alter table Voucher add constraint c_soluong check (SOLUONGDAMUA <= SOLUONGTRONGKHO);

--7
alter table Voucher add constraint c_giagoc check (GIAGOC >= 0);

--8
alter table Voucher add constraint c_giakm check (GIAKHUYENMAI >= 0);

--9
alter table Voucher add constraint c_soluongkho check (SOLUONGTRONGKHO >= 1);

--10
alter table Voucher add constraint c_soluongdamua check (SOLUONGDAMUA >= 0);

--11
alter table Voucher add constraint c_TinhTrang check (TRANGTHAIDUYET in (1, 0));
--ALTER TABLE Voucher DROP CONSTRAINT "c_TinhTrang" ;

--12
alter table Voucher add constraint c_Vip check (ThuocTinhVip in (1, 0))
--ALTER TABLE Voucher DROP CONSTRAINT "c_Vip" ;

---------------------
--Chi Tiet Don Hang--
---------------------

--1
alter table ChiTietDonHang add constraint c_giaohang check (TRANGTHAIGIAOHANG in (N'Đã giao', N'Chưa giao'));

--2
alter table ChiTietDonHang add constraint c_trangthaisudung check (TRANGTHAISUDUNG in (N'Bình thường', N'Hoàn tiền'));

--3
create trigger tr_ngay 
on ChiTietDonHang for insert, update
as
	declare @ngaygiao datetime
	declare @mavoucher int
	declare @bd datetime
	declare @kt datetime

	select @ngaygiao = NGAYGIAOHANG, @mavoucher = VOUCHERDH from inserted i
	select @bd = THOIGIANBDKM from Voucher where MAVOUCHER = @mavoucher
	if (@ngaygiao < @bd)
		begin
			raiserror (N'Ngày giao sớm hơn ngày bắt đầu Voucher.',16,1)
			rollback tran		
		end
go

---------------------
------Don Hang-------
---------------------

--2 -------------------------------------------xem lai
--create trigger tr_ngaymuaDH
--on ChiTietDonHang for insert, update
--as
--	declare @ngaygiao datetime
--	declare @madh int
--	declare @ngaymua datetime
--
--	select @ngaygiao = NGAYGIAOHANG, @madh = MADH from inserted i
--	select @ngaymua = NGAYMUA from DonHang where MADONHANG = @madh
--	if (@ngaygiao < @ngaymua)
--		begin
--			raiserror (N'Ngày giao sớm hơn ngày khách hàng mua Voucher.',16,1)
--			rollback tran		
--		end
--go

--3 -------------------------------------chưa xong
--create trigger tr_ngaymuaVoucher
--on DonHang for insert, update
--as
--	declare @ngaymua datetime
--	declare @madh int
--	declare @ngaymua datetime
--
--	select @ngaygiao = NGAYGIAOHANG, @madh = MADH from inserted i
--	select @ngaymua = NGAYMUA from DonHang where MADONHANG = @madh
--	if (@ngaygiao < @ngaymua)
--		begin
--			raiserror (N'Ngày giao sớm hơn ngày khách hàng mua Voucher.',16,1)
--			rollback tran		
--		end
--go

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

-------------------------------------------------
---------------------Data------------------------
-------------------------------------------------

insert into TaiKhoanThuong values (1, 'abc', '1abc@cba.com', '1203098')
insert into TaiKhoanThuong values (2, '2 abc', '2abc@cba.com', '1203098')
insert into TaiKhoanThuong values (3, '3 abc', '3abc@cba.com', '1203098')
insert into TaiKhoanThuong values (4, '4 abc', '4abc@cba.com', '1203098')
insert into TaiKhoanThuong values (5, '5 abc', '5abc@cba.com', '1203098')

insert into DiaChiDoanhNghiep values (1, '123 ttt', '234 ttt', '345 ttt')
insert into DiaChiDoanhNghiep values (2, '123 aaa', '234 aaa', '345 aaa')

insert into TaiKhoanDoanhNghiep values(1, 'dn1', '321', 'chung toi dn1', 'www.dn1.com', 'dn1@gmail.com', '0', '0', 1)
insert into TaiKhoanDoanhNghiep values(2, 'dn2', '321', 'chung toi dn2', 'www.dn2.com', 'dn2@gmail.com', '0', '0', 2)


insert into TAIKHOAN values ('kh1', 'kh1', null, 1, 1)
insert into TAIKHOAN values ('kh2', 'kh2', null, 2, 1)
insert into TAIKHOAN values ('kh3', 'kh3', null, 3, 1)
insert into TAIKHOAN values ('kh4', 'kh4', null, 4, 1)
insert into TAIKHOAN values ('kh5', 'kh5', null, 5, 1)
insert into TAIKHOAN values ('dn1', 'dn1', 1, null, 1)
insert into TAIKHOAN values ('dn2', 'dn2', 2, null, 1)

insert into LoaiVoucher values (1, 'giai tri')
insert into LoaiVoucher values (2, 'lam dep')
insert into LoaiVoucher values (3, 'an uong')
insert into LoaiVoucher values (4, 'xem phim')

insert into KhuVuc values (1, 'ho chi minh')
insert into KhuVuc values (2, 'ha noi')
insert into KhuVuc values (3, 'hue')
insert into KhuVuc values (4, 'da nang')

insert into HinhAnh values (1, 'hinh1', 'hinh1', 'hinh1', 'hinh1', 'hinh1')
insert into HinhAnh values (2, 'hinh2', 'hinh2', 'hinh2', 'hinh2', 'hinh2')
insert into HinhAnh values (3, 'hinh3', 'hinh3', 'hinh3', 'hinh3', 'hinh3')
insert into HinhAnh values (4, 'hinh4', 'hinh4', 'hinh4', 'hinh4', 'hinh4')
insert into HinhAnh values (5, 'hinh5', 'hinh5', 'hinh5', 'hinh5', 'hinh5')
insert into HinhAnh values (6, 'hinh6', 'hinh6', 'hinh6', 'hinh6', 'hinh6')
insert into HinhAnh values (7, 'hinh7', 'hinh7', 'hinh7', 'hinh7', 'hinh7')
insert into HinhAnh values (8, 'hinh8', 'hinh8', 'hinh8', 'hinh8', 'hinh8')
insert into HinhAnh values (9, 'hinh9', 'hinh9', 'hinh9', 'hinh9', 'hinh9')
insert into HinhAnh values (10, 'hinh10', 'hinh10', 'hinh10', 'hinh10', 'hinh10')
insert into HinhAnh values (11, 'hinh11', 'hinh11', 'hinh11', 'hinh11', 'hinh11')
insert into HinhAnh values (12, 'hinh12', 'hinh12', 'hinh12', 'hinh12', 'hinh12')
insert into HinhAnh values (13, 'hinh13', 'hinh13', 'hinh13', 'hinh13', 'hinh13')
insert into HinhAnh values (14, 'hinh14', 'hinh14', 'hinh14', 'hinh14', 'hinh14')
insert into HinhAnh values (15, 'hinh15', 'hinh15', 'hinh15', 'hinh15', 'hinh15')
insert into HinhAnh values (16, 'hinh16', 'hinh16', 'hinh16', 'hinh16', 'hinh16')
insert into HinhAnh values (17, 'hinh17', 'hinh17', 'hinh17', 'hinh17', 'hinh17')
insert into HinhAnh values (18, 'hinh18', 'hinh18', 'hinh18', 'hinh18', 'hinh18')
insert into HinhAnh values (19, 'hinh19', 'hinh19', 'hinh19', 'hinh19', 'hinh19')
insert into HinhAnh values (20, 'hinh20', 'hinh20', 'hinh20', 'hinh20', 'hinh20')

--select * from taikhoandoanhnghiep

insert into Voucher values (1, N'Nhiệt Kế Điện Tử', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							100000, 50000, 50, 20, 0, 180, 1, 1, 2, 1, 1, 1)
insert into Voucher values (2, N'Buffet Nướng Lẩu Seoul Jung', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							200000, 50000, 10, 2, 0, 180, 1, 2, 2, 1, 2, 1)
insert into Voucher values (3, N'Buffet Nhật 101 Món', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'),
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ',  
							300000, 50000, 30, 10, 0, 180, 1, 3, 2, 1, 2, 1)
insert into Voucher values (4, N'Century Riverside Hotel Huế', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							400000, 50000, 90, 50, 0, 180, 1, 4, 2, 1, 1, 1)
insert into Voucher values (5, N'Thiên Đường Nghỉ Dưỡng Furama', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							500000, 50000, 20, 10, 0, 180, 1, 1, 2, 1, 1, 1)
insert into Voucher values (6, N'Buffet Chay Tại Bồ Đề Tâm', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							600000, 50000, 80, 40, 0, 180, 1, 2, 2, 1, 2, 1)
insert into Voucher values (7, N'Nhà Hàng Hải Sản', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							700000, 50000, 50, 30, 0, 180, 1, 3, 2, 1, 2, 1)
insert into Voucher values (8, N'Edena Chăn Ga Gối Đệm', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							800000, 50000, 60, 10, 0, 180, 1, 4, 2, 1, 2, 1)
insert into Voucher values (9, N'Nhà Hàng BBQ Chicken', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							900000, 50000, 30, 10, 0, 180, 1, 1, 2, 1, 1, 1)
insert into Voucher values (10, N'Món Ngon Nhật Bản Tại Hi Sushi', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							1000000, 50000, 50, 20, 0, 180, 1, 2, 2, 1, 1, 1)
insert into Voucher values (11, N'NRed Beach Resort & Spa', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							1100000, 50000, 90, 20, 0, 180, 1, 3, 1, 2, 2, 1)
insert into Voucher values (12, N'Buffet Nướng & Lẩu Chipa', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							1200000, 50000, 50, 40, 0, 180, 1, 4, 1, 2, 1, 1)
insert into Voucher values (13, N'Picnic Cuối Tuần', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							1300000, 50000, 50, 10, 0, 180, 1, 1, 1, 2, 2, 1)
insert into Voucher values (14, N'Six Senses Côn Đảo Resort', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							1400000, 50000, 90, 60, 0, 180, 1, 2, 1, 2, 2, 1)
insert into Voucher values (15, N'Mỹ Phẩm Bourjois Paris', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							1500000, 50000, 90, 80, 0, 180, 1, 3, 1, 2, 2, 1)
insert into Voucher values (16, N'Máy Ép Đa Năng Scarlett', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							1600000, 50000, 70, 60, 0, 180, 1, 4, 1, 2, 2, 1)
insert into Voucher values (17, N'Indian Foot Massage', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							1700000, 50000, 80, 40, 0, 180, 1, 1, 1, 2, 2, 1)
insert into Voucher values (18, N'Mũ Xinh Đi Biển', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							1800000, 50000, 50, 20, 0, 180, 1, 2, 1, 2, 2, 1)
insert into Voucher values (19, N'Máy Tính Bảng H100 Korea', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							1900000, 50000, 50, 40, 0, 180, 1, 3, 1, 2, 1, 1)
insert into Voucher values (20, N'Đèn Kẹp Đọc Sách', convert(datetime,'5/1/2012'), convert(datetime,'12/30/2012'), 
							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
							2000000, 50000, 50, 50, 0, 180, 1, 4, 1, 2, 1, 1)
--select * from Voucher

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

-------------------------------------------------
------------------Procedure----------------------
-------------------------------------------------

---------------------
-------select--------
---------------------

create proc sp_ChiTietDonHangXem as 
begin tran ChiTietDonHangXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from ChiTietDonHang
commit tran ChiTietDonHangXem

--exec sp_ChiTietDonHangXem

create proc sp_HinhAnhXem as
begin tran HinhAnhXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from HinhAnh
commit tran HinhAnhXem

create proc sp_CommentXem as 
begin tran CommentXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Comment
commit tran CommentXem

--exec sp_CommentXem

create proc sp_DiaChiDoanhNghiepXem as 
begin tran DiaChiDoanhNghiepXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from DiaChiDoanhNghiep
commit tran DiaChiDoanhNghiepXem

--exec sp_DiaChiDoanhNghiepXem

create proc sp_DonHangXem as 
begin tran DonHangXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from DonHang
commit tran DonHangXem

--exec sp_DonHangXem

create proc sp_EmailXem as 
begin tran EmailXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Email
commit tran EmailXem

--exec sp_EmailXem

create proc sp_KhuVucXem as 
begin tran KhuVucXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from KhuVuc
commit tran KhuVucXem

--exec sp_KhuVucXem

create proc sp_LoaiVoucherXem as 
begin tran LoaiVoucherXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from LoaiVoucher
commit tran LoaiVoucherXem

--exec sp_LoaiVoucherXem

create proc sp_TaiKhoanXem as 
begin tran TaiKhoanXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from TaiKhoan
commit tran TaiKhoanXem

--EXEC sp_TaiKhoanXem

create proc sp_TaiKhoanXemUser @userIn nvarchar(100) as 
begin tran TaiKhoanXemUser
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from TaiKhoan where username = @userIn
commit tran TaiKhoanXemUser

--EXEC sp_TaiKhoanXemUser 'kh1'

create proc sp_TaiKhoanDoanhNghiepXem as 
begin tran TaiKhoanDoanhNghiepXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from TaiKhoanDoanhNghiep
commit tran TaiKhoanDoanhNghiepXem

--EXEC sp_TaiKhoanDoanhNghiepXem

create proc sp_TaiKhoanThuongXem as 
begin tran TaiKhoanThuongXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from TaiKhoanThuong
commit tran TaiKhoanThuongXem

--EXEC sp_TaiKhoanThuongXem

--xem chi tiet don hang co them tham so ma don hang
create proc sp_ChiTietDonHangXemMDH @madhInput int as 
begin tran ChiTietDonHangXemMDH
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from ChiTietDonHang where MADH = @madhInput
commit tran ChiTietDonHangXemMDH

--EXEC sp_ChiTietDonHangXemMDH 1

--xem comment cua mot san pham
create proc sp_CommentXemVoucher @maVoucherInput int as 
begin tran CommentXemVoucher
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Comment where MAVoucherComment = @maVoucherInput
commit tran CommentXemVoucher

--EXEC sp_CommentXemVoucher 1

--xem don hang cua mot user
create proc sp_DonHangXemUser @userInput nvarchar(100) as 
begin tran DonHangXemUser
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from DonHang where TKusername = @userInput
commit tran DonHangXemUser



--xem don hang cua mot ngay
create proc sp_DonHangXemNgaymua @dateInput datetime as 
begin tran DonHangXemNgaymua
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from DonHang where NgayMua = @dateInput
commit tran DonHangXemNgaymua

--xem don hang cua mot ngay cua mot user
create proc sp_DonHangXemNgaymua @dateInput datetime, @userInput int as 
begin tran DonHangXemNgaymua
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from DonHang where NgayMua = @dateInput and TKusername = @userInput
commit tran DonHangXemNgaymua

--xem tat ca voucher
create proc sp_VoucherXem as 
begin tran VoucherXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher
commit tran VoucherXem

--exec sp_VoucherXem

--xem voucher theo khu vuc
create proc sp_VoucherXemKhuVuc @kvInput int as 
begin tran VoucherXemKhuVuc
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher where makhuvuc = @kvInput
commit tran VoucherXemKhuVuc

--exec sp_VoucherXemKhuVuc 2

--xem voucher theo loai
create proc sp_VoucherXemloai @typeInput int as 
begin tran VoucherXemloai
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher where maloaivoucher = @typeInput
commit tran VoucherXemloai

--exec sp_VoucherXemloai 2

--xem voucher theo loai + khu vuc
create proc sp_VoucherXemloaiKV @typeInput int, @kvInput int as 
begin tran VoucherXemloaiKV
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher where maloaivoucher = @typeInput and makhuvuc = @kvInput
commit tran VoucherXemloaiKV

--exec sp_VoucherXemloaiKV 1,2

--xem voucher theo Doanh Nghiep
create proc sp_VoucherXemDN @dnInput int as 
begin tran VoucherXemDN
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher where madoanhnghiep = @dnInput
commit tran VoucherXemDN

--exec sp_VoucherXemDN 1

---------------------
-------delete--------
---------------------

--bo voucher theo ma voucher
create proc sp_del_voucher_ma @mavoucherIn int as
begin tran del_voucher_ma
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from Voucher where mavoucher = @mavoucherIn
commit tran del_voucher_ma

--exec sp_del_voucher_ma 1

--bo voucher theo ngay ket thuc
create proc sp_del_voucher_ngaykt @ngayvoucherIn datetime as
begin tran del_voucher_ngaykt
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from Voucher where thoigianktkm = @ngayvoucherIn
commit tran del_voucher_ngaykt

--exec sp_del_voucher_ngaykt '2012-12-30 00:00:00.000'

--bo voucher theo doanh nghiep
create proc sp_del_voucher_dn @madnIn int as
begin tran del_voucher_dn 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from Voucher where madoanhnghiep = @madnIn
commit tran del_voucher_dn 

--exec sp_del_voucher_dn 1

--bo voucher theo khu vuc
create proc sp_del_voucher_kv @makvIn int as
begin tran del_voucher_kv 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from Voucher where makhuvuc = @makvIn
commit tran del_voucher_kv

--exec sp_del_voucher_kv 1

--bo voucher theo loai voucher
create proc sp_del_voucher_loai @maloaiIn int as
begin tran del_voucher_loai 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from Voucher where maloaivoucher = @maloaiIn
commit tran del_voucher_loai

--exec sp_del_voucher_loai 1

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--select * from chitietdonhang

--xoa chi tiet don hang theo ma don hang
create proc sp_del_CTDH_ma @maIn int as
begin tran del_CTDH_ma 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from chitietdonhang where madh = @maIn
commit tran del_CTDH_ma

--xoa chi tiet don hang theo ma voucher
create proc sp_del_CTDH_voucher @mavoucherIn int as
begin tran del_CTDH_voucher 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from chitietdonhang where voucherdh = @mavoucherIn
commit tran del_CTDH_voucher

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa comment theo ma voucher
create proc sp_del_com_ma @mavoucher int as
begin tran del_com_m 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from comment where mavouchercomment = @mavoucher
commit tran del_com_m

--xoa comment theo user
create proc sp_del_com_tk @tk nvarchar(100) as
begin tran del_com_tk 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from comment where tkcomment = @tk
commit tran del_com_tk

create proc sp_del_com_tk_ma @tk nvarchar(100), @mavoucher int as
begin tran del_com_tk_ma
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from comment where tkcomment = @tk and mavouchercomment = @mavoucher
commit tran del_com_tk_ma

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa don hang theo ma don hang
create proc sp_del_DH_ma @madh int as
begin tran del_DH_ma 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from donhang where madonhang = @madh
commit tran del_DH_ma

--xoa don hang theo ten tai khoan
create proc sp_del_DH_tk @tk nvarchar(100) as
begin tran del_DH_tk 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from donhang where tkusername = @tk
commit tran del_DH_tk

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa email
create proc sp_del_mail @tk nvarchar(100) as
begin tran del_mail 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from email where email = @tk
commit tran del_mail

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa hinh
create proc sp_del_hinh @ma int as
begin tran del_hinh 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from hinhanh where mahinhanh = @ma
commit tran del_hinh

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa khu vuc
create proc sp_del_khuvuc @ma int as
begin tran del_khuvuc
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from khuvuc where makhuvuc = @ma
commit tran del_khuvuc

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa loai voucher
create proc sp_del_loaivoucher @ma int as
begin tran del_loaivoucher
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from loaivoucher where maloaivoucher = @ma
commit tran del_loaivoucher

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa tai khoan
create proc sp_del_taikhoan @user nvarchar(100) as
begin tran del_taikhoan
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from taikhoan where username = @user
commit tran del_taikhoan

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

---------------------
-------insert--------
---------------------

--them vao tai khoan thuong
create proc sp_ins_taikhoanthuong @MAKHin int, @DIACHIin nvarchar(100), @EMAILin nvarchar(100), @SDTin nvarchar(100) as
begin tran ins_taikhoanthuong
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into taikhoanthuong values (@MAKHin, @DIACHIin, @EMAILin, @SDTin)
commit tran ins_taikhoanthuong

--exec sp_ins_taikhoanthuong 10, '234 gffgh', 'asd@sdf', '456456'

--them vao dia chi doanh nghiep
create proc sp_ins_dcdn @madcin int, @dc1in nvarchar(500), @dc2in nvarchar(500), @dc3in nvarchar(500) as
begin tran ins_dcdn
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into diachidoanhnghiep values (@madcin, @dc1in, @dc2in, @dc3in)
commit tran ins_dcdn

--exec sp_ins_dcdn 10, '112 asdasd', '213 asd', '3214 asd'

--them vao tai khoan doanh nghiep
create proc sp_ins_tkdn @madnin int, @tendnin nvarchar(100), @SDTin nvarchar(100), @intro nvarchar(500), @website nvarchar(100), @email nvarchar(100), @kd nvarchar(100), @vd nvarchar(100), @madc int as
begin tran ins_tkdn
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into taikhoandoanhnghiep values (@madnin, @tendnin, @SDTin, @intro, @website, @email, @kd, @vd,@madc)
commit tran ins_tkdn

--exec sp_ins_tkdn 10, 'dn10', '2343', 'ikasdhjhdfk', 'httpasdasdasdasd', 'askdh@sdfsf', 'asfasd', 'asdasd', 1

--them vao tai khoan 
create proc sp_ins_tk @userin nvarchar(100), @passin nvarchar(100), @madnin int, @makh int, @avai int as
begin tran ins_tk
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into taikhoan values (@userin, @passin, @madnin, @makh, @avai)
commit tran ins_tk

--exec sp_ins_tk 'kh10', '12313', 1, 1, 1

--them vao loai voucher 
create proc sp_ins_loaivoucher @main int, @tenin nvarchar(100) as
begin tran ins_laoivoucher
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into loaivoucher values (@main, @tenin)
commit tran ins_laoivoucher

--exec sp_ins_loaivoucher 10, 'super'

--them vao khu vuc
create proc sp_ins_kv @main int, @tenin nvarchar(100) as
begin tran ins_kv 
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into khuvuc values (@main, @tenin)
commit tran ins_kv 

--exec sp_ins_kv 10, 'go vap'

--them vao hinh anh
create proc sp_ins_ha @main int, @hinhdaidien nvarchar(500), @thumb nvarchar(500), @h1 nvarchar(500), @h2 nvarchar(500), @h3 nvarchar(500) as
begin tran ins_kv 
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into hinhanh values (@main, @hinhdaidien,@thumb, @h1, @h2, @h3)
commit tran ins_kv 

--exec sp_ins_ha 110, 'a', 'a','a','a','a'

--them vao voucher
create proc sp_ins_voucher @main int, @ten nvarchar(100), @bdkm datetime, @ktkm datetime, @noidung text, @goc int, @km int, @slkho int, @slmua int, @vip int, @gioban int, @trangthaiduyet int, @hinh int, @loaivoucher int, @makhuvuc int, @madn int, @avai int as
begin tran ins_voucher
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into voucher values (@main, @ten, @bdkm, @ktkm, @noidung, @goc, @km, @slkho, @slmua, @vip, @gioban, @trangthaiduyet, @hinh, @loaivoucher, @makhuvuc, @madn, @avai)
commit tran ins_voucher

--exec sp_ins_voucher 120, N'Đèn Kẹp Đọc Sách', '5/1/2012', '12/30/2012', 
--							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
--							2000000, 50000, 50, 50, 0, 180, 1, 4, 1, 2, 1, 1

--them vao don hang
create proc sp_ins_dh @main int, @tongin int, @ngaymuain datetime, @tk nvarchar(100) as
begin tran ins_dh 
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into Donhang values (@main, @tongin, @ngaymuain, @tk)
commit tran ins_dh 

--exec sp_ins_dh 10, 100, '2012-12-30', 'kh1'

--them vao chi tiet don hang
create proc sp_ins_ctdh @sl int, @ttgh nvarchar(100), @ttsd nvarchar(100), @langiao int, @ngay datetime, @ma int, @voucher int as
begin tran ins_ctdh 
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into chitietdonhang values (@sl, @ttgh, @ttsd, @langiao, @ngay, @ma, @voucher)
commit tran ins_ctdh 
--exec sp_ins_ctdh 10, N'Đã giao', N'Bình thường', 1, '2012-12-30', 10, 120


--them vao comment
create proc sp_ins_com @nd text, @ngay datetime, @user nvarchar(100), @voucher int as
begin tran ins_com 
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into comment values (@nd, @ngay, @user, @voucher)
commit tran ins_com
--exec sp_ins_com 'ba con ga', '2012-12-30', 'kh1', 120

--them vao email
create proc sp_ins_mail @mail nvarchar(100) as
begin tran ins_mail  
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into email values (@mail)
commit tran ins_mail 
--exec sp_ins_mail 'asdasdasd'

---------------------
-------update--------
---------------------

--them vao tai khoan thuong
create proc sp_update_taikhoanthuong @MAKHin int, @DIACHIin nvarchar(100), @EMAILin nvarchar(100), @SDTin nvarchar(100) as
begin tran update_taikhoanthuong
	SET TRANSACTION ISOLATION LEVEL read committed
	update taikhoanthuong set diachi = @DIACHIin, email = @EMAILin, sdt = @SDTin where makh = @MAKHin
commit tran update_taikhoanthuong

--exec sp_update_taikhoanthuong 10, '890 gffgh', 'asd@sdf', '456456'

--them vao dia chi doanh nghiep
create proc sp_update_dcdn @madcin int, @dc1in nvarchar(500), @dc2in nvarchar(500), @dc3in nvarchar(500) as
begin tran update_dcdn
	SET TRANSACTION ISOLATION LEVEL read committed
	update diachidoanhnghiep set dc1 = @dc1in, dc2 = @dc2in, dc3 = @dc3in where madc = @madcin
commit tran update_dcdn

--exec sp_update_dcdn 10, '222 asdasd', '213 asd', '3214 asd'

--them vao tai khoan doanh nghiep
create proc sp_update_tkdn @madnin int, @tendnin nvarchar(100), @SDTin nvarchar(100), @intro nvarchar(500), @website nvarchar(100), @email nvarchar(100), @kd nvarchar(100), @vd nvarchar(100), @madc int as
begin tran update_tkdn
	SET TRANSACTION ISOLATION LEVEL read committed
	update taikhoandoanhnghiep set tendn = @tendnin, sdtdn = @SDTin, gioithieu = @intro, website = @website, email = @email, kinhdo = @kd, vido = @vd, madiachidn = @madc where madn = @madnin
commit tran update_tkdn

--exec sp_update_tkdn 10, 'dn110', '2343', 'ikasdhjhdfk', 'httpasdasdasdasd', 'askdh@sdfsf', 'asfasd', 'asdasd', 1

--them vao tai khoan 
create proc sp_update_tk @userin nvarchar(100), @passin nvarchar(100), @madnin int, @makh int, @avai int as
begin tran update_tk
	SET TRANSACTION ISOLATION LEVEL read committed
	update taikhoan set  password = @passin, madn = @madnin, makh = @makh, TKISAVAILABLE = @avai where username = @userin
commit tran update_tk

--exec sp_update_tk 'kh10', '1213', 1, 1, 1

--them vao loai voucher 
create proc sp_update_loaivoucher @main int, @tenin nvarchar(100) as
begin tran update_laoivoucher
	SET TRANSACTION ISOLATION LEVEL read committed
	update loaivoucher set tenloaivoucher = @tenin where maloaivoucher = @main
commit tran update_laoivoucher

--exec sp_update_loaivoucher 10, 'go te'

--them vao khu vuc
create proc sp_update_kv @main int, @tenin nvarchar(100) as
begin tran update_kv 
	SET TRANSACTION ISOLATION LEVEL read committed
	update khuvuc set  tenkhuvuc = @tenin where makhuvuc = @main
commit tran update_kv 

--exec sp_update_kv 10, 'go te'

--them vao hinh anh
create proc sp_update_ha @main int, @hinhdaidien nvarchar(500), @thumb nvarchar(500), @h1 nvarchar(500), @h2 nvarchar(500), @h3 nvarchar(500) as
begin tran update_kv 
	SET TRANSACTION ISOLATION LEVEL read committed
	update hinhanh set hinhdaidien = @hinhdaidien, hinhthumbnail = @thumb, hinh1 = @h1, hinh2 = @h2, hinh3 = @h3 where mahinhanh = @main
commit tran update_kv 

--exec sp_update_ha 10, 'b', 'b', 'b', 'b', 'b'

--them vao voucher
create proc sp_update_voucher @main int, @ten nvarchar(100), @bdkm datetime, @ktkm datetime, @noidung text, @goc int, @km int, @slkho int, @slmua int, @vip int, @gio int, @ttduyet int, @hinh int, @loaivoucher int, @makhuvuc int, @madn int, @trangthai int as
begin tran update_v 
	SET TRANSACTION ISOLATION LEVEL read committed
	update voucher set TENVOUCHER=@ten, THOIGIANBDKM=@bdkm, THOIGIANKTKM=@ktkm, NOIDUNG=@noidung, GIAGOC=@goc, GIAKHUYENMAI=@km, SOLUONGTRONGKHO=@slkho, SOLUONGDAMUA=@slmua, THUOCTINHVIP=@vip,TONGSOGIOBAN= @gio,TRANGTHAIDUYET=@ttduyet ,MAHINH=@hinh, MALOAIVOUCHER=@loaivoucher, MAKHUVUC=@makhuvuc, MADOANHNGHIEP=@madn where MAVOUCHER=@main
commit tran update_v 

--exec sp_update_voucher 120, N'Đèn Kẹ Đọc Sách', '5/1/2012', '12/30/2012', 
--							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
--							2000000, 50000, 50, 50, 0, 180, 1, 4, 1, 2, 1, 1

--them vao donhang
create proc sp_update_dh @main int, @tongin int, @ngaymuain datetime, @tk nvarchar(100) as
begin tran update_dh 
	SET TRANSACTION ISOLATION LEVEL read committed
	update Donhang set tongtien = @tongin, ngaymua = @ngaymuain, tkusername = @tk where madonhang = @main
commit tran update_dh 
--exec sp_update_dh 10, 110, '2012-12-30', 'kh1'


--them vao chi tiet don hang
create proc sp_update_ctdh @sl int, @ttgh nvarchar(100), @ttsd nvarchar(100), @langiao int, @ngay datetime, @ma int, @voucher int as
begin tran update_ctdh 
	SET TRANSACTION ISOLATION LEVEL read committed
	update chitietdonhang set soluongmua = @sl, trangthaigiaohang = @ttgh, TRANGTHAISUDUNG=@ttsd, NGAYGIAOHANG=@ngay where LANGIAOHANGTHU= @langiao and MADH=@ma and VOUCHERDH=@voucher
commit tran update_ctdh 
--exec sp_update_ctdh 10, N'Đã giao', N'Bình thường', 1, '2012-12-29', 10, 120

--them vao comment
create proc sp_update_com @nd text, @ngay datetime, @user nvarchar(100), @voucher int as
begin tran update_com 
	SET TRANSACTION ISOLATION LEVEL read committed
	update comment set noidung = @nd where tkcomment = @user and mavouchercomment = @voucher, thoigian = @ngay
commit tran update_com
--exec sp_update_com 'bon con ga', '2012-12-30', 'kh1', 120

--them vao email
create proc sp_update_mail @mailcu nvarchar(100), @mailmoi nvarchar(100) as
begin tran update_mail  
	SET TRANSACTION ISOLATION LEVEL read committed
	update email set email = @mailmoi where email = @mailcu
commit tran update_mail 

--exec sp_update_mail 'asdasdasd', 'hushasdasd'









--update tinh trang availabe cua mot voucher la update thuoc tinh isavailable
--tuong tu voi tai khoan