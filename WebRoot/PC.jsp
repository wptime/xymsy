<%@ page language="java" contentType="text/html; UTF-8"
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
	<title>个人中心</title>
	<link rel="stylesheet" type="text/css" href="css/model.css" />
	<link rel="stylesheet" type="text/css" href="css/pc.css">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/jQuery-Msy.js"></script>
	<script type="text/javascript" src="js/jQuery-top.js"></script>
	<script type="text/javascript" src="js/pc.js"></script>
</head>
<body>
	<jsp:directive.include file="top.jsp"/>
	
	<div id="warpper">
		
		<div class="allba">
			<ul >
				<li><a href="goodsList.jsp">所有宝贝</a></li>
				<li><a href="">跳蚤市场</a></li>
				<li><a href="index.jsp">今日推荐</a></li>
			</ul>
		</div>
		<div id="warpper2">
			<div class="warpper-body">
				<div class="warpper-top">
					<p><a href="">个人中心</a></p>
					<ul>
						<li><a href="">个人主页</a></li>
						<li class="setup"><a href="">设置</a><i class="icon-self1 icon-pos"></i>
							<div class="set">
								<p class="set1"><a href="">设置</a></p>
								<p><a href="">个人信息</a></p>
								<p><a href="">账户安全</a></p>
								<p><a href="">我的等级</a></p>
								<p><a href="">增票资质</a></p>
								<p><a href="">收获地址</a></p>
								<p><a href="">快捷支付</a></p>
								<p><a href="">分享设置</a></p>
								<p><a href="">邮件订阅</a></p>
								<p><a href="">消费记录</a></p>
								<p><a href="">京东云盘</a></p>
								<p><a href="">应用授权</a></p>
							</div>
						</li>
						<li class="comm"><a href="">社区</a><span>(3)</span><i class="icon-self2 icon-pos"></i>
							<div class="community">
								<p class="community1"><a href="" style="margin-left: 13px;">社区</a><span>(3)</span></p>
								<p><a href="">评价晒单</a></p>
								<p><a href="">购买咨询</a></p>
								<p class="message"><a href="">消息精灵</a><span>(3)</span></p>
							</div>
						</li>
					</ul>
					<span class="gift"><a href="">支付有礼</a></span>
				</div>
				<div class="warpper-left">
					<div class="trade">
						<p>我的交易</p>
						<ul>
							<li><a href="">我的订单</a></li>
							<li><a href="">我的本地生活</a></li>
							<li><a href="">我的定期送</a></li>
							<li><a href="">我的团购</a></li>
							<li><a href="">价格保护</a></li>
							<li id="attention"><a>我的关注<b class="trade1"></b></a>
								<ul>
									<li><a href="">关注的商品</a></li>
									<li><a href="">关注的店铺</a></li>
									<li><a href="">关注的活动</a></li>
									<li><a href="">浏览历史</a></li>
								</ul>
							</li>
							<li id="property"><a>我的资产<b class="trade1"></b></a>
								<ul>
									<li><a href="">我的小金库</a></li>
									<li><a href="">余额</a></li>
									<li><a href="">优惠券</a></li>
								</ul>
							</li>
							<li id="service"><a>客户服务<b class="trade1"></b></a>
								<ul>
									<li><a href="">返修退换货</a></li>
									<li><a href="">取消订单记录</a></li>
									<li><a href="">我的投诉</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<div class="warpper-middle">
					<div class="myname">
						<img src="images/member1.png" alt="">
						<p class="myname1">用户昵称</p>
						<p class="myname2">睡前来一单，么么哒！</p>
						<p class="make"><a href="">注册会员</a></p>
						<p class="make"><a href="">账户安全</a></p>
						<div class="income">
							<div class="income1">
								<p class="income11">昨日收益（元）</p>
								<p class="income12">0.00</p>
								<p class="income13">转入小金库，<br>马上赚钱！</p>
							</div>
							<div class="income2">
								<p>余额：<span>0.00</span></p>
								<p>消费：<span></span></p>
							</div>
							<div class="income3">
								<p>消费卡：<span>0</span></p>
								<p>优惠卡：<span>0</span></p>
							</div>
						</div>
					</div>
					<div class="myorder">
						<p>
							<span class="myorder1">我的订单</span>
							<a class="myorder2">代付款<em>0</em></a>
							<a class="myorder2">待确认收获<em>0</em></a>
							<a class="myorder2">待自提<em>0</em></a>
							<a class="myorder2">代评价<em>0</em></a>
							<a class="myorder3" style="cursor: pointer;">查看全部订单</a>
						</p>
						<img src="images/car.png" alt="">
						<p class="myorder4">你买的东西太少了，这里空空的，快去挑选合适的商品吧！</p>
					</div>
					<div class="myattention">
						<p>
							<span class="myattention1">我关注的商品</span>
							<a class="myattention2">降价商品<em>0</em></a>
							<a class="myattention2">促销商品<em>0</em></a>
							<a class="myattention2">现货商品<em>0</em></a>
							<a class="myattention3" style="cursor: pointer;">查看更多</a>
						</p>
						<p class="myattention4">现在还没有关注的任何商品，看到感兴趣的商品就果断关注吧！看看大家都关注了什么！</p>
						<div class="maybelike">
							<div class="maybelike1"><a href=""><img src="images/may1.png" alt=""><p> &yen; 163.20</p></a></div>
							<div class="maybelike1"><a href=""><img src="images/may2.png" alt=""><p> &yen; 79.00</p></a></div>
							<div class="maybelike1"><a href=""><img src="images/may3.png" alt=""><p> &yen; 49.9</p></a></div>
							<div class="maybelike1"><a href=""><img src="images/may4.png" alt=""><p> &yen; 139.00</p></a></div>
							<div class="maybelike1"><a href=""><img src="images/may5.png" alt=""><p> &yen; 35.80</p></a></div>
						</div>
					</div>
					<div class="mypic"><a href=""><img src="images/pic3.png" alt=""></a></div>
					<div class="mypic"><a href=""><img src="images/pic1.png" alt=""></a></div>
					<div class="mypic" id="mypic1"><a href=""><img src="images/pic4.png" alt=""></a> </div>
					<div class="mypic"><a href=""><img src="images/pic2.png" alt=""></a></div>
				</div>
				<div class="warpper-right">
					<div class="member">
						<p class="member1">会员推荐</p>
						<p><span class="club">会员俱乐部</span><a href=""><span class="comein">进入</span></a></p>
						<div class="member2">
							<div class="member3">
								<div class="member4"><a href=""><img src="images/mem1.png" alt=""></a></div>
								<div class="member4"><a href=""><img src="images/mem2.png" alt=""></a></div>
							</div>
							<div class="member3">
								<div class="member4"><a href=""><img src="images/mem3.png" alt=""></a></div>
								<div class="member4"><a href=""><img src="images/mem4.png" alt=""></a></div>
							</div>
						</div>
					</div>
					<div class="history">
						<p><span class="history1">浏览历史</span><span class="history2"><a href="">查看更多</a></span></p>
						<div class="history3">
							<div class="history4"><a href=""><img src="images/his1.png" alt="">
								<p>&yen;<span>19.90</span></p></a></div>
							<div class="history4"><a href=""><img src="images/his2.png" alt="">
								<p>&yen;<span>17.90</span></p></a></div>
						</div>
					</div>
				</div>				
			</div>
		</div>
	</div>
	</div>
	
	<jsp:directive.include file="bottom.jsp"/>
</body>
</html>