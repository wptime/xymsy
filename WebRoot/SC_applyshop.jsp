<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>马上有个人中心</title>
    
	<link rel="stylesheet" type="text/css" href="css/SC.css"/>
	<link rel="stylesheet" type="text/css" href="css/model.css"/>
	<link rel="stylesheet" type="text/css" href="css/SC_applyshop.css"/>
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
	
		var xmlHttp;
		function createXMLHttp() {
			if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			} else {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
	
		function getCertificationStatu() {
			createXMLHttp();
			xmlHttp.open("GET", "person/certificationStatu");
			xmlHttp.send(null);
		}
		
		function getStoreStatu()
		{
			createXMLHttp();
			xmlHttp.open("GET", "person/shopStatu");
			xmlHttp.send(null);
			document.getElementById("form").submit();
			return false;
		}
		
		function getStatu()
		{
			createXMLHttp();
			xmlHttp.open("GET", "person/shopStatu");
			xmlHttp.send(null);
		}
		
	</script>
</head>
<body>
	<jsp:directive.include file="top.jsp"/>
	
	<div id="warpper">
		
		<div class="allba">
			<ul >
				<li><a href="goodsList.jsp">所有宝贝</a></li>
				<li><a href="">跳蚤市场</a></li>
				<li><a href="">今日推荐</a></li>
			</ul>
		</div>
		<div id="warpper2" >
			<div class="warpper-body" style="height:400px;">
				<div class="warpper-top">
					<p><a href="">卖家中心</a></p>
				</div>
				<div class="warpper-middle apply"style="width: 910px;">
					<s:if test="#session.certificationStatu.equals('notsubmit') || #session.certificationStatu.equals('fail')">
						  <div class="title">免费开店</div>
						<div class="title-small">申请马上有店铺完全免费。想了解更多开店攻略，请 <a href=""#>联系我们</a>。流程如下：</div>
						<div class="rule">
							<ul>
								<li style="width: 182px;">
									<div class="num">1</div>
									<div class="rule-cen">
										<strong>开店条件检测</strong>
										<p>开店资格判断</p>
									</div>
								</li>
								<li>
									<div class="num">2</div>
									<div class="rule-cen">
										<strong>马上有认证，等待小二审核</strong>
										<p>需提交所在学校等资料</p>
									</div>
								</li>
								<li>
									<div class="num">3</div>
									<div class="rule-cen">
										<strong>创建店铺成功</strong>
										<p>店铺开通，完成店铺信息</p>
									</div>
								</li>
							</ul>
						</div><!--rule-->
						<div class="addshop">
							<a class="button-addshop button" onclick="getCertificationStatu()">马上开店</a>
							<a href class="addrule">开店规则</a>
						</div>
					</s:if>
					<s:elseif test="#session.certificationStatu.equals('success')">
						<s:if test="#session.storeStatu.equals('success')">
							<h1>这个地方应该显示店铺的信息，<a href="SC.jsp">点击之后</a>进入店铺的管理中心</h1>
						</s:if>
						<s:elseif test="#session.storeStatu.equals('auditing')">
							<h1>你的店铺正在审核中，如果想尽快被审核的话请联系管理员~~</h1>
						</s:elseif>
						<s:else>
							<h1>你的实名认证已被通过，点击</h1>
							<form name="form" id="form" method="post" action="">
								<input class="sub success" value="免费开店"></button>
							</form>
						</s:else>
					</s:elseif>
					<s:elseif test="#session.certificationStatu.equals('auditing')">
						<h1>你的实名认证申请正在处理中，如果想尽快处理你的申请，请联系管理员O(∩_∩)O哈：联系方式：</h1>
					</s:elseif>
					
				</div><!--warpper-middle-apply-->
				<div class="warpper-middle register" style="display:none;">
					<s:if test="#session.certificationStatu.equals('notsubmit')">
						<form name="form" id="form" method="post" action="person/certification">	
							<div>
								<div class="title">
									<a class="reapply">免费开店 </a> > <a> 实名认证</a> 
								</div>
								<div class="shop-center">
									<table class="shop-table">
										<tr>
											<td class="th">姓名：</td>
											<td><input type="text" name="realname" value="" /> </td>
										</tr>
										<tr>
											<td class="th">学校：</td>
											<td><input type="text" name="school" value="" /> </td>
										</tr>
										<tr>
											<td class="th">院系/专业：</td>
											<td><input type="text" name="major" value /> </td>
										</tr>
										<tr>
											<td class="th">学号：</td>
											<td><input type="text" name="number" value=""/> </td>
										</tr>
										<tr>
											<td class="th">联系方式:</td>
											<td><input type="text" name="call" value="手机/邮箱"/> </td>
										</tr>
										<!-- <tr>
											<td class="th">店铺名称:</td>
											<td><input type="text" value=""/> </td>
										</tr> -->
									</table>
								</div>
							</div>
							<input value="提交" class="sub button" onclick="getStoreStatu()"/>
						</form>
					</s:if>
					<s:elseif test="#session.certificationStatu.equals('success')">
						<h1>你已经通过实名认证，可以</h1>
						<form name="form" id="form" method="post" action="person/certification">
							<input class="sub button" value="直接开店"></button>
						</form>
					</s:elseif>
					<s:elseif test="#session.certificationStatu.equals('auditing')">
						<h1>你的申请正在处理中，如果想尽快处理你的申请，请联系管理员O(∩_∩)O哈：联系方式：</h1>
					</s:elseif>
					<s:elseif test="#session.certificationStatu.equals('fail')">
						<h1>你的实名认证未通过，请重新提交，然后联系管理员：联系方式：</h1>
						<form name="form" id="form" method="post" action="person/certification">	
							<div>
								<div class="title">
									<a class="reapply">免费开店 </a> > <a> 实名认证</a> 
								</div>
								<div class="shop-center">
									<table class="shop-table">
										<tr>
											<td class="th">姓名：</td>
											<td><input type="text" name="realname" value="" /> </td>
										</tr>
										<tr>
											<td class="th">学校：</td>
											<td><input type="text" name="school" value="" /> </td>
										</tr>
										<tr>
											<td class="th">院系/专业：</td>
											<td><input type="text" name="major" value /> </td>
										</tr>
										<tr>
											<td class="th">学号：</td>
											<td><input type="text" name="number" value=""/> </td>
										</tr>
										<tr>
											<td class="th">联系方式:</td>
											<td><input type="text" name="call" value="手机/邮箱"/> </td>
										</tr>
										<!-- <tr>
											<td class="th">店铺名称:</td>
											<td><input type="text" value=""/> </td>
										</tr> -->
									</table>
								</div>
							</div>
							<input onclick="getStoreStatu()" value="提交" class="sub button" />
					</s:elseif>
				</div><!--warpper-middle-register-->
				<div class="warpper-middle shop" style="display:none; ">
					<!--<form action="" >
						<div>
							<a class="title shopping">店铺1</a>
							<br />
							<img src="#" alt="" class="shopimg" />
							<table class="shopping-center" style="position:relative;left: 70px;">
								<tr>
									<td class="th">店铺名称：</td>
									<td>123</td>
								</tr>
								<tr>
									<td class="th">主要销售项目：</td>
									<td>456 </td>
								</tr>
								<tr>
									<td class="th">店铺地址：</td>
									<td>789</td>
								</tr>
								<tr>
									<td class="th">简介：</td>
									<td>0</td>
								</tr>
							</table>
						</div>
					</form>-->
					<s:if test="#session.storeStatu.equals('hasnostore')">
						<form name="form" id="form" method="post" action="person/applyShop" enctype="multipart/form-data" style="margin-top:20px;">	
							<div>
								<div class="title">
									<a class="reapply">免费开店</a> >
									<a class="reregister">实名认证</a> >开店申请
								</div>
								<div class="shop-center">
									<table class="shop-table">
										<tr>
											<td class="th">店铺名称：</td>
											<td><input type="text" name="storeName" value="" /> </td>
										</tr>
										<tr>
											<td class="th">店铺照片：</td>
											<td><input type="file" name="storePicture"/> </td>
										</tr>
										<tr>
											<td class="th">主要销售项目：</td>
											<td><input type="text" name="mainSell" value="" /> </td>
										</tr>
										<tr>
											<td class="th">店铺地址：</td>
											<td><input type="text" name="storeAdd" value /> </td>
										</tr>
										<tr>
											<td class="th">简介：</td>
											<td><textarea name="storeBrief" id="" cols="30" rows="10"></textarea> </td>
										</tr>
									</table>
								</div>
							</div>
							<input type="submit" value="提交" class="sub button" />
						</form>
					</s:if>
					<s:elseif test="#session.storeStatu.equals('success')">
						<h1>你已经有店铺了~~~</h1>
					</s:elseif>
					<s:elseif test="#session.storeStatu.equals('auditing')">
						<h1>你的店铺正在审核中，如果想尽快被审核的话请联系管理员~~</h1>
					</s:elseif>
					<s:elseif test="#session.storeStatu.equals('fail')">
						<h1>你的审核没有通过，请重新提交申请~~</h1>
						<form name="form" id="form" method="post" action="person/applyShop" enctype="multipart/form-data" style="margin-top:20px;">	
							<div>
								<div class="title">
									<a class="reapply">免费开店</a> >
									<a class="reregister">实名认证</a> >开店申请
								</div>
								<div class="shop-center">
									<table class="shop-table">
										<tr>
											<td class="th">店铺名称：</td>
											<td><input type="text" value="" /> </td>
										</tr>
										<tr>
											<td class="th">店铺照片：</td>
											<td><input type="file" /> </td>
										</tr>
										<tr>
											<td class="th">主要销售项目：</td>
											<td><input type="text" value="" /> </td>
										</tr>
										<tr>
											<td class="th">店铺地址：</td>
											<td><input type="text" value /> </td>
										</tr>
										<tr>
											<td class="th">简介：</td>
											<td><textarea name="" id="" cols="30" rows="10"></textarea> </td>
										</tr>
									</table>
								</div>
							</div>
							<input type="submit" value="提交" class="sub  button" />
						</form>
					</s:elseif>
				</div><!--warpper-middle-shop-->
				<div class="warpper-right" style="display:none;">
					<div class="own-shop">
						<div class="title">我的店铺</div>
						<div class="own-con">
							<div class="own-image">
								<img src="images/ctx.png" alt="" style="width: 180px;"/>
								<div>小店名字</div>
							</div>
							<ul class="own-center">
								<li>店主：<span>***</span></li>
								<li>商品数：<span>*</span></li>
								<li>被关注量：<span>*</span></li>
								<li>店铺评分：<span>*</span></li>
								<li>主要销售：<span>**</span></li>
							</ul>
						</div><!--own-con-->
					</div><!--own-shop-->
				</div><!--warpper-right-->	
			</div>
			<div class="clear"></div>
		</div>
	</div>
	
	<jsp:directive.include file="bottom.jsp"/>
		<script type="text/javascript">
			

		</script>
	<script type="text/javascript" src="js/jQuery-Msy.js"></script>
	<script type="text/javascript" src="js/own.js"></script>
</body>
</html>