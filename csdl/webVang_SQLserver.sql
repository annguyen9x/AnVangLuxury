Create Database WebVang1
Go
Use WebVang1
Create Table KhachHang(
	MaKH int primary key identity(100,1), --Trong SQL Server
	--MaKH int AUTO_INCREMENT, --trong MySQL 
	TenKH nvarchar(50) not null,
	MatKhau varchar(10) not null,
	NgaySinh date default(getDate()),
	Email varchar(50) unique not null,
	DienThoai varchar(11) unique not null check(DienThoai like'[0-9][0-9][0-9]%' and isNumeric(DienThoai) = 1 ),---CHECK (DienThoai like'[0-9][0-9][0-9]%' and isNumeric(DienThoai=1))--MySQL xu?ng hàng riêng
	DiaChi nvarchar(100) not null,
	BinhLuan nvarchar(500),
	--PRIMARY KEY (MaKH),-- trong MySQL vi?t dòng riêng
)
Go
--ALTER TABLE KhachHang AUTO_INCREMENT=100;--trong MySQL phai viet o ngoai( bat dau tang tu 100)

insert into KhachHang(TenKH,MatKhau,NgaySinh,Email,DienThoai,DiaChi)
 values (N'Nguyễn Văn An','123456','1997-09-19','nguyenva09@gmail.com','01647244142',N'H.Kỳ Anh - T.Hà Tĩnh')
insert into KhachHang(TenKH,MatKhau,NgaySinh,Email,DienThoai,DiaChi)
 values (N'Bùi Thế Thân','123456','1989-01-22','buithethan@gmail.com','01637243456',N'H.Cẩm Xuyên - T.Hà Tĩnh')
insert into KhachHang(TenKH,MatKhau,NgaySinh,Email,DienThoai,DiaChi)
 values (N'Võ Thị Ngọc Nhi','123456','1999-10-15','buithingocnhi@gmail.com','0905522522',N'Phường Đại Nài - TP.Hà Tĩnh')
insert into KhachHang(TenKH,MatKhau,NgaySinh,Email,DienThoai,DiaChi)
 values (N'Kiều Trọng Lượng','123456','1973-11-05','kieutrongluong@gmail.com','0988098098',N'Q.Hải Châu - TP.Đà Nẵng')


Create Table NhanVien(
	MaNV int primary key identity(1,1),--Trong SQL Server
	--MaNV int AUTO_INCREMENT, --trong MySQL 
	TenNV nvarchar(50) not null,
	MatKhau varchar(10) not null,
	ChucVu nvarchar(50) default(N'Admin'),
	Email varchar(50) unique not null,
	DienThoai varchar(11) unique not null check(DienThoai like'[0-9][0-9][0-9]%' and isNumeric(DienThoai) = 1 ),---CHECK (DienThoai like'[0-9][0-9][0-9]%' and isNumeric(DienThoai=1))--MySQL xu?ng hàng riêng
	DiaChi nvarchar(100),
	--PRIMARY KEY (MaNV),-- trong MySQL vi?t dòng riêng
)
Go
--ALTER TABLE NhanVien AUTO_INCREMENT=1;--trong MySQL phai viet o ngoai( bat dau tang tu 1)

insert into NhanVien(TenNV,MatKhau,Email,DienThoai,DiaChi)
 values (N'Nguyễn Văn An', N'123456', N'nguyenva09@gmail.com', N'01647244142', N'H.Kỳ Anh - T.Hà Tĩnh')
insert into NhanVien(TenNV,MatKhau,Email,DienThoai,DiaChi)
 values (N'Admin', N'Admin', N'admin0001@gmail.com', N'0905345345', N'Q.Hải Châu - TP.Đằ Nẵng')
insert into NhanVien(TenNV,MatKhau,Email,DienThoai,DiaChi)
 values ( N'Trần Minh Chiến', N'123456', N'tranminhchien@gmail.com', N'01664564566', N'Q. Sơn Trà - TP.Đà Nẵng')
insert into NhanVien(TenNV,MatKhau,Email,DienThoai,DiaChi)
 values (N'Nguyễn Thị Thu Sương', N'123456', N'nguyenthithusuong@gmail.com', N'0988345867', N'H.Đức Thọ - T.Hà Tĩnh')

Create Table TinTuc(
	IDTin int primary key identity(1,1),--Trong SQL Server
	--IDTin int AUTO_INCREMENT, --trong MySQL 
	TenTin nvarchar(100) not null,
	Noidung nvarchar(2000),
	--MaNV int, --Trong MySQL viet dong rieng
	MaNV int foreign key references NhanVien(MaNV),
	--PRIMARY KEY (IDTin),-- trong MySQL vi?t dòng riêng
	--FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV) --Trong MYSQL viet dong rieng
)
Go
--ALTER TABLE TinTuc AUTO_INCREMENT=1;--trong MySQL phai viet o ngoai( bat dau tang tu 1)

