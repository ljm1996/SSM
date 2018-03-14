<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="description" content="Neon Admin Panel" />
	<meta name="author" content="" />

	<link rel="icon"href="../assets/images/favicon.ico">

	<title>Neon | Forms</title>

	<link rel="stylesheet"href="../assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
	<link rel="stylesheet"href="../assets/css/font-icons/entypo/css/entypo.css">
	<link rel="stylesheet"href="../assets/css/bootstrap.css">
	<link rel="stylesheet"href="../assets/css/neon-core.css">
	<link rel="stylesheet"href="../assets/css/neon-theme.css">
	<link rel="stylesheet"href="../assets/css/neon-forms.css">
	<link rel="stylesheet"href="../assets/css/custom.css">

	<script href="../assets/js/jquery-1.11.3.min.js"></script>

	<!--[if lt IE 9]><script href="../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script href="../assets/js/html5shiv/r29/html5shiv.min.js"></script>
		<script href="../assets/js/respond/1.4.2/respond.min.js"></script>
	<![endif]-->


</head>
<body class="page-body" data-url="http://www.poandsoul.com">
	<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
		<div class="main-content">	
			<div id="table">
				<h2>分辨率列表</h2>
					<table class="table table-bordered table-striped datatable" id="table-2">
						<thead>
							<tr>
								<th>分辨率</th>
								<th>操作</th>
							</tr>
					</thead>
						<tbody>
							<tr>
								<td>Randy S. Smith</td>
								<td>
									<button type="button" class="btn btndenrudefault">修改</button>
									<button type="button" class="btn btn-blue">管理视频</button>
									<button type="button" class="btn btn-blue">查询视频</button>
						            <button type="button" class="btn btn-danger">删除</button>
						            
								
							</tr>	
						</tbody>
					</table>
				<br />		
			</div>
		
		<h2>分辨率添加</h2>
			<br />
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary" data-collapsed="0">
						<div class="panel-body">
							<form role="form" class="form-horizontal form-groups-bordered">
								<div class="form-group">
									<label for="field-3" class="col-sm-3 control-label">分辨率</label>		
									<div class="col-sm-5">
										<input type="text" class="form-control" id="field-3"  >
									</div>
								</div>
								<br/>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-5">
										<button type="submit" class="btn btn-default">添加</button>
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
	<script href="../assets/js/gsap/TweenMax.min.js"></script>
	<script href="../assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
	<script href="../assets/js/bootstrap.js"></script>
	<script href="../assets/js/joinable.js"></script>
	<script href="../assets/js/resizeable.js"></script>
	<script href="../assets/js/neon-api.js"></script>


	<!-- Imported scripts on this page -->
	<script href="../assets/js/bootstrap-switch.min.js"></script>
	<script href="../assets/js/neon-chat.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script href="../assets/js/neon-custom.js"></script>
	<!--<script href="../assets/js/messages_cn.js"></script>-->


	<!-- Demo Settings -->
	<script href="../assets/js/neon-demo.js"></script>

</body>
</html>