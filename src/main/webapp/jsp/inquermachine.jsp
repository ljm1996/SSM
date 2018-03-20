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
               //开启排序功能
                //ordering: true,
               //页面显示的列数
                pageLength: 8,
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
               //"orderMulti"：fale,
			   //开启服务器模式
	            serverSide: true,
			   //使用ajax异步请求
		        "ajax": {
				    url: "${pageContext.request.contextPath}/machine/findmachine",
				    type: "post",
					error: function (jqXHR, textStatus, errorMsg) {
                    alert(textStatus);
                    alert(errorMsg);
                	}
				},
				 //使用对象数组，一定要配置columns，告诉 DataTables 每列对应的属性
		         columns: [
                    { data: 'machinename' },
                    { data: 'mac' },
                    { data: 'machinekey' },
                    { data: 'machinecode' },
                    { data: null }
                ],
 				//渲染添加自定义按钮
                columnDefs: [{
        		//指定第最后一列
		        targets: 4,
		        render: function(data, type, row, meta) {
		            return '<button type="button" class="btn btn-default" onclick=\'showAjaxModal("'+row.id+'","'+row.machinename+'","'+row.mac+'","'+row.machinekey+'","'+row.machinecode+'")\'>修改</button>&nbsp&nbsp<button type="button" class="btn btn-danger"  onclick=\'deletbymachinekey("'+row.id+'")\' >删除</button>';
		        	}
		    	}],
            });
        } );
		function showAjaxModal(id,machinename,mac,machinekey,machinecode)
			{   
			 	$('#id').val(id);
			 	$('#machinename').val(machinename);
			 	$('#mac').val(mac);
			 	$('#machinekey').val(machinekey);
			 	$('#machinecode').val(machinecode);
			 	$('#hiddenid').hide();
			 	
				jQuery('#modal-6').modal('show', {backdrop: 'static'});
				jQuery.ajax({
				url: "data/ajax-content.txt",
				success: function(response)
				{
					jQuery('#modal-6 .modal-body').html(response);
				}
			});
			}
		function updategrouping()
			{   
				jQuery.ajax({
					url: '${pageContext.request.contextPath}/machine/updatemachine',
					method:'post',
					data:$('#machienfrom').serialize(),
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
					
		<h2>查询机器</h2>
		
		<br />
				
<table id="table_id_example" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
    <tr>
        <th>机器名称</th>
        <th>Mac地址</th>
        <th>序列号</th>
        <th>激活码</th>
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
					<h3 class="modal-title">修改机器信息</h3>
				</div>
				<form id="machienfrom">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group" id="hiddenid">
								<input type="text" class="form-control" id="id" name="id" >
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-3" class="control-label">机器名称</label>
								
								<input type="text" class="form-control" id="machinename" name="machinename" >
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-3" class="control-label">Mac地址</label>
								
								<input type="text" class="form-control" id="mac" name="mac" >
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-3" class="control-label">序列号</label>
								
								<input type="text" class="form-control" id="machinekey" name="machinekey" >
							</div>	
							
						</div>
					</div>
					<div class="row">
					   <a href="../#" ></a>
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-3" class="control-label">激活码</label>
								
								<input type="text" class="form-control" id="machinecode" name="machinecode">
							</div>	
							
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
					<button type="button" class="btn btn-info" onclick="updategrouping()">保存</button>
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
</html>