<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>mainNav</title>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<link rel="stylesheet" type="text/css" href="css/AdminIndex.css"/>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/AdminIndex.js"></script>

</head>
<body>
	<div id="body-wrapper"> <!-- Wrapper for the radial gradient background -->
		<div id="sidebar"><div id="sidebar-wrapper"> <!-- Sidebar with logo and menu -->
			
			<h1 id="sidebar-title"><a href="#">Simpla Admin</a></h1>
		  
			<!-- Logo (221px wide) -->
			<a id="home" href="frame/main.jsp" target="right"><img id="logo" src="images/logo.png" alt="Simpla Admin logo" /></a>
		  
			     
			
			<ul id="main-nav">  <!-- Accordion Menu -->
				
				<li>
					<a class="nav-top-item"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
						网站概况
					</a>  
					<ul>
						<li><a href="frame/basicInformation.jsp" target="right">基本信息</a></li>
					</ul>     
				</li>
				
				<li> 
					<a href="#" class="nav-top-item"> <!-- Add the class "current" to current menu item -->
						用户管理
					</a>
					<ul>
						<li><a href="getAllUser" target="right">注册用户</a></li>
						<li><a href="getAllUserInfo" target="right">详细信息</a></li><li>
						<li><a href="getBuyerInfo" target="right">买家信息</a></li><li>
						<li><a href="getSellerInfo" target="right">卖家信息</a></li><li>
						<a href="getTimeInfo" target="right">时间信息</a></li>
						<li><a href="getAllAdmin" target="right">管理员用户</a></li> <!-- Add class "current" to sub menu items also -->
					</ul>
				</li>
				<li>
					<a href="#" class="nav-top-item">
						店铺管理
					</a>
					<ul>
						<li><a href="getAllStore" target="right">店铺信息</a></li>
					</ul>
					
				</li>
				<li>
					<a href="#" class="nav-top-item">
						商品管理
					</a>
					<ul>
						<li><a href="frame/recommend.jsp" target="right">推荐商品</a></li>
						<li><a href="frame/goodsCategory.jsp" target="right">商品分类</a></li>
						<li><a href="getAllGoods" target="right">全部商品</a></li>
						<li><a href="getSellingGoods" target="right">正在进行中的商品</a></li>
						<li><a href="getSelledGoods" target="right">已下架商品</a></li>
					</ul>
					
				</li>
				
				<li>
					<a href="#" class="nav-top-item">
						交易管理
					</a>
					<ul>
						<li><a href="frame/alldeal.jsp" target="right">全部交易</a></li>
						<li><a href="frame/unDeal.jsp" target="right">正在进行中的交易</a></li>
						<li><a href="frame/fnDeal.jsp" target="right">已完成的交易</a></li>
					</ul>
				</li>
				
				
				<li>
					<a href="#" class="nav-top-item">
						评价管理
					</a>
					<ul>
						<li><a href="frame/goodscomment.jsp" target="right">商品评价</a></li>
						<li><a href="frame/shopcomment.jsp" target="right">店铺评价</a></li>
					</ul>
				</li>
				
				<li>
					<a href="#" class="nav-top-item">
						内容管理
					</a>
					<ul>
						<li><a href="frame/new.jsp" target="right">公告</a></li>
						<li><a href="frame/write.jsp" target="right">签到</a></li>
						<li><a href="frame/rule.jsp" target="right">规则</a></li>
					</ul>
				</li>
				
				
			</ul> <!-- End #main-nav -->
			
		</div></div> <!-- End #sidebar -->
		<div class="page" >
    		<iframe scrolling="auto"  height="100%" frameborder="false" allowtransparency="true" style="border: medium none; float:right;" src="frame/main.jsp" id="rightMain" name="right"  ></iframe>
    </div>
	</div>	
		
</body>
</html>