<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<script type="text/javascript">
	function f(){
		alert("dafd");
	}
</script>
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>马上有登陆</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script src="js/err.js"></script>
</head>
<body>
	<a href="index.jsp"><div class="head"></div></a>
	<div class="warpper">
		<div class="warpper-login">
			<div class="warpper-left"></div>
			<div class="warpper-right">
				<div class="login">
					<img src="images/switcher-qr.png" alt="">
					<div class="hd">
						<h2>登录</h2>
					</div>
					<s:property value="#request.info"/>
					<form name="testform" id="testform" method="post" action="account/login">
						<div id="caution"><p id="caution1"></p></div>
						<div class="bd">
							<div class="field-name">
								<input type="text" name="username" class="username" placeholder="手机号/会员名/邮箱">
							</div>
							<div class="field-pass">
								<input type="password" name="password" class="userpass">
							</div>
							<div class="safe">
								<span class="safe-login">
									<input type="checkbox" checked="checked">
									<label for="">安全控件登录</label>
								</span>
								<a href="">忘记登录密码？</a>
							</div>
							<button class="Submit">登录</button>
						</div>
					</form>
					<div class="fd">
						<ul class="entries">
							<li><a href="" class="wf">微博登录</a><a href="https://www.alipay.com" class="zf">支付宝登录</a></li>
							<li><a href="register.jsp" class="zc">免费注册</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class=""></div>
		
	</div>
	<div id="foot">	
		<div class="foot2">
			<ul>
				<li><a href="">关于我们<span></span></a></li>
				<li><a href="">联系我们<span></span></a></li>
				<li><a href="">人才招聘<span></span></a></li>
				<li><a href="">商家入驻<span></span></a></li>
				<li><a href="">广告服务<span></span></a></li>
				<li><a href="">手机京东<span></span></a></li>
				<li><a href="">友情链接<span></span></a></li>
				<li><a href="">京东社区<span></span></a></li>
				<li><a href="">京东公益<span></span></a></li>
				<li><a href="">销售联盟<span></span></a></li>
				<li><a href="">English Site</a></li>
			</ul>
		</div>
		<div class="foot3">
				<p>
					北京市公安局朝阳分局备案编号110105014669 | 京ICP证070359号 | 互联网药品信息服务资格证编号（京）-非经营性-2011-0034
				</p>
				<p>
					音像制品经营许可证苏宿批005号 | 出版物经营许可证编号新出发（苏）批字第N-012号 | 互联网出版许可证编号新出网证（京）字150号
				</p>
				<p>
					网络文化经营许可证京网文[2011]0168-061号 Copyright@2004-2014 京东JD.com版权所有
				</p>
			</div>
		</div>
</body>
</html>