insert into TinTuc(TenTin,Noidung,MaNV)
 values (N'Giới Thiệu', N'<div class="gioithieu">
<hr/>
<p><strong>Tên doanh nghiệp: CÔNG TY TNHH VÀNG BẠC, ĐÁ QUÝ AN VANG</strong></p>
<p><strong>Tên tiếng Anh: An Vang Jewelry Joint Stock Company</strong></p>

<div class="left" style="float:right; width:60%;">
<p>Địa chỉ: Quận Hải Chậu– Thành phố Đà Nẵng</p>
<p>Điện thoại: (84) 164.724.4142</p>
<p>Email: nguyenva09@gmail.com</p>
<p>Loại hình công ty: Công ty trách nhiệm hữu hạn</p>
</div>

<div class="right" style="float:left; width:35%; padding:5px; border-right:1px solid black;">
<img width="150px" height="auto" alt="Ong Nguyen Van An" src="./img/tintuc/annguyen.jpg">
<p><strong>Ông Nguyễn Văn An</strong></p>
<span style="color:blue">Chủ tịch HĐQT AnVang</span>
</div>
<div class="chitiet" style="float:left; width:100%;">
<p>Người đại diện theo pháp luật: Ông Nguyễn Văn An – Chức danh&nbsp;Chủ tịch HĐQT AN VANG</p>
<p>Vốn điều lệ: 5.970.350.000 đồng (năm tỷ, chín trăm bảy mươi triệu, ba trăm năm mươi&nbsp;ngàn đồng)</p>
<p>Ngành nghề kinh doanh chính: Sản xuất kinh doanh trang sức bằng vàng, bạc, đá quý, phụ kiện thời trang, quà lưu niệm</p>
<p>Dịch vụ kiểm định kim cương, đá quý, kim loại quý</p>
</div>
</div>
', 1)
insert into TinTuc(TenTin,Noidung,MaNV)
 values ( N'Dịch Vụ', N'<div class="dichvu">
<hr/>
<h3>KIỂM ĐỊNH CHẤT LƯỢNG VÀNG</h3>
<img width="400px" height="auto" src="./img/tintuc/kiemdinhvang.jpg"/>
<p><strong>
TRUNG TÂM KIỂM ĐỊNH VÀNG  ANVANG Tại Đà Nẵng
</strong></p>
<p>
Do nhu cầu kiểm định chất lượng vàng của thị trường, AnVang cho ra đời trung tâm kiểm định hàm lượng vàng chính quy cho các sản phẩm vàng nữ trang, hoạt động của công ty đã góp phần xây dựng một chuẩn mực cho thị trường kinh doanh các mặt hàng vàng trang sức, tạo niềm tin rất lớn cho người sử dụng. “Uy tín - Chính xác - Trung thực”, được khẳng định tạo vị thế hàng đầu cho công ty.
</p>
<p>
Trung tâm kiểm định AnVang đặt tại Quận Hải Châu, TP.Đà Nẵng. AnVang có đội ngũ phụ trách là các chuyên viên đã qua chương trình học chuyên sâu cộng với kinh nghiệm thực tiễn, AnVang đã không ngừng nâng cao trình độ giám định và đầu tư máy móc hiện đại, kết luận nhanh - chính xác trong mọi trường hợp. 
</p>
<p> 
 AnVang đã trở thành một trong đơn vị kiểm định uy tín nhất Việt Nam, sẽ ngày càng phát triển để khẳng định vị thế hàng đầu của mình trên thị trường.
</p>
</div>
', 1)

insert into TinTuc(TenTin,Noidung,MaNV)
 values (N'Hướng Dẫn Mua Hàng', N'<div class="huongdanmuahang">
<hr/>
<div>
AnVang mang đến cho khách hàng những trải nghiệm tốt nhất, mua sắm thuận lợi, thanh toán linh hoạt trên website anvang.com.vn. Khách hàng có thể lựa chọn các cách sau để thực hiện mua hàng:
</div>
<img src="./img/tintuc/muahang.jpg" width="500px" height="auto"/>
<h4>
CÁCH 1: ĐẶT MUA HÀNG TRỰC TUYẾN TRÊN WEBSITE ANVANG.COM.VN</h4>
<p>
Khách hàng truy cập vào website anvang.com.vn và thực hiện các bước dưới đây để tiến hành đặt mua sản phẩm.</p>
<p>Bước 1: Tìm sản phẩm cần mua</p>
<p>Bước 2: Chọn sản phẩm cần mua</p>
<p>Bước 3: Nhập thông tin thanh toán và tiến hành thanh toán</p>
<p>Bước 4: Chọn phương thức thanh toán</p>
<p>Bước 5: Thanh toán và xem đơn hàng</p>

<h4>CÁCH 2: GỌI ĐẾN SỐ HOTLINE (84) 164.724.4142</h4>
<p>Nếu với hướng dẫn ở Cách 1: Đặt mua hàng trực tuyến trên website anvang.com.vn, khách hàng vẫn chưa thực hiện được thanh toán thì khách hàng vui lòng gọi điện đến số hotline của AnVang (84)164.724.4142 để được phục vụ một cách tốt nhất. Thời gian từ 8g30-17g30 (kể cả CN & trừ ngày lễ) nhân viên AnVang luôn sẵn sàng phục vụ.
</p>
<p>
AnVang hân hạnh được phục vụ quý khách, chúc quý khách có những trải nghiệm tuyệt vời trên website anvang.com.vn 
</p>
</div>
', 1)

insert into TinTuc(TenTin,Noidung,MaNV)
 values (N'Liên Hệ', N'<div class="lienhe">
<hr/>
<h3>
CÔNG TY CỔ PHẦN VÀNG BẠC ĐÁ QUÝ AN VANG</h3>
<img src="./img/tintuc/lienhe.jpg" />
<p>
Địa chỉ: Quận Hải Châu - TP. Đà Nẵng</p>
<p>
ĐẶT MUA NGAY QUA ĐIỆN THOẠI (8h30 - 17h30)</p>
<p>
Hotline: (84) 164.724.4142</p>
<p>
Email: nguyenva09@gmail.com.vn</p>
</p>
</div>
', 1)


Create Table LoaiSanPham(
	MaLSP int primary key identity(1,1),
	--MaLSP int AUTO_INCREMENT, --trong MySQL 
	TenLSP nvarchar(100) not null,
	--PRIMARY KEY (MaLSP),-- trong MySQL vi?t dòng riêng
)
Go
--ALTER TABLE LoaiSanPham AUTO_INCREMENT=1;--trong MySQL phai viet o ngoai( bat dau tang tu 1)

insert into LoaiSanPham(TenLSP)
 values(N'Bộ sưu tập đặc biệt')
insert into LoaiSanPham(TenLSP)
 values(N'Mặt dây chuyền đá quý')
insert into LoaiSanPham(TenLSP)
 values(N'Lắc tay vòng tay')
insert into LoaiSanPham(TenLSP)
 values(N'Bộ trang sức cưới')

Create Table SanPham(
	MaSP int primary key identity(1,1),
	--MaSP int AUTO_INCREMENT, --trong MySQL 
	TenSP nvarchar(100) not null,
	TomTat nvarchar(500) not null,
	SoLuong int default(10),
	DVT nvarchar(8) check(DVT in(N'Cái',N'Vòng',N'Dây',N'Chỉ',N'Phân',N'Cây',N'Bộ')) default(N'Cái'),
	DonGia decimal(18,2),
	urlHinh varchar(100),
	--MaLSP int,
	MaLSP int foreign key references LoaiSanPham(MaLSP),
	--PRIMARY KEY (MaSP),-- trong MySQL vi?t dòng riêng
	--FOREIGN KEY (MaLSP) REFERENCES LoaiSanPham(MaLSP) --Trong MYSQL viet dong rieng
)
Go
--ALTER TABLE SanPham AUTO_INCREMENT=1;--trong MySQL phai viet o ngoai( bat dau tang tu 1)

-- Lo?i sp "1: Bộ s?u t?p ??c bi?t
insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Nhẫn Vàng 18K đính ngọc trai',
N'Bộ sưu tập: Ngọc Biển<br/>
Loại đá chính: Ngọc trai<br/>
Hình dạng đá: Tròn<br/>
Loại đá phụ (nếu có): Kim cương<br/>
Màu đá phụ (nếu có): Trắng<br/>
Giới tính: Nữ<br/>
Dịp tặng quà:<br/> 
Sinh nhật<br/>
Tình yêu<br/>
Ngày kỷ niệm',
N'Cái',42215000,'b1.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Nhẫn vàng 18K đính ngọc trai Freshwater',
N'Bộ sưu tập:
Ngọc Biển<br/>
Màu đá chính:
Trắng<br/>
Dịp tặng quà:
Ngày kỷ niệm<br/>
Quà tặng cho người thân:
Cho Mẹ<br/>
Chủng loại:
Nhẫn',
N'Cái',16392000,'b2.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bông tai sắc xuân vàng 24k', 
N'Bộ sưu tập:
Hoa Hồng - Rose<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:<br/>
Sinh nhật<br/>
Tình yêu<br/>
Quà cưới - Kỷ niệm ngày cưới<br/>
Ngày kỷ niệm,
 Các dịp lễ tết<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Chủng loại:
Bông tai<br/>
Tuổi vàng:
Vàng 24K',
N'Bộ',5030000,'b3.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bộ sưu tập Sắc xuân', 
N'Bộ sưu tập:
Sắc xuân<br/>
Loại đá chính:
Citrine<br/>
Màu đá chính:
Vàng<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:<br/>
Sinh nhật, Tình yêu, Ngày kỷ niệm, Các dịp lễ tết<br/>
Quà tặng cho người thân:
Cho Nàng, Cho Mẹ<br/>
Tuổi vàng: 18K',
N'Bộ',42768000,'b4.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Nhẫn vàng 18K đính đá',
N'Bộ sưu tập:
Sắc xuân<br/>
Loại đá chính:
Topaz<br/>
Màu đá chính:
Xanh<br/>
Hình dạng đá:
Oval<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ<br/>',
N'Cái',8873000,'b5.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bông tai vàng đính đá', 
N'Bộ sưu tập:
Sắc xuân<br/>
Loại đá chính:
Citrine<br/>
Màu đá chính:
Vàng<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ<br/>',
N'Bộ',6497000,'b6.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bộ sư tập đính đá AMETHYST', 
N'Bộ sưu tập:
Sắc xuân<br/>
Loại đá chính:
Amethyst<br/>
Màu đá chính:
Tím<br/>
Hình dạng đá:
Tròn<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ<br/>',
N'Bộ',25292000,'b7.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bộ sưu tập đính đá CITRINE', 
N'Bộ sưu tập:
Sắc xuân<br/>
Loại đá chính:
Citrine<br/>
Màu đá chính:
Vàng<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ<br/>',
N'Bộ',19124000,'b8.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bộ sưu tập đính đá CITRINE', 
N'Sắc xuân<br/>
Loại đá chính:
Citrine<br/>
Màu đá chính:
Vàng<br/>
Hình dạng đá:
Giọt<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ',
N'Bộ',16904000,'b9.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bông tai vàng 18K', 
N'Bộ sưu tập:
Sắc xuân<br/>
Loại đá chính:
Amethyst<br/>
Màu đá chính:
Tím<br/>
Hình dạng đá:
Tròn<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ',
N'Bộ',7290000,'b10.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bộ trang sức cưới vàng 24k', 
N'Bộ sưu tập:
SắcBộ sưu tập:
Hoa Hồng - Rose<br/>
Màu đá chính:
Đang cập nhật<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Chủng loại:
Sản phẩm theo bộ',
N'Bộ',42661000,'b11.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Lắc tay cưới vàng 24K', 
N'Bộ sưu tập:
Hoa Hồng - Rose<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Chủng loại:
Lắc<br/>
Tuổi vàng:
Vàng 24K',
N'Cái',9653000,'b12.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bộ trang sức hoa sen vàng', 
N'Bộ sưu tập:
Hoa Hồng - Rose<br/>
Màu đá chính:
Trắng<br/>
Chủng loại:
Sản phẩm theo bộ',
N'Bộ',16559000,'b13.jpg',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Lắc tay vàng 24K', 
N'Bộ sưu tập:
Hoa Hồng - Rose<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Ngày kỷ niệm
Các dịp lễ tết<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Chủng loại:
Lắc', 
N'Cái',13917000,'b14.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bộ trang sức vàng trắng', 
N'Bộ sưu tập:
Hoa Hồng - Rose<br/>
Loại đá chính:
Ngọc trai<br/>
Màu đá chính:
Trắng<br/>
Hình dạng đá:
Tròn<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ',
N'Bộ',28230000,'b15.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Dây cổ vàng 10K', 
N'Bộ sưu tập:
Hoa Hồng - Rose<br/>
Loại đá chính:
ECZ - Swarovski<br/>
Màu đá chính:
Trắng<br/>
Hình dạng đá:
Tròn<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ
',
N'Dây',42185000,'b16.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Dây cổ vàng 24K', 
N'Bộ sưu tập:
Hoa Hồng - Rose<br/>
Màu đá chính:
Đang cập nhật<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Chủng loại:
Dây cổ<br/>
Tuổi vàng:
Vàng 24K
',
N'Dây',25307000,'b17.jpg',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền hoa sen', 
N'Bộ sưu tập:
Hoa Hồng - Rose<br/>
Màu đá chính:
Đang cập nhật<br/>
Giới tính:
Nữ<br/>
Tuổi vàng:
Vàng 14K
',
N'Cái',18826000,'b18.jpg',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bông tai vàng 24K', 
N'Bộ sưu tập:
Hoa Hồng - Rose<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Ngày kỷ niệm
Các dịp lễ tết<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Chủng loại:
Bông tai
',
N'Bộ',4431000,'b19.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bộ trang sức vàng 24K', 
N'Bộ sưu tập:
Hoa Hồng - Rose<br/>
Màu đá chính:
Đang cập nhật<br/>
Giới tính:
Nữ<br/>
Chủng loại:
Sản phẩm theo bộ
',
N'Bộ',33629000,'b20.png',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bộ sản phẩm Hoa biển', 
N'<div>
<h2>BỘ TRANG SỨC HOA BIỂN</h2>
Mã Sản Phẩm: NURC0421 - MDRC0507 - BTRC0243<br/>
Giá Sản Phẩm: 11.834.000 VNĐ<br/>
Loại đá	: KIM CƯƠNG<br/>
Loại Vàng: 75%
</div>
',
N'Bộ',11834000,'b21.jpg',1)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bộ sản phẩm MDRC0488',
N'<div>
<h2>MDRC0488 - BTRC0229 - NURC0403</h2>
Mã Sản Phẩm: MDRC0488 - BTRC0229 - NURC0403</br>
Giá Sản Phẩm:	20.576.000 VNĐ</br>
Loại đá	: SAPHIRE, CZ</br>
Loại Vàng: 75%
</div>
',
N'Bộ',20576000,'b22.jpg',1)

-- Lo?i sp "2: M?t dây chuy?n ?á quý

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền đính đá ruby', 
N'<div>
Loại đá chính:
Ruby<br/>
Màu đá chính:
Đỏ<br/>
Giới tính:
Nữ<br/>
Tuổi vàng:
Vàng 18K
</div>
',
N'Cái',12377000,'c1.jpg',2)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền đính đá sapphire', 
N'<div>
Loại đá chính:
Sapphire<br/>
Màu đá chính:
Hồng<br/>
Hình dạng đá:
Tròn<br/>
Loại đá phụ (nếu có):
Kim cương<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ
</div>
',
N'Cái',34664000,'c2.png',2)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền đính đá Citrine', 
N'<div>
Loại đá chính:
Citrine<br/>
Màu đá chính:
Vàng<br/>
Giới tính:
Nữ<br/>
Tuổi vàng:
Vàng 18K
</div>
',
N'Cái',21483000,'c3.jpg',2)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền đính đá ruby', 
N'<div>
Loại đá chính:
Ruby<br/>
Màu đá chính:
Đang cập nhật<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Các dịp lễ tết<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Tuổi vàng:
Vàng 14K
</div>
',
N'Cái',16713000,'c4.jpg',2)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền vàng trắng', 
N'<div>
Bộ sưu tập:
Hoàng gia - Royal<br/>
Loại đá chính:
Sapphire<br/>
Giới tính:
Nữ<br/>
Tuổi vàng:
Vàng 14K
</div>
',
N'Cái',16645000,'c5.jpg',2)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền vàng 18K', 
N'<div>
Loại đá chính:
Ruby<br/>
Màu đá chính:
Đỏ<br/>
Hình dạng đá:
Oval<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ
</div>
',
N'Cái',16563000,'c6.png',2)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền vàng 18K', 
N'<div>
Loại đá chính:
Ruby<br/>
Màu đá chính:
Đỏ<br/>
Hình dạng đá:
Oval<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ
</div>
',
N'Cái',14808000,'c7.png',2)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền vàng trắng',
N'<div>
Loại đá chính:
Ruby<br/>
Màu đá chính:
Đang cập nhật<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Các dịp lễ tết<br/>
Quà tặng cho người thân:
Cho Mẹ<br/>
Tuổi vàng:
Vàng 14K
</div>
',
N'Cái',14030000,'c8.jpg',2)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền vàng trắng', 
N'<div>
Loại đá chính:
Topaz<br/>
Màu đá chính:
Xanh nước biển<br/>
Giới tính:
Nữ<br/>
Tuổi vàng:
Vàng 14K
</div>
',
N'Cái',11141000,'c9.jpg',2)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền vàng 18K', 
N'<div>
Loại đá chính:
Citrine<br/>
Màu đá chính:
Vàng<br/>
Giới tính:
Nữ<br/>
Tuổi vàng:
Vàng 18K
</div>
',
N'Cái',11183000,'c10.jpg',2)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền vàng 14K', 
N'<div>
Loại đá chính:
Topaz<br/>
Màu đá chính:
Vàng<br/>
Giới tính:
Nữ<br/>
Tuổi vàng:
Vàng 14K
</div>
',
N'Cái',10769000,'c11.jpg',2)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Mặt dây chuyền vàng 18K', 
N'<div>
Loại đá chính:
Citrine<br/>
Màu đá chính:
Vàng<br/>
Tuổi vàng: 18K
</div>
',
N'Cái',8359000,'c12.jpg',2)

