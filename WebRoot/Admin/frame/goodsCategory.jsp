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
<title>课程分类</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/tab.js"></script> 
	<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="../js/jquery.form.min.js"></script>
	<script type="text/javascript" src="../js/AdminIndex.js"></script>
	<script type="text/javascript" src="../js/goodsCategory.js"></script>

</head>

<body>
<div id="Tab1">
    <div id="wrap">
    	
   		<div class="content-box"><!-- Start Content Box -->
				<div class="content-box-header">
					
					<h3>课程分类</h3>
					
					<div class="findkuai">
						查找：<select id="permission" name="permission" onBlur="vline_permission();" onkeyup="v_permission();"> 
					   	<option>一级分类id</option> 
						<option>二级分类id</option>
						<option>一级分类名</option>
						<option>二级分类名</option>
				   		</select>
				   		<input type="text" id="find" name="find"/>
						<button class="chafind">查找</button>
					<button class="content-add">添加二级分类</button>
					<button class="content-add">添加一级分类</button>
					</div>
					
					
					<div class="clear"></div>
					
				</div> <!-- End .content-box-header -->
   			<div class="Menubox">
			<ul>
				<li id="one1" onclick="setTab('one',1,9)"  class="hover">11111 店铺1</li>
				<li id="one2" onclick="setTab('one',2,9)" >22222 店铺2</li>
				<li id="one3" onclick="setTab('one',3,9)">33333 店铺3</li>
				<li id="one4" onclick="setTab('one',4,9)">44444 店铺4</li>
				<li id="one5" onclick="setTab('one',5,9)">55555 店铺5</li>
				<li id="one6" onclick="setTab('one',6,9)">66666 店铺6</li>
				<li id="one7" onclick="setTab('one',7,9)">77777 店铺7</li>
				<li id="one8" onclick="setTab('one',8,9)">88888 店铺8</li>
				<li id="one9" onclick="setTab('one',9,9)">99999 店铺9</li>
			</ul>
			<div class="clear"></div>
		</div>
			<div id="con_one_1" class="hover">
				<div class="content-box-content" style="display: block; ">
						<table class="alllong">
								<form method="get" >
									<tr>
										<td style="width:10%"></td>
										<td style="width:35%">11111</td>
										<td style="width:35%">店铺1</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
						</table>
						<table>
								
							<thead>
								<tr>
								   <th><input class="check-all" type="checkbox"></th>
								   <th>二级分类id</th>
								   <th>二级分类名</th>
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
									<tr>
										<td><input type="checkbox"></td>
										<td>00001</td>
										<td>商品1</td>
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
										<td>商品2</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr>
										<td><input type="checkbox"></td>
										<td>00003</td>
										<td>商品3</td>
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
			</div>
			<div id="con_one_2" style="display:none">

				<div class="content-box-content" style="display: block; ">
						<table class="alllong">
								<form method="get" >
									<tr>
										<td style="width:10%"></td>
										<td style="width:35%">22222</td>
										<td style="width:35%">店铺2</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
						</table>
						<table>
							
							<thead>
								<tr>
								   <th><input class="check-all" type="checkbox"></th>
								   <th>二级分类id</th>
								   <th>二级分类名</th>
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
									<tr>
										<td><input type="checkbox"></td>
										<td>00001</td>
										<td>商品1</td>
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
										<td>商品2</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr>
										<td><input type="checkbox"></td>
										<td>00003</td>
										<td>商品3</td>
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
										<td>商品4</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr>
										<td><input type="checkbox"></td>
										<td>00005</td>
										<td>商品5</td>
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
				</div>
				<div id="con_one_3" style="display:none">

				<div class="content-box-content" style="display: block; ">
						<table class="alllong">
								<form method="get" >
									<tr>
										<td style="width:10%"></td>
										<td style="width:35%">33333</td>
										<td style="width:35%">店铺3</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
						</table>
						<table>
							
							<thead>
								<tr>
								   <th><input class="check-all" type="checkbox"></th>
								   <th>二级分类id</th>
								   <th>二级分类名</th>
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
									<tr>
										<td><input type="checkbox"></td>
										<td>00001</td>
										<td>商品1</td>
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
										<td>商品2</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr>
										<td><input type="checkbox"></td>
										<td>00003</td>
										<td>商品3</td>
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
										<td>商品4</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr>
										<td><input type="checkbox"></td>
										<td>00005</td>
										<td>商品5</td>
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
					</div>
					<div id="con_one_4" style="display:none">

				<div class="content-box-content" style="display: block; ">
						<table class="alllong">
								<form method="get" >
									<tr>
										<td style="width:10%"></td>
										<td style="width:35%">44444</td>
										<td style="width:35%">店铺4</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
						</table>
						<table>
							
							<thead>
								<tr>
								   <th><input class="check-all" type="checkbox"></th>
								   <th>二级分类id</th>
								   <th>二级分类名</th>
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
									<tr>
										<td><input type="checkbox"></td>
										<td>00001</td>
										<td>商品1</td>
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
										<td>商品2</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr>
										<td><input type="checkbox"></td>
										<td>00003</td>
										<td>商品3</td>
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
										<td>商品4</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr>
										<td><input type="checkbox"></td>
										<td>00005</td>
										<td>商品5</td>
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
					</div>

				
