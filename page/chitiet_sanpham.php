
<?php
	if (isset($_GET["MaSP"])) {
		$MaSP = $_GET["MaSP"];
	}
	else{
		$MaSP = 1;//Trường hợp lỗi
	}
?>

<?php
	$chitiet_sanpham = ChiTiet_SanPham($MaSP);
	$row_chitiet_sanpham = $chitiet_sanpham->fetch();

	$MaLSP = $row_chitiet_sanpham["MaLSP"];
	$loai_sp_theo_malsp =Loai_SP_Theo_MaLSP($MaLSP); 
	$row_loai_sp_theo_malsp = $loai_sp_theo_malsp->fetch();
?>
 
<div class="content" id="content_chitiet_sp">
	<div class="top_sp">
		<h2><a href="index.php?p=sanpham_cungloai&amp;MaLSP=<?php echo $row_chitiet_sanpham["MaLSP"];?>"><?php echo $row_loai_sp_theo_malsp["TenLSP"];?> >> THÔNG TIN SẢN PHẨM :</a></h2>
	</div>
</div>
<table id="table_chitiet_sp">
	<tr>
		<td class="anh">
			 <img src="./img/sanpham/<?php  echo $row_chitiet_sanpham["urlHinh"];?>">
 		</td>
		<td class="ten_gia_sp_form">
			<h3 class="tensp">
					<?php echo $row_chitiet_sanpham["TenSP"];?>
			</h3>	
			<div class="giasp">
				<?php
					$chitiet_khuyenmai = ChiTiet_KhuyenMai_Theo_SP($MaSP);
					$row_chitiet_khuyenmai = $chitiet_khuyenmai->fetch();// Trả về 1 bản ghi
					if ( $row_chitiet_khuyenmai > 0 )
					{
						$result = '<span class="gia_goc">';

					// Định dạng dấu chấm (.) ngăn phần nghìn, và VNĐ
						$number1 = $row_chitiet_sanpham["DonGia"];
						$result .= number_format($number1,0,'','.')." đ ";

						$result .= '</span>';
						$result .= '<span class="gia_km">';
					// Định dạng dấu chấm (.) ngăn phần nghìn, và VNĐ
						$number2 = $row_chitiet_khuyenmai["GiaKM"];
						$result .= number_format($number2,0,'','.')." đ";

						$result .= '</span>';

						$result .= '<p class="trang_thai">Trạng thái: ';
						if($row_chitiet_sanpham["SoLuong"] > 0 ){
							$result .= '<span>Còn hàng</span></p>';
						}
						else{
							$result .= '<span>Hết hàng</span></p>';
						}
						echo $result;
					}
					else{
					// Nếu không tồn tại giá KM => lừa tình CSS class"gia_goc"="gia_km" để định dạng giá cho đẹp;
					// và không hiển thị giá KM vì không có giá KM
						$tenclass = "gia_km";
						$result = '<span class="'.$tenclass.'">';
						$number1 = $row_chitiet_sanpham["DonGia"];
						$result .= number_format($number1,0,'','.')." đ";
						$result .= '</span>';
						$result .= '<p class="trang_thai">Trạng thái: ';
						if($row_chitiet_sanpham["SoLuong"] > 0 ){
							$result .= '<span>Còn hàng</span></p>';
						}
						else{
							$result .= '<span>Hết hàng</span></p>';
						}
						echo $result;
					}
				?>
			</div>
			<form>
			 	<span>Số lượng: </span>
				<input type='text' name='so_luong' value='1' ><br/>
				<input type='submit' value='Thêm vào giỏ' > 
				<a href="./"><button type="submit">Thoát</button></a>
			 </form> 
		</td>
	</tr>
	<tr id="tieude_chitiet">
		<td colspan="2" style="text-align: center;"><p><span>Mô tả sản phẩm</span></p></td>
	</tr>
	<?php 
		echo $row_chitiet_sanpham["TomTat"];
 	?>
</table>


<style>
	section #table_chitiet_sp{
		background-image: url(./img/bg_ndsp.png);
		width:100%;
		padding:20px 0px 20px 19%;
		font-size: 20px;
	}
	section  #table_chitiet_sp tr td{
		width: 350px;
	}
	section div.content div.top_sp h2 a{
		text-transform: none;
	}
	section #table_chitiet_sp tr td.anh{
		text-align: center;
		height: 180px;
		background: #ffffff;
		border-radius: 10px;
		box-shadow: 3px 3px 2px #feac24;/*bóng đổ */
	}
	section #table_chitiet_sp tr td.anh img{
		height:175px;
		/* width: 350px; */
	}
	section #table_chitiet_sp tr td.ten_gia_sp_form{
		float: left;
		padding: 5px 0 0 30px;
	}
	section #table_chitiet_sp tr td.ten_gia_sp_form div.giasp{
		margin: 15px 0;
	}
	section #table_chitiet_sp tr td.ten_gia_sp_form div.giasp .gia_goc {
	    text-decoration: line-through;
	    color: #999;
	    font-size: 0.8em;
	}
	section #table_chitiet_sp tr td.ten_gia_sp_form div.giasp .gia_km {
	    font-weight: bold;
	    color: #feac24;
	}
	section #table_chitiet_sp tr td.ten_gia_sp_form div.giasp p.trang_thai{
		margin-top: 15px;
		font-size: 20px;
	}
	section #table_chitiet_sp tr td.ten_gia_sp_form div.giasp p.trang_thai span{
		color: #009cde;
	}
	section #table_chitiet_sp tr td.ten_gia_sp_form form span{
		font-weight: bold;
	}
	section #table_chitiet_sp tr td.ten_gia_sp_form form input{
		padding: 3px 7px;
		text-align: center;
		margin-right: 7px;
	}
	section #table_chitiet_sp tr td.ten_gia_sp_form form input[type="text"]{
		width: 100px;
		margin-bottom: 17px;
	}
	section #table_chitiet_sp tr td.ten_gia_sp_form form a button,
	section #table_chitiet_sp tr td.ten_gia_sp_form form input[type="submit"]{
		width: 148px;
		height: 48px;
		text-align: center;
		background: #ff971c;
		font-size:18px;
		color: #ffffff;
		border: none;
		border-radius: 3px;
	}
	
	section  #table_chitiet_sp #tieude_chitiet td p span{
		font-size: 24px;
		color: #009cde;
		text-decoration-line: underline;
    	text-decoration-style: solid; 
	}
	section  #table_chitiet_sp #tieude_chitiet,section  #table_chitiet_sp tr.noidung_chitiet{
   		float: left;
   		width: 200%;
   		padding: 6px;
   		display: table-cell;
   		vertical-align:bottom; /* Canh giữa theo CHIỀU DỌC */
   		border-bottom: 1px solid #ddd;
   		font-size: 18px;
	}
	section  #table_chitiet_sp #tieude_chitiet{
   		margin: 25px auto 10px;
   		border-bottom: none;
	}
	section  #table_chitiet_sp #tieude_chitiet td {
		display:block;/* một khối nằm trong row-> tr */
		text-align: center;
	}
	section  #table_chitiet_sp tr.noidung_chitiet td:first-child{
		font-weight: bold;
	}
</style>
	 
		
		 
			 
			 
		
	 