-- Lo?i sp "3: L?c tay vòng tay

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Lắc tay vàng đính đá', 
N'<div>
Loại đá chính:
Ruby<br/>
Màu đá chính:
Đỏ<br/>
Hình dạng đá:
Oval<br/>
Loại đá phụ (nếu có):
CZ<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ
</div>
',
N'Cái',34770000,'d1.png',3)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Lắc tay cưới', 
N'<div>
Bộ sưu tập:
Hạnh phúc vàng<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Ngày kỷ niệm
Các dịp lễ tết<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Chủng loại:
Lắc
</div>
',
N'Cái',23403000,'d2.png',3)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Lắc tay vàng 24K', 
N'<div>
Bộ sưu tập:
Hạnh phúc vàng<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Ngày kỷ niệm
Các dịp lễ tết<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Chủng loại:
Lắc<br/>
Tuổi vàng:
Vàng 24K
</div>
',
N'Cái',22449000,'d3.png',3)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Lắc tay cưới', 
N'<div>
Bộ sưu tập:
Sắc xuân<br/>
Loại đá chính:
Citrine<br/>
Màu đá chính:
Vàng<br/>
Hình dạng đá:
Giọt<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ
</div>
',
N'Cái',21085000,'d4.png',3)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Vòng tay vàng 24K', 
N'<div>
Bộ sưu tập:
Hạnh phúc vàng<br/>
Giới tính:
Nữ<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Chủng loại:
Lắc<br/>
Tuổi vàng:
Vàng 24K
</div>
',
N'Vòng',22449000,'d5.png',3)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Vòng vàng 18K', 
N'<div>
Bộ sưu tập:
Hạnh phúc vàng<br/>
Màu đá chính:
Đang cập nhật<br/>
Giới tính:
Nữ<br/>
Chủng loại:
Vòng<br/>
Tuổi vàng:
Vàng 18K
</div>
',
N'Vòng',17364000,'d6.png',3)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Lắc tay vàng 18K', 
N'<div>
Loại đá chính:
Ruby<br/>
Màu đá chính:
Đỏ<br/>
Hình dạng đá:
Oval<br/>
Loại đá phụ (nếu có):
CZ<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ
</div>
',
N'Cái',19395000,'d7.png',3)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Lắc tay cưới vàng 22K', 
N'<div>
Bộ sưu tập:
Hạnh phúc vàng<br/>
Màu đá chính:
Đang cập nhật<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Chủng loại:
Lắc<br/>
Tuổi vàng:
Vàng 22K
</div>
',
N'Cái',15988000,'d8.png',3)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Lắc tay cưới vàng 24K', 
N'<div>
Bộ sưu tập:
Hạnh phúc vàng<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Ngày kỷ niệm
Các dịp lễ tết<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Chủng loại:
Lắc<br/>
Tuổi vàng:
Vàng 24K
</div>
',
N'Cái',16022000,'d9.png',3)

