<?php
 session_start();// Khởi tạo Session() lưu đăng kí, đăng nhập
 include("lib/ketnoi.php");
 include("lib/truyvan.php");
 ?>

 <?php
// Kiểm tra để chèn nội dung ở giữa trang => PAGE
 if(isset($_GET["p"]))
 {
 	$p = $_GET["p"];
 }
 else{
 	$p ="";
 }
?>

<?php
// Kiểm tra đăng nhập
if (isset($_POST["submit_login"]))
{
	$TenKH = $_POST["username"];
	$MatKhau = $_POST["password"];
									// Mã hóa md5
// truy vấn thông tin từ CSDL khách hàng
	$sql = "	
			SELECT * From khachhang
			where TenKH = '$TenKH' and MatKhau = '$MatKhau'
		";
	$khachhang = $conn->prepare($sql);
	$khachhang->execute();

	// Lấy về 1 bản ghi => nhưng PDO trong PHP không hỗ trợ kiểm tra số bản ghi trả về(rowCount())
	$row_thong_tin_khachhang = $khachhang->fetch();	

	//So sánh với thông tin trong CSDL
	if( $row_thong_tin_khachhang > 0 ) // Kiểm tra nếu kết quả trả về đúng 1 K/H
	{
		$_SESSION["username"] = $row_thong_tin_khachhang["TenKH"]; 
		$_SESSION["password"] = $row_thong_tin_khachhang["MatKhau"]; 
		// $_SESSION["urlHinh"] = $row_thong_tin_khachhang["urlHinh"]; 
		$_SESSION["urlHinh"] = "hinhMacdinh.png"; 
	}
}
?>

<?php
//Kiểm tra thoát đăng nhập => Hủy session
if( isset($_POST["submit_thoat"]) )
{
	unset($_SESSION["username"]);
	unset($_SESSION["password"]);
	unset($_SESSION["urlHinh"]);
}
?>


<!DOCTYPE html>
<html lang="vi-vn" xml:lang="vi-vn">
<head>
	<title>AnVang-Trang sức vàng bạc, đá quý</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/style_dangky_taikhoan_kh.css">
	<script type="text/javascript" src="javascript/kt_form.js"></script>
</head>
<body>
<div id="wrapper">

<!-- PHẦN HEADER -->
<header class="canhdeu_2ben">
	<?php include("block/header.php"); ?>
</header>

<!-- PHẦN MENU_NGANG -->
<nav>
	<?php include("block/menu_ngang.php"); ?>
</nav>

<!-- PHẦN NỘI DUNG SECTION -->
<section>
	<div id="menu_slide_dangnhap">
	  	<!-- Menu dọc-->
			<?php include("block/menu_doc.php");?>
		<!-- Phần slide -->
			<?php include("block/slide.php");?>

		<!-- Phần đăng kí, đăng nhập -->
		<?php
			if(empty($_SESSION["username"]))// True khi chưa tồn tại "username" => chưa đăng nhập
			{
				include("block/dangnhap_dangky/nhapxuat.php");
			}
			else
			{
			 	include("block/dangnhap_dangky/dangnhap_thanhcong.php");
			}
		?>
	</div>
  

<!--PAGES-->

	<!-- NỘI DUNG HIỂN THỊ Ở GIỮA TRANG KHI CLICK CHUỘT VÀO 1 THẺ <a> NÀO ĐÓ -->
	<!-- canh đều nội dung content -->	
	<div class="canhdeu_2ben">
		<?php 
		switch($p){
			case 'dangky':
				include("page/dangnhap_dangky/dangky.php");
				break;
			case 'xuly_dangky':
				include("page/dangnhap_dangky/xuly_dangky.php");
				break;
			case 'cap_nhat_taikhoan':
				include("page/dangnhap_dangky/cap_nhat_taikhoan.php");
				break;
			case 'chitiet_khuyenmai':
				include("page/chitiet_khuyenmai.php");
				break;
			case 'chitiet_sanpham':
				include("page/chitiet_sanpham.php");
				break;
			case 'chitiet_slide':
				include("page/chitiet_slide.php");
				break;
			case 'chitiet_tin_menu_ngang':
				include("page/chitiet_tin_menu_ngang.php");
				break;
			case 'sanpham_cungloai':
				include("page/sanpham_cungloai.php");
				break;
			case 'timkiem':
				include("page/timkiem.php");
				break;
			default: 
				include("page/trangchu.php");
		}
	?>
	</div>
</section>

<!-- PHẦN FOOTER -->
<footer>
	<?php include("block/footer.php");?>
</footer>
</div>
	<script type="text/javascript" src="javascript/slide.js"></script>
</body>
</html>