<div id="con_one_5" style="display:none">
	<div class="content-box-content" style="display: block; ">
						<table class="alllong">
								<form method="get" >
									<tr>
										<td style="width:10%"></td>
										<td style="width:35%">55555</td>
										<td style="width:35%">店铺5</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
						</table>
						<table>
								
							<thead>
								<tr>
								   <th><input class="check-all" type="checkbox"></th>
								   <th>二级分类id</th>
								   <th>二级分类名</th>
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
									<tr>
										<td><input type="checkbox"></td>
										<td>00001</td>
										<td>商品1</td>
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
										<td>商品2</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr>
										<td><input type="checkbox"></td>
										<td>00003</td>
										<td>商品3</td>
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
</div>
<div id="con_one_6" style="display:none">
	<div class="content-box-content" style="display: block; ">
						<table class="alllong">
								<form method="get" >
									<tr>
										<td style="width:10%"></td>
										<td style="width:35%">66666</td>
										<td style="width:35%">店铺6</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
						</table>
						<table>
								
							<thead>
								<tr>
								   <th><input class="check-all" type="checkbox"></th>
								   <th>二级分类id</th>
								   <th>二级分类名</th>
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
									<tr>
										<td><input type="checkbox"></td>
										<td>00001</td>
										<td>商品1</td>
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
										<td>商品2</td>
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

</div>
<div id="con_one_7" style="display:none">
<div class="content-box-content" style="display: block; ">
						<table class="alllong">
								<form method="get" >
									<tr>
										<td style="width:10%"></td>
										<td style="width:35%">88888</td>
										<td style="width:35%">店铺8</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
						</table>
						<table>
								
							<thead>
								<tr>
								   <th><input class="check-all" type="checkbox"></th>
								   <th>二级分类id</th>
								   <th>二级分类名</th>
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
									<tr>
										<td><input type="checkbox"></td>
										<td>00001</td>
										<td>商品1</td>
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
										<td>商品2</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr>
										<td><input type="checkbox"></td>
										<td>00003</td>
										<td>商品3</td>
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
</div>
<div id="con_one_8" style="display:none">
<div class="content-box-content" style="display: block; ">
						<table class="alllong">
								<form method="get" >
									<tr>
										<td style="width:10%"></td>
										<td style="width:35%">11111</td>
										<td style="width:35%">店铺11</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
						</table>
						<table>
								
							<thead>
								<tr>
								   <th><input class="check-all" type="checkbox"></th>
								   <th>二级分类id</th>
								   <th>二级分类名</th>
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
									<tr>
										<td><input type="checkbox"></td>
										<td>00001</td>
										<td>商品1</td>
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
										<td>商品2</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr>
										<td><input type="checkbox"></td>
										<td>00003</td>
										<td>商品3</td>
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
</div>
<div id="con_one_9" style="display:none">
<div class="content-box-content" style="display: block; ">
						<table class="alllong">
								<form method="get" >
									<tr>
										<td style="width:10%"></td>
										<td style="width:35%">99999</td>
										<td style="width:35%">店铺9</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
						</table>
						<table>
								
							<thead>
								<tr>
								   <th><input class="check-all" type="checkbox"></th>
								   <th>二级分类id</th>
								   <th>二级分类名</th>
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
									<tr>
										<td><input type="checkbox"></td>
										<td>00001</td>
										<td>商品1</td>
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
										<td>商品2</td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr>
								</form>
								<form method="get" >
									<tr>
										<td><input type="checkbox"></td>
										<td>00003</td>
										<td>商品3</td>
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
</div>

			</div>
		</div>
</div>





<div id="alert">
    	<div id="al" style="position:relative">
<h4><span class="tjxx">修改信息</span><span id="close">关闭</span></h4> 		
<form><table>

						<tr id="line_permissions"><td class="xiun"><strong>分类名</strong></td><td><div class="input">
						<input type="text" class="myinp" name="permissions" id="permissions" onBlur="v_permissions();" onKeyUp="v_permissions();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>
						
						
<tr style=" position:relative; top:10px;"><td style="text-align:right;"><input type="submit" value="保存" id="submit" class="sub" /></td><td style="text-align:center;"><input type="reset" value="重置"  class="sub" /></td></tr></table></form>
</div>
</div>



</body>
</html>