-- Lo?i sp "4: Bộ trang s?c c??i

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Dây cổ cưới vàng 24K', 
N'<div>
Bộ sưu tập:
Hạnh phúc vàng<br/>
Loại đá chính:
Ruby<br/>
Màu đá chính:
Đỏ<br/>
Giới tính:
Nữ<br/>
Chủng loại:
Dây cổ<br/>
Tuổi vàng:
Vàng 24K
</div>
',
N'Dây',133268000,'e1.png',4)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Dây cổ cưới vàng 22K', 
N'<div>
Bộ sưu tập:
Hạnh phúc vàng<br/>
Màu đá chính:
Đang cập nhật<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Chủng loại:
Dây cổ<br/>
Tuổi vàng:
Vàng 22K
</div>
',
N'Dây',70369000,'e2.png',4)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Dây cổ cưới', 
N'<div>
Bộ sưu tập:
Hạnh phúc vàng<br/>
Màu đá chính:
Đang cập nhật<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Chủng loại:
Dây cổ
</div>
',
N'Dây',69238000,'e3.png',4)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Dây cổ cưới vàng 24K', 
N'<div>
Bộ sưu tập:
Hạnh phúc vàng<br/>
Màu đá chính:
Đang cập nhật<br/>
Giới tính:
Nữ<br/>
Chủng loại:
Dây cổ<br/>
Tuổi vàng:
Vàng 24K
</div>
',
N'Dây',63513000,'e4.png',4)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Dây cổ cưới vàng 22K', 
N'<div>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Ngày kỷ niệm
Các dịp lễ tết<br/>
Quà tặng cho người thân:<br/>
Cho Nàng
Cho Mẹ<br/>
Chủng loại:
Dây cổ<br/>
Tuổi vàng:
Vàng 22K
</div>
',
N'Dây',39585000,'e5.png',4)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Dây cổ vàng 24K', 
N'<div>
Bộ sưu tập:
Hạnh phúc vàng<br/>
Màu đá chính:
Đang cập nhật<br/>
Giới tính:
Nữ<br/>
Chủng loại:
Dây cổ<br/>
Tuổi vàng:
Vàng 24K
</div>
',
N'Dây',22468000,'e6.png',4)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Dây cổ vàng trắng 14k đính ngọc trai', 
N'<div>
Loại đá chính:
Ngọc trai<br/>
Màu đá chính:
Trắng<br/>
Hình dạng đá:
Tròn<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Tình yêu,Ngày kỷ niệm<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Loại ngọc trai:
Freshwater<br/>
Chủng loại:
Dây cổ<br/>
Tuổi vàng:
Vàng 14K<br/>
</div>
',
N'Dây',22260000,'e7.png',4)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Dây cổ vàng trắng 10k đính đá', 
N'<div>
Loại đá chính:
ECZ - Swarovski<br/>
Màu đá chính:
Trắng<br/>
Hình dạng đá:
Tròn<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Quà cưới - Kỷ niệm ngày cưới<br/>
Quà tặng cho người thân:
Cho Nàng<br/>
Chủng loại:
Dây cổ<br/>
Tuổi vàng:
Vàng 10K<br/>
</div>
</div>
',
N'Dây',17602000,'e8.png',4)

