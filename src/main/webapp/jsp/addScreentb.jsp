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
	<script type="text/javascript">
		jQuery(function($) { 
			  var loc = location.href;
			  var n1 = loc.length;//地址的总长度
			  var n2 = loc.indexOf("=");//取得=号的位置
			  var id = decodeURI(loc.substr(n2+1, n1-n2));//从=号后面的内容	  
			  $.ajax({
						url:'${pageContext.request.contextPath}/screen/selectbymachienid',
  						data:{
						 machineid:id
						},
						success: function(data){
							$('#tablebody').empty();
							for(var i=0;i<data.length;i++){
									$('#tablebody').append("<tr><td>"+data[i].pix+"</td><td>"
									+"<button type='button' class='btn btn-default' onclick=\"showAjaxModal('"+data[i].id+"','"+data[i].pix+"')\">修改</button>"
									+"&nbsp<button type='button' class='btn btn-danger' onclick=\"deletbyscreenif('"+data[i].id+"')\">删除</button>"
									+"&nbsp<button type='button' class='btn btn-blue' onclick=\"addvideo('"+data[i].id+"')\">添加视频</button>"
									+"&nbsp<button type='button' class='btn btn-blue' onclick='Administrationvideo()'>管理视频</button></td></tr>");		
								
								}
							},
						error: function(XMLHttpRequest, textStatus, errorThrown) {
						      alert(XMLHttpRequest.status); 
						    }
						});
		     
		});
		function Administrationvideo(){
		var v = parseUrl();//解析所有参数
		alert(v['adminid']);
		}
		function addvideo(Screenid){
		 alert(Screenid);
		   location.href="../jsp/choesVido.jsp?Screenid="+Screenid;
		}
		function deletbyscreenif(screenid){
		 if (window.confirm('你确定删除吗？')) {
			    $.ajax({
						url:'${pageContext.request.contextPath}/screen/deletbyscreenid',
						method:'post',
						data:{
							screenid:screenid,
						},　
						success: function(response){
									alert("删除成功！");
									location.reload(true)
								},
						error: function(XMLHttpRequest, textStatus, errorThrown) {
						      alert(XMLHttpRequest.status); 
						    }
						});    
					}else{
						alert("取消");
					}                     
		}  
		function addscreen(){
		 	  var loc = location.href;
			  var n1 = loc.length;//地址的总长度
			  var n2 = loc.indexOf("=");//取得=号的位置
			  var id = decodeURI(loc.substr(n2+1, n1-n2));//从=号后面的内容	
			  var pix=$('#pix').val();
			  if(pix==""){
			        alert("输入为空");
			  }else{ 	
					$.ajax({
						url:'${pageContext.request.contextPath}/screen/addscreen',
						method:'post',
						data:{
							machineid:id,
							pix:pix
						},　
						success: function(response){
									alert("添加成功！");
									$('#pix').empty();
									location.reload(true)
									
								},
						error: function(XMLHttpRequest, textStatus, errorThrown) {
						      alert(XMLHttpRequest.status); 
						    }
						});
			  }
		}
	function showAjaxModal(screenid,pix)
		{
		  
		    $('#goupingId').val(screenid);
		    $('#Pix').val(pix);
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
	function updatescreen(){
		$.ajax({
					url:'${pageContext.request.contextPath}/screen/updatescreenbyid',
					method:'post',
					data:$('#updatescreenfrom').serialize(),　
					success: function(response){
							alert("修改成功！");
							$('#pix').empty();
							location.reload(true);	
								},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						      alert(XMLHttpRequest.status); 
						    }
						});
	}
	function parseUrl(){
                var url=location.href;
                var i=url.indexOf('?');
                if(i==-1)return;
                var querystr=url.substr(i+1);
                var arr1=querystr.split('&');
                var arr2=new Object();
                for  (i in arr1){
                    var ta=arr1[i].split('=');
                    arr2[ta[0]]=ta[1];
                }
                return arr2;
         }
	</script>
</head>
<body class="page-body" data-url="http://www.poandsoul.com">
	<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
		<div class="main-content">	
			<div class="row">
			      <div class="col-md-6 col-sm-8 clearfix">
			        <ul class="user-info pull-left pull-none-xsm">
			          <li class="profile-info dropdown">
			           	<h2>分辨率列表</h2>
			          </li>
			        </ul>
			      </div>
			      <div class="col-md-6 col-sm-4 clearfix hidden-xs">
			        <ul class="list-inline links-list pull-right">
			          <li>
			           <button type="button" class="btn btn-primary" onclick="javascript :history.back(-1);"> 返回</button>          
			          </li>
			        </ul>
			      </div>
		    </div>
		    <hr />
			<div id="table">
					<table class="table table-bordered table-striped datatable" id="screentable">
						<thead>
							<tr>
								<th>分辨率</th>
								<th>操作</th>
	</thead>
						<tbody id="tablebody">
						</tbody>
					</table>
				<br />		
			</div>
			<h2>添加分辨率</h2>
			<br />
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary" data-collapsed="0">
						<div class="panel-body">
							<form role="form" class="form-horizontal form-groups-bordered" id="addscreenfrom">
								<div class="form-group">
									<label for="field-3" class="col-sm-3 control-label">分辨率</label>		
									<div class="col-sm-5">
										<input type="text" class="form-control" id="pix"  name="pix">
									</div>
								</div>
								<br/>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-5">
										<button type="button" class="btn btn-default" onclick="addscreen()">添加</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
	    </div>
    </div>
    <div class="modal fade" id="modal-6" style="display: none;">
	    <div class="modal-dialog">
	      <div class="modal-content"> 
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	          <h3 class="modal-title">修改组名</h3>
	        </div>
	        <form id="updatescreenfrom">
	        <div class="modal-body">
	          <div class="row">
	            <div class="col-md-12" >
	              <div class="form-group" id="hiddenid">
	                <input type="text" class="form-control" id="goupingId" name="id" >
	              </div>
	              <div class="form-group">
	                <label for="field-3" class="control-label">分辨率修改</label>
	                <input type="text" class="form-control" id="Pix" name="pix" >
	              </div>  
	            </div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
	          <button type="button" class="btn btn-info" onclick="updatescreen()">保存</button>
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
	<!-- <script src="../assets/js/messages_cn.js"></script>-->


	<!-- Demo Settings -->
	<script src="../assets/js/neon-demo.js"></script>

</body>
</html>