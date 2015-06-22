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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>推荐商品</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="../js/jquery.form.min.js"></script>
	<script type="text/javascript" src="../js/AdminIndex.js"></script>
	<script type="text/javascript" src="../js/recommend.js"></script>

</head>

<body>
    <div id="wrap">
    <div class="content-box"><!-- Start Content Box -->
				
				<div class="content-box-header">
					
					<h3>推荐商品</h3>
					
					<div class="findkuai">
						查找：<select id="permission" name="permission" onBlur="vline_permission();" onkeyup="v_permission();"> 
					   	<option>商品id</option> 
						<option>商品名</option>
						<option>推荐时间</option>
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
								   <th>商品id</th>
								   <th>商品名</th>
								   <th>推荐时间</th>
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
									<tr class="alt-row">
										<td><input type="checkbox"></td>
										<td>00001</td>
										<td>曲奇饼干</td>
										<td>2014-10-10</td>            
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								
								
							</tbody>
							
						</table>
						
					</div> <!-- End #tab1 -->
					
					
					
				</div> <!-- End .content-box-content -->
				
			</div>
   
    







<div id="alert">
    	<div id="al" style="position:relative">
<h4><span class="tjxx">修改信息</span><span id="close">关闭</span></h4> 		
<form><table>

						<tr id="line_wpName"><td class="xiun"><strong>商品名</strong></td><td><div class="input">
						<input type="text" class="myinp" name="wpName" id="wpName" onBlur="v_wpName();" onKeyUp="v_wpName();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>

						<tr id="line_cmTime"><td class="xiun"><strong>推荐时间</strong></td><td><div class="input">
						<input type="text" class="myinp" name="cmTime" id="cmTime" onBlur="v_cmTime();" onKeyUp="v_cmTime();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" />
			   <div class="none"><span></span></div></div></td></tr>

						
<tr style=" position:relative; top:10px;"><td style="text-align:right;"><input type="submit" value="保存" id="submit" class="sub" /></td><td style="text-align:center;"><input type="reset" value="重置"  class="sub" /></td></tr></table></form>
</div>
</div>









</body>
</html>
