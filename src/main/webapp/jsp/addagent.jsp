<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
    <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js" ></script>


	<!--[if lt IE 9]><script src="../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="../assets/js/html5shiv/r29/html5shiv.min.js"></script>
		<script src="../assets/js/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<script type="text/javascript">
		function addagent(){
			if($("#Ver").val()==''||$("#name").val()==''||$("#phone").val()==''||
			$("#account").val()==''||$("#passwrod").val()==''||$("#repassword").val()==''){
						alert("输入不能为空");
						
				}else{
			if($("#passwrod").val()==$("#repassword").val()){
				$.ajax({
						url:'${pageContext.request.contextPath}/admin/addagent',
						method:'post',
						data:$('#addagentfrom').serialize(),　
						success: function(response){
						      if(response==1){
								alert("新建代理商成功！");
							    $("#addagentfrom")[0].reset();
									}
								},
						error : function(XMLHttpRequest, textStatus, errorThrown) { 
						         		alert("新建代理商失败！")
						       		 }
						});
						} else{
								alert("两次密码输入不一致");
								
						}
					}
				}
	</script>

</head>
<body class="page-body" data-url="http://www.poandsoul.com">

<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
	<div class="main-content">				
		<div class="page-container">
		  <div class="main-content">        
		    <div class="row">
		      <div class="col-md-6 col-sm-8 clearfix">
		        <ul class="user-info pull-left pull-none-xsm">
		          <li class="profile-info dropdown">
		            <h2 style="color: steelblue;">查询代理商</h2>
		          </li>
		        </ul>
		      </div>
   		 </div>      
    	<br />    
		<br />
		<div class="row">
			<div class="col-md-12">
				
				<div class="panel panel-primary" data-collapsed="0">
					
					<div class="panel-body">
						
						<form role="form" class="form-horizontal form-groups-bordered" id="addagentfrom">
							<div class="form-group">
								<label for="field-3" class="col-sm-3 control-label">版本号</label>
								 
								<div class="col-sm-5">
									<input type="text" class="form-control" id="Ver"  name="Ver" >
								</div>
							</div>
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label">名称</label>	
								<div class="col-sm-5">
									<input type="text" class="form-control" id="name" name="name" >
								</div>
							</div>
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label">电话号码</label>	
								<div class="col-sm-5">
									<input type="text" class="form-control" id="phone" name="phone" >
								</div>
							</div>
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label">账号</label>	
								<div class="col-sm-5">
									<input type="text" class="form-control" id="account" name="account">
								</div>
							</div>							
							<div class="form-group">
								<label for="field-3" class="col-sm-3 control-label" type="password">密码</label>
								
								<div class="col-sm-5">
									<input type="password" class="form-control" id="passwrod"  name="passwrod" >
								</div>
							</div>
							<div class="form-group">
								<label for="field-3" class="col-sm-3 control-label">确认密码</label>
								
								<div class="col-sm-5">
									<input type="password" class="form-control" id="repassword" name="repassword"  >
								</div>
							</div>
							
	
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-5">
									<button onclick="addagent()" class="btn btn-default">保存</button>
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
	


	<!-- Demo Settings -->
	<script src="../assets/js/neon-demo.js"></script>

</body>
</html>