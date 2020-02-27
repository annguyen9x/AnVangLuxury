<!-- TRANG CHỦ GỒM: KKHUYẾN MÃI, Bộ Sưu tập đặc biệt, Bộ trang sức cưới-->

<!-- Phần Khuyến mãi -->
	<div class="content" id="sp_KM">
		<div class="top_sp">
			<h2><a href="index.php?p=chitiet_khuyenmai">Sản phẩm Khuyến mãi</a></h2>
		</div>
		<div class="sale">
			<?php
				$khuyen_mai= KhuyenMai();
				while ($row_khuyen_mai = $khuyen_mai->fetch(PDO::FETCH_ASSOC)) 
				{
					
			?>
			<a href="index.php?p=chitiet_khuyenmai&amp;MaKM=<?php echo $row_khuyen_mai["MaKM"]; ?>">
				<img src="./img/quangcaoKhuyenmai/<?php echo $row_khuyen_mai["urlHinh"]?>" title="sale" alt="hinh">
			</a>
			<?php 
				}
			?>
		</div>
	</div>
	<!-- Phần sản phẩm: Bộ sưu tập đặc biệt -->
	<div class="content" id="sp_boSuuTapDacBiet">
		<div class="top_sp">
			<h2><a href="index.php?p=sanpham_cungloai&amp;MaLSP=1">Bộ sưu tập đặc biệt</a> </h2>
		</div>
		<div class="noidung_sp">
			<?php  
				$MaLSP = 1;
				$sosp = 4;
				$sanpham_cungloai = SanPham_CungLoai_TrangChu($MaLSP,$sosp);
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

	<!-- Phần sản phẩm: Bộ trang sức cưới -->
	<div class="content" id="sp_boTrangSucCuoi">
		<div class="top_sp">
			<h2><a href="index.php?p=sanpham_cungloai&amp;MaLSP=4">Bộ trang sức cưới</a></h2>
		</div>
		<div class="noidung_sp">
			<?php  
				$MaLSP = 4;
				$sosp = 4;
				$sanpham_cungloai = SanPham_CungLoai_TrangChu($MaLSP,$sosp);
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

	<!-- Phần sản phẩm: Mặt dây chuyền đá quý -->
	<div class="content" id="sp_matDayChuyenDaQuy">
		<div class="top_sp">
			<h2><a href="index.php?p=sanpham_cungloai&amp;MaLSP=2">Mặt dây chuyền đá quý</a></h2>
		</div>
		<div class="noidung_sp">
			<?php  
				$MaLSP = 2;
				$sosp = 4;
				$sanpham_cungloai = SanPham_CungLoai_TrangChu($MaLSP,$sosp);
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