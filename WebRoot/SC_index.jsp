<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>"/>
	<meta charset="UTF-8">
	<title>卖家首页</title>
	<link rel="stylesheet" href="css/model.css">
	<link rel="stylesheet" href="css/SC_index.css">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/unslider.min.js"></script>
	<script type="text/javascript" src="js/jQuery.tyMsy.js"></script>
	<script type="text/javascript" src="js/jQuery-show.js"></script>
	<script type="text/javascript" src="js/jQuery-top.js"></script>
</head>
<body>
	<div id="top">
		<div class="tytop">
			<ul class="top-left">
				<li>缺什么，</li>
				<li>马上有！&nbsp;</li>
				<li class="blue">&nbsp;<a href="#" style="color:#1cabb4;">亲，请登录</a>&nbsp;</li>
				<li>&nbsp;<a href="#">免费注册</a></li>
			</ul>
			<ul class="top-right">
				<li class="index-own">
					<a href="#" class="index-top">个人中心</a>
					<i class="icon-self icon-pos"></i>
					<div class="self-own self-all">
						<p><a href="#">已买到的宝贝</a></p>
						<p><a href="#">爱逛街</a></p>
						<p><a href="#">拾货</a></p>
						<p><a href="#">我的足迹</a></p>
						<p><a href="#">我的上新</a></p>
						<p><a href="#">我的优惠</a></p>
					</div>
				</li>
				<li class="index-car">
					<i class="icon-self icon-shop"></i> 
					<a href="#" class="index-top">购物车
						<span style="color:#1cabb4;font-weight:bold;">0</span> </a>
					<i class="icon-self icon-pos"></i>
					<div class="self-car self-all">
						<p>
							您的购物车里没有任何宝贝
							<input type="button" value="查看我的购物车"/>
						</p>
							
					</div>
				</li>
				<li class="index-collect">
					<i class="icon-self icon-save"></i>
					<a href="#" class="index-top">收藏夹</a>
					<i class="icon-self icon-pos"></i>
					<div class="self-base self-all">
						<p><a href="#">收藏的宝贝</a></p>
						<p><a href="#">收藏的店铺</a></p>
					</div>
				</li>
				<li class="index-sell">
					<a href="#" class="index-top">卖家中心</a>
					<i class="icon-self icon-pos"></i>
					<div class="self-sell self-all">
						<p><a href="#">免费开店</a></p>
						<p><a href="#">已卖出的宝贝</a></p>
						<p><a href="#">出售中的宝贝</a></p>
						<p><a href="#">卖家服务市场</a></p>
						<p><a href="#">卖家培训中心</a></p>
					</div>
				</li>
				<li >
					|&nbsp;&nbsp;&nbsp;
					<a href="#" >联系客服</a>&nbsp;&nbsp;
				</li>
				<li class="index-tour">
					<a href="#" class="index-top" style="margin:0 auto">网站导航</a>
					<i class="icon-self icon-nav"></i>
					<div class="self-tour">
						<div class="tour-or" style="border:none;">
							<p style="color:#ea4444">主题市场</p>
							<div class="tour-er">
								<ul>
									<li><a href="#">淘宝女人</a></li>
									<li><a href="#">运动派</a></li>
									<li><a href="#">情侣</a></li>
									<li><a href="#">淘宝男人</a></li>
									<li><a href="#">孕婴童</a></li>
									<li><a href="#">家居</a></li>
									<li><a href="#">美容护肤</a></li>
									<li><a href="#">中老年</a></li>
									<li><a href="#">美食</a></li>
									<li><a href="#">美嫁新娘</a></li>
									<li><a href="#">有车族</a></li>
									<li><a href="#">装修</a></li>
									<li><a href="#">生活家</a></li>
									<li><a href="#">品牌控</a></li>
									<li><a href="#">游戏</a></li>
									<li><a href="#">潮流设计</a></li>
									<li><a href="#">动漫</a></li>
									<li><a href="#">爱好</a></li>
								</ul>
							</div><!--tour-er-->
						</div><!--1tour-or-->
						<div class="tour-or">
							<p style="color:#80cd97">特色购物</p>
							<div class="tour-er">
								<ul>
									<li><a href="#">天天特价</a></li>
									<li><a href="#">免费试用</a></li>
									<li><a href="#">清仓</a></li>
									<li><a href="#">一元起拍</a></li>
									<li><a href="#">淘金币</a></li>
									<li><a href="#">拾货</a></li>
									<li><a href="#">淘宝二手</a></li>
									<li><a href="#">全球购</a></li>
									<li><a href="#">新欢</a></li>
									<li><a href="#">淘宝奇葩</a></li>
									<li><a href="#">淘女郎</a></li>
									<li><a href="#">挑食</a></li>
									<li><a href="#">淘宝同学</a></li>
									<li><a href="#">夜淘宝</a></li>
									<li><a href="#">星店</a></li>
									<li><a href="#">淘宝星愿</a></li>
									<li><a href="#">拍卖会</a></li>
									<li><a href="#">腔调</a></li>
									<li><a href="#">同城便民</a></li>
									<li><a href="#">搭配</a></li>
								</ul>
							</div>
						</div><!--2tour-or-->
						<div class="tour-or">
							<P style="color:#b559b6">当前热点</P>
							<div class="tour-er">
								<ul>
									<li><a href="#">天天中奖</a></li>
									<li><a href="#">新鲜土货</a></li>
									<li><a href="#">清凉一夏</a></li>
									<li><a href="#">美白防晒</a></li>
									<li><a href="#">热卖凉鞋</a></li>
									<li><a href="#">新品数码</a></li>
									<li><a href="#">海外精品</a></li>
									<li><a href="#">美白防晒</a></li>
									<li><a href="#">宝贝最爱</a></li>
									<li><a href="#">夏日养车</a></li>
									<li><a href="#">新房装修</a></li>
									<li><a href="#">宝贝计划</a></li>
									<li><a href="#">大码女装</a></li>
									<li><a href="#">我要泡妞</a></li>
									<li><a href="#">约伴神器</a></li>
									<li><a href="#">急聘客服</a></li>
									<li><a href="#">免费APP</a></li>
									<li><a href="#">洗照片</a></li>
								</ul>
							</div><!--tour-er-->
						</div><!--3tour-or-->
						<div class="tour-or">
							<p style="#614dde">更多精彩</p>
							<div class="tour-er">
								<ul>
									<li><a href="#">阿里旺旺</a></li>
									<li><a href="#">支付宝</a></li>
									<li><a href="#">来往</a></li>
									<li><a href="#">房屋免佣</a></li>
									<li><a href="#">闺蜜淘货</a></li>
									<li><a href="#">天猫国际</a></li>
									<li><a href="#">全网底价</a></li>
									<li><a href="#">余额宝</a></li>
									<li><a href="#">整点秒杀</a></li>
									<li><a href="#">淘公仔</a></li>
									<li><a href="#">浏览器</a></li>
									<li><a href="#">我帮你</a></li>
									<li><a href="#">司法拍卖</a></li>
									<li><a href="#">查寄快递</a></li>
									<li><a href="#">淘宝香港</a></li>
									<li><a href="#">淘宝台湾</a></li>
									<li><a href="#">淘宝全球</a></li>
									<li><a href="#">淘宝视频</a></li>
								</ul>
							</div>
						</div><!--4tour-or-->
					</div><!--self-tour-->
				</li>
			</ul>
		</div><!--tytop-->
		
	</div><!--top-->
	<div id="warpper">
			<div class="warpper1">
				<div class="navgitor">
					<div class="logo">
						<a href="#" class="navgitor-logo">
							<img src="images/logo.png" alt="首页">
						</a>
					</div><!--logo-->
					<div class="shop">
						<div class="shopname">
						<div class="shopname1">
							<a href="#"><strong><s:property value="#request.store.stStorename"/></strong></a>
							<p>
								<span id="flagship">品牌直销</span><i class="icon-ask"></i>	
							</p>
						</div>
						<div class="shopname2">
							<table>
								<tr>
								<td>描述</td>
								<td>服务</td>
								<td>物流</td>
							</tr>
							<tr>
								<td>4.9<span class="icon-up"></span></td>
								<td>4.9<span class="icon-up"></span></td>
								<td>4.9<span class="icon-up"></span></td>
							</tr>
							</table>
						</div>
					</div>
					<div class="shop-messages">
						<div class="hd-msg">
							<h1>店铺服务</h1>
							<p>掌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;柜：<span><s:property value="#request.store.stStorename"/></span></p>
							<p>联系方式：<span><!-- <i class="icon-ask ask-msg" --><s:property value="#request.store.user.usPhone"/></i></span></p>
							<p>所&nbsp;在&nbsp;地：<span><s:property value="#request.store.stStoreadd"/></span></p>
							<div class="shop-care">
								<span>关注</span>
								<p><em>188888</em></p>
								<p>关注</p>
							</div>
						</div>
						<div class="bd-msg">
							
							<div class="shop-cle"><span>收藏本店</span></div>
						</div>
					</div>
					</div>
					
					<div class="navgitor-search">
						<form name="" action="" method="" class="index-form" id="indexform">
							<lable class="navgitoraa">新品<i class="icon-self icon-new"></i></lable>
							<i class="icon-self icon-find"></i>
							<input type="text" name="user" value="" class="search-in">
							<input type="submit" class="search-push"  value="搜索">
						</form>
					</div><!--navgitor-search-->	
				</div><!--navgitor-->
			</div>
			<div id="hd">
				<div class="hd-nav">
					<ul>
						<li class="nav-index"><a href="">首页</a><span>|</span></li>
						<li class="nav-all"><a href="">所有产品</a></li>
						<li><a href="">商品类</a></li>
						<li><a href="">商品类</a></li>
						<li><a href="">商品类</a></li>
						<li><a href="">商品类</a></li>
						<li><a href="">商品类</a></li>
						<li><a href="">商品类</a></li>
						<li><a href="">商品类</a></li>
						<li><a href="">商品类</a></li>
					</ul>
				</div>
			</div>
			<div id="bd">
				<div class="sell-pic">
					<div class="sell-main"><img src="images/as.png" alt=""></div>
					<div class="sell-main"><img src="images/as.png" alt=""></div>
				</div>
				<div class="photoshow">
					<s:iterator value="storeGoodsList" id="r">
						<div class="photoshow-ex">
							<a href="main/getInfo?goodsId=<s:property value="#r.gdGoodsid"/>" target="_blank"><img src=<s:property value="#r.gdPicture.substring(1,#r.gdPicture.indexOf('#',1))"/> alt="#" width="182" height="182"></a>
							<div class="simple-left">
								<a href="main/getInfo?goodsId=<s:property value="#r.gdGoodsid"/>" target="_blank" class="big"><s:property value="#r.gdGoodsname"/></a>
								<span class="small"><s:property value="#r.gdBrief"/></span>
							</div>
							<div class="simple-right">
								<span class="price"><s:property value="#r.gdPrice"/></span>
								<a class="collect" title="喜欢"><i class="icon-col"></i></a>
							</div>
						</div>
					</s:iterator>
					<!-- <div class="photoshow-ex">
						<a href="#"><img src="images/picture-example.png" alt="#" width="182" height="182"></a>
						<div class="simple-left">
							<a href="#" class="big">2商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect" title="喜欢"><i class="icon-col"></i></a>
						</div>
					</div>
					<div class="photoshow-ex">
						<a href="#"><img src="images/picture-example.png" alt="#" width="182" height="182"></a>
						<div class="simple-left">
							<a href="#" class="big">3商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect" title="喜欢"><i class="icon-col"></i></a>
						</div>
					</div>
					<div class="photoshow-ex phexx">
						<a href="#"><img src="images/picture-example.png" alt="#" width="182" height="182"></a>
						<div class="simple-left">
							<a href="#" class="big">4商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect" title="喜欢"><i class="icon-col"></i></a>
						</div>
					</div>
					<div class="photoshow-ex">
						<a href="#"><img src="images/picture-example.png" alt="#" width="182" height="182"></a>
						<div class="simple-left">
							<a href="#" class="big">1商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect" title="喜欢"><i class="icon-col"></i></a>
						</div>
					</div>	
					<div class="photoshow-ex">
						<a href="#"><img src="images/picture-example.png" alt="#" width="182" height="182"></a>
						<div class="simple-left">
							<a href="#" class="big">2商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect" title="喜欢"><i class="icon-col"></i></a>
						</div>
					</div>	
					<div class="photoshow-ex">
						<a href="#"><img src="images/picture-example.png" alt="#" width="182" height="182"></a>
						<div class="simple-left">
							<a href="#" class="big">3商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect" title="喜欢"><i class="icon-col"></i></a>
						</div>
					</div>	
					<div class="photoshow-ex phexx">
						<a href="#"><img src="images/picture-example.png" alt="#" width="182" height="182"></a>
						<div class="simple-left">
							<a href="#" class="big">4商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect" title="喜欢"><i class="icon-col"></i></a>
						</div>
					</div>	
					<div class="photoshow-ex ">
						<a href="#"><img src="images/picture-example.png" alt="#" width="182" height="182"></a>
						<div class="simple-left">
							<a href="#" class="big">1商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect" title="喜欢"><i class="icon-col"></i></a>
						</div>
					</div>	
					<div class="photoshow-ex">
						<a href="#"><img src="images/picture-example.png" alt="#" width="182" height="182"></a>
						<div class="simple-left">
							<a href="#" class="big">2商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect" title="喜欢"><i class="icon-col"></i></a>
						</div>
					</div>	
					<div class="photoshow-ex">
						<a href="#"><img src="images/picture-example.png" alt="#" width="182" height="182"></a>
						<div class="simple-left">
							<a href="#" class="big">3商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect" title="喜欢"><i class="icon-col"></i></a>
						</div>
					</div>	
					<div class="photoshow-ex phexx">
						<a href="#"><img src="images/picture-example.png" alt="#" width="182" height="182"></a>
						<div class="simple-left">
							<a href="#" class="big">4商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect" title="喜欢"><i class="icon-col"></i></a>
						</div>
					</div>	 -->				
				</div>
			</div>
			
		<div id="footer">
			<div >
				<ul class="footer-ss">
					<li class="footer-single">
						<div class="footer-photo">
							<img src="images/picturea.jpg" alt="" />
						</div>
						<div class="footer-content">
							<div class="footer-up">购物指南<br></div>
							<div class="footer-down">
								<a href="#">购物流程<br></a>
								<a href="#">会员介绍<br></a>
								<a href="#">团购机票<br></a>
								<a href="#">常见问题<br></a>
								<a href="#">大家电<br></a>
								<a href="#">联系客服</a>
							</div>
						</div>
					</li >
					<li class="footer-single">
						<div class="footer-photo">
							<img src="images/pictureb.jpg" alt="" />
						</div>
						<div class="footer-content">
							<div class="footer-up">配送方式<br></div>
							<div class="footer-down">
								<a href="#">上门自提<br></a>
								<a href="#">211限时达<br></a>
								<a href="#">配送服务查询<br></a>
								<a href="#">配送费收取标准<br></a>
								<a href="#">海外配送<br></a>
							</div>
						</div>
					</li>
					<li class="footer-single">
						<div class="footer-photo">
							<img src="images/picturec.jpg" alt="" />
						</div>
						<div class="footer-content">
							<div class="footer-up">支付方式<br></div>
							<div class="footer-down">

								<a href="#">货到付款<br></a>
								<a href="#">在线支付<br></a>
								<a href="#">分期付款<br></a>
								<a href="#">邮局汇款<br></a>
								<a href="#">公司转账</a>
							</div>
						</div>
					</li>
					<li class="footer-single">
						<div class="footer-photo">
							<img src="images/pictured.jpg" alt="" />
						</div>
						<div class="footer-content">
							<div class="footer-up">售后服务<br></div>
							<div class="footer-down">

								<a href="#">售后政策<br></a>
								<a href="#">价格保护<br></a>
								<a href="#">退款说明<br></a>
								<a href="#">返修/退换货<br></a>
								<a href="#">取消订单</a>
							</div>
						</div>
					</li>
					<li class="footer-single">
						<div class="footer-photo">
							<img src="images/picturee.jpg" alt="" />
						</div>
						<div class="footer-content">
							<div class="footer-up">特色服务<br></div>
							<div class="footer-down">

								<a href="#">夺宝岛<br></a>
								<a href="#">DIY装机<br></a>
								<a href="#">延保服务<br></a>
								<a href="#">京东卡<br></a>
								<a href="#">节能补贴</a>
							</div>
						</div>
					</li>
					<li class="footer-content2">
						<a href="#"><img src="images/picturef.png" alt="" /></a> 
					</li>
				</ul>
			</div>
		</div><!--footer-->
		<div id="end">
			<ul class="endle">
				<li><a href="#">&nbsp;关于我们</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">&nbsp;联系我们</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">&nbsp;人才招聘</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">&nbsp;商家入驻</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">&nbsp;广告服务</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">&nbsp;手机东京</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">&nbsp;友情链接</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">&nbsp;销售联盟</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">&nbsp;京东社区</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">&nbsp;京东公益</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">&nbsp;English Site</a></li>
			</ul>
			<div>
				<br><br><br>
				<p>
					北京市公安局朝阳分局备案编号110105014669 | 京ICP证070359号 | 互联网药品信息服务资格证编号（京）-非经营性-2011-0034
				</p>
				<p>
					音像制品经营许可证苏宿批005号 | 出版物经营许可证编号新出发（苏）批字第N-012号 | 互联网出版许可证编号新出网证（京）字150号
				</p>
				<p>
					网络文化经营许可证京网文[2011]0168-061号 Copyright@2004-2014 京东JD.com版权所有
				</p>
				<br><br>
			</div>				
		</div><!--end-->
	</div>
	<div class="back-class ">
		<ul>
			<li><a href="#">商品类</a></li>
			<li><a href="#">商品类</a></li>
			<li><a href="#">商品类</a></li>
			<li><a href="#">商品类</a></li>
			<li><a href="#">商品类</a></li>
			<li><a href="#">商品类</a></li>
			<li><a href="#">商品类</a></li>
			<li><a href="#">商品类</a></li>
		</ul>
		<a href="javascript:void(0)" title="分类查找"><i class=""></i></a>
	</div>
	<div class="back">
		<a href="javascript:void(0)" title="回到顶部"><i class="icon-self icon-back"></i></a>
	</div>
</body>
</html>