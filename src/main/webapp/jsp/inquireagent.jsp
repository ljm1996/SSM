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
		<!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="../media/css/jquery.dataTables.css">
	
	<!-- jQuery -->
	<script type="text/javascript" charset="utf8" src="../media/js/jquery.js"></script>
	
	<!-- DataTables -->
	<script type="text/javascript" charset="utf8" src="../media/js/jquery.dataTables.js"></script>
	
	<script src="../assets/js/jquery-1.11.3.min.js"></script>

	<!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="../media/css/jquery.dataTables.css">
	
	<!-- jQuery -->
	<script type="text/javascript" charset="utf8" src="../media/js/jquery.js"></script>
	
	<!-- DataTables -->
	<script type="text/javascript" charset="utf8" src="../media/js/jquery.dataTables.js"></script>

 <script>
        <!--第三步：初始化Datatables-->
        $(document).ready( function () {
        
           var table =  $('#table_id_example').DataTable({
               language: {
                   url:"zh_CN.txt"
               },
               //页面显示的列数
                pageLength: 10,
               //控制是否显示表格左下角的信息
                "info" : true,
                //是否开启本地分页
                "paging": true,
                //是否显示处理状态(排序的时候，数据很多耗费时间长的话，也会显示这个)
                "processing":false,
                //是否允许Datatables开启本地搜索
               "searching": true,
               //控制Datatables的延迟渲染，可以提高初始化的速度
               "deferRender": true,
               //首页，尾页，上一页和下一页四个按钮,加上数字按钮
               "pagingType": "full_numbers",
               //开启服务器模式
	            serverSide: true,
			  //使用ajax异步请求
		        "ajax": {
		        	//请求的数据源
				    url: "${pageContext.request.contextPath}/admin/findagent",
				    //请求方式
				    type: "post",
					error: function (jqXHR, textStatus, errorMsg) {
                    console("请求失败");
                }
				  },				 
		         columns: [
		            { data: 'ver' },
                    { data: 'name' },
                    { data: 'phone' },
                    { data: 'account' },
                    { data: null }
                ],
 				//渲染添加自定义按钮
                columnDefs: [
                {
        		//指定第最后一列
		        targets: 4,
		        render: function(data, type, row, meta) {
		                    return '<button type="button" class="btn btn-default" onclick=\'showAjaxModal("'+row.id+'","'+row.ver+'","'+row.name+'","'+row.phone+'","'+row.account+'","'+row.passwrod+'")\'>修改</button>&nbsp&nbsp<button type="button" class="btn btn-danger"  onclick="deletbyid('+data+', this)" >禁用</button>';
		        	}
		    	}
			    	],
            });
        } );
   function deletbyid(adminid, that) {
  if (window.confirm('你确定删除吗？')) {
     		$.ajax({
						url: '${pageContext.request.contextPath}/admin/deletbyId',
						method: 'POST',
						dataType: 'json',
						data:{
							adminId:adminid
						} ,
						error: function()
						{
							alert("删除失败");
						},
						success: function(response){
						if(response==1){
							alert("删除成功");	
							    var table = $("#table_id_example").DataTable();
	              			    table.ajax.reload();	
						}
							
						}
					});
				}else{
				   alert("取消");
				}
			}
	function modify(id, password) {
    $.ajax({
        url: "modify.action",
        //在后台接受id这个参数
        data: {
            id: id
        },
        success: function(data) {
            if (data.flag) {
                //保留分页信息
                table.ajax.reload(null, false);
                alert(password + data.msg);
            }
        }
    });
}
		function showAjaxModal(id,ver,name,phone,account,passwrod)
		{   
			
			<!--alert(id+" "+ver+" "+name+" "+phone+" "+account+" "+passwrod);-->
			$('#hiddenid').hide();
			$('#Id').val(id);
			$('#Ver').val(ver);
			$('#Name').val(name);
			$('#Phone').val(phone);
			$('#Account').val(account);
			$('#Passwrod').val(passwrod);
			jQuery('#modal-6').modal('show', {backdrop: 'static'});
			jQuery.ajax({
				url: "data/ajax-content.txt",
				success: function(response)
				{
					jQuery('#modal-6 .modal-body').html(response);
				}
			});
		}
		function updateadmin()
		{
			jQuery.ajax({
					url: '${pageContext.request.contextPath}/admin/updateAdmin',
					method:'post',
					data:$('#adminfrom').serialize(),
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
<table id="table_id_example" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
    <tr>
        <th>版本号</th>
        <th>名称</th>
        <th>电话号码</th>
        <th>账号</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
</table>
		<br />
	</div>
</div>
<div class="modal fade" id="modal-6" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 class="modal-title">修改代理商</h3>
				</div>
				<form id="adminfrom">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group" id="hiddenid">
								<input type="text" class="form-control" id="Id" name="id" >
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-3" class="control-label">版本号</label>
								
								<input type="text" class="form-control" id="Ver" name="ver" >
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-3" class="control-label">名称</label>
								
								<input type="text" class="form-control" id="Name" name="name" >
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-3" class="control-label">电话号码</label>
								
								<input type="text" class="form-control" id="Phone" name="phone" >
							</div>	
							
						</div>
					</div>
					<div class="row">
					   <a href="#" ></a>
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-3" class="control-label">账号 </label>
								
								<input type="text" class="form-control" id="Account" name="account" >
							</div>	
							
						</div>
					</div>
					<div class="row">
					   <a href="#" ></a>
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-3" class="control-label">密码 </label>
								
								<input type="text" class="form-control" id="Passwrod" name="passwrod" >
							</div>	
							
						</div>
					</div>
				</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
					<button type="button" class="btn btn-info" onclick="updateadmin()">保存</button>
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
	<!--<script src="../assets/js/messages_cn.js"></script>


	<!-- Demo Settings -->
	<script src="../assets/js/neon-demo.js"></script>

</body>
</html>
</html>