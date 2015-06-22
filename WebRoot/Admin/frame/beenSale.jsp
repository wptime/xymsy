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
<title>已下架商品</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="../js/jquery.form.min.js"></script>
	<script type="text/javascript" src="../js/AdminIndex.js"></script>
	<script type="text/javascript" src="../js/beenSale.js"></script>
</head>

<body>
    <div id="wrap">
    <div class="content-box"><!-- Start Content Box -->
				
				<div class="content-box-header">
					
					<h3>已下架商品</h3>
					
					<div class="findkuai">
						查找：<select id="permission" name="permission" onBlur="vline_permission();" onkeyup="v_permission();"> 
					   	<option>商品id</option> 
						<option>商品名</option>
						<option>商品描述</option>
						<option>价格</option>
						<option>参考价</option>
						<option>发表时间</option>
						<option>店铺</option>
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
								   <th>商品描述</th>
								   <th>价格</th>
								   <th>参考价</th>
								   <th>图片</th>
								   <th>发表时间</th>
								   <th>店铺</th>
								   <th>功能</th>
								</tr>　　
								
							</thead>
						 
							<tfoot>
								<tr>
									<td colspan="10">
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
									<s:iterator value="goodsList" id="g">
									<s:if test="%{#g.gdStatus.equals(\"3\")}">
									<tr class="alt-row">
										<td><input type="checkbox"></td>
										<td><s:property value="#g.gdGoodsid"/></td>
										<td><a href="#" title="title"><s:property value="#g.gdGoodsname"/></a></td>
										<td style="width:15%"><s:property value="#g.gdBrief"/></td>
										<td><s:property value="#g.dgPrice"/></td>
										<td><s:property value="#g.gdPrice"/></td>
										<td style="width:70px">
											<s:generator val="%{#g.gdPicture}" separator="#" var="pl">
												<s:iterator value="pl" id="p">
													<img height="30" src="../../<s:property value='%{#p}'/>">
												</s:iterator>
											</s:generator>
										</td>
										<td><s:property value="#g.gdCreatetime"/></td>
										<td style="width:10%"><s:property value="#g.store.stStorename"/></td>
										<td>
											<!-- Icons -->
											<input class="act" type="button" title="编辑">
											
											<input class="delete" type="button" title="删除">
										</td>
									</tr> 
									</s:if>
								</s:iterator>
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
						<tr id="line_wpName"><td class="xiun"><strong>商品名</strong></td><td><div class="input">
						<input type="text" class="myinp" name="wpName" id="wpName" onBlur="v_wpName();" onKeyUp="v_wpName();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>


						<tr id="line_itemDescription"><td class="xiun"><strong>商品描述</strong></td><td><div class="input">
						<textarea rows="8" cols="20" style="max-width:170px;max-height:270px"></textarea>
			   <div class="none"><span></span></div></div></td></tr>

						<tr id="line_msprice"><td class="xiun"><strong>价格</strong></td><td><div class="input">
						<input type="text" class="myinp" name="msprice" id="msprice" onBlur="v_msprice();" onKeyUp="v_msprice();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>

						<tr id="line_hxprice"><td class="xiun"><strong>参考价</strong></td><td><div class="input">
						<input type="text" class="myinp" name="hxprice" id="hxprice" onBlur="v_hxprice();" onKeyUp="v_hxprice();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>
						
						
						<tr id="line_picture"><td class="xiun"><strong>图  片</strong></td><td><div class="input" style="width:150px">

						<div class="none"><span></span></div></div></td></tr>
				
			<tr id="line_publishedTime"><td class="xiun"><strong>发表时间</strong></td><td><div class="input">
						<input type="text" class="myinp" name="publishedTime" id="publishedTime" onBlur="v_publishedTime();" onKeyUp="v_wpName();" onmouseover="this.style.border='1px solid #f60'" onfoucs="this.style.border='1px solid #f60'" /><div class="none"><span></span></div></div></td></tr>
						
			<tr id="line_address"><td class="xiun"><strong>店  铺</strong></td><td><div class="input">
						<textarea rows="5" cols="20" style="max-width:170px;max-height:270px"></textarea><div class="none"><span></span></div></div></td></tr>

						
<tr style=" position:relative; top:10px;"><td style="text-align:right;"><input type="submit" value="保存" id="submit" class="sub" /></td><td style="text-align:center;"><input type="reset" value="重置"  class="sub" /></td></tr></table></form>
</div>
</div>









</body>
</html>
