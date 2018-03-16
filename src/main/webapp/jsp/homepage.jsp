 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Neon Admin Panel">
	<meta name="author" content="">

	<link rel="icon" href="../assets/images/favicon.ico">

	<title>Neon | Login</title>

	<style>.file-input-wrapper { overflow: hidden; position: relative; cursor: pointer; z-index: 1; }.file-input-wrapper input[type=file], .file-input-wrapper input[type=file]:focus, .file-input-wrapper input[type=file]:hover { position: absolute; top: 0; left: 0; cursor: pointer; opacity: 0; filter: alpha(opacity=0); z-index: 99; outline: 0; }.file-input-name { margin-left: 8px; }</style><link rel="stylesheet" href="../assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
	<link rel="stylesheet" href="../assets/css/font-icons/entypo/css/entypo.css">
	<link rel="stylesheet" href="../assets/css/bootstrap.css">
	<link rel="stylesheet" href="../assets/css/neon-core.css">
	<link rel="stylesheet" href="../assets/css/neon-theme.css">
	<link rel="stylesheet" href="../assets/css/neon-forms.css">
	<link rel="stylesheet" href="../assets/css/custom.css">

	<script src="../assets/js/jquery-1.11.3.min.js"></script>

</head>
	<script type="text/javascript">
		function tiaozhuang(theme,url){
	$(".active").removeClass("active");
	  if (theme != null) {
	    var name = $(theme).parent().parent()[0].className;
	    if (name != "main-menu") {
	      $(theme).parent().parent().parent().addClass("active");
	    }
	    // main-menu
	    $(theme).parent().addClass("active");
	  }
		if(url!=null||url!=""){
		$("#theiframe").css("height","100%");
		$("#theiframe").attr("src",url);
		
		}
		
		}
	</script>

<body class="page-body  loaded" data-url="http://neon.dev">
	<div class="page-container">

		<div class="sidebar-menu">
			<div class="sidebar-menu-inner">
				<header class="logo-env"> <!-- logo -->
				<div class="logo">
					<a href="../javascript:void(0);"><h1 style="color: white;">幻影魔盒 </h1>
					</a>
				</div>

				<!-- logo collapse icon -->
				<div class="sidebar-collapse">
					<a href="../#" class="sidebar-collapse-icon">
						<!-- add class "with-animation" if you want sidebar to have animation during expanding/collapsing transition -->
						<i class="entypo-menu"></i>
					</a>
				</div>

				<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
				<div class="sidebar-mobile-menu visible-xs">
					<a href="../#" class="with-animation">
						<!-- add class "with-animation" to support animation --> <i
						class="entypo-menu"></i>
					</a>
				</div>

				</header>
				<ul id="main-menu" class="main-menu">
					<li class="active active has-sub root-level">
					<a href="../forms-main.html">
						<i class="entypo-doc-text"></i>
						<span class="title">代理商管理</span>
					</a>
					<ul>
						<li>
							<a onclick="tiaozhuang(this,'../jsp/addagent.jsp')" href="javascript:void(0)">
								<span class="title">添加代理商</span>
							</a>
						</li>
						<li>
							<a onclick="tiaozhuang(this,'inquireagent.jsp')" href="javascript:void(0)">
								<span class="title">查询代理商</span>
							</a>
						</li>
						
					</ul>
					</li>
					
					<li class="has-sub">
					<a href="../forms-main.html">
						<i class="entypo-doc-text"></i>
						<span class="title">视频管理</span>
					</a>
					<ul>
						<li>
							<a onclick="tiaozhuang(this,'video.jsp')" href="javascript:void(0)">
								<span class="title">上传视屏</span>
							</a>
						</li>
						<li>
							<a onclick="tiaozhuang(this,'vidocontrol.jsp')" href="javascript:void(0)">
								<span class="title">查询视屏</span>
							</a>
						</li>	
					</ul>
				</li>
				    <li class="has-sub">
					<a href="../forms-main.html">
						<i class="entypo-doc-text"></i>
						<span class="title">魔盒组管理</span>
					</a>
					<ul>
						<li>
							<a onclick="tiaozhuang(this,'addboxtb.jsp')" href="javascript:void(0)" >
								<span class="title">魔盒组信息新建</span>
							</a>
						</li>
						<li>
							<a onclick="tiaozhuang(this,'addboxgroup.jsp')" href="javascript:void(0)">
								<span class="title">魔盒组分组</span>
							</a>
						</li>
						
					</ul>
				</li>
				    <li class="has-sub">
					<a href="../forms-main.html">
						<i class="entypo-doc-text"></i>
						<span class="title">机器管理</span>
					</a>
					<ul>
						<li>
							<a onclick="tiaozhuang(this,'addmechanicaltb.jsp')" href="javascript:void(0)">
								<span class="title">新建机器</span>
							</a>
						</li>
						<li>
							<a onclick="tiaozhuang(this,' inquermachine.jsp')" href="javascript:void(0)" >
								<span class="title">查询机器</span>
							</a>
						</li>	
						<li>
							<a onclick="tiaozhuang(this,'actionmechanical.jsp')" href="javascript:void(0)" >
								<span class="title">激活机器</span>
							</a>
						</li>	
						
					</ul>
				</li>
				</ul>
				
			</div>
		</div>

		<div class="main-content">
			<iframe id="theiframe" name="theiframe" frameborder="0"
				style="height:100%;width:100%;"></iframe>
		</div>
	</div>
	
	<link rel="stylesheet" href="../assets/js/jvectormap/jquery-jvectormap-1.2.2.css">
	<link rel="stylesheet" href="../assets/js/rickshaw/rickshaw.min.css">
	<!-- Bottom scripts (common) -->
	<script src="../assets/js/gsap/TweenMax.min.js"></script>
	<script src="../assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
	<script src="../assets/js/bootstrap.js"></script>
	<script src="../assets/js/joinable.js"></script>
	<script src="../assets/js/resizeable.js"></script>
	<script src="../assets/js/neon-api.js"></script>
	<script src="../assets/js/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>


	<!-- Imported scripts on this page -->
	<script src="../assets/js/jvectormap/jquery-jvectormap-europe-merc-en.js"></script>
	<script src="../assets/js/jquery.sparkline.min.js"></script>
	<script src="../assets/js/rickshaw/vendor/d3.v3.js"></script>
	<script src="../assets/js/rickshaw/rickshaw.min.js"></script>
	<script src="../assets/js/raphael-min.js"></script>
	<script src="../assets/js/morris.min.js"></script>
	<script src="../assets/js/toastr.js"></script>
	<script src="../assets/js/neon-chat.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="../assets/js/neon-custom.js"></script>


	<!-- Demo Settings -->
	<script src="../assets/js/neon-demo.js"></script>
</body>
</html>
