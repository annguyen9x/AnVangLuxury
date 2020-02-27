<div class="canhdeu_2ben">
	<ul>
		<li id="trangchu">
			<a href="./">Trang chủ</a>
		</li>

		<?php 
			$menuNgang = Menu_ngang_TinTuc();
			while($row_menuNgang = $menuNgang->fetch(PDO::FETCH_ASSOC))
			{
		?>
		<li>
			<a href="index.php?p=chitiet_tin_menu_ngang&amp;IDTin=<?php echo $row_menuNgang["IDTin"];?>">
				<?php echo $row_menuNgang["TenTin"];?>
			</a>
		</li>

		<?php 
			} 
		?>
		</li>
	</ul>
</div>