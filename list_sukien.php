<?php
include('inc/check_session.php'); 
include('includes/header.php');?>
<?php include('inc/connect.php'); ?>

 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"></h1>
                </div>
             
            </div>

<div class="row">
	<div class="col-log-12 col-md-12 col-sm-12 col-xs-12 ">
		<div class="panel panel-info">
  			<!-- Default panel contents -->
 		 	<div class="panel-heading"><h3>Danh sách Sự Kiện</h3></div>
 			<div class="panel-body">
 				<table  class="table table-hover table-striped table-bordered table-responsive " id="tb" >
					<thead>
						<tr>
							<th>Tên Sự Kiện</th>
							<th>Khách mời tham gia</th>
						</tr>	
					</thead>
					<tbody>
						<?php

							$query = "SELECT topic.id as id, topic.name AS name, speaker.name AS nameSpeaker FROM topic, speaker WHERE topic.id_speaker = speaker.id_speaker";
							$rersult = mysqli_query($mysqli,$query) ;
							while ($phongban = mysqli_fetch_array($rersult)){
						?>  

						<tr>
							<td> <a href="list_nvsk.php?mota=<?php echo $phongban['id'] ?> &submit=Xác+Nhận"><?php echo $phongban['name'] ?></a></td>
							<td><?php echo $phongban['nameSpeaker'] ?></td>
						</tr>
						<?php 
							}
						?>
					</tbody>
			
				</table>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>
</div>

<?php include('includes/footer.php') ;?>
