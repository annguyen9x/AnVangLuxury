function check_form(){
	var hople = true;

	//Email phải đúng định dạng
	var email=document.getElementById("email").value;
	var reg_mail=/^[a-zA-Z0-9]+([_\.\-]?[A-Za-z0-9])*@[a-zA-Z0-9]+([_\.\-]?[A-Za-z0-9])*(\.[A-Za-z]+)+$/;
	if(reg_mail.test(email) == false)
	{		
		hople = false;
		document.getElementById("err_email").innerHTML="<br/>Địa chỉ email không hợp lệ !";
		err_email.style.color="red";
		document.getElementById("email").focus();
	}
	else{
		document.getElementById("err_email").innerHTML="";
	}

	//Mật khẩu tối thiểu 6 ký tự
	var mk = document.getElementById("matkhau").value;
	if(mk.length < 6)
	{
		hople = false;
		document.getElementById("err_matkhau").innerHTML="<br/>Mật khẩu phải từ 6 ký tự !";
		err_matkhau.style.color="red";
		document.getElementById("matkhau").focus();
	}
	else{
		document.getElementById("err_matkhau").innerHTML="";
	}

	//Mật khẩu nhập lại phải khớp với mật khẩu
	var nhaplai_mk = document.getElementById("nhaplai_matkhau").value;
	if(nhaplai_mk != mk)
	{
		hople = false;
		document.getElementById("err_nhaplaimk").innerHTML="<br/>Mật khẩu nhập lại chưa đúng !";
		err_nhaplaimk.style.color="red";
		document.getElementById("nhaplai_matkhau").focus();
	}
	else{
		document.getElementById("err_nhaplaimk").innerHTML="";
	}

	//Số dt phải là dữ liệu kiểu số, không được  để trống	
	var dt = document.getElementById("dienthoai").value;
	if(isNaN(dt) == true || dt=="")
	{
		hople = false;
		document.getElementById("err_dienthoai").innerHTML="<br/>Điện thoại phải là kiểu số !";
		err_dienthoai.style.color = "red";
		document.getElementById("dienthoai").focus();
	}
	else{
		document.getElementById("err_dienthoai").innerHTML="";
	}	

	//Họ tên từ 2 đến 25 ký tự
	var ten = document.getElementById("ten").value;
	if( ten.length < 2 || ten.length > 25)
	{
		hople= false;
		document.getElementById("err_ten").innerHTML="<br/>Tên từ 2 đến 25 ký tự !";
		err_ten.style.color = "red";
		document.getElementById("ten").focus();
	}
	else
		{

		document.getElementById("err_ten").innerHTML="";
	}

	//Địa chỉ không được để trống, tối đa 200 ký tự
	var dc=document.getElementById("diachi").value;
	if(dc == "" || dc.length > 200)
	{
		hople = false;
		document.getElementById("err_diachi").innerHTML = "<br/>Vui lòng nhập chính xác địa chỉ !";
		err_diachi.style.color = "red";
		document.getElementById("diachi").focus();
	}
	else
		{
		document.getElementById("err_diachi").innerHTML = "";
	}
	//Phải tích vào checkbox
	var trangthai = document.getElementById("checkbox").checked;
	if(!trangthai)
	{
		hople = false;
		document.getElementById("err_checkbox").innerHTML="<br/>Bạn phải đồng ý với các điều khoản !";
		err_checkbox.style.color = "red";
		document.getElementById("checkbox").focus();
	}
	else
		{
		document.getElementById("err_checkbox").innerHTML = "";
	}

	//Nếu form không có lỗi thì submit() gửi dữ liệu về server 
	if(hople)
	{
		document.getElementById("form_dangky").submit();
	}
}	