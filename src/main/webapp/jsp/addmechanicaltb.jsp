<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
	<html lang="en">
	<head>	
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
	<script type="text/javascript">
		function addmachine(){
			if($("#machinename").val()==''||$("#mac").val()==''||$("#machinekey").val()==''||
			$("#machinecode").val()==''){
						alert("输入不能为空");
						
				}else{
			
				$.ajax({
						url:'${pageContext.request.contextPath}/machine/insertmachine',
						method:'post',
						data:$('#machienfrom').serialize(),　
						success: function(response){
						      if(response==1){
									alert("保存成功！");
									 $("#machienfrom")[0].reset();
									  location.reload(true)
									}
								},
						error : function(XMLHttpRequest, textStatus, errorThrown) { 
						         		alert("保存失败！");
						       		 }
						});
						} 	
					}
	
	</script>

</head>
<body class="page-body" data-url="http://www.poandsoul.com">

<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
	<div class="main-content">				
		<h2>新建机器</h2>
		<br />
		<div class="row">
			<div class="col-md-12">
				
				<div class="panel panel-primary" data-collapsed="0">
					
					<div class="panel-body">

						<form action="${pageContext.request.contextPath}/machine/insertmachine" method="post"  id="machienfrom" role="form" class="form-horizontal form-groups-bordered">
							<div class="form-group">
								<label for="field-3" class="col-sm-3 control-label">机器名称</label>
								 
								<div class="col-sm-5">
									<input type="text" class="form-control" id="machinename" name="machinename" >
								</div>
							</div>
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label">Mac地址</label>	
								<div class="col-sm-5">
									<input type="text" class="form-control" id="mac" name="mac">
								</div>
							</div>
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label">序列号</label>	
								<div class="col-sm-5">
									<input type="text" class="form-control" id="machinekey" name="machinekey" >
								</div>
							</div>
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label">激活码</label>	
								<div class="col-sm-5">
									<input type="text" class="form-control" id="machinecode" name="machinecode" >
								</div>
							</div>							
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-5">
									<button type="button" class="btn btn-default" onclick="addmachine()" >保存</button>
								</div>
							</div>
						</form>
						
					</div>
				
				</div>
			
			</div>
		</div>
	</div>
</div>

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
	<script src="../assets/js/messages_cn.js"></script>


	<!-- Demo Settings -->
	<script src="../assets/js/neon-demo.js"></script>

</body>
</html>