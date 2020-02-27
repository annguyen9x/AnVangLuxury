-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2018 at 05:56 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `webvang`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitiethoadon`
--

CREATE TABLE IF NOT EXISTS `chitiethoadon` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SoLuong` int(11) NOT NULL DEFAULT '1',
  `ThanhTien` decimal(18,2) NOT NULL,
  `SoHD` int(11) NOT NULL,
  `MaSP` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SoHD` (`SoHD`),
  KEY `MaSP` (`MaSP`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`ID`, `SoLuong`, `ThanhTien`, `SoHD`, `MaSP`) VALUES
(1, 1, '42215000.00', 1, 1),
(2, 1, '16392000.00', 1, 2),
(3, 1, '5030000.00', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE IF NOT EXISTS `hoadon` (
  `SoHD` int(11) NOT NULL AUTO_INCREMENT,
  `NgayDat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NgayGiao` date DEFAULT NULL,
  `TongTien` decimal(18,2) NOT NULL DEFAULT '1.00',
  `TrangThai` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `XacNhan` bit(1) NOT NULL DEFAULT b'1',
  `MaKH` int(11) NOT NULL,
  `NaNV` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SoHD`),
  KEY `MaKH` (`MaKH`),
  KEY `NaNV` (`NaNV`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`SoHD`, `NgayDat`, `NgayGiao`, `TongTien`, `TrangThai`, `XacNhan`, `MaKH`, `NaNV`) VALUES
