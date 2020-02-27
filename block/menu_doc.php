<div id="menu_doc"> 	<!-- Menu dọc-->
		<div id="top">
			<img src="./img/menu.png" title="menu" alt="icon"/>
			<span>DANH MỤC SẢN PHẨM</span>
		</div>

		<dl>
			<?php
				$menuDoc = Menu_doc_DanhMuc_SanPham();
				while($row_menuDoc = $menuDoc->fetch(PDO::FETCH_ASSOC))
				{
			?>
			<dt>
				<img src="./img/check.png" title="check" alt="check"/>
				<span>
					<a href="index.php?p=sanpham_cungloai&amp;MaLSP=<?php echo $row_menuDoc["MaLSP"];?>">
						<?php echo $row_menuDoc["TenLSP"]; ?>
					</a>
				</span>
			</dt>

			<?php 

				}
			?>		
		</dl>
	</div>