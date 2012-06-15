
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

exec sp_Top6VoucherTheoMa 3;