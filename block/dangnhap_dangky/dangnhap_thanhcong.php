
<div id="dangky_dangnhap" class="dangnhap_thanhcong">
	<div class="top" >
		<span>TÀI KHOẢN</span>
	</div>
	<div class="noidung">
		<p><img src="./img/khachhang/<?php echo $_SESSION["urlHinh"]; ?>" alt="hinh">
			<?php echo "<b>Xin chào </b>".$_SESSION["username"];?>
		</p>
		<div class="sua_taikhoan">
			<a href="index.php?p=cap_nhat_taikhoan" >
				<input type="submit" name="submit_capnhat_tk" value="Cập nhật tài khoản">
			</a>
		</div>
		<form action="index.php" method="post" >
			<input type="submit" name="submit_thoat" value="Thoát">
		</form>
	</div>
</div>



<style>
	#menu_slide_dangnhap div.dangnhap_thanhcong{
		color: white;
	}
	#menu_slide_dangnhap div.dangnhap_thanhcong div.noidung{
		padding: 25px;
	}
	#menu_slide_dangnhap div.dangnhap_thanhcong div.noidung p{
		font-size: 18px;
		line-height:20px;
		color:#009cde;
	}
	#menu_slide_dangnhap div.dangnhap_thanhcong div.noidung p img{
		width: 45px;
		height: 45px;
		border-radius: 50%;

		vertical-align:text-bottom;/* middle => chữ nằm giữa; text-top => chữ nằm trên hình;text-bottom => chữ nằm dưới hình */
	}
	#menu_slide_dangnhap div.dangnhap_thanhcong div.noidung div.sua_taikhoan{
		margin: 65px 0 15px 0;
	}
	#menu_slide_dangnhap div.dangnhap_thanhcong div.noidung div.sua_taikhoan a input,
	#menu_slide_dangnhap div.dangnhap_thanhcong div.noidung form input{
		width: 130px;
		padding: 6px 0;
		background: #009cde;
    	cursor: pointer;
    	color: white;
	}
	#menu_slide_dangnhap div.dangnhap_thanhcong div.noidung form input{
		background: #feac24;
    }
	
</style>