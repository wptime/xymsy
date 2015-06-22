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
<title>详细信息</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="../js/jquery.form.min.js"></script>
	<script type="text/javascript" src="../js/AdminIndex.js"></script>
	<script type="text/javascript" src="../js/minuteUser.js"></script>

</head>

<body   style="overflow-x: hidden;overflow-y:auto">
    <div id="wrap">
    <div class="content-box"><!-- Start Content Box -->
				
				<div class="content-box-header">
					
					<h3>详细信息</h3>
					
					<div class="findkuai">
						查找：<select id="permission" name="permission" onBlur="vline_permission();" onkeyup="v_permission();"> 
					   	<option>用户id</option>
					   	<option>注册邮箱</option> 
						<option>昵称</option>
						<option>真实姓名</option>
						<option>性别</option>
						<option>年龄</option>
						<option>手机号</option>
				   		</select>
				   		<input type="text" id="find" name="find"/>
						<button class="chafind">查找</button>
						<button class="content-add">添加</button>
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
								   <th>真实姓名</th>
								   <th>性别</th>
								   <th>年龄</th>
								   <th>绑定手机号</th>
								   <th>学校、专业</th>
								   <th>功能</th>
								</tr>
							</thead>
						 
							<tfoot>
								<tr>
									<td colspan="13">
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
								<form>
								<s:iterator value="userList" id="u">
									<tr class="alt-row">
										<td><input type="checkbox"></td>
										<td><s:property value="#u.usUserid"/></td>
										<td><s:property value="#u.usUsername"/></td>
										<td><a href="#" title="title"><s:property value="#u.usNickname"/></a></td>
										<td>没有真实姓名字段</td>
										<td><s:property value="#u.usSex"/></td>
										<td><s:property value="#u.usAge"/></td>
										<td><s:property value="#u.usPhone"/></td>
										<td><p>大连民族学院</p><p>计算机科学与工程</p></td>
										<td>
											<!-- Icons -->
											<input class="act"  type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
											<!-- <a href="#" title="Edit Meta"><img src="../images/hammer_screwdriver.png" alt="Edit Meta"></a>-->
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

						<tr id="line_zsName"><td class="xiun"><strong>真实姓名</strong></td><td><div class="input">
						<input type="text" class="myinp" name="zsName" id="zsName" onBlur="v_zsName();" onKeyUp="v_zsName();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>
						
			<tr id="line_gender"><td class="xiun"><strong>性  别</strong></td><td><div class="input">
						<input name='sex' type='radio' value='男'>男 <input name='sex' type='radio' value='女'>女 
					<div class="none"><span></span></div></div></td></tr>


			<tr id="line_studentAge"><td class="xiun"><strong>年  龄</strong></td><td><div class="input"><input type="text" class="myinp" name="studentAge" id="studentAge" onBlur="v_studentAge();" onKeyUp="v_studentAge();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>
				
			<tr id="line_yx"><td class="xiun"><strong>绑定手机号</strong></td><td><div class="input">
						<input type="text" class="myinp" name="yx" id="yx" onBlur="v_studentTel();" onKeyUp="v_studentTel();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>
						
				<tr id="line_school">
					<td class="xiun"><strong>学  校</strong></td><td>
						<select id="school" onblur="v_school();" onkeyup="v_school();"> 
					   	   <option>----请选择学校----</option> 
							<option id="1">大连民族学院</option>
							<option id="2">大连理工大学</option>
							<option id="3">大连大学</option>
							<option id="4">大连外国语言大学</option>
							<option id="5">鲁迅美术学院</option>
							<option id="6">大连模特艺术学院</option>
							<option id="7">辽宁师范大学</option>
					   </select> 
					</td>
			   </tr>
   			
			<tr id="line_grade"><td class="xiun"><strong>专  业</strong></td><td><div class="input">
						<input type="text" class="myinp" name="grade" id="grade" onBlur="v_gender();" onKeyUp="v_grade();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>
						
<tr style=" position:relative; top:10px;"><td style="text-align:right;"><input type="submit" value="保存" id="submit" class="sub" /></td><td style="text-align:center;"><input type="reset" value="重置"  class="sub" /></td></tr></table></form>
</div>
</div>
</body>
</html>
