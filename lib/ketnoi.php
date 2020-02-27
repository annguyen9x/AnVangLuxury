<?php
/*
// Kết nối CSDL
	$conn = new mysqli("localhost","root","","anvang") or die("Kết nối thất bại");
// Cài đặt tiếng việt
	$conn->query("SET NAMES UTF8");
	*/
	try{
		 $conn = new PDO("mysql: host=localhost;dbname=webvang;charset=UTF8","root","");
	}catch(PDOException $e){
		echo "Lỗi kết nối: ".$e->getMessage();
	}
	
?>