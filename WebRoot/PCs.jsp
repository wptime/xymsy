﻿<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>“马上有”首页</title>
	<link rel="stylesheet" type="text/css" href="css/model.css" />
	<link rel="stylesheet" type="text/css" href="css/pc.css" />
</head>
<body>
	<jsp:directive.include file="top.jsp"/>
	<div id="warpper">
		<div class="allba">
			<ul >
				<li>
					<a href="goodsList.jsp">所有宝贝</a>
				</li>
				<li>
					<a href="">跳蚤市场</a>
				</li>
				<li>
					<a href="index.jsp">今日推荐</a>
				</li>
			</ul>
		</div>
		<div id="warpper2">
			<div class="warpper-body">
				<div class="warpper-top">
					<p>
						<a href="">个人中心</a>
					</p>
					<ul>
						<li>
							<a class="per_main">个人主页</a>
						</li>
						<li class="setup">
							<a class="turn" href="PC_set.jsp">设置</a> <i class="icon-self1 icon-pos"></i>
							<div class="set">
								<p class="set1">
									<a href="">设置</a>
								</p>
								<p>
									<a href="">个人信息</a>
								</p>
								<p>
									<a href="">账户安全</a>
								</p>
								<p>
									<a href="">我的等级</a>
								</p>
								<p>
									<a href="">增票资质</a>
								</p>
								<p>
									<a href="">收获地址</a>
								</p>
								<p>
									<a href="">快捷支付</a>
								</p>
								<p>
									<a href="">分享设置</a>
								</p>
								<p>
									<a href="">邮件订阅</a>
								</p>
								<p>
									<a href="">消费记录</a>
								</p>
								<p>
									<a href="">京东云盘</a>
								</p>
								<p>
									<a href="">应用授权</a>
								</p>
							</div>
						</li>
						<li class="comm">
							<a href="">消息</a>
							<span>(3)</span> <i class="icon-self2 icon-pos"></i>
							<div class="community">
								<p class="community1">
									<a href="" style="margin-left: 13px;">社区</a>
									<span>(3)</span>
								</p>
								<p>
									<a href="">评价晒单</a>
								</p>
								<p>
									<a href="">购买咨询</a>
								</p>
								<p class="message">
									<a href="">消息精灵</a>
									<span>(3)</span>
								</p>
							</div>
						</li>
					</ul>
					<span class="gift">
						<a href="">支付有礼</a>
					</span>
				</div>
				<div class="main">
					<div class="warpper-left">
						<div class="trade">
							<p>我的交易</p>
							<ul>
								<li>
									<a href="">我的订单</a>
								</li>
								<!-- <li>
								<a href="">我的商品</a>
							</li>
							<li id="attention">
								<a>
									我的关注 <b class="trade1"></b>
								</a>
								<ul>
									<li>
										<a href="">关注的商品</a>
									</li>
									<li>
										<a href="">关注的店铺</a>
									</li>
									<li>
										<a href="">关注的活动</a>
									</li>
									<li>
										<a href="">浏览历史</a>
									</li>
								</ul>
							</li>
							<li id="service">
								<a>
									客户服务 <b class="trade1"></b>
								</a>
								<ul>
									<li>
										<a href="">返修退换货</a>
									</li>
									<li>
										<a href="">取消订单记录</a>
									</li>
									<li>
										<a href="">我的投诉</a>
									</li>
								</ul>
							</li>
							-->
						</ul>
					</div>
				</div>
				<div class="warpper-middle">
					<div class="myname">
						<img src="images/member1.png" alt="">
						<p class="myname1">用户昵称</p>
						<p class="myname2">睡前来一单，么么哒！</p>
						<p class="make">
							<a href="">注册会员</a>
						</p>
						<p class="make">
							<a href="">账户安全</a>
						</p>

					</div>
					<!-- myorder -->
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
				<!-- <tbody>
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
				</tbody> -->
				<s:iterator value="userOrderList" id="r">
				<tbody>
					<tr class="offer">
						<td colspan="6">
							<span>
								订单编号：
								<a href=""><s:property value="#r.odOrderid"/></a>
							</span>
							<span class="nshop"><s:property value="#r.goods.store.stStorename"/></span>
						</td>
					</tr>
					<tr>
						<td>
							<div class="img-list">
								<a href="">
									<img src="<s:property value='#r.goods.gdPicture.substring(1,#r.goods.gdPicture.indexOf("#",1))'/>" alt=""></a>
							</div>
						</td>
						<td><s:property value="#r.user.usNickname"/></td>
						<td>￥<s:property value="#r.odPrice"/></td>
						<td>
							<span class=""><s:property value="#r.odCreattime"/></span>
						</td>
						<td>
							<s:if test="#r.odStatus==0">
								<span>待付款</span>
							</s:if>
							<s:elseif test="#r.odStatus==1">
								<span>待发货</span>
							</s:elseif>
							<s:elseif test="#r.odStatus==3">
								<span>待确认收货</span>
							</s:elseif>
							<s:elseif test="#r.odStatus==4">
								<span>交易完成</span>
							</s:elseif>
							<s:else>
								<span>订单状态：<s:property value="#r.odStatus"/></span>
							</s:else>
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
				</s:iterator>
			</table>
		</div>
		<!-- myorder end -->

	</div>
	<div class="warpper-right">
		<div class="own-shop">
			<div class="title">
				我的店铺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尚未开通
			</div>
			<div class="own-con">
				<div class="own-image">
					<img src="images/ctx.png" alt="" style="width: 180px;"/>
					<div>小店名字</div>
				</div>
				<ul class="own-center">
					<li>
						店主:
						<span>店主姓名</span>
					</li>
					<li>
						商品数：
						<span></span>
					</li>
					<li>
						被关注量：
						<span></span>
					</li>
					<li>
						店铺评分：
						<span></span>
					</li>
					<li>
						主要销售：
						<span></span>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
</div>

	<jsp:directive.include file="bottom.jsp"/>
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/jQuery-Msy.js"></script>
	<script type="text/javascript" src="js/jQuery-top.js"></script>
</body>
</html>