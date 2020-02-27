<?php

	include("ketnoi.php");
	$ketnoi = $conn;
//Lấy danh sách menu ngang
	function Menu_ngang_TinTuc(){
		// lấy biến siêu toàn cục
		$ketnoi = $GLOBALS['ketnoi'];

		$sql = "Select * from TinTuc 
				LIMIT 0,4";
		//gán $sql sang truy vấn prepare => bảo mật
		$result =$ketnoi->prepare($sql);
		$result->execute();//Thực thi truy vấn
		return $result;
	}
	function Menu_ngang_TinTuc_Theo_IDTin($IDTin){
		// lấy biến siêu toàn cục
		$ketnoi = $GLOBALS['ketnoi'];

		$sql = "SELECT * from TinTuc 
				Where IDTin = $IDTin";
		//gán $sql sang truy vấn prepare => bảo mật
		$result =$ketnoi->prepare($sql);
		$result->execute();//Thực thi truy vấn
		return $result;
	}
// Lấy danh sách menu dọc(tên các loại sp)
	function Menu_doc_DanhMuc_SanPham(){
		$ketnoi = $GLOBALS['ketnoi'];
		$sql = "Select * from loaisanpham 
				LIMIT 0,4";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result;
	}
// Lấy * (danh sách ảnh) slide
	function SlideShow(){
		$ketnoi = $GLOBALS['ketnoi'];
		$sql="Select * from slideshow";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result;
	}
// Lấy * (tên) slide theo IDSLIDE
	function SlideShow_Theo_IDSlide($IDSlide){
		$ketnoi = $GLOBALS['ketnoi'];
		$sql="SELECT * from slideshow
			  Where IDSlide = $IDSlide
		";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result;
	}
// Lấy * (Các MaSP) thuộc cùng 1 IDSlide
	function SP_Cung__Mot_IDSlide_SlideShow($IDSlide){
		$ketnoi = $GLOBALS['ketnoi'];
		$sql="SELECT * from sp_slideshow
			  Where IDSlide = $IDSlide
		";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result;
	}
// Lấy các sản phẩm cùng loại->bảng sản phẩm
	function SanPham_CungLoai_TrangChu($MaLSP,$sosp){
		$ketnoi = $GLOBALS['ketnoi'];
		$sql = "Select * From sanpham 
				Where MaLSP = $MaLSP
				LIMIT 2,$sosp";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result;
	}
//Lấy giá Khuyến mãi theo sp
	function ChiTiet_KhuyenMai_Theo_SP($MaSP)
	{
		$ketnoi = $GLOBALS["ketnoi"];
		$sql = "Select * from sp_km
				Where MaSP = $MaSP";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result ;
	}
// Phần chi tiết KM lấy ra các sp có trong MaKM
	function ChiTiet_KhuyenMai_Theo_MaKM($MaKM)
	{
		$ketnoi = $GLOBALS["ketnoi"];
		$sql = "Select * from sp_km
				Where MaKM = $MaKM";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result ;
	}

	function ChiTiet_KhuyenMai_TatCa_SP()
	{
		$ketnoi = $GLOBALS["ketnoi"];
		$sql = "SELECT * from sp_km
				ORDER BY MaKM ASC";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result ;
	}
//Lấy thong tin Khuyến mãi theo
	function KhuyenMai()
	{
		$ketnoi = $GLOBALS["ketnoi"];
		$sql = "Select * from khuyenmai
				LIMIT 0,3";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result ;
	}
	function KhuyenMai_Theo_MaKM($MaKM)
	{
		$ketnoi = $GLOBALS["ketnoi"];
		$sql = "SELECT * from khuyenmai
				Where MaKM = $MaKM";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result ;
	}

// Lấy chi tiết về 1 sản phẩm-> bảng sản phẩm
	function ChiTiet_SanPham($MaSP){
		$ketnoi = $GLOBALS["ketnoi"];
		$sql = "Select * from sanpham
				Where MaSP = $MaSP";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result ;
	}

	function Loai_SP_Theo_MaLSP($MaLSP){
		$ketnoi = $GLOBALS["ketnoi"];
		$sql= "
				SELECT * from loaisanpham
				where MaLSP = $MaLSP
		";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result;
	}
	function SanPham_CungLoai($MaLSP){
		$ketnoi = $GLOBALS['ketnoi'];
		$sql = "SELECT * From sanpham 
				Where MaLSP = $MaLSP
				ORDER BY MaSP DESC";
		$result = $ketnoi->prepare($sql);
		$result->execute();
		return $result;
	}
?>