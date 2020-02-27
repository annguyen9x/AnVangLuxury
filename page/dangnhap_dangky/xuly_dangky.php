<?php
	if(isset($_POST['submit'])){
		if($_FILES['hinhAnh']['error'] != 0){//Nếu != 0 => có lỗi
			echo "Có lỗi trong việc uploadfile lên Server";
		}
		else
		{
			$fileTam = $_FILES['hinhAnh']['tmp_name'];
			//Đường dẫn tuyệt đối => gán tên file là"hinhAnh"
			// $noiLuu = 'D:/XAMPP/htdocs/web_vang/img/khachhang/'.$_FILES['hinhAnh']['name'];

			//Đường dẫn tương đối => gán tên file là"hinhAnh"
			$noiLuu = "./img/khachhang/".$_FILES['hinhAnh']['name'];//Lấy tên file trong file có tên "hinhAnh"
			move_uploaded_file( $fileTam,$noiLuu);
			echo "Uploadfile thành công";
		}
	}
	else{
	echo "Chưa nhấn submit";
	}
?> 