insert into SanPham(TenSP, TomTat, DVT, DonGia, urlHinh, MaLSP)
 values(
N'Bộ trang sức vàng 10k đính đá', 
N'<div>
Loại đá chính:
ECZ - Swarovski<br/>
Màu đá chính:
Trắng<br/>
Hình dạng đá:
Tròn<br/>
Loại đá phụ (nếu có):
ECZ - Swarovski<br/>
Màu đá phụ (nếu có):
Trắng<br/>
Giới tính:
Nữ<br/>
Dịp tặng quà:
Sinh nhật, tình yêu, lễ kỷ niệm<br/>
Quà tặng cho người thân:
Cho Nàng, Cho Mẹ<br/>
Chủng loại:
Sản phẩm theo bộ<br/>
Tuổi vàng:
Vàng 14K<br/>
</div>
',
N'Bộ',79226000,'e9.png',4)

Create Table SlideShow(
	IDSlide int primary key identity(1,1),
	--IDSlide int AUTO_INCREMENT, --trong MySQL 
	urlHinh varchar(100) not null,
	Tu date default(getdate()),
	Den date default(dateAdd(year,1,getdate())),
	--PRIMARY KEY (IDSlide),-- trong MySQL vi?t dòng riêng
)
Go
--ALTER TABLE SlideShow AUTO_INCREMENT=1;--trong MySQL phai viet o ngoai( bat dau tang tu 1)

