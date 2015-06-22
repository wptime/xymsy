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
	<link rel="stylesheet" href="css/SC.css">
	<link rel="stylesheet" href="css/model.css">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	
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
		<div id="warpper2">

			<div class="warpper-body" >
				<div class="warpper-top">
					<p><a href="person/shopStatu">卖家中心</a></p>
					<ul>
						<li><a href="person/shopStatu">卖家主页</a></li>
						<li class="setup"><a href="">设置</a></li>
					</ul>
					<span class="gift"><a href="">支付有礼</a></span>
				</div>
				<jsp:directive.include file="SC_left.jsp"/>
				<div class="warpper-middle warpper-other">
						<div class="myorder">
						<table class="tb-void">
							<colgroup>
							<col width="290">
							<col width="90">
							<col width="110">
							<col width="100">
							<col width="100">
							<col width="130"></colgroup>
						<thead>
							<tr>
								<th>订单信息</th>
								<th>收货人</th>
								<th>订单金额</th>
								<th>
									<select id="submitDate" name="" class="sele">
										<option value="1" selected="">最近三个月</option>
										<option value="2">今年内</option>
										<option value="2014">2014年</option>
										<option value="2013">2013年</option>
										<option value="2012">2012年</option>
										<option value="3">2012年以前</option>
									</select>
								</th>
								<th>
									<select id="orderState" name="" class="sele">
										<option value="4096" selected="">全部状态</option>
										<option value="1">等待付款</option>
										<option value="32">等待自提</option>
										<option value="128">等待收货</option>
										<!-- <option value="0">处理中</option>
									-->
									<!--<option value="2048">有效</option>
								-->
								<option value="1024">已完成</option>
								<option value="-1">已取消</option>
							</select>
						</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr class="offer">
						<td colspan="6">
							<span>
								订单编号：
								<a href="">7288571317</a>
							</span>
							<span class="nshop">马上有</span>
						</td>
					</tr>
					<tr>
						<td>
							<div class="img-list">
								<a href="">
									<img src="images/book.jpg" alt=""></a>
								<a href="">
									<img src="images/book.jpg" alt=""></a>
							</div>
						</td>
						<td>韦鹏</td>
						<td>￥10.80</td>
						<td>
							<span class="">
								2014-12-06
								<br>21:20:48</span>
						</td>
						<td>
							<span>已完成</span>
						</td>
						<td>
							<a href="">查看</a>
							<br/>
							<a href="">删除</a>
							<br/>
							<a href="">返修/退换货</a>
							<br/>
							<a href="" class="payAgain">还要买</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
					
				</div>
					
				<jsp:directive.include file="SC_right.jsp"/>				
			</div>
		<div class="clear"></div>
		</div>
	</div>
	
	<jsp:directive.include file="bottom.jsp"/>
	
	<script type="text/javascript" src="js/sc.js"></script>
	<script type="text/javascript" src="js/jQuery-Msy.js"></script>
	<script type="text/javascript" src="js/own.js"></script>
	
</body>
</html>