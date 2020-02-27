<?php
//Lấy biến p (page) truyền vào
	if(isset($_GET["MaLSP"]))
	{
		$MaLSP = $_GET["MaLSP"];
	}
	else{
		$MaLSP = 1;
	}
	//Lấy về 1 dòng để gán tên loai san pham (#top_sp)
	$loai_sanpham_theo_malsp = Loai_SP_Theo_MaLSP($MaLSP)->fetch(); 
?>

<div class="content">
	<div class="top_sp">
		<h2><a href="index.php?p=sanpham_cungloai&amp;MaLSP=<?php echo $MaLSP;?>">
				<?php echo $loai_sanpham_theo_malsp["TenLSP"]; ?>
			</a>
		</h2>
	</div>
	<div class="noidung_sp">
		<?php  
			$sanpham_cungloai = SanPham_CungLoai($MaLSP);
			while ($row_sanpham_cungloai = $sanpham_cungloai->fetch(PDO::FETCH_ASSOC)) 
			{
				$MaSP = $row_sanpham_cungloai["MaSP"];
		?>
		<div class="group_sp">
			<div class="anh_sp">
				<a href="index.php?p=chitiet_sanpham&amp;MaSP=<?php echo $MaSP; ?>">
				<img class="anh" src="./img/sanpham/<?php echo $row_sanpham_cungloai["urlHinh"];?>" title="sp" alt="anhsp">
				</a>
			</div>
			<div class="tensp_giasp">
				<h3 class="tensp">
					<a href="index.php?p=chitiet_sanpham&amp;MaSP=<?php echo $MaSP; ?>">
						<?php echo $row_sanpham_cungloai["TenSP"];?>
					</a>
				</h3>	
				<div class="giasp">
					<?php
						$chitiet_khuyenmai = ChiTiet_KhuyenMai_Theo_SP($MaSP);
						$row_chitiet_khuyenmai = $chitiet_khuyenmai->fetch();// Trả về 1 bản ghi
						if ( $row_chitiet_khuyenmai > 0 )
						{
							$result = '<span class="gia_goc">';

						// Định dạng dấu chấm (.) ngăn phần nghìn, và VNĐ
							$number1 = $row_sanpham_cungloai["DonGia"];
							$result .= number_format($number1,0,'','.')." đ ";

							$result .= '</span>';
							$result .= '<span class="gia_km">';
						// Định dạng dấu chấm (.) ngăn phần nghìn, và VNĐ
							$number2 = $row_chitiet_khuyenmai["GiaKM"];
							$result .= number_format($number2,0,'','.')." đ";

							$result .= '</span>';
							echo $result;
						}
						else{
						// Nếu không tồn tại giá KM => lừa tình CSS class"gia_goc"="gia_km" để định dạng giá cho đẹp;
						// và không hiển thị giá KM vì không có giá KM
							$tenclass = "gia_km";
							$result = '<span class="'.$tenclass.'">';
							$number1 = $row_sanpham_cungloai["DonGia"];
							$result .= number_format($number1,0,'','.')." đ";
							$result .= '</span>';
							echo $result;
						}
					?>
				</div>
			</div>
			<div class="dat_hang">
				<a href="muahang.html">Đặt hàng</a>
			</div>
		</div>
		<?php
			}
		?>
	</div>
</div>