insert into SlideShow(urlHinh)
 values('slide1.png')
insert into SlideShow(urlHinh)
 values('slide2.jpg')
insert into SlideShow(urlHinh)
 values('slide3.jpg')
insert into SlideShow(urlHinh)
 values('slide4.png')

Create Table SP_SlideShow(-- slide giong nhu quang cáo => khi click vào slide se hiện ra các sản phẩm trong table: sanpham
	IDSlide int foreign key references SlideShow(IDSlide),
	MaSP int foreign key references SanPham(MaSP),
	--IDSlide int,--trong MySQL phai dinh nghia rieng
	--MaSP int,--trong MySQL phai dinh nghia rieng
	primary key (IDSlide, MaSP),
	-- PRIMARY KEY (IDSlide,MaSP),-- trong MySQL vi?t dòng riêng
	--FOREIGN KEY (IDSlide) REFERENCES SlideShow(IDSlide), --Trong MYSQL viet dong rieng
	--FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP), --Trong MYSQL viet dong rieng
)
Go

-- sẽ dẫn link theo <a> từng slide anhr sản phẩm theo những sp có trong này
insert into SP_SlideShow(IDSlide,MaSP)
 values(1,1)
insert into SP_SlideShow(IDSlide,MaSP)
 values(2,10)
insert into SP_SlideShow(IDSlide,MaSP)
 values(3,19)
