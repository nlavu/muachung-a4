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
MAHINHANH INT IDENTITY NOT NULL,
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
go
--2
alter table ChiTietDonHang add constraint c_trangthaisudung check (TRANGTHAISUDUNG in (N'Bình thường', N'Hoàn tiền'));
go
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


insert into DiaChiDoanhNghiep values (1, N'227 nguyễn văn cừ quận 5 tphcm', N'227 nguyễn văn cừ quận 5 tphcm', N'227 nguyễn văn cừ quận 5 tphcm')
insert into DiaChiDoanhNghiep values (2, N'372 nhật tảo quận 10 tphcm', N'372 nhật tảo quận 10 tphcm', N'372 nhật tảo quận 10 tphcm')


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

insert into HinhAnh values ('images/sanpham/1.jpg','images/sanpham/2.jpg', 'images/sanpham/3.jpg', 'images/sanpham/4.jpg','images/sanpham/4.jpg')
insert into HinhAnh values ('images/sanpham/5.jpg','images/sanpham/6.jpg', 'images/sanpham/7.jpg', 'images/sanpham/8.jpg','images/sanpham/8.jpg')
insert into HinhAnh values ('images/sanpham/9.jpg','images/sanpham/10.jpg', 'images/sanpham/11.jpg', 'images/sanpham/12.jpg','images/sanpham/12.jpg')
insert into HinhAnh values ('images/sanpham/13.jpg','images/sanpham/14.jpg', 'images/sanpham/15.jpg', 'images/sanpham/16.jpg','images/sanpham/16.jpg')
insert into HinhAnh values ('images/sanpham/17.jpg','images/sanpham/18.jpg', 'images/sanpham/19.jpg', 'images/sanpham/20.jpg','images/sanpham/20.jpg')
insert into HinhAnh values ('images/sanpham/21.jpg','images/sanpham/22.jpg', 'images/sanpham/23.jpg', 'images/sanpham/24.jpg','images/sanpham/24.jpg')
insert into HinhAnh values ('images/sanpham/denled1.jpg','images/sanpham/denled2.jpg', 'images/sanpham/denled3.jpg', 'images/sanpham/denled4.jpg','images/sanpham/denled4.jpg')
insert into HinhAnh values ('images/sanpham/25.jpg','images/sanpham/26.jpg', 'images/sanpham/27.jpg', 'images/sanpham/28.jpg','images/sanpham/28.jpg')
insert into HinhAnh values ('images/sanpham/29.jpg','images/sanpham/30.jpg', 'images/sanpham/31.jpg', 'images/sanpham/32.jpg','images/sanpham/32.jpg')
insert into HinhAnh values ('images/sanpham/33.jpg','images/sanpham/34.jpg', 'images/sanpham/35.jpg', 'images/sanpham/36.jpg','images/sanpham/36.jpg')
insert into HinhAnh values ('images/sanpham/37.jpg','images/sanpham/38.jpg', 'images/sanpham/39.jpg', 'images/sanpham/40.jpg','images/sanpham/40.jpg')
insert into HinhAnh values ('images/sanpham/41.jpg','images/sanpham/42.jpg', 'images/sanpham/43.jpg', 'images/sanpham/44.jpg','images/sanpham/44.jpg')
insert into HinhAnh values ('images/sanpham/45.jpg','images/sanpham/46.jpg', 'images/sanpham/47.jpg', 'images/sanpham/48.jpg','images/sanpham/48.jpg')
insert into HinhAnh values ('images/sanpham/dejacafe1.jpg','images/sanpham/dejacafe2.jpg', 'images/sanpham/dejacafe3.jpg', 'images/sanpham/dejacafe4.jpg','images/sanpham/dejacafe4.jpg')
insert into HinhAnh values ('images/sanpham/53.jpg','images/sanpham/54.jpg', 'images/sanpham/55.jpg', 'images/sanpham/56.jpg','images/sanpham/56.jpg')
insert into HinhAnh values ('images/sanpham/57.jpg','images/sanpham/58.jpg', 'images/sanpham/59.jpg', 'images/sanpham/60.jpg','images/sanpham/60.jpg')
insert into HinhAnh values ('images/sanpham/61.jpg','images/sanpham/62.jpg', 'images/sanpham/63.jpg', 'images/sanpham/64.jpg','images/sanpham/64.jpg')
insert into HinhAnh values ('images/sanpham/65.jpg','images/sanpham/66.jpg', 'images/sanpham/67.jpg', 'images/sanpham/68.jpg','images/sanpham/68.jpg')
insert into HinhAnh values ('images/sanpham/69.jpg','images/sanpham/70.jpg', 'images/sanpham/71.jpg', 'images/sanpham/72.jpg','images/sanpham/72.jpg')
insert into HinhAnh values ('images/sanpham/73.jpg','images/sanpham/74.jpg', 'images/sanpham/75.jpg', 'images/sanpham/76.jpg','images/sanpham/76.jpg')
insert into HinhAnh values ('images/sanpham/77.jpg','images/sanpham/78.jpg', 'images/sanpham/79.jpg', 'images/sanpham/80.jpg','images/sanpham/80.jpg')
insert into HinhAnh values ('images/sanpham/81.jpg','images/sanpham/82.jpg', 'images/sanpham/83.jpg', 'images/sanpham/84.jpg','images/sanpham/84.jpg')
insert into HinhAnh values ('images/sanpham/85.jpg','images/sanpham/86.jpg', 'images/sanpham/87.jpg', 'images/sanpham/88.jpg','images/sanpham/88.jpg')
insert into HinhAnh values ('images/sanpham/89.jpg','images/sanpham/90.jpg', 'images/sanpham/91.jpg', 'images/sanpham/92.jpg','images/sanpham/92.jpg')
insert into HinhAnh values ('images/sanpham/93.jpg','images/sanpham/94.jpg', 'images/sanpham/95.jpg', 'images/sanpham/96.jpg','images/sanpham/96.jpg')
insert into HinhAnh values ('images/sanpham/97.jpg','images/sanpham/98.jpg', 'images/sanpham/99.jpg', 'images/sanpham/100.jpg','images/sanpham/100.jpg')
insert into HinhAnh values ('images/sanpham/101.jpg','images/sanpham/102.jpg', 'images/sanpham/103.jpg', 'images/sanpham/104.jpg','images/sanpham/104.jpg')
insert into HinhAnh values ('images/sanpham/105.jpg','images/sanpham/106.jpg', 'images/sanpham/107.jpg', 'images/sanpham/108.jpg','images/sanpham/108.jpg')
insert into HinhAnh values ('images/sanpham/109.jpg','images/sanpham/110.jpg', 'images/sanpham/111.jpg', 'images/sanpham/76.jpg','images/sanpham/112.jpg')







--select * from taikhoandoanhnghiep


