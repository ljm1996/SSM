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
						$('#nextboxtable').append("<tr><td>"+date[i].groupname
						+"</td><td>"+date[i].lic+"</td><td>"+date[i].lan+"</td><td>"+date[i].phone+"</td>"
						+"<td>"
						+"<button type='button' class='btn btn-default' onclick=\"showAjaxModal('"+date[i].id+"','"+date[i].groupname+"','"+date[i].lic+"','"+date[i].lan+"','"+date[i].phone+"')\">"
						+"修改</button>"+
						"&nbsp<button type='button' class='btn btn-red'>禁用</button>"
						+"&nbsp<button type='button' class='btn btn-info'>详细信息</button>"
						+"&nbsp<button type='button' class='btn btn-blue'>下载</button></td></tr>")
						}
						
				    },
				            
			});
		}); 
    function addnextbox(){
			if($("#groupName").val()==''||$("#lic").val()==''||$("#lan").val()==''||
			$("#phone").val()==''){
						alert("输入不能为空");
						
				}else{
			
				$.ajax({
						url:'${pageContext.request.contextPath}/nextbox/insertNextbox',
						method:'post',
						data:$('#addnextboxfrom').serialize(),　
						success: function(response){
						      if(response==1){
									alert("保存成功！");
									 $("#addnextboxfrom")[0].reset();
									  location.reload(true)
									}
								},
						error : function(XMLHttpRequest, textStatus, errorThrown) { 
						         		alert("保存失败！");
						         		
						       		 }
						});
						} 	
					}
	
	function showAjaxModal(id,groupname,lic,lan,phone)
	{   
	    $('#Id').val(id);
	    $('#Groupname').val(groupname);
	    $('#Lic').val(lic);
	    $('#Lan').val(lan);
	    $('#Phone').val(phone);
		$('#hiddenid').hide();
		jQuery('#modal-6').modal('show', {backdrop: 'static'});
		jQuery.ajax({
			url: "data/ajax-content.txt",
			success: function(response)
			{
				jQuery('#modal-7 .modal-body').html(response);
			}
		});
	}
	function updatenextbox()
	{
		jQuery.ajax({
			url: "${pageContext.request.contextPath}/nextbox/updateNextbox",
			method:'post',
			data: $('#updatenextboxfrom').serialize(),　
			success: function(response)
			{
				alert("修改成功！");
				$('#modal-6').hide();
				location.reload();
				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("修改失败！");
						         		
			 }
		});
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
					            <h2>魔盒信息</h2>
					          </li>
					        </ul>
      					</div>
					    <div class="col-md-6 col-sm-4 clearfix hidden-xs">
					        <ul class="list-inline links-list pull-right">
					          <li>
					            <button type="button" class="btn btn-red btn-icon icon-left">
													禁用
													<i class="entypo-cancel"></i>
												</button>
					            
					          </li>
					          <li>
					            <button type="button" class="btn btn-green btn-icon icon-left">
													启用
													<i class="entypo-check"></i>
												</button>
					          </li>
					        </ul>
				      </div>
   				 </div>      
			    	 <hr />
			         <br />    
					 <div id="table">
							<table class="table table-bordered table-striped datatable" id="nextboxtable">
								<thead>
									<tr>
										<th>组名</th>
										<th>名称</th>
										<th>广域IP</th>
										<th>电话</th>
										<th>操作</th>
									</tr>
								</thead>
							</table>
							<br />		
					</div>			
					 <h2>新建魔盒组表</h2>
					 <br />
					 <div class="row">			
					 <div class="col-md-12">
						
						<div class="panel panel-primary" data-collapsed="0">
							
							<div class="panel-body">
								
								<form role="form" class="form-horizontal form-groups-bordered" id="addnextboxfrom">
									<div class="form-group">
										<label for="field-3" class="col-sm-3 control-label">组名</label>
										
										<div class="col-sm-5">
											<input type="text" class="form-control" id="groupName" name="groupname" >
										</div>
									</div>
									<div class="form-group">
										<label for="field-1" class="col-sm-3 control-label">名称</label>	
										<div class="col-sm-5">
											<input type="text" class="form-control" id="lic" name="lic" >
										</div>
									</div>			
									<div class="form-group">
										<label for="field-3" class="col-sm-3 control-label">广域IP</label>
										
										<div class="col-sm-5">
											<input type="text" class="form-control" id="lan" name="lan"  >
										</div>
									</div>
									<div class="form-group">
										<label for="field-3" class="col-sm-3 control-label">电话</label>
										
										<div class="col-sm-5">
											<input type="text" class="form-control" id="phone" name="phone" >
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-5">
											<button type="button" onclick="addnextbox()" class="btn btn-default">保存</button>
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
	<div class="modal fade" id="modal-6" style="display: none;">
	
    <div class="modal-dialog">
   
      <div class="modal-content"> 
        <form id="updatenextboxfrom">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h3 class="modal-title">修改魔盒</h3>
        </div> 
        <div class="modal-body">
        
          <div class="row">
	            <div class="col-md-12">
		              <div class="form-group" id="hiddenid">
		                <input type="text" class="form-control" id="Id" name="id">
		              </div>     
		              <div class="form-group">
		                <label for="field-3" class="control-label">组名</label>
		                <input type="text" class="form-control" id="Groupname" name="groupname">
		              </div>     
	            </div>
          </div>
          
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="field-3" class="control-label">名称</label>
                <input type="text" class="form-control" id="Lic" name="lic" >
              </div>  
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="field-3" class="control-label">广域IP</label>
                <input type="text" class="form-control" id="Lan" name="lan">
              </div>  
            </div>
          </div>
          
          <div class="row">
            <a href="#" ></a>
            <div class="col-md-12">
              <div class="form-group">
                <label for="field-3" class="control-label">电话</label>
                <input type="text" class="form-control" id="Phone" name="phone">
              </div>  
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
          <button type="button" class="btn btn-info" onclick="updatenextbox()">保存</button>
        </div>
        </form>
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