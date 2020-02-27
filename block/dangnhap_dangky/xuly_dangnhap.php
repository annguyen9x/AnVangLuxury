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