(1, '2018-11-17 04:22:20', NULL, '58607000.00', '', b'1', 1, 1),
(2, '2018-11-17 04:22:20', NULL, '5030000.00', '', b'1', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE IF NOT EXISTS `khachhang` (
  `MaKH` int(11) NOT NULL AUTO_INCREMENT,
  `TenKH` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `NgaySinh` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DienThoai` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `DiaChi` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `BinhLuan` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaKH`),
  UNIQUE KEY `Email` (`Email`,`DienThoai`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `TenKH`, `MatKhau`, `NgaySinh`, `Email`, `DienThoai`, `DiaChi`, `BinhLuan`) VALUES
(1, 'Nguyễn Văn An', '123456', '1997-09-18 17:00:00', 'nguyenva09@gmail.com', '01647244142', 'H.Kỳ Anh - T.Hà Tĩnh', NULL),
(2, 'Bùi Thế Thân', '123456', '1989-01-21 17:00:00', 'buithethan@gmail.com', '01637243456', 'H.Cẩm Xuyên - T.Hà Tĩnh', NULL),
(3, 'Võ Thị Ngọc Nhi', '123456', '1999-10-14 17:00:00', 'buithingocnhi@gmail.com', '0905522522', 'Phường Đại Nài - TP.Hà Tĩnh', NULL),
(4, 'Kiều Trọng Lượng', '123456', '1973-11-04 17:00:00', 'kieutrongluong@gmail.com', '0988098098', 'Q.Hải Châu - TP.Đà Nẵng', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `khuyenmai`
--

CREATE TABLE IF NOT EXISTS `khuyenmai` (
  `MaKM` int(11) NOT NULL AUTO_INCREMENT,
  `GiaTriAD` decimal(10,0) NOT NULL DEFAULT '2000000',
  `HinhThucKM` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Giảm giá',
  `urlHinh` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Tu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Den` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`MaKM`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `khuyenmai`
--

INSERT INTO `khuyenmai` (`MaKM`, `GiaTriAD`, `HinhThucKM`, `urlHinh`, `Tu`, `Den`) VALUES
(1, '2000000', 'Giảm giá 10%', 'sale1.jpg', '2018-11-17 05:26:37', '2020-11-16 17:00:00'),
(2, '2000000', 'Giảm giá 20%', 'sale2.jpg', '2018-11-17 05:26:37', '2020-11-16 17:00:00'),
(3, '2000000', 'Mua 10 tặng 1', 'sale3.jpg', '2018-11-17 05:26:37', '2019-12-31 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `MaLSP` int(11) NOT NULL AUTO_INCREMENT,
  `TenLSP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MaLSP`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLSP`, `TenLSP`) VALUES
(1, 'Bộ sưu tập đặc biệt'),
(2, 'Mặt dây chuyền đá quý'),
(3, 'Lắc tay vòng tay'),
(4, 'Bộ trang sức cưới');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE IF NOT EXISTS `nhanvien` (
  `MaNV` int(11) NOT NULL AUTO_INCREMENT,
  `TenNV` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ChucVu` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Admin',
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DienThoai` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `DiaChi` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MaNV`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `DienThoai` (`DienThoai`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `TenNV`, `MatKhau`, `ChucVu`, `Email`, `DienThoai`, `DiaChi`) VALUES
(1, 'Nguyễn Văn An', '123456', 'Admin1', 'nguyenva09@gmail.com', '01647244142', 'H.Kỳ Anh - T.Hà Tĩnh'),
(2, 'Admin', 'Admin', 'Admin', 'admin0001@gmail.com', '0905345345', 'Q.Hải Châu - TP.Đằ Nẵng'),
(3, 'Trần Minh Chiến', '123456', 'Admin', 'tranminhchien@gmail.com', '01664564566', 'Q. Sơn Trà - TP.Đà Nẵng'),
(4, 'Nguyễn Thị Thu Sương', '123456', 'Admin', 'nguyenthithusuong@gmail.com', '0988345867', 'H.Đức Thọ - T.Hà Tĩnh');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE IF NOT EXISTS `sanpham` (
  `MaSP` int(11) NOT NULL AUTO_INCREMENT,
  `TenSP` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TomTat` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `SoLuong` int(11) NOT NULL DEFAULT '10',
  `DVT` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `DonGia` decimal(18,0) NOT NULL,
  `urlHinh` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MaLSP` int(11) NOT NULL,
  PRIMARY KEY (`MaSP`),
  KEY `MaLSP` (`MaLSP`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=53 ;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `TenSP`, `TomTat`, `SoLuong`, `DVT`, `DonGia`, `urlHinh`, `MaLSP`) VALUES
(1, 'Nhẫn Vàng 18K đính ngọc trai', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Ngọc Biển</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Ngọc trai</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Tròn</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td> \r\n<td>Kim cương</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Sinh nhật, Tình yêu, Ngày kỷ niệm</td>\r\n</tr>\r\n\r\n', 10, 'Cái', '42215000', 'b1.png', 1),
(2, 'Nhẫn vàng 18K đính ngọc trai Freshwater', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Ngọc Biển</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày kỷ niệm</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Mẹ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Nhẫn</td>\r\n</tr>', 10, 'Cái', '16392000', 'b2.png', 1),
(3, 'Bông tai sắc xuân vàng 24k', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoa Hồng - Rose</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Sinh nhật, Tình yêu, Kỷ niệm ngày cưới</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Bông tai</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 24K</td>\r\n</tr>\r\n', 10, 'Bộ', '5030000', 'b3.png', 1),
(4, 'Bộ sưu tập Sắc xuân', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Sắc xuân</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Citrine</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Sinh nhật, Tình yêu, Ngày kỷ niệm</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng, Cho Mẹ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>18K</td>\r\n</tr>', 10, 'Bộ', '42768000', 'b4.png', 1),
(5, 'Nhẫn vàng 18K đính đá', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Sắc xuân</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Topaz</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Xanh</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Oval</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>', 10, 'Cái', '8873000', 'b5.png', 1),
(6, 'Bông tai vàng đính đá', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Sắc xuân</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Citrine</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n', 10, 'Bộ', '6497000', 'b6.png', 1),
(7, 'Bộ sư tập đính đá AMETHYST', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Sắc xuân</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Amethyst</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Tím</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Tròn</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>', 10, 'Bộ', '25292000', 'b7.png', 1),
(8, 'Bộ sưu tập đính đá CITRINE', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Sắc xuân</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Citrine</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>', 10, 'Bộ', '19124000', 'b8.png', 1),
(9, 'Bộ sưu tập đính đá CITRINE', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Sắc xuân</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Citrine</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Giọt</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>', 10, 'Bộ', '16904000', 'b9.png', 1),
(10, 'Bông tai vàng 18K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Sắc xuân</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Amethyst</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Tím</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Tròn</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n', 10, 'Bộ', '7290000', 'b10.png', 1),
(11, 'Bộ trang sức cưới vàng 24k', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoa Hồng - Rose</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đang cập nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Quà cưới - Kỷ niệm ngày cưới</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Sản phẩm theo bộ</td>\r\n</tr>', 10, 'Bộ', '42661000', 'b11.png', 1),
(12, 'Lắc tay cưới vàng 24K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoa Hồng - Rose</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Quà cưới - Kỷ niệm ngày cưới</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Lắc</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 24K</td>\r\n</tr>', 10, 'Cái', '9653000', 'b12.png', 1),
(13, 'Bộ trang sức hoa sen vàng', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoa Hồng - Rose</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Sinh nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Sản phẩm theo bộ</td>\r\n</tr>\r\n', 10, 'Bộ', '16559000', 'b13.jpg', 1),
(14, 'Lắc tay vàng 24K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoa Hồng - Rose</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Quà cưới - Kỷ niệm ngày cưới, Các dịp lễ tết</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Lắc</td>\r\n</tr>', 10, 'Cái', '13917000', 'b14.png', 1),
(15, 'Bộ trang sức vàng trắng', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoa Hồng - Rose</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Ngọc trai</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Tròn</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n', 10, 'Bộ', '28230000', 'b15.png', 1),
(16, 'Dây cổ vàng 10K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoa Hồng - Rose</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Tròn</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>', 10, 'Dây', '42185000', 'b16.png', 1),
(17, 'Dây cổ vàng 24K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoa Hồng - Rose</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đang cập nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Quà cưới - Kỷ niệm ngày cưới</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Dây cổ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 24K</td>\r\n</tr>', 10, 'Dây', '25307000', 'b17.jpg', 1),
(18, 'Mặt dây chuyền hoa sen', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoa Hồng - Rose</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đang cập nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Sinh Nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 14K</td>\r\n</tr>\r\n', 10, 'Cái', '18826000', 'b18.jpg', 1),
(19, 'Bông tai vàng 24K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoa Hồng - Rose</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Quà cưới - Kỷ niệm ngày cưới, Các dịp lễ tết</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Bông tai</td>\r\n</tr>\r\n', 10, 'Bộ', '4431000', 'b19.png', 1),
(20, 'Bộ trang sức vàng 24K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoa Hồng - Rose</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đang cập nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Ngày lễ kỉ niệm</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Sản phẩm theo bộ</td>\r\n</tr>\r\n', 10, 'Bộ', '33629000', 'b20.png', 1),
(21, 'Bộ sản phẩm Hoa biển', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoa Biển</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Mã Sản Phẩm:</td>\r\n<td>NURC0421 - MDRC0507 - BTRC0243</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Ngày kỉ niệm</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá:</td>\r\n<td>KIM CƯƠNG</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại Vàng:</td>\r\n<td> 75%</td>\r\n</tr>', 10, 'Bộ', '11834000', 'b21.jpg', 1),
(22, 'Bộ sản phẩm MDRC0488', '<tr class="noidung_chitiet">\r\n<td>Mã Sản Phẩm: </td>\r\n<td>MDRC0488 - BTRC0229 - NURC0403</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá:</td>\r\n<td>SAPHIRE, CZ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Ngày lễ kỉ niệm</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Sản phẩm theo bộ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>75%</td>\r\n<td>Loại Vàng:</td>\r\n</tr>\r\n\r\n', 10, 'Bộ', '20576000', 'b22.jpg', 1),
(23, 'Mặt dây chuyền đính đá ruby', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Ruby</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đỏ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Sinh nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 18K</td>\r\n</tr>\r\n', 10, 'Cái', '12377000', 'c1.jpg', 2),
(24, 'Mặt dây chuyền đính đá sapphire', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Sapphire</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Hồng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Tròn</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>Kim cương</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Sinh nhật</td>\r\n</tr>\r\n\r\n', 10, 'Cái', '34664000', 'c2.png', 2),
(25, 'Mặt dây chuyền đính đá Citrine', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Citrine</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Sinh nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 18K</td>\r\n</tr>\r\n', 10, 'Cái', '21483000', 'c3.jpg', 2),
(26, 'Mặt dây chuyền đính đá ruby', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Ruby</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đang cập nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Các dịp lễ tết</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 14K</td>\r\n</tr>', 10, 'Cái', '16713000', 'c4.jpg', 2),
(27, 'Mặt dây chuyền vàng trắng', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hoàng gia - Royal<</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Sapphire</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Sinh nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 14K</td>\r\n</tr>', 10, 'Cái', '16645000', 'c5.jpg', 2),
(28, 'Mặt dây chuyền vàng 18K', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Ruby</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đỏ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Oval</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n</div>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>', 10, 'Cái', '16563000', 'c6.png', 2),
(29, 'Mặt dây chuyền vàng 18K', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Ruby</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đỏ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Oval</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>', 10, 'Cái', '14808000', 'c7.png', 2),
(30, 'Mặt dây chuyền vàng trắng', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Ruby</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đang cập nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Các dịp lễ tết</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Mẹ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 14K</td>\r\n</tr>', 10, 'Cái', '14030000', 'c8.jpg', 2),
(31, 'Mặt dây chuyền vàng trắng', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Topaz</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Xanh nước biển</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Sinh nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 14K</td>\r\n</tr>', 10, 'Cái', '11141000', 'c9.jpg', 2),
(32, 'Mặt dây chuyền vàng 18K', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Citrine</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Sinh nhật, Ngày lễ kỉ niệm</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 18K</td>\r\n</tr>\r\n', 10, 'Cái', '11183000', 'c10.jpg', 2),
(33, 'Mặt dây chuyền vàng 14K', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Topaz</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Sinh nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 14K</td>\r\n</tr>', 10, 'Cái', '10769000', 'c11.jpg', 2),
(34, 'Mặt dây chuyền vàng 18K', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Citrine</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày cưới, Sinh nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng  18K</td>\r\n</tr>', 10, 'Cái', '8359000', 'c12.jpg', 2),
(35, 'Lắc tay vàng đính đá', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Ruby</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đỏ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Oval</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>CZ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>', 10, 'Cái', '34770000', 'd1.png', 3),
(36, 'Lắc tay cưới', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hạnh phúc vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Quà cưới - Kỷ niệm ngày cưới, Các dịp lễ tết</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Lắc</td>\r\n</tr>\r\n', 10, 'Cái', '23403000', 'd2.png', 3),
(37, 'Lắc tay vàng 24K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hạnh phúc vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Quà cưới - Kỷ niệm ngày cưới, Các dịp lễ tết</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Lắc</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 24K</td>\r\n</tr>', 10, 'Cái', '22449000', 'd3.png', 3),
(38, 'Lắc tay cưới', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Sắc xuân</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Citrine</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Giọt</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>', 10, 'Cái', '21085000', 'd4.png', 3),
(39, 'Vòng tay vàng 24K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hạnh phúc vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày kỉ niệm, Dịp lễ tết</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Lắc</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 24K</td>\r\n</tr>\r\n', 10, 'Vòng', '22449000', 'd5.png', 3),
(40, 'Vòng vàng 18K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hạnh phúc vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đang cập nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Ngày kỉ niệm, Sinh nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Vòng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 18K</td>\r\n</tr>', 10, 'Vòng', '17364000', 'd6.png', 3),
(41, 'Lắc tay vàng 18K', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Ruby</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đỏ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Oval</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>CZ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>', 10, 'Cái', '19395000', 'd7.png', 3),
(42, 'Lắc tay cưới vàng 22K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hạnh phúc vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đang cập nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Quà cưới - Kỷ niệm ngày cưới</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Lắc</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 22K</td>\r\n</tr>\r\n', 10, 'Cái', '15988000', 'd8.png', 3),
(43, 'Lắc tay cưới vàng 24K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hạnh phúc vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Quà cưới - Kỷ niệm ngày cưới, Các dịp lễ tết</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Lắc</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 24K</td>\r\n</tr>', 10, 'Cái', '16022000', 'd9.png', 3),
(44, 'Dây cổ cưới vàng 24K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hạnh phúc vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Ruby</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đỏ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Dây cổ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 24K</td>\r\n</tr>', 10, 'Dây', '133268000', 'e1.png', 4),
(45, 'Dây cổ cưới vàng 22K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hạnh phúc vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đang cập nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Quà cưới - Kỷ niệm ngày cưới, Dịp lễ tết</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Dây cổ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 22K</td>\r\n</tr>', 10, 'Dây', '70369000', 'e2.png', 4),
(46, 'Dây cổ cưới', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hạnh phúc vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đang cập nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Quà cưới - Kỷ niệm ngày cưới</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Dây cổ</td>\r\n</tr>', 10, 'Dây', '69238000', 'e3.jpg', 4),
(47, 'Dây cổ cưới vàng 24K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hạnh phúc vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đang cập nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Dây cổ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 24K</td>\r\n</tr>\r\n', 10, 'Dây', '63513000', 'e4.png', 4),
(48, 'Dây cổ cưới vàng 22K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hạnh phúc vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà:</td>\r\n<td>Quà cưới - Kỷ niệm ngày cưới, Các dịp lễ tết</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng, Cho Mẹ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Dây cổ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 22K</td>\r\n</tr>', 10, 'Dây', '39585000', 'e5.png', 4),
(49, 'Dây cổ vàng 24K', '<tr class="noidung_chitiet">\r\n<td>Bộ sưu tập:</td>\r\n<td>Hạnh phúc vàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Đang cập nhật</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Dây cổ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 24K</td>\r\n</tr>\r\n', 10, 'Dây', '22468000', 'e6.png', 4),
(50, 'Dây cổ vàng trắng 14k đính ngọc trai', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>Ngọc trai</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Tròn</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n</div>\r\n<tr class="noidung_chitiet">\r\n<td>Dịp tặng quà::</td>\r\n<td>Tình yêu,Ngày kỷ niệm</td>\r\n</tr>\r\n</div>\r\n<tr class="noidung_chitiet">\r\n<td>Quà tặng cho người thân:</td>\r\n<td>Cho Nàng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 14K</td>\r\n</tr>', 10, 'Dây', '22260000', 'e7.png', 4),
(51, 'Dây cổ vàng trắng 10k đính đá', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Tròn</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 10K</td>\r\n</tr>', 10, 'Dây', '17602000', 'e8.png', 4),
(52, 'Bộ trang sức vàng 10k đính đá', '<tr class="noidung_chitiet">\r\n<td>Loại đá chính:</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá chính:</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Hình dạng đá:</td>\r\n<td>Tròn</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Loại đá phụ (nếu có):</td>\r\n<td>ECZ - Swarovski</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Màu đá phụ (nếu có):</td>\r\n<td>Trắng</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Giới tính:</td>\r\n<td>Nữ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Chủng loại:</td>\r\n<td>Sản phẩm theo bộ</td>\r\n</tr>\r\n<tr class="noidung_chitiet">\r\n<td>Tuổi vàng:</td>\r\n<td>Vàng 14K</td>\r\n</tr>', 10, 'Bộ', '79226000', 'e9.png', 4);

-- --------------------------------------------------------

--
-- Table structure for table `slideshow`
--

CREATE TABLE IF NOT EXISTS `slideshow` (
  `IDSlide` int(11) NOT NULL AUTO_INCREMENT,
  `urlHinh` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Tu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Den` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDSlide`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `slideshow`
--

INSERT INTO `slideshow` (`IDSlide`, `urlHinh`, `Tu`, `Den`) VALUES
(1, 'slide1.png', '2018-11-16 17:00:00', '2018-11-16 17:00:00'),
(2, 'slide2.jpg', '2018-11-16 17:00:00', '2018-11-16 17:00:00'),
(3, 'slide3.jpg', '2018-11-16 17:00:00', '2018-11-16 17:00:00'),
(4, 'slide4.png', '2018-11-16 17:00:00', '2018-11-16 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sp_km`
--

CREATE TABLE IF NOT EXISTS `sp_km` (
  `MaKM` int(11) NOT NULL,
  `MaSP` int(11) NOT NULL,
  `GiaKM` decimal(18,0) NOT NULL,
  PRIMARY KEY (`MaKM`,`MaSP`),
  KEY `FK_SPKM_SP` (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sp_km`
--

INSERT INTO `sp_km` (`MaKM`, `MaSP`, `GiaKM`) VALUES
(1, 1, '37993500'),
(1, 5, '7985700'),
(1, 15, '25407000'),
(1, 23, '11139300'),
(2, 2, '13113600'),
(2, 17, '20245600'),
(2, 19, '3544800'),
(2, 50, '17808000'),
(3, 7, '22762800'),
(3, 13, '14903100'),
(3, 26, '15041700'),
(3, 49, '20221200');

-- --------------------------------------------------------

--
-- Table structure for table `sp_slideshow`
--

CREATE TABLE IF NOT EXISTS `sp_slideshow` (
  `IDSlide` int(11) NOT NULL,
  `MaSP` int(11) NOT NULL,
  PRIMARY KEY (`IDSlide`,`MaSP`),
  KEY `FK_slide_sanpham` (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sp_slideshow`
--

INSERT INTO `sp_slideshow` (`IDSlide`, `MaSP`) VALUES
(1, 1),
(1, 3),
(2, 10),
(3, 19),
(4, 22);

-- --------------------------------------------------------

--
-- Table structure for table `tintuc`
--

CREATE TABLE IF NOT EXISTS `tintuc` (
  `IDTin` int(11) NOT NULL AUTO_INCREMENT,
  `TenTin` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NoiDung` varchar(2500) COLLATE utf8_unicode_ci NOT NULL,
  `MaNV` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`IDTin`),
  KEY `MaNV` (`MaNV`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tintuc`
--

INSERT INTO `tintuc` (`IDTin`, `TenTin`, `NoiDung`, `MaNV`) VALUES
(1, 'Giới Thiệu', '<div class="gioithieu">\r\n<div class="ten_ct">\r\n<p><strong>\r\nTên doanh nghiệp: Công ty TNHH vàng bạc, đá quý An Vang\r\n</strong></p>\r\n<p><strong>\r\nTên tiếng Anh: An Vang Jewelry Joint Stock Company\r\n</strong></p><br/>\r\n</div>\r\n<div class="left" style="float:left; width:70%;">\r\n	<br/>\r\n	<p>- Người đại diện theo pháp luật: Ông Nguyễn Văn An – Chức danh&nbsp;Chủ tịch HĐQT An Vang</p>\r\n	<p>- Vốn điều lệ: 5.970.300.000 đồng (năm tỷ, chín trăm bảy mươi triệu, ba trăm ngàn đồng)</p>\r\n    <p>- Loại hình công ty: Công ty trách nhiệm hữu hạn (TNHH)</p>\r\n	<p>- Ngành nghề kinh doanh chính: Sản xuất kinh doanh trang sức bằng vàng, bạc, đá quý, phụ kiện thời trang</p>\r\n	<p>- Dịch vụ: kinh doanh vàng bạc, kiểm định kim cương, đá quý, kim loại quý</p>\r\n    <p>- Địa chỉ công ty: Quận Hải Chậu– Thành phố Đà Nẵng</p>\r\n	<p>- Điện thoại: (84) 164.724.4142</p>\r\n	<p>- Email: nguyenva09@gmail.com</p>\r\n</div>\r\n\r\n<div class="right" style="float:right; width:29%; padding:5px;padding-left:1%;">\r\n	<img width="96%" height="auto" alt="Ong Nguyen Van An" src="./img/tintuc/annguyen.jpg">\r\n	<p style="font-size:14px;"><strong>Ông Nguyễn Văn An - </strong>\r\n	<span style="color:blue">Chủ tịch HĐQT An Vang</span>\r\n	</p>\r\n</div>\r\n<div class="bottom" style="float:left; width:100%;">\r\n<br/>\r\n    <img style="width:32%; float:left ; padding-right:1% " src="./img/tintuc/truso.jpg" title="truso">\r\n    <span class="gioithieu" style="width:66%">\r\n     Được thành lập năm 2018, Công ty TNHH vàng bạc, đá quý An Vang hoạt động theo mô hình công ty TNHH, trong đó: sản xuất kinh doanh trang sức bằng vàng, bạc, đá quý, phụ kiện thời trang ngàng nghề kinh doanh chính, bên cạnh đó là dịch vụ kiểm định kim cương, đá quý, kim loại quý. An Vang định hướng phát triển thành một tập đoàn kinh tế đầu ngành của quốc gia trong vòng vài năm tới, phát triển ngành kinh doanh vàng và trang sức với nền tảng một thương hiệu hàng đầu quốc gia để trở thành thương hiệu quốc tế. Thương hiệu An Vang đã đi vào tâm trí của khách hàng là sản phẩm của niềm tin, uy tín, chất lượng. Xứng đáng là danh hiệu thương hiệu hàng đầu Quốc gia, với sự đa dạng về chủng loại từ phổ thông đến cao cấp. Sản phẩm của An Vang có nhiều mẫu mã độc đáo, thời trang từ công nghệ đúc, đột dập, kết dây, khắc máy… Đặc biệt giá tiền vừa phải, phù hợp với nhiều đối tượng khách hàng và đáp ứng được nhu cầu của mua sắm trang sức của khách hàng trong cả nước.\r\n      </span>\r\n</div>\r\n</div>\r\n\r\n\r\n', 1),
(2, 'Dịch Vụ', '<div class="dichvu">\r\n<h3 style="text-align:center; color:#ff971c; font-size:24px;">\r\nDịch vụ kinh doanh và kiểm định chất lượng vàng\r\n</h3><br/>\r\n<div class="left_right" style="float:left;">\r\n<p>\r\n <span style="width:31%; float:right; padding: 10px;" >\r\n   <img style="width:100%;border-radius:5px;vertical-align: top;" src="./img/tintuc/kiemdinhvang.jpg"/>\r\n </span>\r\nDo nhu cầu kiểm định chất lượng vàng của thị trường, An Vang cho ra đời trung tâm kiểm định hàm lượng vàng chính quy cho các sản phẩm vàng nữ trang, hoạt động của công ty đã góp phần xây dựng một chuẩn mực cho thị trường kinh doanh các mặt hàng vàng trang sức, tạo niềm tin rất lớn cho người sử dụng. “Uy tín - Chính xác - Trung thực”, được khẳng định tạo vị thế hàng đầu cho công ty.\r\n</p>\r\n<p>\r\nTrung tâm kiểm định vàng An Vang đặt tại Quận Hải Châu, TP.Đà Nẵng là trung tâm có đội ngũ phụ trách là các chuyên viên đã qua chương trình học chuyên sâu cộng với kinh nghiệm thực tiễn. An Vang đã không ngừng nâng cao trình độ giám định và đầu tư máy móc hiện đại, kết luận nhanh - chính xác trong mọi trường hợp. \r\n</p><br/>\r\n<p> \r\n An Vang đã trở thành một trong đơn vị kiểm định vàng uy tín nhất Việt Nam, và sẽ ngày càng phát triển để khẳng định vị thế hàng đầu của mình trên thị trường.\r\n</p>\r\n\r\n</div>\r\n</div>', 1),
(3, 'Hướng Dẫn Mua Hàng', '<div class="huongdanmuahang">\r\n<div style="width:100%; float:left">\r\n<h4 style="color:#ff971c; font-size:24px">Hướng dẫn mua hàng trên website anvang.com.vn</h4>\r\n<img src="./img/tintuc/muahang.jpg" style="width:46%; float:right;padding:0 4%"/><br/>\r\nAn Vang mang đến cho khách hàng những trải nghiệm tốt nhất, mua sắm thuận lợi, thanh toán linh hoạt trên website anvang.com.vn. Khách hàng có thể lựa chọn các cách sau để thực hiện mua hàng:\r\n</div>\r\n<h4>\r\n<br/>\r\nCÁCH 1: ĐẶT MUA HÀNG TRỰC TUYẾN TRÊN WEBSITE ANVANG.COM.VN\r\n</h4>\r\n<p>\r\nKhách hàng truy cập vào website anvang.com.vn và thực hiện các bước dưới đây để tiến hành đặt mua sản phẩm.</p>\r\n<p>Bước 1: Tìm sản phẩm cần mua</p>\r\n<p>Bước 2: Chọn sản phẩm cần mua</p>\r\n<p>Bước 3: Nhập thông tin thanh toán và tiến hành thanh toán</p>\r\n<p>Bước 4: Chọn phương thức thanh toán</p>\r\n<p>Bước 5: Thanh toán và xem đơn hàng</p>\r\n<br/>\r\n<h4>CÁCH 2: GỌI ĐẾN SỐ HOTLINE (84) 164.724.4142</h4>\r\n<p>Nếu với hướng dẫn ở <b>Cách 1:</b> Đặt mua hàng trực tuyến trên website anvang.com.vn, khách hàng vẫn chưa thực hiện được thanh toán thì khách hàng vui lòng gọi điện đến số hotline của An Vang (84)164.724.4142 để được phục vụ một cách tốt nhất. Thời gian từ 8g30-17g30 (kể cả CN & trừ ngày lễ) nhân viên An Vang luôn sẵn sàng phục vụ.\r\n</p>\r\n<p>\r\nAn Vang hân hạnh được phục vụ quý khách, chúc quý khách có những trải nghiệm tuyệt vời trên website anvang.com.vn \r\n</p>\r\n</div>\r\n', 1),
(4, 'Liên Hệ', '<div class="top"><div class="lienhe" style="width:35%; float:left;">\r\n<h3>\r\nCông ty trách nhiệm hữu hạn (TNHH) vàng bạc, đá quý An Vang\r\n</h3>\r\n<br/>\r\n<p>\r\nĐịa chỉ: Quận Hải Châu - TP. Đà Nẵng</p>\r\n<p>\r\nLiên hệ đặt mua qua điện thoại: 8h30 - 17h30 \r\n</p>\r\n<p>\r\nHotline: (84) 164.724.4142</p>\r\n<p>\r\nEmail: nguyenva09@gmail.com.vn</p>\r\n</p>\r\n</div>\r\n<img style="width:42%; padding-left: 16%; border-radius:5px;" src="./img/tintuc/lienhe.jpg" />\r\n</div>\r\n<br/>\r\n<hr/>\r\n<br/>\r\n<h3 style="text-align:center; font-size:24px; color:#ff971c;">Các cơ sở của công ty TNHH An Vang</h3><br/>\r\n<p>\r\n<strong>\r\nKhu vực phía Bắc :\r\n</strong>\r\n</p>\r\n<p>\r\n- Địa chỉ: 29 Trần Nhân Tông, Bùi Thị Xuân, Hai Bà Trưng, Hà Nội\r\n</p>\r\n<p>\r\n- Email : haibatrung@anvang.com.vn\r\n</p>\r\n<p>\r\n- Điện thoại : (84) 164.724.4143\r\n</p>\r\n<p>\r\n<strong>\r\n<br/>\r\nKhu vực phía Nam :\r\n</strong>\r\n</p>\r\n<p>\r\n- Địa chỉ : Trung tâm Thương mại Vincom Plaza Saigon, 72 Lê Thánh Tôn, P. Bến Nghé, Q. 1. TP. Hồ Chí Minh \r\n</p>\r\n<p>\r\n- Email : vincom@anvang.com.vn\r\n</p>\r\n<p>\r\n- Điện thoại : (84) 164.724.4144\r\n</p>\r\n\r\n<p>\r\n<strong>\r\n<br/>\r\nKhu vực Miền Trung :\r\n</strong>\r\n</p>\r\n<p>\r\n- Địa chỉ : Q.Hải Châu, TP.Đà Nẵng\r\n</p>\r\n<p>\r\n- Email : nguyenva09@gmail.com.vn\r\n</p>\r\n<p>\r\n- Điện thoại : (84) 164.724.4142\r\n</p>\r\n\r\n', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `FK_chitiethd_hoadon` FOREIGN KEY (`SoHD`) REFERENCES `hoadon` (`SoHD`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_chitiethd_sanpham` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE NO ACTION;

--
-- Constraints for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `FK_hoadon_khachhang` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_hoadon_nhanvien` FOREIGN KEY (`NaNV`) REFERENCES `nhanvien` (`MaNV`) ON DELETE NO ACTION;

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FR_sanpham_loaisanpham` FOREIGN KEY (`MaLSP`) REFERENCES `loaisanpham` (`MaLSP`) ON DELETE NO ACTION;

--
-- Constraints for table `sp_km`
--
ALTER TABLE `sp_km`
  ADD CONSTRAINT `FK_SPKM_KM` FOREIGN KEY (`MaKM`) REFERENCES `khuyenmai` (`MaKM`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_SPKM_SP` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE NO ACTION;

--
-- Constraints for table `sp_slideshow`
--
ALTER TABLE `sp_slideshow`
  ADD CONSTRAINT `FK_slide_sanpham` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_slide_slideshow` FOREIGN KEY (`IDSlide`) REFERENCES `slideshow` (`IDSlide`) ON DELETE NO ACTION;

--
-- Constraints for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `FR_tintuc_nhanvien` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`) ON DELETE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
