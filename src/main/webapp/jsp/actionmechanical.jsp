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
	
		$(function(){ 
			　　     $.ajax({
					url:'${pageContext.request.contextPath}/nextbox/selectall',
					type: "POST",   //提交的方法
					processData:false,
		            contentType:false,
		            error : function() {
					alert("服务器错误！");
					
				},
					success : function(date) {
						for(var i = 0; i < date.length; i++){
						$("#selectbox").append("<option value='"+date[i].id+"'>"+date[i].groupname+"</option>");
							var getidnextbox=$('#selectbox').val();
						}
						show_sub(getidnextbox);		
				   }            
			});	
		}); 
	 function show_sub(idnextbox){
				$.ajax({
							url:'${pageContext.request.contextPath}/grouping/selectbyboxid',
							type: "POST",   //提交的方法
						    data: {id:idnextbox},
							error : function() {
								alert("服务器错误!");
							},
							success : function(date) {
							$("#selectgrouping").empty("");  
							$("#machinebody").empty("");  
							for(var i = 0; i < date.length; i++){
									$("#selectgrouping").append("<option value='"+date[i].id+"'>"+date[i].name+"</option>");
             								var getgroupingid=$('#selectbox').val();
											}	    
											showgroupid(getgroupingid);
											
							 }    
							});
	}
	function showgroupid(groupingid){
			$.ajax({
				 url:'${pageContext.request.contextPath}/machine/selectbygroupid',
				 type: "POST",   //提交的方法
				 data:{groupingid:groupingid},
				 error : function() {
						alert("服务器错误！");
						
					},
				 success:function(date){
				 	 if(date==""){
				 	 $('#machinebody').empty("");
				 	 alert("没有机器，请激活");
				 	 	
				 	 }else{
				 	 	for(var i = 0; i < date.length; i++){
							$("#machinetable").append("<tr><td>"+date[i].machinename
							+"</td><td>"+date[i].mac
							+"</td><td>"+date[i].machinekey
							+"</td><td>"+date[i].machinecode+"</td><td><button type='button' class='btn btn-default' onclick=\"tiaozhuan("+date[i].id+")\">分辨率管理</button>&nbsp<button type='button' class='btn btn-danger'>删除</button></td></tr>");			
								}
						
								
				 	 }
				 }
				 
			});
	}
	function  activation(){
	    var getgroupingid=$('#selectbox').val();
	    var mac=$('#mac').val();
	    if($('#mac').val()==""){
	    	alert("请输入Mac地址");
	    }else{
        $.ajax({
        			url:'${pageContext.request.contextPath}/machine/updategroupidbymac',
        			type: "POST",   //提交的方法
        			data:{
        				groupingid:getgroupingid,
        				mac:mac
        				},
        			error:function(date){
        				alert("激活失败！")
        			},
        			success : function(date) {	
        			    alert("激活成功")
        			    $('#mac').val("")
        			}
        			
        
        });
		$.ajax({
					url:'${pageContext.request.contextPath}/machine/selectbymac',
					type: "POST",   //提交的方法
					data:$('#machinefrom').serialize(),
					error : function() {
								alert("服务器错误！");
							},
					success : function(date) {	
					if(date==""){
								alert("该机器不存在");
								$('#mac').empty();
						}else{
							for(var i = 0; i < date.length; i++){
							$("#machinetable").append("<tr><td>"+date[i].machinename
							+"</td><td>"+date[i].mac
							+"</td><td>"+date[i].machinekey
							+"'</td><td>"+date[i].machinecode+"</td><td><button type='button' class='btn btn-default' onclick='tiaozhuan()'>分辨率管理</button>&nbsp<button type='button' class='btn btn-danger'>删除</button></td></tr>");
								}
								}
						  }          
						});
			}
		}
	function tiaozhuan(machineid){
	   location.href="../jsp/addScreentb.jsp?"+"machineid="+machineid;
	}
   	</script>
	</head>
	<body class="page-body" data-url="http://www.poandsoul.com">
	<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
		<div class="main-content">
			<div class="page-container">
 				 <div class="main-content">  
 				 <h2>魔盒选择</h2>
				 <div class="row">
					<div class="col-md-12">
						
							<div class="panel-body">
								<form role="form" class="form-horizontal form-groups-bordered">
									<div class="col-md-12">
										<select class="form-control" id="selectbox" onchange="show_sub(this.options[this.options.selectedIndex].value)" >	
										</select>
									</div>
								</form>
							</div>
						
					</div>
				</div>   
				 <h2>分组选择</h2>
				<div class="row">
					<div class="col-md-12">
							<div class="panel-body">
								<form role="form" class="form-horizontal form-groups-bordered">
									<div class="col-md-12">
										<select class="form-control" id="selectgrouping" onchange="showgroupid(this.options[this.options.selectedIndex].value)" >	
										</select>
									</div>
								</form>
							</div>
					</div>
				</div>  
				<br />
   				 <div class="row">
      					<div class="col-md-6 col-sm-8 clearfix">
					        <ul class="user-info pull-left pull-none-xsm">
					          <li class="profile-info dropdown">
					            <h2>魔盒分组信息</h2>
					          </li>
					        </ul>
      					</div>
   				</div>      
			    <br />    
			<div id="table">
				<table class="table table-bordered table-striped datatable" id="machinetable">
						<thead>
							<tr>
								<th>名称</th>
								<th>mac地址</th>
								<th>序列号</th>
								<th>激活码</th>
								<th>操作</th>
							</tr>
					</thead>
						<tbody id="machinebody">
						</tbody>
					</table>       
				<br />		
				<br />		
			</div>			
			<h2>新建魔盒分组</h2>
			<hr />
			<br />
			<div class="row">
				<div class="col-md-12">
					
					<div class="panel panel-primary" data-collapsed="0">
						
						<div class="panel-body">
							
							<form role="form" class="form-horizontal form-groups-bordered" id="machinefrom"> 
								<div class="form-group">
									<label for="field-3" class="col-sm-3 control-label">Mac地址</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="mac"  name="mac" >
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-5">
										<button type="button" class="btn btn-default" onclick="activation()">激活</button>
									</div>
								</div>
							</form>
							
						</div>
					
					</div>
				
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