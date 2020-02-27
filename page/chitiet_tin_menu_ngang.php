<?php
	if(isset($_GET["IDTin"]))
	{
		$IDTin = $_GET["IDTin"];
	}
	else{
		$IDTin = 1;
	}
?>
<?php
	$chitiet_tin_menu_ngang = Menu_ngang_TinTuc_Theo_IDTin($IDTin);
	$row_chitiet_tin_menu_ngang = $chitiet_tin_menu_ngang->fetch(PDO::FETCH_ASSOC);
	
?>
<div class="content" id="chitiet_menu_ngang">
	<div class="top_sp">
		<h2><a href="index.php?p=chitiet_tin_menu_ngang&amp;IDTin=<?php echo $IDTin;?>">
				<?php echo $row_chitiet_tin_menu_ngang["TenTin"]; ?>
			</a>
		</h2>
	</div>
	<div class="noidung_sp">
		<?php 
			echo $row_chitiet_tin_menu_ngang["NoiDung"];
		?>
	</div>
</div>
<style>
	#chitiet_menu_ngang{
		
	}
	#chitiet_menu_ngang div.noidung_sp{
		float:left;
		padding: 25px 20px;
		text-align: justify;
		font-size: 18px;
		line-height: 24px;
	}
</style>