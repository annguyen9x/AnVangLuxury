<!-- Phần slide -->
			<div class="slide_nut">
				<?php
					$slide = SlideShow();
					while($row_slide = $slide->fetch(PDO::FETCH_ASSOC))
					{
				?>
				<a href="index.php?p=chitiet_slide&amp;IDSlide=<?php echo $row_slide["IDSlide"];?>">
					<img src="./img/slideshow/<?php echo $row_slide["urlHinh"];?>" title="" alt="anh.<?php echo $row_slide["IDSlide"];?>" class="slide"/>
				</a>
				<?php
					}
				?>
			<!-- Nút di chuyển slide -->
				<button onClick="Chuyen_slide(1);" type="button" id="next">&lt;</button>
				<button onClick="Chuyen_slide(-1);" type="button" id="back">&gt;</button>
			</div>