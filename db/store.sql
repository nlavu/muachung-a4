
alter proc sp_laysoluongvouchertheoloai @maloai int as
DECLARE @soluong int;
begin tran laysoluongvouchertheoloai 
SET TRANSACTION ISOLATION LEVEL read committed
select @soluong = COUNT(MAVOUCHER) from Voucher where MALOAIVOUCHER = @maloai;
commit tran laysoluongvouchertheoloai 
return @soluong;
go

DECLARE @soluong int
exec @soluong = sp_laysoluongvouchertheoloai 1
print @soluong

create proc sp_Top6VoucherTheoMaLoai @maloai int as
begin tran top6vouchertheoma 
SET TRANSACTION ISOLATION LEVEL read committed
select Top 6 * from Voucher where MALOAIVOUCHER = @maloai;
commit tran top6vouchertheoma 
go
create proc sp_VoucherXemMaVoucher @mavoucher int as 
begin tran VoucherXemmavoucher
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher where MAVOUCHER = @mavoucher;
commit tran VoucherXemmavoucher
go

--------------xem voucher theo ma------------------
create proc sp_SelectVoucherTheoMa @mavoucher int as 
begin tran VoucherXemtheoma
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher where MAVOUCHER = @mavoucher;
commit tran VoucherXemtheoma
go

exec sp_SelectVoucherTheoMa 5;

create proc sp_LayMaHinhAnhTheoMaVoucher @mavoucher int as 
DECLARE @mahinhanh int;
begin tran laymahinhanhtheomavoucher
	SET TRANSACTION ISOLATION LEVEL read committed
	select @mahinhanh = MAHINH from Voucher where MAVOUCHER = @mavoucher;
commit tran laymahinhanhtheomavoucher
return @mahinhanh;
go

DECLARE @mahinhanh int;
exec @mahinhanh = sp_LayMaHinhAnhTheoMaVoucher 6;
print(@mahinhanh)

create proc sp_LayHinhAnhTheoMaHinh @mahinh int as
begin tran LayHinhAnhTheoMaHinh
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from HinhAnh where MAHINHANH = @mahinh;
commit tran LayHinhAnhTheoMaHinh
go

exec sp_LayHinhAnhTheoMaHinh 5

create proc sp_LayMaDoanhNghiepTheoMaVoucher @mavoucher int as 
DECLARE @madoanhnghiep int;
begin tran LayMaDoanhNghiepTheoMaVouche
	SET TRANSACTION ISOLATION LEVEL read committed
	select @madoanhnghiep = MADOANHNGHIEP from Voucher where MAVOUCHER = @mavoucher;
commit tran LayMaDoanhNghiepTheoMaVouche
return @madoanhnghiep;
go

DECLARE @madoanhnghiep int;
exec @madoanhnghiep = sp_LayMaDoanhNghiepTheoMaVoucher 10;
print(@madoanhnghiep)

create proc sp_LayDoanhNghiepTheoMadn @madoanhnghiep int as
begin tran LayDoanhNghiepTheoMaDN
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from TaiKhoanDoanhNghiep tk, DiaChiDoanhNghiep dc where tk.MADN = @madoanhnghiep and tk.MADIACHIDN = dc.MADC;
commit tran LayDoanhNghiepTheoMaDN
go

exec sp_LayDoanhNghiepTheoMadn 2

exec sp_Top6VoucherTheoMa 3