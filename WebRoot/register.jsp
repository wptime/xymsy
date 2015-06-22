<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>"/>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>马上有注册页面</title>
	<link rel="stylesheet" type="text/css" href="css/valid.css" />
	<script src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/skygq.checkform.1.2.js"></script>
	<script src="js/jQselect.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/register.js"> </script>
	<script type="text/javascript">
		function func(btn)
		{
			var form = document.getElementById("testform");
			btn.disabled = true;
			//form.submit();
		}
		
		window.onload=function(){
     		var verifyObj = document.getElementById("Verify");
     		verifyObj.onclick=function(){
         		this.src="account/securityCode?timestamp="+new Date().getTime();
     		};
     		
     		var verifyAObj = document.getElementById("Verifya");
     		verifyAObj.onclick=function(){
     			var verifyObj = document.getElementById("Verify");
         		verifyObj.src="account/securityCode?timestamp="+new Date().getTime();
     		};
 		}
	</script>
</head>
<body>
	<div id="header">
		<div class="logo">	
			<a href="index.jsp"><img src="images/logo.png" alt=""></a>
			<i class="logo-sper"></i><span>&nbsp;注册账号</span>
		</div>
		<div class="login">
			<span>
				我已注册，现在就
				<a href="login.jsp"style="position: relative;left: 10px;">登录</a>
			</span>
		</div>
	</div>
	<div id="nav"></div>
	
	<span style="color:#ed1b00; font-size:13px; font-weight:bold; position:relative; top:10px; left:35px;"><s:property value="#request.info"/></span>
	
	<div id="main">
		<div class="reg_main">
			<form name="testform" id="testform" method="post" action="account/register" >
				<div class="label_main">
					<label for="">邮箱</label>
					<input type="text" name="username" class="username" id="username" placeholder="邮箱">
				</div>
				<div class="label_main">
					<label for="">密码</label>
					<input type="password" name="password" placeholder="密码">
				</div>
				<div class="label_main">
					<label for="">确认密码</label>
					<input type="password" name="password2" placeholder="密码">
				</div>
				<div class="label_main">
					<label for="">昵称</label>
					<input type="text" name="nickName" placeholder="昵称">
				</div>
				<div class="label_main">
					<label for="">验证码</label>
					<input type="text" name="check" placeholder="验证码" class="check_main">
					<!-- <span class="pic_check"></span> -->
						<img src="account/securityCode" id="Verify" class="securityCode" alt="看不清，换一张">
					<a id="Verifya">换一张</a>
					<div class="clear"></div>
				</div>
				<div class="agree_main">
					<input name="agree" type="checkbox" checked="checked" >
					<label for="">我已阅读并接受</label>
					<a href="">《马上有用户协议》</a>
				</div>
				<input id="sub" type="submit" value="注册"  class="sub_main" >
			</form>
		</div>
		<div class="reg_sms">
			<h3>手机快速注册</h3>
			<div class="reg_sms_content">
				<p class="reg_sms_p reg_sms_p_text">请使用中国大陆手机号，编辑短信：</p>
				<p class="reg_sms_p reg_sms_p_warn">6-14位字符（支持数字/字母/符号）</p>
				<p class="reg_sms_p reg_sms_p_text">作为登录密码，发送至：</p>
				<p class="reg_sms_p reg_sms_p_warn">1069 80000 36590</p>
				<p class="reg_sms_p reg_sms_p_last">即可注册成功，手机号即为登录帐号。</p>		
			</div>
		</div>
	</div>
	<div id="foot">
		<div class="copy-box">2014&nbsp;©MSY</div>
	</div>

</body>
</html>