insert into SP_SlideShow(IDSlide,MaSP)
 values(4,22)
insert into SP_SlideShow(IDSlide,MaSP)
 values(1,3)

Create Table HoaDon(
	SoHD int primary key identity(1,1),
	--SoHD int AUTO_INCREMENT, --trong MySQL 
	NgayDat date default(getDate()),
	NgayGiao date default(dateAdd(day,7,getDate())),
	TongTien decimal(18,2) not null default(1.1),
	TrangThai nvarchar(8) default(N'ĐangGiao') check(TrangThai in(N'ĐangGiao',N'ChưaGiao',N'ĐãGiao')),
	XacNhan bit default(1), -- 1: ch?p nh?n ??n hàng, 0: H?y ??n
	MaKH int foreign key references KhachHang(MaKH),
	NaNV int foreign key references NhanVien(MaNV) default(1),
	--MaKH int,
	--NaNV int,
	--PRIMARY KEY (SoHD),-- trong MySQL vi?t dòng riêng
	--FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH), --Trong MYSQL viet dong rieng
	--FOREIGN KEY (NaNV) REFERENCES NhanVien(MaNV), --Trong MYSQL viet dong rieng
)
Go
--ALTER TABLE HoaDon AUTO_INCREMENT=1;--trong MySQL phai viet o ngoai( bat dau tang tu 1)

