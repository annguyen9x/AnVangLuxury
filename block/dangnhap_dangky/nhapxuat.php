<!-- Phần đăng kí, đăng nhập -->
		<div id="dangky_dangnhap">
			<div class="dangnhap">
				<div class="top" id="dang_nhap" >
					<span>Đăng nhập</span>
				</div>
				<div id="dang-nhap-form" >
					<form action="index.php" method="post">
						<table>
							<tr>
								<td><label for="user">Tên đăng nhập: </label><br><input type="text" name="username" id="user" placeholder="Nhập tên đăng nhập.." required ></td>
							</tr>
							<tr>
								<td><label for="pass">Mật khẩu:</label><br><input type="password"  name="password" id="pass" placeholder="Nhập mật khẩu.." required ></td>
							</tr>
							<tr>
								<td colspan="2" style="padding-top: 8px;"><input type="submit" name="submit_login" value="Đăng nhập" style="cursor: pointer; "></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="dangky">
		     	<div class="top" id="dang_ky" style="cursor: pointer; " >
		      		<a href="index.php?p=dangky"><span>Đăng ký</span></a>
				</div>
			</div>
		</div> <!-- dangky_dangnha -->
