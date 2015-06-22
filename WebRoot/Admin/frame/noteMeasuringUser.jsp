<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	basePath = basePath+"Admin/frame/";
%>
<base href="<%=basePath%>"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册用户</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="../js/jquery.form.min.js"></script>
	<script type="text/javascript" src="../js/AdminIndex.js"></script>
	<script type="text/javascript" src="../js/noteMeasuringUser.js"></script>

</head>

<body>
    <div id="wrap">
    <div class="content-box"><!-- Start Content Box -->
				
				<div class="content-box-header">
					
					<h3>注册用户</h3>
					
					
					<div class="findkuai">
					<form>
						查找：<select id="permission" name="permission" onBlur="vline_permission();" onkeyup="v_permission();"> 
					   	<option>用户id</option>
					   	<option>注册邮箱</option>
						<option>密码</option>
						<option>昵称</option>
				   		</select>
				   		<input type="text" id="find" name="find"/>
						<input type="submit" class="chafind" value="查找"></button>
						<button class="content-add">添加</button>
					</form>
					</div>
					<div class="clear"></div>
					
				</div> <!-- End .content-box-header -->
				
				<div class="content-box-content" style="display: block; ">
						
						<table>
							
							<thead>
								<tr>
								   <th><input class="check-all" type="checkbox"></th>
								   <th>编号</th>
								   <th>注册邮箱</th>
								   <th>昵称</th>
								   <th>密码</th>
								   <th>头像</th>
								   <th>注册时间</th>
								   <th>功能</th>
								</tr>
								
							</thead>
						 
							<tfoot>
								<tr>
									<td colspan="6">
										<div class="bulk-actions align-left">
											<select name="dropdown">
												<!--<option value="option1">请选择...</option>
												<option value="option2">编辑</option>-->
												<option value="option3">删除</option>
											</select>
											<a class="button" href="#">适用于所选</a>
											<!--<input id="saveall" type="button" value="保存全部" style="display:none">-->
										</div>
										
										<div class="pagination">
											<a href="#" title="First Page">« 首页</a><a href="#" title="Previous Page">« 上一页</a>
											<a href="#" class="number" title="1">1</a>
											<a href="#" class="number" title="2">2</a>
											<a href="#" class="number current" title="3">3</a>
											<a href="#" class="number" title="4">4</a>
											<a href="#" title="Next Page">下一页 »</a><a href="#" title="Last Page">最后一页 »</a>
										</div> <!-- End .pagination -->
										<div class="clear"></div>
									</td>
								</tr>
							</tfoot>
						 
							<tbody>
								<form method="get" >
								<s:iterator value="userList" id="u">
									<tr class="alt-row">
										<td><input type="checkbox"></td>
										<td><s:property value="#u.usUserid"/></td>
										<td><s:property value="#u.usUsername"/></td>
										<td><a href="#" title="title"><s:property value="#u.usNickname"/></a></td>
										<td><s:property value="#u.usPassword"/></td>
										<td><img height="30" src="../<s:property value='#u.usPricture.substring(1)'/>"></td>
										<td><s:property value="#u.usRegistertime"/></td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
									</s:iterator>
								</form>
								
								
								
								
							</tbody>
							
						</table>
						
					
					
					
				</div> <!-- End .content-box-content -->
				
			</div>
    </div>
    







<div id="alert">
    	<div id="al" style="position:relative">
<h4><span class="tjxx">修改信息</span><span id="close">关闭</span></h4> 		
<form><table>
						<tr id="line_yhName"><td class="xiun"><strong>用户名</strong></td><td><div class="input">
						<input type="text" class="myinp" name="yhName" id="yhName" onBlur="v_yhName();" onKeyUp="v_yhName();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>

						<tr id="line_key"><td class="xiun"><strong>密  码</strong></td><td><div class="input">
						<input type="text" class="myinp" name="key" id="key" onBlur="v_key();" onKeyUp="v_key();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>
						
						
<tr style=" position:relative; top:10px;"><td style="text-align:right;"><input type="submit" value="保存" id="submit" class="sub" /></td><td style="text-align:center;"><input type="reset" value="重置"  class="sub" /></td></tr></table></form>
</div>
</div>



</body>
</html>
