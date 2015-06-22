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
<title>操作信息</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="../js/jquery.form.min.js"></script>
	<script type="text/javascript" src="../js/AdminIndex.js"></script>
	<script type="text/javascript" src="../js/operation.js"></script>

</head>

<body>
    <div id="wrap">
    <div class="content-box"><!-- Start Content Box -->
				
				<div class="content-box-header">
					
					<h3>操作信息</h3>
					
					
					<div class="findkuai">
						查找：<select id="permission" name="permission" onBlur="vline_permission();" onkeyup="v_permission();"> 
					   	<option>操作id</option> 
						<option>操作名</option>
						<option>操作描述</option>
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
								   <th>操作id</th>
								   <th>操作名</th>
								   <th width="60%">操作描述</th>
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
										<td>操作1</td>
										<td width="60%" width="60%">操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form>
									<tr>
										<td><input type="checkbox"></td>
										<td>00002</td>
										<td>操作2</td>
										<td width="60%">操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr class="alt-row">
										<td><input type="checkbox"></td>
										<td>00003</td>
										<td>操作3</td>
										<td width="60%">操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form>
									<tr>
										<td><input type="checkbox"></td>
										<td>00004</td>
										<td>操作4</td>
										<td width="60%">操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr class="alt-row">
										<td><input type="checkbox"></td>
										<td>00005</td>
										<td>操作5</td>
										<td width="60%">操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述操作描述</td>
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
    </div>
    







<div id="alert">
    	<div id="al" style="position:relative">
<h4><span class="tjxx">修改信息</span><span id="close">关闭</span></h4> 		
<form><table>

						<tr id="line_permissions"><td class="xiun"><strong>操作名</strong></td><td><div class="input">
						<input type="text" class="myinp" name="permissions" id="permissions" onBlur="v_permissions();" onKeyUp="v_permissions();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>

						<tr id="line_permissions"><td class="xiun"><strong>操作描述</strong></td><td><div class="input">
						<textarea rows="10" cols="20" style="max-width:170px;max-height:470px"></textarea>
			   <div class="none"><span></span></div></div></td></tr>
						
						
<tr style=" position:relative; top:10px;"><td style="text-align:right;"><input type="submit" value="保存" id="submit" class="sub" /></td><td style="text-align:center;"><input type="reset" value="重置"  class="sub" /></td></tr></table></form>
</div>
</div>









</body>
</html>