insert into HoaDon(TongTien,MaKH)
 values(58607000,100)--MaKH Bột ??u t? 100
insert into HoaDon(TongTien,MaKH)
 values(5030000,102)

Create Table ChiTietHoaDon(
	ID int primary key identity(1,1),
	--ID int AUTO_INCREMENT, --trong MySQL 
	SoLuong int default(1) not null,
	DonGiaBan decimal(18,2),
	ThanhTien decimal(18,2) not null,
	SoHD int foreign key references HoaDon(SoHD),
	MaSP int foreign key references SanPham(MaSP),
	--SoHD int,
	--MaSP int,
	--PRIMARY KEY (ID),-- trong MySQL vi?t dòng riêng
	--FOREIGN KEY (SoHD) REFERENCES HoaDon(SoHD), --Trong MYSQL viet dong rieng
	--FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP), --Trong MYSQL viet dong rieng
)
Go
--ALTER TABLE ChiTietHoaDon AUTO_INCREMENT=1;--trong MySQL phai viet o ngoai( bat dau tang tu 1)

insert into ChiTietHoaDon(DonGiaBan, ThanhTien, SoHD, MaSP)
 values(42215000,42215000,1,1)
insert into ChiTietHoaDon(DonGiaBan, ThanhTien, SoHD, MaSP)
 values(16392000,16392000,1,2)
insert into ChiTietHoaDon(DonGiaBan, ThanhTien, SoHD, MaSP)
 values(5030000,5030000,2,3)

Create Table KhuyenMai(
	MaKM int primary key identity(1,1),
	--MaKM int AUTO_INCREMENT, --trong MySQL 
	GiaTriAD decimal(18,2) default(2000000),
	HinhThucKM nvarchar(100) default(N'Giảm giá'),
	urlHinh varchar(100),
	Tu date default(getDate()),
	Den date default(dateAdd(year,1,getDate())),
	--PRIMARY KEY (MaKM),-- trong MySQL vi?t dòng riêng
)
Go
--ALTER TABLE KhuyenMai AUTO_INCREMENT=1;--trong MySQL phai viet o ngoai( bat dau tang tu 1)

insert into KhuyenMai(HinhThucKM,urlHinh)
 values(N'Giảm giá 10%','sale1.jpg')
insert into KhuyenMai(HinhThucKM,urlHinh)
 values(N'Giảm giá 20%','sale2.jpg')
insert into KhuyenMai(HinhThucKM,urlHinh)
 values(N'Mua 10 tặng 1','sale3.jpg')


Create Table SP_KM(
	MaKM int foreign key references KhuyenMai(MaKM),
	MaSP int foreign key references SanPham(MaSP),
	--MaKM int,
	--MaSP int,
	--primary key(MaKM,MaSP),-- trong MySQL vi?t gi?ng dòng này
	--FOREIGN KEY (MaKM) REFERENCES KhuyenMai(MaKM), --Trong MYSQL viet dong rieng
	--FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP), --Trong MYSQL viet dong rieng
)
Go

insert into SP_KM(MaKM, MaSP)
 values(1,1)
 insert into SP_KM(MaKM, MaSP)
 values(1,5)
 insert into SP_KM(MaKM, MaSP)
 values(1,15)
 insert into SP_KM(MaKM, MaSP)
 values(1,23)
insert into SP_KM(MaKM, MaSP)
 values(2,2)
insert into SP_KM(MaKM, MaSP)
 values(2,5)
insert into SP_KM(MaKM, MaSP)
 values(2,17)
insert into SP_KM(MaKM, MaSP)
 values(2,19)
insert into SP_KM(MaKM, MaSP)
 values(3,7)
insert into SP_KM(MaKM, MaSP)
 values(3,13)
insert into SP_KM(MaKM, MaSP)
 values(3,26)
insert into SP_KM(MaKM, MaSP)
 values(3,27)