insert into Voucher values (1, N'Salon Tùng', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'SALON TÙNG có nhiều dịch vụ chăm sóc tóc cho bạn lựa chọn như cắt tạo kiểu, sấy gội, duỗi phồng, nhuộm highlight thời trang, phục hồi tóc; các gói dịch vụ chăm sóc mi như uốn, nối; make up, làm đẹp cho móng… Các tay thợ lành nghề sẽ tư vấn cho bạn kiểu tóc và lựa chọn dịch vụ chăm sóc tóc sao cho thích hợp với gương mặt, độ khỏe và đặc điểm của sợi tóc… nhằm giảm thiểu các ảnh hưởng không tốt đến mái tóc của bạn trong quá trình làm đẹp.', 
							500000, 75000, 1000, 184, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (2, N'Giày Thể Thao Vianni Kids', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Sản phẩm Giày Thể Thao Vianni Kids được Win Win Shop nhập khẩu từ Hàn Quốc. Đây chính là lựa chọn hàng đầu của cha mẹ khi tìm cho con một đôi giày chất lượng, vừa đảm bảo an toàn cho bé, vừa tạo phong cách thời trang. Giày được được làm bằng chất liệu da tổng hợp mềm, đế giày làm từ nhựa dẻo với nhiều rãnh nhỏ, đặc biệt chống trơn trượt khi sử dụng trong trời mưa. Sản phẩm có kiểu dáng trẻ trung với màu sắc hồng, xanh dương tươi sáng và nổi bật. Màu hồng dịu dàng sẽ là lựa chọn tuyệt vời dành cho các bé gái, xanh dương là màu sắc trung tính nên phù hợp cho cả bé trai lẫn bé gái.', 
							250000, 125000, 500, 46, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (3, N'Tinh dầu thiên nhiên ', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Natural Essential Oil Co., Ltd là công ty hàng đầu Việt Nam chuyên về cung cấp tinh dầu hương thơm và các chiết xuất tự nhiên. Natural cũng là nhà cung cấp các sản phẩm dưỡng thể được làm hoàn toàn 100% từ thiên nhiên chuyên dùng cho ngành spa và trị liệu thẩm mỹ Aromatherapy. Do nguyên liệu được nhập khẩu trực tiếp từ châu Âu và đóng gói tại Việt Nam nên các mặt hàng do Natural cung cấp có chất lượng cao và giá bán cạnh tranh. Với nguồn gốc 100% từ thiên nhiên, các sản phẩm mang thương hiệu La champa do Natural phân phối luôn an toàn cho sức khỏe và thân thiện với môi trường.Đến với cửa hàng TINH DẦU THIÊN NHIÊN của công ty Natural Essential Oil, bạn sẽ ngập chìm trong hương thơm tự nhiên với nhiều loại tinh dầu khác nhau như: nhài, oải hương, hoa hồng, chanh, bạc hà, sả…Các sản phẩm khá đa dạng với: tinh dầu thiên nhiên, dầu dẫn, dầu massage…, phù hợp mọi nhu cầu của bạn.', 
							1000000, 50000, 200, 156, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (4, N'Thế Giới Nước Hoa', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Đến với Thế Giới Nước Hoa, bạn sẽ được đắm chìm trong thế giới mùi hương đầy quyến rũ, vô cùng lôi cuốn với hàng trăm loại nước hoa nổi tiếng đến từ khắp nơi trên thế giới. Thế Giới Nước Hoa giúp bạn khám phá vẻ đẹp tiềm ẩn của chính bạn để luôn quyến rũ trong mắt người khác phái và là tâm điểm chú ý trong những buổi hẹn hò', 
							265000, 129000, 200, 86, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (5, N'Tour Quần Đảo Bà Lụa Rừng Tràm Trà Sư 2n2đ', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Lần đầu tiên tại Việt Nam: Hình thức du lịch hoàn toàn mới, mang đến cho du khách “Một trải nghiệm mới – Một ấn tượng mới!”. Tận mắt chiêm ngưỡng vẻ đẹp hoang sơ của quần đảo Bà Lụa – "Vịnh Hạ Long của miền Nam" và thưởng thức các loại đặc sản đặc trưng vùng biển, hòa nhịp cùng đời sống của người dân xứ đảo Hòn Heo, khám phá rừng tràm Trà Sư hoang dã với các loài chim quý hiếm.Sau chuyến đi, bạn sẽ được tham gia một buổi offline với đoàn cùng ban tổ chức để cùng nhau chia sẻ cảm nhận của chuyến đi, giao lưu và chia sẻ hình ảnh được thực hiện bởi các “nhiếp ảnh gia” bán chuyên nghiệp ghi nhận những khoảnh khắc đáng nhớ của chuyến đi để rồi hẹn lần sau, sẽ lại cùng tham gia hành trình điểm đến kế tiếp của Savvy Connection Tour!', 
							2265000, 1129000, 50, 10, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (6, N'Usb Hoạt Hình 4GB', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'USB Hoạt Hình được làm bằng nhựa chống sốc nên có thể chống trầy xước, va đập và đặc biệt, có khả năng chống thấm nước rất tốt. Sản phẩm được sản xuất theo tiêu chuẩn, đa dạng về mẫu mã cũng như màu sắc cho bạn lựa chọn.Với chiếc móc bi bằng kim loại chắc chắn, những chiếc usb dễ thương này còn trở thành chiếc móc khoá phù hợp với xu hướng của giới trẻ năng động có thể mang theo bên mình mọi lúc mọi nơi để tiện sử dụngUSB Hoạt Hình có dung lượng lưu trữ 4GB, giúp bạn tha hồ lưu trữ và chia sẻ thông tin, tài liệu cùng bạn bè. Sản phẩm được bảo hành 06 tháng.', 
							265000, 129000, 100, 28, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (7, N'Đèn Led Super Line', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Đèn Led Cảm Ứng Superline gồm 10 bóng đèn led chiếu ánh sáng trắng. Đèn chiếu ánh sáng mát dịu, không gây hại mắt, đồng thời tạo ra không gian mát dịu trong ngày hè nóng nực. Đặc biệt, nếu nhà bạn có người già hay trẻ nhỏ thì đây sẽ là thiết bị chiếu sáng tiện ích giúp tránh những rủi ro có thể xảy ra mỗi khi di chuyển.ới cơ chế cảm ứng ánh sáng, Đèn Led Cảm Ứng Superline sẽ tự động phát sáng khi trời tối. Độ sáng của đèn sẽ tự động điều chỉnh theo độ tối không gian xung quanh đèn. Chiếc đèn sẽ giúp bạn và những người trong gia đình an toàn hơn khi di chuyển trong nhà mà không phải tốn công bật – tắt các thiết bị chiếu sáng khác. Vì vậy, Đèn Led Cảm Ứng Superline là sản phẩm siêu tiết kiệm điện được nhiều gia đình sử dụng.Ngoài tác dụng chiếu sáng, với thiết kế thon nhọn 2 đầu xinh xắn, Đèn Led Cảm Ứng Superline còn là vật trang trí dễ thương giúp không gian nhà bạn thêm sinh động. Chiếc đèn nhỏ xinh phát ra những tia sáng trắng dịu dàng trong đêm sẽ tạo không gian huyền dịu, mang đến sự ấm cúng cho ngôi nhà bạn.', 
							165000, 90000, 200, 45, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (8, N'Tokyo Sushi & Que', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Dưới cái nắng oi bức của trời hè, Tokyo Sushi & Que với một màu xanh lá ngập tràn mọi ngõ ngách và họa tiết trang trí sẽ mang đến cho bạn cảm giác thật nhẹ nhàng, mát dịu, gần gũi và thoải mái. Lối thiết kế nhà hàng mang phong cách Nhật Bản, bàn ghế sang trọng với gỗ và ghế lót nệm, Tokyo Sushi & Que là sự lựa chọn hoàn hảo cho những buổi sum vầy gia đình, những cuộc vui bè bạn lẫn gặp gỡ đối tác.
 
Bếp từ được thiết kế hiện đại đặt ngay chính giữa bàn ăn để làm nóng thức ăn nhanh. Hệ thống hút khói không tạo mùi, không gây cay mắt, đảm bảo cho thực khách luôn thoải mái khi thưởng thức món ngon tại nhà hàng.', 
							140000, 70000, 400, 145, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (9, N'Mũ Ủ Tóc', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Tóc cũng như bất cứ một cơ quan nào trong cơ thể, cũng cần được cung cấp dinh dưỡng thường xuyên. Lượng dinh dưỡng đó được cung cấp chủ yếu qua thực phẩm hằng ngày bạn ăn vào. Tuy nhiên, trong quá trình chế biến thực phẩm ở nhiệt độ cao, lượng chất dinh dưỡng bị hao hụt dần và nhiều khi thực phẩm không cung cấp đủ chất cho cơ thể. Khi đó, tóc cũng chịu chung tình trạng thiếu dưỡng chất và mất dần vẻ đẹp vốn có của nó. Sự tìm đến với hấp dầu là cách tốt để trả lại sinh lực cho tóc.MŨ Ủ TÓC CÁ NHÂN giúp tóc bạn hấp thụ tối đa các dưỡng chất từ kem dưỡng làm tóc mềm mượt, vừa giúp bạn tiết kiệm được thời gian và tiền bạc, giá thành rẻ hơn rất nhiều so với hấp tóc ở ngoài tiệm nhưng hiệu quả thì như nhau.', 
							320000, 160000, 50, 14, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (10, N'PDG Spa', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'PDG Spa với việc ứng dụng công nghệ lăn kim kết hợp tế bào gốc thực vật sẽ giúp bạn xoá tan nỗi ám ảnh về sẹo rỗ. Đây là phương pháp đa trị liệu dựa trên nguyên tắc kích thích sự tái sinh của mô tế bào đã mất đi và cơ chế tự làm lành vết thương của cơ thể, sẽ giúp bạn lấy lại làn da mịn màng tươi trẻ. Thiết bị lăn kim làm tăng nồng độ của collagen và elastin trong da của bạn, khiến các vết rạn da, nếp nhăn, vết sẹo và màu da không đồng đều được thay thế các collagen và có thể giúp làn da của bạn tự làm mới và sửa chữa.Công nghệ lăn kim kết hợp tế bào gốc thực vật không chỉ cải thiện sẹo rỗ, nếp nhăn mà còn cải thiện tất cả các hiện tượng lão hoá da khác trên bề mặt da. Trẻ hoá da bằng tế bào gốc là sử dụng tế bào gốc từ thực vật kích thích tế bào gốc dưới da, sẽ mang đến hiệu quả tốt trong việc chống lại quá trình lão hoá sinh học, kích thích sản xuất và kết nối các phân tử collagen trong da, đồng thời thẩm thấu xâm nhập vào bên trong, liên kết các mô bên dưới da nhằm duy trì và trẻ hoá cho làn da đồng thời trị sẹo, xoá nhăn hiệu quả vượt trội.', 
							1400000, 210000, 500, 230, 0, 90, 1, 1, 1, 2, 1, 1)

insert into Voucher values (11, N'Thời Trang Trẻ Em Kico', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Bộ sưu tập Friendly là sự hòa quyện của 4 chủ đề rất đỗi trẻ thơ và mang đậm tính nhân văn dành cho các bé trai và bé gái mang tên: Waves – Sóng biển; Nature’s colour – Sắc màu thiên nhiên; Summer fruit – Hoa trái mùa hè; Wildlife – Động vật hoang dã.Bộ sưu tập là sự thể hiện ước muốn của các bé luôn luôn muốn khám phá thiên nhiên để gần gũi và bảo vệ thiên nhiên. Bộ sưu tập sẽ mang đến cho các bé yêu luôn cảm thấy thoải mái, tự tin, nổi bật trong mùa hè này! Bé nhà bạn sẽ đáng yêu hơn rất nhiều với thời trang KICO đấy!', 
							150000, 79000, 1000, 540, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (12, N'Máy Massage Trị Liệu Doctor Family', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Máy Massage Trị Liệu Cao Cấp Family Doctor  AK-2000 II có 6 chế độ với chức năng riêng được sử dụng độc lập: Hamering - Đấm bóp, Acupuncture - Châm cứu, Naprapathy - Xoa bóp, Cupping - Giác hơi, Scraping - Cạo gió và Massage – Mát xa. Ngoài ra, máy còn có 4 chế độ với chức năng tự động được nghiên cứu và thử nghiệm lâm sàng cho hiệu quả đối với từng chức năng gồm: Body shaping - Thẩm mỹ, Neck/ shoulder – Đau cổ/ vai và Loin/ leg – Đau lưng/ bắp chân và một chế độ đặc biệt là “Lowering blood pressure - Giảm huyết áp” rất hiệu quả đối với bệnh cao huyết áp độ 1.Theo số liệu thống kê của Tổ chức Y tế Thế giới, tăng huyết áp (THA) ảnh hưởng đến sức khỏe của hơn 1 tỷ người trên toàn thế giới và là yếu tố nguy cơ tim mạch quan trọng nhất liên quan đến bệnh mạch vành, suy tim, bệnh mạch máu não và bệnh thận mãn tính. Có rất nhiều người hiện nay kể cả các bạn ở độ tuổi 25 đau đầu về vấn đề huyết áp. Áp lực công việc, chế độ ăn uống không hợp lý làm cho cơ thể phải đối đầu với bệnh huyết áp. Điều đáng lo, bệnh huyết áp là khởi nguồn của nhiều căn bệnh mãn tính nguy hiểm khác', 
							860000, 480000, 200, 30, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (13, N'Ẩm Thực 63', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Không gian rộng, sạch và thoáng, ẨM THỰC 63 được thiết kế theo phong cách hiện đại với tông vàng chủ đạo từ màu tường cho đến ánh đèn, những bộ bàn ghế vuông vức phủ khăn trắng tinh khôi. Điểm xuyết những chiếc đèn lồng lơ lửng trên khóm trúc, bờ tre tạo cho thực khách cảm giác thật ấm cúng và thư giãn khi đặt chân đến đây.Bạn có thể chọn cho mình một chỗ ngồi thật ưng ý ngay tại gian ngoài thoáng mát, rộng rãi. Trong phòng kín đáo, lịch sự, thích hợp cho những cuộc hẹn đặc biệt, gặp gỡ khách hàng. Phòng VIP riêng biệt của nhà hàng được thiết kế sang trọng, ấm cúng cho những buổi liên hoan công ty, họp mặt gia đình hoặc các buổi sinh nhật ấm cúng.', 
							150000, 70000, 200, 122, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (14, N'Deja Vu Café', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Deja Vu Café nằm trong con hẻm yên tĩnh trên khúc đường Điện Biên Phủ cạnh ngã tư Nguyễn Thượng Hiền. Kết hợp giữa nghệ thuật graffiti hiện đại trong một biệt thự cổ Tây Âu sang trọng, Deja Vu Café mang đến một phong cách cà phê đầy riêng biệt giữa Sài Gòn sầm uất.Ngoài sự chăm chút vào các không gian được mixed theo lối decore semi-classic, các thức uống và “món ăn chơi” tại Deja Vu mang đến sự khác biệt dành cho người ghé qua khám phá.Hãy trải nghiệm sự mới mẻ và đừng bỏ lỡ cơ hội ưu đãi trong dịp Hè này tại Deja Vu nhé!', 
							100000, 50000, 200, 140, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (15, N'Yến Sào Chấn Phi', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Trước bao áp lực của công việc, ảnh hưởng của môi trường công nghiệp nhiều ô nhiễm,… là tác nhân chính dẫn đến bệnh tật dần phát sinh trong cơ thể. Không chỉ có người lớn tuổi cảm thấy mệt mỏi và bức bối mà ngay cả những người trẻ tuổi cũng bắt đầu nảy sinh nhiều dấu hiệu suy nhược: giảm trí nhớ, stress, nhức mỏi các cơ, ăn ngủ không ngon, lão hóa sớm,…

Việc sử dụng các nguồn thực phẩm có nguồn gốc từ thiên nhiên chính là giải pháp hiệu quả được con người lựa chọn, nhằm nâng cao sức khỏe, tăng cường sức đề kháng của cơ thể trước những tác động xấu từ môi trường, cải thiện sắc tố da và có được tinh thần minh mẫn. Trong đó, Yến Sào Thiên Nhiên trở thành lựa chọn tối ưu đối với nhiều người.YẾN SÀO CHẤN PHI cam kết đổi hàng hoặc hoàn tiền nếu quý khách không hài lòng về chất lượng sản phẩm, với điều kiện hộp còn nguyên tem và không bị vỡ bễ.Nếu không đúng hàng thật, công ty sẽ hoàn tiền 200%', 
							500000, 275000, 200, 140, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (16, N'Thẻ Nhớ Micro SD PNY 8GB:', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Với Thẻ Nhớ Micro SD PNY 8GB, bạn không còn phải lo lắng và thoải mái cài đặt các ứng dụng khác nhau mà không còn sợ thiếu dung lượng thẻ nhớ.Micro SD là loại thẻ nhớ thông dụng nhất hiện nay, tương thích với phần lớn các loại điện thoại di động đời mới, có dung lượng và tính năng cao, do Công Ty TNHH TM XNK Vũ Quang nhập khẩu và phân phối.Thẻ Nhớ Micro SD PNY 8GB được sử dụng trên phần lớn điện thoại di động và smartphone hiện nay. Có thể dùng được cho máy ảnh dưới dạng thẻ SD nếu dùng thêm adapter, cho bạn thỏa sức lưu giữ những khoảnh khắc đáng nhớ.', 
							210000, 115000, 400, 140, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (17, N'Dụng Cụ Đa Năng 11 Món', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Cuộc sống hiện đại có rất nhiều hoạt động bạn cần tham gia, do đó trang bị những dụng cụ đa năng nhỏ gọn có thể mang theo bên mình mọi lúc mọi nơi là điều rất cần thiết. Trong deal hôm nay, nhómMua mang đến cho bạn Bộ Dao Đa Năng 11 Món, sản phẩm đồng hành hữu ích cho những chuyến picnic, du lịch cùng người thân, bạn bè với giá khuyến mãi bất ngờ chỉ với 49.000 VNĐ cho phiếu trị giá 140.000 VNĐ.Với Dao Đa Năng 11 Món, bạn không còn phải băn khoăn, lo lắng khi mở những đồ hộp yêu thích, khui chai rượu vang hảo hạng hay những thứ đã chuẩn bị sẵn trong chuyến dã ngoại. Cuộc vui sẽ trở nên trọn vẹn và ý nghĩa hơn.Bộ dao đa năng này được làm từ chất liệu hợp kim không gỉ, sáng bóng, Dao Đa Năng 11 Món được đảm bảo có độ bền rất cao, bạn có thể tha hồ sử dụng mà không lo lắng dao sẽ nhanh chóng bị rỉ sét, ảnh hưởng đến những đồ ăn, thức uống. Sản phẩm được thiết kế nhỏ gọn, bạn có thể tùy nghi mang đi bất cứ nơi đâu.', 
							140000, 49000, 500, 440, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (18, N'Pizza Hot', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Toạ lạc tại trung tâm TP. HCM, Pizza Hot và Pizza Roma là một trong những nhà hàng đầu tiên hoạt động trong lĩnh vực thức ăn nhanh và có dịch vụ giao hàng tận nơi đến khách hàng. Nổi tiếng với các món Âu đặc sắc như: pizza, mỳ Ý, sandwich, hamburger, beefsteak … Pizza Hot và Pizza Roma luôn là sự lựa chọn của những tín đồ món Âu bởi uy tín và chất lượng trong từng món ăn ngon.
Để có được những món ăn hoàn hảo cho thực khách, nhà hàng luôn chú trọng đặc biệt đến khâu lựa chọn nguồn nguyên liệu, đảm bảo luôn tươi ngon và an toàn nhất. Bên cạnh đó, với công thức truyền thống kết hợp ý tưởng sáng tạo, những món ăn của Pizza Hot và Pizza Roma luôn có hương vị hấp dẫn, màu sắc bắt mắt và bảo đảm chất dinh dưỡng.', 
							110000, 52000, 300, 230, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (19, N'See By Harajuku', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Tọa lạc trên con đường thời trang Nguyễn Đình Chiểu, SEE BY HARAJUKU tuy nhỏ nhưng luôn lôi cuốn đông đảo khách hàng bởi những sản phẩm độc đáo và đầy cá tính. Đến với cửa hàng, bạn sẽ bị cuốn hút ngay bởi những chiếc váy, đầm đầy màu sắc, phong phú kiểu dáng; hay những chiếc quần short trẻ trung, năng động… rất thích hợp cho những buổi tiệc nhỏ, những chuyến dạo phố hay cafe cùng bạn bè. Kết hợp cùng những phụ kiện xinh xắn và được thiết kế rất lạ mắt như ví cầm tay, dây chuyền, thắt lưng, khăn quàng cổ, túi xách, nón, mắt kính, khăn cột đầu… một phong cách thời trang mang đậm chất Harajuku.Không chỉ có sản phẩm dành cho các nàng mà SEE BY HARAJUKU còn có một khu vực dành riêng cho các chàng trai với những chiếc áo thun nhiều màu, áo sơ mi biến tấu hay những chiếc quần jeans bụi bặm, những đôi giày vừa lịch lãm vừa năng động… được trưng bày ở khu vực riêng. Sự kết hợp độc đáo giữa các tông màu và chất liệu, kiểu dáng đầy ngẫu hứng sẽ mang đến cho bạn một phong cách mới mẻ, trẻ trung và nổi bật.', 
							200000, 100000, 500, 440, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (20, N'Khỏe Đẹp Tại FIT24', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Tại Fit24 có rất nhiều bộ môn cũng như chương trình học phù hợp với yêu cầu, sở thích của từng người. Các lớp học dành cho nhóm: Aerobic, Modern Dance, Hip Hop, Zumba, Pump the Tump, Belly Dance… hay các khóa học Yoga: Sun Salutation, Gentle Yoga, Hatha Yoga, Power Yoga, Therapy, Ashtanga… ; Boxing, Kick Boxing. Trong một không gian sang trọng, rộng rãi, những bản nhạc Dance sôi động vang lên cuồng nhiệt cùng những điệu nhảy Aerobic, Belly Dance, Zumba… hay nhẹ nhàng uyển chuyển cùng các bài tập Yoga. Kết thúc buổi tập, được tắm hơi thư giãn ngay tại trung tâm, bạn sẽ thấy cơ thể mình nhẹ nhàng và thoải mái hơn rất nhiều. Cuộc sống cơm áo gạo tiền ngày càng khắc nghiệt với vô số những nỗi lo toan, những phút giây thư giãn là điều thực sự cần thiết giúp bạn cân bằng mọi thứ và luôn cảm thấy yêu đời, yêu cuộc sống này hơn.Ngoài ra, nếu muốn có những động tác chính xác, bạn có thể đăng ký tham gia lớp học cá nhân với sự hướng dẫn của huấn luyện viên. Đội ngũ huấn luyện viên chuyên nghiệp sẽ hướng dẫn cho bạn từng động tác luyện tập cụ thể, bài bản, mang lại hiệu quả tối ưu nhất và một điểm cực hấp dẫn là bạn không cần mất thêm bất cứ chi phí nào khác.', 
							5800000, 270000, 500, 440, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (21, N'Bao da iPad 2 & 3 Belk', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Được làm bằng chất liệu da cao cấp với lối thiết kế sang trọng, nhỏ gọn và mỏng, BAO DA IPAD 2 & 3 BELK chính là một “chiếc áo” xinh đẹp, thời trang giúp nâng niu và bảo vệ iPad của bạn.Sản phẩm có đến 8 màu sắc thời trang và phong cách cho bạn lựa chọn: đen, đỏ, xanh lơ, xanh đen, nâu, trắng, xám, hồng. Nếu những “chiếc áo” màu hồng, trắng, đỏ… dành cho những cô nàng cá tính, muốn thể hiện phong cách, đẳng cấp riêng thì màu đen, nâu, xanh đen… lại là màu sắc được rất nhiều chàng trai ưa chuộng bởi vẻ mạnh mẽ, nam tính nhưng cũng không kém phần thời trang mà nó mang lại.', 
							700000, 370000, 500, 440, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (22, N'Pankha Cafe Loungle', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Tọa lạc trên con đường Phạm Đình Toái, P6, Q3, PANKHA CAFE LOUNGE thu hút bạn ngay  từ ánh nhìn đầu tiên bởi vẻ kì bí cùng những cảm giác lạ lùng khiến bạn tò mò khám phá. Sau lớp rèm trắng mong manh ngay nơi cửa sẽ là những điều thú vị với trải nghiệm đặc biệt về một địa chỉ café quen thuộc của nhiều bạn trẻ. Những điệu nhạc sôi động, những vật trang trí đồng bộ ton sur ton sẽ làm bạn cảm thấy thật sự thú vị.Tại PANKHA CAFE LOUNGE, bạn sẽ cảm nhận được sự khác biệt của nơi này với những quán café bình thường khác bởi phong cách thiết kế độc đáo và lạ mắt. Không thể gọi là đẹp, là sang trọng, là hiện đại, nhưng đây vẫn là sự lựa chọn quen thuộc của nhiều bạn trẻ. Không chỉ thưởng thức café, cocktail  mà tại nơi này, bạn còn được cảm nhận một nền văn hóa mới mẻ, huyễn hoặc của văn minh Ả Rập, văn minh phương Đông bí ẩn.', 
							80000, 35000, 500, 440, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (23, N'Saigon Deli_Vietnamese Cuisine', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Tọa lạc trong một khuôn viên khá rộng tại cao ốc Saigon Royal (91 Pasteur, quận 1), Saigon Deli_Vietnamese Cuisine là một nhà hàng café sang trọng, nổi bật với phong cách thiết kế hiện đại, rất nhẹ nhàng nhưng đầy tính nghệ thuật. Giữa tiếng nhạc nhẹ nhàng, sâu lắng, mọi ưu tư, muộn phiền đều bay đi hết. Đã một lần thưởng thức, chiêm nghiệm ẩm thực nơi đây, chắc chắn bạn sẽ hẹn ngày trở lại. Với thế mạnh thức ăn ngon, không gian đẹp và giá thành hợp lý, Saigon Deli_Vietnamese Cuisine là điểm lựa chọn lý tưởng cho mọi người cùng chia sẻ những khoảnh khắc ấm cúng của mình. Đó có thể là bữa sáng cùng gia đình hoặc đối tác, là những bữa ăn trưa cùng đồng nghiệp hay những buổi tối nhâm nhi cùng bạn bè hoặc người yêu. Chắc chắn bạn sẽ rất hài lòng vì chính nét ẩm thực được chú trọng đến từng chi tiết, từng hương vị.
 ', 
							100000, 50000, 1000, 440, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (24, N'Bee Spa', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Toạ lạc tại 35 Nguyễn Bặc (Q. Tân Bình), BEE SPA được thiết kế với phong cách sang trọng, nhẹ nhàng và tinh tế. Sự kết hợp hài hòa giữa yếu tố thiên nhiên và không gian hướng mộc khiến spa tạo nên một cảm giác thư thái dễ chịu, làm giảm đi sự căng thẳng và mệt mỏi. Giúp bạn nhanh chóng lấy lại sự hưng phấn và tinh thần phấn chấn sau những căng thẳng, lo toan của cuộc sống đời thường.Được thiết kế rất thoáng mát và sang trọng, nhưng BEE SPA không phân biệt giai cấp hay lựa chọn khách hàng. Bên cạnh đó, chính sách giá cả cũng phù hợp với mọi đối tượng khách hàng, đặc biệt là trong nền kinh tế khó khăn như hiện nay. Chính điều đó tạo nên sự gần gũi thân thiện mà chỉ riêng nơi đây mới có. Với vị trí đắc địa cùng cơ sở vật chất cao cấp, hiện đại và một đội ngũ nhân viên chuyên nghiệp, nhiệt tình, BEE SPA sẽ là điểm đến lý tưởng của những người có nhu cầu làm đẹp và thư giãn.', 
							200000, 79000, 200, 40, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (25, N'Belle & Doree Bakery', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Belle & Doree Bakery mang cả “thế giới” bánh ngọt Pháp đến với Sài Gòn. Những chiếc bánh có vị ngọt thanh mát, nhẹ nhàng cho bạn cảm nhận về sự tinh tế và chất lượng tuyệt vời của ẩm thực Pháp. Hương thơm ngọt ngào quyến rũ của các loại bánh hấp dẫn ngay khi bạn vừa đẩy cánh cửa bước vào. Bạn sẽ đắm chìm trong một thế giới bánh ngọt với vô số loại: Bread, Sandwich, Croisant, Pie, Cookie, Cupcake...Mỗi chiếc bánh đều được tạo nên từ tâm huyết và bàn tay khéo léo, tài tình của người thợ làm bánh, mang đến cho bạn những “tác phẩm nghệ thuật” không chỉ đẹp đẽ ở hình thức bên ngoài mà còn đậm đà, hấp dẫn ở hương vị bên trong.', 
						158000, 86000, 600, 251, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (26, N'Kim Cương Xanh', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'Đá quý được biết đến như một “đứa con” của thiên nhiên! Trải qua hàng triệu năm, dưới những tác động lý hóa và sự biến động của địa chất, từ sâu trong lòng đất đã hình thành nên những viên đá quý thiên nhiên với vô vàn sắc màu rực rỡ, với những tạo hình đầy tinh tế và sắc sảo, làm mê hoặc biết bao trái tim người chiêm ngưỡng.Mỗi loại đá quý có hình dáng và màu sắc riêng nên gắn liền với chúng là những giai thoại khác nhau. Con người tin rằng: Mỗi viên đá quý sẽ hợp với một cung mệnh và việc sở hữu được viên đá quý phù hợp với cung mệnh của mình sẽ giúp người sở hữu đạt được những thành công như mong muốn, hạnh phúc và sức khỏe luôn mỉm cười.
', 
							300000, 60000, 150, 40, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (27, N'Nha Khoa Đa Kao', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'NHA KHOA ĐAKAO đã nâng cấp mới hoàn toàn trang thiết bị theo tiêu chuẩn của ngành nha khoa hiện đại như: X-quang kỹ thuật số, ghế nha, máy cạo vôi răng thế hệ mới, máy đo chiều dài ống tủy Densply (Mỹ)…cùng với đội ngũ các bác sĩ chuyên khoa giỏi, nhiều năm kinh nghiệm, luôn luôn cập nhật những kiến thức mới nhất để đảm bảo mang đến cho khách hàng những dịch vụ hoàn hảo.“Hợp lý, an toàn, nhẹ nhàng và hiệu quả”, NHA KHOA ĐAKAO thiết kế theo tiêu chuẩn của một phòng khám nha khoa quốc tế với không gian rộng lớn, thoáng mát, bố trí khoa học, đảm bảo vệ sinh, sử dụng quy trình khử trùng tự động, tránh lây nhiễm tuyệt đối, tất cả các dụng cụ đều được ngâm sát khuẩn và hấp sấy tiệt trùng 100%.', 
						2000000, 670000, 100, 72, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (28, N'Hồ Lô May Mắn', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N' Hồ Lô May Mắn Bằng Đá Thạch Anh Hồng là một sự kết hợp độc đáo và ý nghĩa của 2 biểu tượng trên mà nhómMua muốn giới thiệu đến các bạn. Hồ Lô May Mắn được làm từ pha lê đặc biệt pha thạch anh là một pháp khí kết tinh hoa của Thổ, mang cát khí của vận 8 nên công năng sử dụng rất lớn, có tác dụng mang lại sự bình an và may mắn cho chủ nhân.Và nếu bạn đang băn khoăn về món quà để dành tặng bạn bè trong dịp sinh nhật, kỷ niệm… thì Hồ Lô May Mắn Bằng Đá Thạch Anh Hồng sẽ là một trong những sự lựa chọn lý tưởng vừa thiết thực lại hết sức ý nghĩa. Hơn nữa, bạn cũng có thể dùng làm quà tặng cho ông bà, cha mẹ bởi sản phẩm này rất thích hợp với những người ốm đau hoặc gia đình có người già với hy vọng mang lại sức khoẻ và trường thọ cho mọi người.', 
							150000, 49000, 150, 89, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (29, N'Nhà Hàng Golden Elephant', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N'GOLDEN ELEPHANT được thực khách sành ăn gần xa biết đến như là một địa điểm ẩm thực nổi tiếng, là điểm hẹn dành cho những ai mê món Thái. Không gian nhà hàng được bài trí sang trọng và thanh lịch với gam màu vàng – trắng làm chủ đạo, từ màu tường, ánh đèn đến bàn ghế, rèm cửa… rất đặc trưng cho lối kiến trúc truyền thống của người Thái.Đến với GOLDEN ELEPHANT, bạn sẽ được thưởng thức các món ăn Thái chính gốc thật tuyệt vời và giá cả hợp lý trong một không gian lý tưởng. Thực đơn nhà hàng phong phú với hơn 200 món ăn Thái truyền thống, hội đủ các vị mặn, ngọt, chua, cay… từ khai vị như: chả tôm chiên kiểu Thái, thịt heo nướng sa tế, chả giò Thái…đến món chính như: Hủ tiếu xào kiểu Thái (Phad Thai), Guay Tieu Tom Yam, cơm chiên cà ri xanh tôm, súp tôm chua cay (Tom Yam Goong)… được chế biến bởi các đầu bếp Thái hàng đầu hiện nay và là những món đặc trưng mà khách nước ngoài biết đến khá nhiều.', 
						130000, 65000, 600, 240, 0, 90, 1, 1, 1, 2, 1, 1)
insert into Voucher values (30, N'Ấm Đun Siêu Tốc Supo', convert(datetime,'6/16/2012'), convert(datetime,'12/30/2012'), 
							N' ẤM ĐUN SIÊU TỐC SUPO BQ – 1868, một trong những sự lựa chọn hàng đầu cho cuộc sống của những con người hiện đại.ẤM ĐUN SIÊU TỐC đã trở thành một vật dụng không thể thiếu trong mỗi gia đình hiện nay, đặc biệt đối với dân văn phòng và các bạn đi làm xa nhà. Do quỹ thời gian eo hẹp nên đôi khi những nhu cầu đơn giản như được thưởng thức một cốc trà nóng, một tách cà phê thơm lừng hay một bát mì nóng hổi mỗi buổi sáng lại trở nên khó khăn. Với sản phẩm ẤM ĐUN SIÊU TỐC SUPO BQ – 1868 này, bạn sẽ không còn phải mất nhiều thời gian cho việc chờ đợi nước sôi mỗi ngày nữa và những nhu cầu tất yếu đó sẽ được giải quyết một cách đơn giản, nhanh chóng hơn.Ngoài ra, ấm còn có khả năng tự động ngắt điện khi sôi nên bạn cũng không cần lo lắng khi đun nước bằng ẤM ĐUN SIÊU TỐC SUPO và có thể “tranh thủ” làm thêm những việc khác nữa. Nhờ những tính năng tiện ích và hiệu quả trên mà ẤM ĐUN SIÊU TỐC SUPO ngày càng được nhiều gia đình lựa chọn.', 
						400000, 175000, 400, 344, 0, 90, 1, 1, 1, 2, 1, 1)
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
go
--exec sp_ChiTietDonHangXem

create proc sp_HinhAnhXem as
begin tran HinhAnhXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from HinhAnh
commit tran HinhAnhXem
go

create proc sp_CommentXem as 
begin tran CommentXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Comment
commit tran CommentXem
go

--exec sp_CommentXem

create proc sp_DiaChiDoanhNghiepXem as 
begin tran DiaChiDoanhNghiepXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from DiaChiDoanhNghiep
commit tran DiaChiDoanhNghiepXem
go

--exec sp_DiaChiDoanhNghiepXem

create proc sp_DonHangXem as 
begin tran DonHangXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from DonHang
commit tran DonHangXem
go

--exec sp_DonHangXem

create proc sp_EmailXem as 
begin tran EmailXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Email
commit tran EmailXem
go

--exec sp_EmailXem

create proc sp_KhuVucXem as 
begin tran KhuVucXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from KhuVuc
commit tran KhuVucXem
go

--exec sp_KhuVucXem

create proc sp_LoaiVoucherXem as 
begin tran LoaiVoucherXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from LoaiVoucher
commit tran LoaiVoucherXem
go
--exec sp_LoaiVoucherXem

create proc sp_TaiKhoanXem as 
begin tran TaiKhoanXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from TaiKhoan
commit tran TaiKhoanXem
go
--EXEC sp_TaiKhoanXem

create proc sp_TaiKhoanXemUser @userIn nvarchar(100) as 
begin tran TaiKhoanXemUser
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from TaiKhoan where username = @userIn
commit tran TaiKhoanXemUser
go
--EXEC sp_TaiKhoanXemUser 'kh1'

create proc sp_TaiKhoanDoanhNghiepXem as 
begin tran TaiKhoanDoanhNghiepXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from TaiKhoanDoanhNghiep
commit tran TaiKhoanDoanhNghiepXem
go
--EXEC sp_TaiKhoanDoanhNghiepXem

create proc sp_TaiKhoanThuongXem as 
begin tran TaiKhoanThuongXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from TaiKhoanThuong
commit tran TaiKhoanThuongXem
go
--EXEC sp_TaiKhoanThuongXem

--xem chi tiet don hang co them tham so ma don hang
create proc sp_ChiTietDonHangXemMDH @madhInput int as 
begin tran ChiTietDonHangXemMDH
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from ChiTietDonHang where MADH = @madhInput
commit tran ChiTietDonHangXemMDH
go
--EXEC sp_ChiTietDonHangXemMDH 1

--xem comment cua mot san pham
create proc sp_CommentXemVoucher @maVoucherInput int as 
begin tran CommentXemVoucher
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Comment where MAVoucherComment = @maVoucherInput
commit tran CommentXemVoucher
go
--EXEC sp_CommentXemVoucher 1

--xem don hang cua mot user
create proc sp_DonHangXemUser @userInput nvarchar(100) as 
begin tran DonHangXemUser
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from DonHang where TKusername = @userInput
commit tran DonHangXemUser
go


--xem don hang cua mot ngay
create proc sp_DonHangXemNgaymua @dateInput datetime as 
begin tran DonHangXemNgaymua
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from DonHang where NgayMua = @dateInput
commit tran DonHangXemNgaymua
go
--xem don hang cua mot ngay cua mot user
--create proc sp_DonHangXemNgaymua @dateInput datetime, @userInput int as 
--begin tran DonHangXemNgaymua
--	SET TRANSACTION ISOLATION LEVEL read committed
--	select * from DonHang where NgayMua = @dateInput and TKusername = @userInput
--commit tran DonHangXemNgaymua
--go
--xem tat ca voucher
create proc sp_VoucherXem as 
begin tran VoucherXem
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher
commit tran VoucherXem
go
--exec sp_VoucherXem

--xem voucher theo khu vuc
create proc sp_VoucherXemKhuVuc @kvInput int as 
begin tran VoucherXemKhuVuc
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher where makhuvuc = @kvInput
commit tran VoucherXemKhuVuc
go
--exec sp_VoucherXemKhuVuc 2

--xem voucher theo loai
create proc sp_VoucherXemloai @typeInput int as 
begin tran VoucherXemloai
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher where maloaivoucher = @typeInput
commit tran VoucherXemloai
go
--exec sp_VoucherXemloai 2

--xem voucher theo loai + khu vuc
create proc sp_VoucherXemloaiKV @typeInput int, @kvInput int as 
begin tran VoucherXemloaiKV
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher where maloaivoucher = @typeInput and makhuvuc = @kvInput
commit tran VoucherXemloaiKV
go
--exec sp_VoucherXemloaiKV 1,2

--xem voucher theo Doanh Nghiep
create proc sp_VoucherXemDN @dnInput int as 
begin tran VoucherXemDN
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher where madoanhnghiep = @dnInput
commit tran VoucherXemDN
go
--exec sp_VoucherXemDN 1

create proc sp_VoucherXemMaVoucher @maInput int as 
begin tran VoucherXemMaVoucher
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from Voucher where mavoucher = @maInput
commit tran VoucherXemMaVoucher
go
---------------------
-------delete--------
---------------------

--bo voucher theo ma voucher
create proc sp_del_voucher_ma @mavoucherIn int as
begin tran del_voucher_ma
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from Voucher where mavoucher = @mavoucherIn
commit tran del_voucher_ma
go
--exec sp_del_voucher_ma 1

--bo voucher theo ngay ket thuc
create proc sp_del_voucher_ngaykt @ngayvoucherIn datetime as
begin tran del_voucher_ngaykt
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from Voucher where thoigianktkm = @ngayvoucherIn
commit tran del_voucher_ngaykt
go
--exec sp_del_voucher_ngaykt '2012-12-30 00:00:00.000'

--bo voucher theo doanh nghiep
create proc sp_del_voucher_dn @madnIn int as
begin tran del_voucher_dn 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from Voucher where madoanhnghiep = @madnIn
commit tran del_voucher_dn 
go
--exec sp_del_voucher_dn 1

--bo voucher theo khu vuc
create proc sp_del_voucher_kv @makvIn int as
begin tran del_voucher_kv 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from Voucher where makhuvuc = @makvIn
commit tran del_voucher_kv
go
--exec sp_del_voucher_kv 1

--bo voucher theo loai voucher
create proc sp_del_voucher_loai @maloaiIn int as
begin tran del_voucher_loai 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from Voucher where maloaivoucher = @maloaiIn
commit tran del_voucher_loai
go
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
go
--xoa chi tiet don hang theo ma voucher
create proc sp_del_CTDH_voucher @mavoucherIn int as
begin tran del_CTDH_voucher 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from chitietdonhang where voucherdh = @mavoucherIn
commit tran del_CTDH_voucher
go
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa comment theo ma voucher
create proc sp_del_com_ma @mavoucher int as
begin tran del_com_m 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from comment where mavouchercomment = @mavoucher
commit tran del_com_m
go
--xoa comment theo user
create proc sp_del_com_tk @tk nvarchar(100) as
begin tran del_com_tk 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from comment where tkcomment = @tk
commit tran del_com_tk
go
create proc sp_del_com_tk_ma @tk nvarchar(100), @mavoucher int as
begin tran del_com_tk_ma
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from comment where tkcomment = @tk and mavouchercomment = @mavoucher
commit tran del_com_tk_ma
go
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa don hang theo ma don hang
create proc sp_del_DH_ma @madh int as
begin tran del_DH_ma 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from donhang where madonhang = @madh
commit tran del_DH_ma
go
--xoa don hang theo ten tai khoan
create proc sp_del_DH_tk @tk nvarchar(100) as
begin tran del_DH_tk 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from donhang where tkusername = @tk
commit tran del_DH_tk
go
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa email
create proc sp_del_mail @tk nvarchar(100) as
begin tran del_mail 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from email where email = @tk
commit tran del_mail
go
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa hinh
create proc sp_del_hinh @ma int as
begin tran del_hinh 
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from hinhanh where mahinhanh = @ma
commit tran del_hinh
go
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa khu vuc
create proc sp_del_khuvuc @ma int as
begin tran del_khuvuc
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from khuvuc where makhuvuc = @ma
commit tran del_khuvuc
go
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa loai voucher
create proc sp_del_loaivoucher @ma int as
begin tran del_loaivoucher
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from loaivoucher where maloaivoucher = @ma
commit tran del_loaivoucher
go
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--xoa tai khoan
create proc sp_del_taikhoan @user nvarchar(100) as
begin tran del_taikhoan
	SET TRANSACTION ISOLATION LEVEL read committed
	delete from taikhoan where username = @user
commit tran del_taikhoan
go


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
go
--exec sp_ins_taikhoanthuong 10, '234 gffgh', 'asd@sdf', '456456'

--them vao dia chi doanh nghiep
create proc sp_ins_dcdn @madcin int, @dc1in nvarchar(500), @dc2in nvarchar(500), @dc3in nvarchar(500) as
begin tran ins_dcdn
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into diachidoanhnghiep values (@madcin, @dc1in, @dc2in, @dc3in)
commit tran ins_dcdn
go
--exec sp_ins_dcdn 10, '112 asdasd', '213 asd', '3214 asd'

--them vao tai khoan doanh nghiep
create proc sp_ins_tkdn @madnin int, @tendnin nvarchar(100), @SDTin nvarchar(100), @intro nvarchar(500), @website nvarchar(100), @email nvarchar(100), @kd nvarchar(100), @vd nvarchar(100), @madc int as
begin tran ins_tkdn
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into taikhoandoanhnghiep values (@madnin, @tendnin, @SDTin, @intro, @website, @email, @kd, @vd,@madc)
commit tran ins_tkdn
go
--exec sp_ins_tkdn 10, 'dn10', '2343', 'ikasdhjhdfk', 'httpasdasdasdasd', 'askdh@sdfsf', 'asfasd', 'asdasd', 1

--them vao tai khoan 
create proc sp_ins_tk @userin nvarchar(100), @passin nvarchar(100), @madnin int, @makh int, @avai int as
begin tran ins_tk
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into taikhoan values (@userin, @passin, @madnin, @makh, @avai)
commit tran ins_tk
go
--exec sp_ins_tk 'kh10', '12313', 1, 1, 1

--them vao loai voucher 
create proc sp_ins_loaivoucher @main int, @tenin nvarchar(100) as
begin tran ins_laoivoucher
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into loaivoucher values (@main, @tenin)
commit tran ins_laoivoucher
go
--exec sp_ins_loaivoucher 10, 'super'

--them vao khu vuc
create proc sp_ins_kv @main int, @tenin nvarchar(100) as
begin tran ins_kv 
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into khuvuc values (@main, @tenin)
commit tran ins_kv 
go
--exec sp_ins_kv 10, 'go vap'

--them vao hinh anh
--create proc sp_ins_ha @main int, @hinhdaidien nvarchar(500), @thumb nvarchar(500), @h1 nvarchar(500), @h2 nvarchar(500), @h3 nvarchar(500) as
--begin tran ins_kv 
--	SET TRANSACTION ISOLATION LEVEL read committed
--	insert into hinhanh values (@main, @hinhdaidien,@thumb, @h1, @h2, @h3)
--commit tran ins_kv 
--go
--exec sp_ins_ha 110, 'a', 'a','a','a','a'

--them vao voucher
create proc sp_ins_voucher @main int, @ten nvarchar(100), @bdkm datetime, @ktkm datetime, @noidung text, @goc int, @km int, @slkho int, @slmua int, @vip int, @gioban int, @trangthaiduyet int, @hinh int, @loaivoucher int, @makhuvuc int, @madn int, @avai int as
begin tran ins_voucher
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into voucher values (@main, @ten, @bdkm, @ktkm, @noidung, @goc, @km, @slkho, @slmua, @vip, @gioban, @trangthaiduyet, @hinh, @loaivoucher, @makhuvuc, @madn, @avai)
commit tran ins_voucher
go
--exec sp_ins_voucher 120, N'Đèn Kẹp Đọc Sách', '5/1/2012', '12/30/2012', 
--							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
--							2000000, 50000, 50, 50, 0, 180, 1, 4, 1, 2, 1, 1

--them vao don hang
create proc sp_ins_dh @main int, @tongin int, @ngaymuain datetime, @tk nvarchar(100) as
begin tran ins_dh 
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into Donhang values (@main, @tongin, @ngaymuain, @tk)
commit tran ins_dh 
go
--exec sp_ins_dh 10, 100, '2012-12-30', 'kh1'

--them vao chi tiet don hang
create proc sp_ins_ctdh @sl int, @ttgh nvarchar(100), @ttsd nvarchar(100), @langiao int, @ngay datetime, @ma int, @voucher int as
begin tran ins_ctdh 
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into chitietdonhang values (@sl, @ttgh, @ttsd, @langiao, @ngay, @ma, @voucher)
commit tran ins_ctdh 
go
--exec sp_ins_ctdh 10, N'Đã giao', N'Bình thường', 1, '2012-12-30', 10, 1


--them vao comment
create proc sp_ins_com @nd text, @ngay datetime, @user nvarchar(100), @voucher int as
begin tran ins_com 
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into comment values (@nd, @ngay, @user, @voucher)
commit tran ins_com
go
--exec sp_ins_com 'con ga', '2012-12-30', 'kh1', 1

--them vao email
create proc sp_ins_mail @mail nvarchar(100) as
begin tran ins_mail  
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into email values (@mail)
commit tran ins_mail 
go
--exec sp_ins_mail 'asdasdasd'

create proc sp_ins_ha_koma @hinhdaidien nvarchar(500), @thumb nvarchar(500), @h1 nvarchar(500), @h2 nvarchar(500), @h3 nvarchar(500) as
begin tran ins_kv 
	SET TRANSACTION ISOLATION LEVEL read committed
	insert into hinhanh values (@hinhdaidien,@thumb, @h1, @h2, @h3)
commit tran ins_kv 
go
--exec sp_ins_ha_koma 'a', 'a','a','a','a'
--select * from hinhanh
---------------------
-------update--------
---------------------

--them vao tai khoan thuong
create proc sp_update_taikhoanthuong @MAKHin int, @DIACHIin nvarchar(100), @EMAILin nvarchar(100), @SDTin nvarchar(100) as
begin tran update_taikhoanthuong
	SET TRANSACTION ISOLATION LEVEL read committed
	update taikhoanthuong set diachi = @DIACHIin, email = @EMAILin, sdt = @SDTin where makh = @MAKHin
commit tran update_taikhoanthuong
go
--exec sp_update_taikhoanthuong 10, '890 gffgh', 'asd@sdf', '456456'

--them vao dia chi doanh nghiep
create proc sp_update_dcdn @madcin int, @dc1in nvarchar(500), @dc2in nvarchar(500), @dc3in nvarchar(500) as
begin tran update_dcdn
	SET TRANSACTION ISOLATION LEVEL read committed
	update diachidoanhnghiep set dc1 = @dc1in, dc2 = @dc2in, dc3 = @dc3in where madc = @madcin
commit tran update_dcdn
go
--exec sp_update_dcdn 10, '222 asdasd', '213 asd', '3214 asd'

--them vao tai khoan doanh nghiep
create proc sp_update_tkdn @madnin int, @tendnin nvarchar(100), @SDTin nvarchar(100), @intro nvarchar(500), @website nvarchar(100), @email nvarchar(100), @kd nvarchar(100), @vd nvarchar(100), @madc int as
begin tran update_tkdn
	SET TRANSACTION ISOLATION LEVEL read committed
	update taikhoandoanhnghiep set tendn = @tendnin, sdtdn = @SDTin, gioithieu = @intro, website = @website, email = @email, kinhdo = @kd, vido = @vd, madiachidn = @madc where madn = @madnin
commit tran update_tkdn
go
--exec sp_update_tkdn 2, 'dn110', '2343', 'ikasdhjhdfk', 'httpasdasdasdasd', 'askdh@sdfsf', 'asfasd', 'asdasd', 1

--them vao tai khoan 
create proc sp_update_tk @userin nvarchar(100), @passin nvarchar(100), @madnin int, @makh int, @avai int as
begin tran update_tk
	SET TRANSACTION ISOLATION LEVEL read committed
	update taikhoan set  password = @passin, madn = @madnin, makh = @makh, TKISAVAILABLE = @avai where username = @userin
commit tran update_tk
go
--exec sp_update_tk 'kh10', '1213', 1, 1, 1

--them vao loai voucher 
create proc sp_update_loaivoucher @main int, @tenin nvarchar(100) as
begin tran update_laoivoucher
	SET TRANSACTION ISOLATION LEVEL read committed
	update loaivoucher set tenloaivoucher = @tenin where maloaivoucher = @main
commit tran update_laoivoucher
go
--exec sp_update_loaivoucher 10, 'go te'

--them vao khu vuc
create proc sp_update_kv @main int, @tenin nvarchar(100) as
begin tran update_kv 
	SET TRANSACTION ISOLATION LEVEL read committed
	update khuvuc set  tenkhuvuc = @tenin where makhuvuc = @main
commit tran update_kv 
go
--exec sp_update_kv 10, 'go te'

--them vao hinh anh
create proc sp_update_ha @main int, @hinhdaidien nvarchar(500), @thumb nvarchar(500), @h1 nvarchar(500), @h2 nvarchar(500), @h3 nvarchar(500) as
begin tran update_kv 
	SET TRANSACTION ISOLATION LEVEL read committed
	update hinhanh set hinhdaidien = @hinhdaidien, hinhthumbnail = @thumb, hinh1 = @h1, hinh2 = @h2, hinh3 = @h3 where mahinhanh = @main
commit tran update_kv 
go
--exec sp_update_ha 10, 'b', 'b', 'b', 'b', 'b'

--them vao voucher
create proc sp_update_voucher @main int, @ten nvarchar(100), @bdkm datetime, @ktkm datetime, @noidung text, @goc int, @km int, @slkho int, @slmua int, @vip int, @gio int, @ttduyet int, @hinh int, @loaivoucher int, @makhuvuc int, @madn int, @trangthai int as
begin tran update_v 
	SET TRANSACTION ISOLATION LEVEL read committed
	update voucher set TENVOUCHER=@ten, THOIGIANBDKM=@bdkm, THOIGIANKTKM=@ktkm, NOIDUNG=@noidung, GIAGOC=@goc, GIAKHUYENMAI=@km, SOLUONGTRONGKHO=@slkho, SOLUONGDAMUA=@slmua, THUOCTINHVIP=@vip,TONGSOGIOBAN= @gio,TRANGTHAIDUYET=@ttduyet ,MAHINH=@hinh, MALOAIVOUCHER=@loaivoucher, MAKHUVUC=@makhuvuc, MADOANHNGHIEP=@madn where MAVOUCHER=@main
commit tran update_v 
go

create proc sp_update_vouchersoluong @sl int, @mavoucher int as
begin tran update_vouchersoluon 
	SET TRANSACTION ISOLATION LEVEL read committed
	update voucher set SOLUONGDAMUA = @sl where mavoucher = @mavoucher
commit tran update_vouchersoluon 
go
--exec sp_update_vouchersoluong 7, 120

--exec sp_update_voucher 120, N'Đèn Kẹ Đọc Sách', '5/1/2012', '12/30/2012', 
--							N'Sốt thường là triệu chứng đầu tiên mỗi khi bạn ốm hay mắc phải các chứng bệnh như: ', 
--							2000000, 50000, 50, 50, 0, 180, 1, 4, 1, 2, 1, 1

--them vao donhang
create proc sp_update_dh @main int, @tongin int, @ngaymuain datetime, @tk nvarchar(100) as
begin tran update_dh 
	SET TRANSACTION ISOLATION LEVEL read committed
	update Donhang set tongtien = @tongin, ngaymua = @ngaymuain, tkusername = @tk where madonhang = @main
commit tran update_dh 
go
--exec sp_update_dh 10, 110, '2012-12-30', 'kh1'


--them vao chi tiet don hang
create proc sp_update_ctdh @sl int, @ttgh nvarchar(100), @ttsd nvarchar(100), @langiao int, @ngay datetime, @ma int, @voucher int as
begin tran update_ctdh 
	SET TRANSACTION ISOLATION LEVEL read committed
	update chitietdonhang set soluongmua = @sl, trangthaigiaohang = @ttgh, TRANGTHAISUDUNG=@ttsd, NGAYGIAOHANG=@ngay where LANGIAOHANGTHU= @langiao and MADH=@ma and VOUCHERDH=@voucher
commit tran update_ctdh 
go
--exec sp_update_ctdh 10, N'Đã giao', N'Bình thường', 1, '2012-12-29', 10, 120

--them vao comment
create proc sp_update_com @nd text, @ngay datetime, @user nvarchar(100), @voucher int as
begin tran update_com 
	SET TRANSACTION ISOLATION LEVEL read committed
	update comment set noidung = @nd where tkcomment = @user and mavouchercomment = @voucher and thoigian = @ngay
commit tran update_com
go
--exec sp_update_com 'con ga', '2012-12-30', 'kh1', 1

--them vao email
create proc sp_update_mail @mailcu nvarchar(100), @mailmoi nvarchar(100) as
begin tran update_mail  
	SET TRANSACTION ISOLATION LEVEL read committed
	update email set email = @mailmoi where email = @mailcu
commit tran update_mail 
go
--exec sp_update_mail 'asdasdasd', 'hushasdasd'

create proc sp_update_passtk @user nvarchar(100), @passmoi nvarchar(100) as
begin tran update_pass  
	SET TRANSACTION ISOLATION LEVEL read committed
	update taikhoan set password = @passmoi where username = @user
commit tran update_pass
go
--select * from taikhoan;
--exec sp_update_passtk dn2, dn2;

create proc sp_update_tkdn_koma @madnin int, @tendnin nvarchar(100), @SDTin nvarchar(100), @intro nvarchar(500), @website nvarchar(100), @email nvarchar(100), @madc int as
begin tran update_tkdn_koma
	SET TRANSACTION ISOLATION LEVEL read committed
	update taikhoandoanhnghiep set tendn = @tendnin, sdtdn = @SDTin, gioithieu = @intro, website = @website, email = @email, madiachidn = @madc where madn = @madnin
commit tran update_tkdn_koma
go
--exec sp_update_tkdn_koma 2, 'dn110', '2343', 'ikasdhjhdfk', 'httpasdasdasdasd', 'askdh@sdfsf', 1
--select * from taikhoandoanhnghiep
--select * from hinhanh
----------------
-----COUNT------
----------------

create proc sp_count_soluongdamua @madh int as
begin tran count_soluongdamua  
	SET TRANSACTION ISOLATION LEVEL read committed
	select sum(soluongmua) from chitietdonhang where madh = @madh
commit tran count_soluongdamua 
go
--exec sp_count_soluongdamua 10



--phan cua Be Hien



create proc sp_laysoluongvouchertheoloai @maloai int as
DECLARE @soluong int;
begin tran laysoluongvouchertheoloai 
SET TRANSACTION ISOLATION LEVEL read committed
select @soluong = COUNT(MAVOUCHER) from Voucher where MALOAIVOUCHER = @maloai;
commit tran laysoluongvouchertheoloai 
return @soluong;
go

--DECLARE @soluong int
--exec @soluong = sp_laysoluongvouchertheoloai 1
--print @soluong

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

--exec sp_SelectVoucherTheoMa 5;

create proc sp_LayMaHinhAnhTheoMaVoucher @mavoucher int as 
DECLARE @mahinhanh int;
begin tran laymahinhanhtheomavoucher
	SET TRANSACTION ISOLATION LEVEL read committed
	select @mahinhanh = MAHINH from Voucher where MAVOUCHER = @mavoucher;
commit tran laymahinhanhtheomavoucher
return @mahinhanh;
go

--DECLARE @mahinhanh int;
--exec @mahinhanh = sp_LayMaHinhAnhTheoMaVoucher 6;
--print(@mahinhanh)

create proc sp_LayHinhAnhTheoMaHinh @mahinh int as
begin tran LayHinhAnhTheoMaHinh
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from HinhAnh where MAHINHANH = @mahinh;
commit tran LayHinhAnhTheoMaHinh
go

--exec sp_LayHinhAnhTheoMaHinh 5

create proc sp_LayMaDoanhNghiepTheoMaVoucher @mavoucher int as 
DECLARE @madoanhnghiep int;
begin tran LayMaDoanhNghiepTheoMaVouche
	SET TRANSACTION ISOLATION LEVEL read committed
	select @madoanhnghiep = MADOANHNGHIEP from Voucher where MAVOUCHER = @mavoucher;
commit tran LayMaDoanhNghiepTheoMaVouche
return @madoanhnghiep;
go

--DECLARE @madoanhnghiep int;
--exec @madoanhnghiep = sp_LayMaDoanhNghiepTheoMaVoucher 10;
--print(@madoanhnghiep)

create proc sp_LayDoanhNghiepTheoMadn @madoanhnghiep int as
begin tran LayDoanhNghiepTheoMaDN
	SET TRANSACTION ISOLATION LEVEL read committed
	select * from TaiKhoanDoanhNghiep tk, DiaChiDoanhNghiep dc where tk.MADN = @madoanhnghiep and tk.MADIACHIDN = dc.MADC;
commit tran LayDoanhNghiepTheoMaDN
go

--exec sp_LayDoanhNghiepTheoMadn 2
--
--exec sp_Top6VoucherTheoMa 3