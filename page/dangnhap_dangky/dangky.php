
<!-- Hàm tạo ngày tháng dạng Select-Option -->
<?php

	$mangNgay = range(1,31);
	$mangThang = range(1,12);
	$mangNam = range(1970,2050);

// Hàm sẽ chạy 2 lần: trước khi người dùng chọn => tham số ngày, tháng, năm truyền vào = 0 nó hiển thị giá trị tại: $mang[0] chính là gtri mặc định ;
// Và sau khi người dùng chọn nó sẽ chạy lần 2 => khi đó tham số ngày, tháng,.. truyền vào do người dùng chọn (được lấy qua $_POST[] thông qua nút submit form )=> mảng hiển thị lại giá trị tại vị trí đó: $mang[Vị trí mới chọn];

	function taoChuoiSelectOptionNgayThang($mang,$kieuNgayThang,$chiSo)
	{
		$result = '';
		if ( !empty($mang)) {// Ktra mảng truyền vào không rỗng
			$result = '<select name="'.$kieuNgayThang.'" id="'.$kieuNgayThang.'">';
			for($i = 0; $i < count($mang); $i++){
			
				if($i == $chiSo){
					//Hiển thị giá trị Option trong mảng tại vị trí = vị trí truyền vào 
					$result .= '<option value="'.$i.'" selected = "true">'.$mang[$i].'</option>';
				}
				else{
					$result .= '<option value="'.$i.'">'.$mang[$i].'</option>';
				}
			}
			$result .= '</select>';
		}
		return $result;
	}

// Vị trí ngày, tháng, năm trong mảng sẽ chạy 2 lần: Lúc đầu người dùng chưa nhấn "submit" form thì vị trí ngày trong mảng = 0; Sau khi người dùng nhập ngày, tháng thì vị trí = Giá trị $_POST[] lấy ra khi người dùng nhấn "submit".

 $chiSoNgay = ( isset($_POST["ngaySinh"]) ) ? $_POST["ngaySinh"] : 0;// lúc đầu nhận giá trị = 0
 $chiSoThang = ( isset($_POST["thangSinh"]) ) ? $_POST["thangSinh"] : 0;
 $chiSoNam = ( isset($_POST["namSinh"]) ) ? $_POST["namSinh"] : 0;

//Hàm tạo ngày, tháng, năm sẽ chạy 2 lần: trước khi người dùng nhấn "submit" nó được truyền vào vị trí ngày, tháng = 0; sau khi người dùng nhập và nhấn "submit" nó nhận vị trí tại vị trí chọn ngày tháng => nó chạy lần 2 để hiển thị kết quả người dùng đã chọn

  $chuoiNgay = taoChuoiSelectOptionNgayThang($mangNgay,"ngaySinh",$chiSoNgay);// chạy 2 lần: trước và sau khi người dùng chọn
  $chuoiThang = taoChuoiSelectOptionNgayThang($mangThang,"thangSinh",$chiSoThang);
  $chuoiNam = taoChuoiSelectOptionNgayThang($mangNam,"namSinh",$chiSoNam);

?> 
<div class="content" id="sp_KM">
		<div class="top_sp">
			<h2><a href="index.php?p=dangky">Đăng ký tài khoản</a></h2>
		</div>
</div>
<div class="dangky">
	<h3>Thông tin đăng ký tài khoản khách hàng</h3>
	<form method="post" action="index.php?p=xuly_dangky" id="form_dangky" enctype="multipart/form-data">
		<p>
			<span class="left_form">
				<label>Địa chỉ email<span class="phaiNhap">(*)</span><b>:</b></label>
				<span id="err_email"></span>
			</span>
			<input type="email" placeholder="Vui lòng nhập email của bạn" id="email">
		</p>
		<p>
			<span class="left_form">
				<label>Mật khẩu<span class="phaiNhap">(*)</span><b>:</b></label>
				<span id="err_matkhau"></span>
			</span>
			<input type="password" placeholder="Mật khẩu tối thiểu 6 ký tự" id="matkhau">
		</p>
		<p>
			<span class="left_form">
				<label>Nhập lại mật khẩu<span class="phaiNhap">(*)</span><b>:</b></label>
				<span id="err_nhaplaimk"></span>
			</span>
			<input type="password" placeholder="Vui lòng nhập lại mật khẩu"	id="nhaplai_matkhau">
		</p>
		<p>
			<span class="left_form">
				<label>Điện thoại<span class="phaiNhap">(*)</span><b>:</b></label>
				<span id="err_dienthoai"></span>
			</span>
			<input type="tel" placeholder="Nhập số điện thoại" id="dienthoai">
		</p>
		<p>
			<span class="left_form">
				<label>Ảnh đại diện <b>:</b></label>
				<span id="err_hinhAnh"></span>
			</span>
			<input type="file" name="hinhAnh" id="hinhAnh">
		</p>
		<p>
			<span class="left_form">
				<label>Họ tên<span class="phaiNhap">(*)</span><b>:</b></label>
				<span id="err_ten"></span>
			</span>
			<input type="text" placeholder="Vui lòng nhập họ tên" id="ten">
		</p>
		<p>
			<span class="left_form">
				<label>Ngày sinh <b>:</b></label>
				<span id="err_ngaySinh"></span>
			</span>
			<span class="ngaySinh">
				<?php echo $chuoiNam; ?>
				<?php echo $chuoiThang; ?>
				<?php echo $chuoiNgay; ?>
			</span>
		</p>
		<p>
			<span class="left_form">
				<label>Giới tính <b>:</b></label>
			</span>
			<span class="gioiTinh">
				<input type="radio" name="gioitinh" checked="checked" value ="1"> Nam
				<input type="radio" name="gioitinh" value ="0"> Nữ
				<input type="radio" name="gioitinh" value ="2"> Giới tính khác(LGBT)
			</span>
		</p>
		<p class="textarea">
			<span class="left_form">
				<label>Địa chỉ liên lạc<span class="phaiNhap">(*)</span><b>:</b></label>
				<span id="err_diachi"></span>
			</span>
			<textarea cols="61" rows="6" maxlength="200" 
			placeholder=" Vui lòng nhập địa chỉ của bạn" id="diachi">
			</textarea>
		</p>
		<p>
			<label><input type="checkbox" id="checkbox"></label>
			<span id="err_checkbox"></span>
			<span>Tôi hoàn toàn đồng ý với các điều khoản mua hàng trên website anvang.com.vn
			</span>
		</p>
		<p class="nut_dangky">
			<button type="reset">Nhập lại</button>
			<button type="submit" name="submit">Đăng ký</button>
		</p>
	</form>
</div>
