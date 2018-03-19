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
	<script type="text/javascript" charset="utf8" src="../.media/js/jquery.js"></script>
	
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
                pageLength: 6,
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
				    url: "${pageContext.request.contextPath}/video/chosevoide",
				    //请求方式
				    type: "post",
					error: function (jqXHR, textStatus, errorMsg) {
                    alert("请求失败");
                }
				  },
				   /* 设置表格中的内容居中 */
				  "createdRow": function (row, data, index) {
                 $('td', row).css('vertical-align',"middle").css('text-align', "center" );
            },				 
		         columns: [
                    { data: 'videoname' },
                    { data: 'videoimgurl' },
                    { data: null },
                ],
 				//渲染添加自定义按钮
                columnDefs: [
                {
      				"targets": 1,
      				"render": function(data, type, row, meta) {
		            	return '<img src="'+data+'" height="80px" width="80px" />';
		        	}
    			},{
    				"targets": 2,
      				"render": function(data, type, row, meta) {
		            	 return '<button type="button" class="btn btn-red"  '>'+
		            	 '删除<button type="button" class="btn btn-blue"  >'+
		            	 '下载图片</button>&nbsp<button type="button" class="btn btn-blue"  onclick=\'deletbykey("'+row.id+'")\'>下载视频'+
		            	 '</button>';
		        	}
    			}     
           ],
            });
        } );
	function modify(id, password) {
    $.ajax({
        url: "modify.action",
        //在后台接受id这个参数
        data: {
            id: id
        },
        success: function(data) {
            if (data.flag) {
                //如果后台修改成功，则刷新表格，并提示用户修改成功

                //保留分页信息
                table.ajax.reload(null, false);
                alert(password + data.msg);
            }
        }
    })
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
			           	<h2>选择视频</h2>
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
<table id="table_id_example" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
    <tr>
        <th>视频名称</th>
        <th>视频图片</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
</table>
		<br />
	</div>
</div>


	<!-- Bottom scripts (common) -->
	<script src="../assets/js/gsap/TweenMax.min.js"></script>
	<script src="../assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
	<script src="../assets/js/bootstrap.js"></script>
	<script src="../ssets/js/joinable.js"></script>
	<script src="../assets/js/resizeable.js"></script>
	<script src="../assets/js/neon-api.js"></script>


	<!-- Imported scripts on this page -->
	<script src="../assets/js/bootstrap-switch.min.js"></script>
	<script src="../assets/js/neon-chat.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="../assets/js/neon-custom.js"></script>
	<!--<script src="../assets/js/messages_cn.js"></script>-->


	<!-- Demo Settings -->
	<script src="../assets/js/neon-demo.js"></script>

</body>
</html>
</html>