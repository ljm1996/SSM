<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="description" content="Neon Admin Panel" />
	<meta name="author" content="" />

	<link rel="icon" href="../assets/images/favicon.ico">

	<title>Neon | Forms</title>

	<link rel="stylesheet" href="../assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
	<link rel="stylesheet" href="../assets/css/font-icons/entypo/css/entypo.css">
	<link rel="stylesheet" href="../assets/css/bootstrap.css">
	<link rel="stylesheet" href="../assets/css/neon-core.css">
	<link rel="stylesheet" href="../assets/css/neon-theme.css">
	<link rel="stylesheet" href="../assets/css/neon-forms.css">
	<link rel="stylesheet" href="../assets/css/custom.css">

	<script src="../assets/js/jquery-1.11.3.min.js"></script>

	<!--[if lt IE 9]><script src="../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="../assets/js/html5shiv/r29/html5shiv.min.js"></script>
		<script src="../assets/js/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	


</head>
<body class="page-body" data-url="http://www.poandsoul.com">

<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
	<div class="main-content">				
		<h2>视屏上传</h2>
		<br />
		<div class="row">
			<div class="col-md-12">
				
				<div class="panel panel-primary" data-collapsed="0">
					
					<div class="panel-body">
						
						<form  id="videofile" class="form-horizontal form-groups-bordered"   enctype="multipart/form-data">
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label">视屏名称</label>
								
								<div class="col-sm-5">
									<input type="text" class="form-control" id="videoname"  name="videoname" >
								</div>
							</div>

							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label">视屏地址</label>
								
								<div class="col-sm-5">
									<input type="file" class="form-control" id="videoaddress" name="videoaddress" placeholder="Placeholder">
								</div>
							</div>
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label">视屏图片</label>
								
								<div class="col-sm-5">
									<input type="file" class="form-control" id="videoimg" name="videoimg" placeholder="Placeholder">
								</div>
							</div>
						    <div class="form-group">
								<div class="col-sm-offset-3 col-sm-5">
									<button type="button" class="btn btn-default" onclick="uploadmeth()">上传</button>
								</div>
							</div>
						</form>
						
					</div>
				
				</div>
			
			</div>
		</div>
	</div>
</div>



	<script type="text/javascript">
	function uploadmeth(){
	var form = new FormData(document.getElementById("videofile"));
		 if($("#videoname").val()==''||$("#videoaddrass")==''||$("#videoimg")==''){
		 	alert("输入不能为空！")
		 }else{ 
			$.ajax({
					url : '${pageContext.request.contextPath}/video/upload',
					type: "POST",   //提交的方法
					data:form,
					processData:false,
	                contentType:false,
					error: function(XMLHttpRequest, textStatus, errorThrown)
					{
						alert(XMLHttpRequest.status);
	 					alert(XMLHttpRequest.readyState);
	 					alert(textStatus);
					},
					success: function(response)
					{		
						alert("上传成功！");
					     $("#videofile")[0].reset();
					}
			    });
			 }
		
		  
	}
			
	
	</script>

	<!-- Bottom scripts (common) -->
	<script src="../assets/js/gsap/TweenMax.min.js"></script>
	<script src="../assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
	<script src="../assets/js/bootstrap.js"></script>
	<script src="../assets/js/joinable.js"></script>
	<script src="../assets/js/resizeable.js"></script>
	<script src="../assets/js/neon-api.js"></script>


	<!-- Imported scripts on this page -->
	<script src="../assets/js/bootstrap-switch.min.js"></script>
	<script src="../assets/js/neon-chat.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="../assets/js/neon-custom.js"></script>


	<!-- Demo Settings -->
	<script src="../assets/js/neon-demo.js"></script>

</body>
</html>