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
					查找：
					<select id="permission" name="permission" onBlur="vline_permission();" onkeyup="v_permission();"> 
						<option>用户id</option>
						<option>注册邮箱</option> 
						<option>用户有商品数量</option>
						<option>卖家信誉</option>
				   	</select>
				   	<input type="text" id="find" name="find"/>
					<button class="chafind">查找</button>
				</div>
				<div class="clear"></div>
					
			</div> <!-- End .content-box-header -->
				
				<div class="content-box-content" style="display: block; ">	
					<table>		
						<thead>
							<tr>
								<th><input class="check-all" type="checkbox"></th>
								<th>卖家编号</th>
								<th>注册邮箱</th>
								<th>拥有商品数量</th>
								<th>卖家信誉</th>
								<th>删除</th>
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
										<a href="#" title="First Page">« 首页</a>
										<a href="#" title="Previous Page">« 上一页</a>
										<a href="#" class="number" title="1">1</a>
										<a href="#" class="number" title="2">2</a>
										<a href="#" class="number current" title="3">3</a>
										<a href="#" class="number" title="4">4</a>
										<a href="#" title="Next Page">下一页 »</a>
										<a href="#" title="Last Page">最后一页 »</a>
									</div> <!-- End .pagination -->
									<div class="clear"></div>
								</td>
							</tr>
						</tfoot>
						 
						<tbody>
							<form method="get" >
							<s:iterator value="storeList" id="s">
								<tr class="alt-row">
									<td><input type="checkbox"></td>
									<td><s:property value="#s.user.usUserid"/></td>
									<td><s:property value="#s.user.usUsername"/></td>
									<td><s:property value="#s.stGoodsnum"/></td>
									<td><s:property value="#s.user.usSellercredit"/></td>
									<td>
											<!-- Icons -->
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

</body>
</html>
