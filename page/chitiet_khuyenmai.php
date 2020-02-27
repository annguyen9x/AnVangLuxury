<?php
	if(isset($_GET["MaKM"]))//Trường hợp click vào từng hình => lấy ra spkm theo HinhThucKM
	{
		$MaKM = $_GET["MaKM"];
		//Lấy ra tên chương trình KM(table: khuyenmai): HinhThucKM
		$bang_khuyenmai = KhuyenMai_Theo_MaKM($MaKM);
		$row_bang_khuyenmai = $bang_khuyenmai->fetch();


?>
	<div class="content">
		<div class="top_sp">
			<h2><a href="index.php?p=chitiet_khuyenmai&amp;MaKM=<?php echo $MaKM;?>">
					Khuyến Mãi "<?php echo $row_bang_khuyenmai["HinhThucKM"]; ?>"
				</a>
			</h2>
		</div>
		<div class="noidung_sp">
			<?php  
				$sp_theo_makm = ChiTiet_KhuyenMai_Theo_MaKM($MaKM);
				while ($row_sp_theo_makm = $sp_theo_makm->fetch(PDO::FETCH_ASSOC))
				{
					$MaSP = $row_sp_theo_makm["MaSP"];
					$chitiet_sp_theo_masp = ChiTiet_SanPham($MaSP);
					$row_chitiet_sp_theo_masp = $chitiet_sp_theo_masp->fetch();

			?>
			<div class="group_sp">
				<div class="anh_sp">
					<a href="index.php?p=chitiet_sanpham&amp;MaSP=<?php echo $MaSP; ?>">
					<img class="anh" src="./img/sanpham/<?php echo $row_chitiet_sp_theo_masp["urlHinh"];?>" title="sp" alt="anhsp">
					</a>
				</div>
				<div class="tensp_giasp">
					<h3 class="tensp">
						<a href="index.php?p=chitiet_sanpham&amp;MaSP=<?php echo $MaSP; ?>">
							<?php echo $row_chitiet_sp_theo_masp["TenSP"];?>
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
								$number1 = $row_chitiet_sp_theo_masp["DonGia"];
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
								$number1 = $row_chitiet_sp_theo_masp["DonGia"];
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
<?php
	}
?>
<?php
// Trường hợp click vào thanh (#top_km) => lấy ra tất cả spkm
	if(empty($_GET["MaKM"]))//Sai = 1(True);đúng = 0;
	{
		$chitiet_khuyenmai_tatca_sp = ChiTiet_KhuyenMai_TatCa_SP();
		
?>
<div class="content">
		<div class="top_sp">
			<h2><a href="index.php?p=chitiet_khuyenmai">
					Sản phẩm khuyến mãi
				</a>
			</h2>
		</div>
		<div class="noidung_sp">
			<?php  
				// $sanpham_cungloai = SanPham_CungLoai($MaLSP);
				// while ($row_sanpham_cungloai = $sanpham_cungloai->fetch(PDO::FETCH_ASSOC)) 
				// {
				// 	$MaSP = $row_sanpham_cungloai["MaSP"];
			//Lấy ra MaSP có trong MaKM (table: km_sp) truyền vào table: sanpham => Lấy ra chitiet sp(Tên,giá,..)
		while ($row_chitiet_khuyenmai_tatca_sp = $chitiet_khuyenmai_tatca_sp->fetch(PDO::FETCH_ASSOC)) 
				{
					$MaSP = $row_chitiet_khuyenmai_tatca_sp["MaSP"];
					$chitiet_sp_theo_masp = ChiTiet_SanPham($MaSP);
					$row_chitiet_sp_theo_masp = $chitiet_sp_theo_masp->fetch();

			?>
			<div class="group_sp">
				<div class="anh_sp">
					<a href="index.php?p=chitiet_sanpham&amp;MaSP=<?php echo $MaSP; ?>">
					<img class="anh" src="./img/sanpham/<?php echo $row_chitiet_sp_theo_masp["urlHinh"];?>" title="sp" alt="anhsp">
					</a>
				</div>
				<div class="tensp_giasp">
					<h3 class="tensp">
						<a href="index.php?p=chitiet_sanpham&amp;MaSP=<?php echo $MaSP; ?>">
							<?php echo $row_chitiet_sp_theo_masp["TenSP"];?>
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
								$number1 = $row_chitiet_sp_theo_masp["DonGia"];
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
								$number1 = $row_chitiet_sp_theo_masp["DonGia"];
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
<?php
	}
?>