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
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>msy商品详细页</title>
	<link rel="stylesheet" type="text/css" href="css/model.css" />
	<link rel="stylesheet" type="text/css" href="css/goodsreply.css" />
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/jQuery-Msy.js"></script>
	<script type="text/javascript" src="js/jQuery-top.js"></script>
	<script type="text/javascript" src="js/goodsinfo.js"></script>
	
</head>
<body>

	<jsp:directive.include file="top.jsp"/>
	<div id="myhome">
		<div class="navgitor">
					<div class="logo">
						<a href="index.html" class="navgitor-logo">
							<img src="images/logo.png" alt="首页">
						</a>
					</div><!--logo-->
					<div class="navgitor-search">
						<form name="" action="" method="" class="index-form" id="indexform">
							<lable class="navgitoraa">新品<i class="icon-self icon-new"></i></lable>
							<i class="icon-self icon-find"></i>
							<input type="text" name="user" value="" class="search-in">
							<input type="submit" class="search-push"  value="搜索">
						</form>
					</div><!--navgitor-search-->
				</div><!--navgitor-->
		<div class="center">
			<div class="category">
				<ul>
					<li><a href="goodsList.html">所有宝贝</a></li>
					<li><a href="#">跳蚕市场</a></li>
					<li><a href="index.html#here">今日推荐</a></li>
				</ul>
			</div><!--category-->
			<div class="goods">
				<div class="goods-img">
					<div id="img-icon"></div>
					<div class="goods-images">
						<a class="imgs-block"><i class="icon-img1 icon-con"></i></a>
						<a href="#"><i class="icon-imgs icon-con" id="icon1"></i></a>
						<a href="#"><i class="icon-imgs icon-con" id="icon2"></i></a>
						<a href="#"><i class="icon-imgs icon-con" id="icon3"></i></a>
						<a href="#"><i class="icon-imgs icon-con" id="icon4"></i></a>
						<a href="#"><i class="icon-imgs icon-con" id="icon5"></i></a>
						<a class="imgs-block"><i class="icon-img2 icon-con"></i></a>
					</div>
				</div>
				<div class="goods-name">
					荷兰Verduijn's牛油脆饼干-小红莓味 蔓越莓味 75g
				</div>
				<div class="price">
					价&nbsp&nbsp&nbsp格&nbsp&nbsp&nbsp<span class="yellow">￥19.9</span>
					<span class="add">
						<span class="add-ex">
							<span class="add1">368</span>
							<span class="add2">交易成功</span>
						</span>
						<span class="add-ex" style="border:none;">
							<span class="add1">307</span>
							<span class="add2">累计评价</span>
						</span>
					</span><!--add-->

					<br /><br />

					参考价&nbsp&nbsp&nbsp<span class="del">￥28.9</span><br /><br />
					
					<form>配&nbsp&nbsp&nbsp送&nbsp&nbsp&nbsp
					    <select name="cars">
							<option value="volvo">北京</option>
							<option value="saab">天津</option>
							<option value="fiat">上海</option>
							<option value="audi">深圳</option>
					    </select>
					</form>
					
					<form>&nbsp&nbsp至&nbsp&nbsp
					    <select name="cars">
							<option value="volvo">北京</option>
							<option value="saab">天津</option>
							<option value="fiat">上海</option>
							<option value="audi">深圳</option>
					    </select>
					</form>&nbsp
					有货&nbsp&nbsp 快递：免运费<br /><br />
					服&nbsp&nbsp&nbsp务&nbsp&nbsp&nbsp 72小时发货<br /><br />
					提&nbsp&nbsp&nbsp示&nbsp&nbsp&nbsp<span style="color:#ffa800">该商品支持7天无理由退换货</span><br />
				</div><!--price-->
				<div class="news">
					<div class="news-top">卖家信息</div>
					<ul class="news-list">
						<li>店铺：小马美食</li>
						<li>信誉：
							<i class="icon-news1 icon-con"></i>
							<i class="icon-news1 icon-con"></i>
							<i class="icon-news1 icon-con"></i>
						</li>
						<li>掌柜：小马</li>
						<li>联系：<a href="#"><i class="icon-news2 icon-con"></i></a>
						</li>
						<li>认证：</li>
					</ul>
					<ul class="buy-up">
						<li style="border:none;">
							<div>描述</div>
							<div class="up">5.0</div>
						</li>
						<li>
							<div>物流</div>
							<div class="up">5.0</div>
						</li>
						<li>
							<div>服务</div>
							<div class="up">5.0</div>
						</li>
					</ul>
					<input type="submit" class="news-in" value="进入店铺">
					<input type="submit" class="news-in" value="收藏店铺">
				</div>
				<form class="num" name="from1">
					<ul>
						<li>数&nbsp&nbsp&nbsp量</li>
						<li><a class="num-1" href="javascript:qtyUpdate('down')">-</a></li>
						<li><input class="num-2" value=1 name=qty type="text"></li>
						<li><a class="num-3" href="javascript:qtyUpdate('up')">+</a></li>
					</ul>
					<!--
					<span class="num-0">数&nbsp&nbsp&nbsp量</span>
					<a class="num-3" href="javascript:qtyUpdate('up')">+</a>
					<input class="num-2" value=1 name=qty type="text">
					<a class="num-1" href="javascript:qtyUpdate('down')">-</a>-->
				</form>
				<div class="buy">
					<a href="PC_orders.html">
						<input type="submit" class="buy-1" value="立即购买">
					</a>
					<input type="submit" class="buy-2" value="加入购物车">
				</div>
			</div><!--goods-->
			<div class="particular">
				<div class="left">
					<div class="par-left par1">
						<div class="par-left-top">相关分类</div>
						<ul style="height: 57px">
							<li><a href="goodsList.html">糖果/巧克力</a></li>
							<li><a href="goodsList.html">休闲零食</a></li>
							<li><a href="goodsList.html">冲调饮品</a></li>
							<li><a href="goodsList.html">粮油调味</a></li>
							<li><a href="goodsList.html">牛奶</a></li>
						</ul>
					</div><!--par-left par1-->
					<div class="par-left par2">
						<div class="par-left-top" style="margin-top:0">同类其他品牌</div>
						<ul style="height: 160px">
							<li><a href="goodsList.html">丹麦蓝罐(Kjeldsens)</a></li>
							<li><a href="goodsList.html">吃透透</a></li>
							<li><a href="goodsList.html">蜜兰诺(Milano)</a></li>
							<li><a href="goodsList.html">乐天(Lotte)</a></li>
							<li><a href="goodsList.html">皇冠</a></li>
							<li><a href="goodsList.html">Tipo</a></li>
							<li><a href="goodsList.html">美人鱼</a></li>
							<li><a href="goodsList.html">益口(IKO)</a></li>
							<li><a href="goodsList.html">向日葵(sunflower)</a></li>
							<li><a href="goodsList.html">非凡农庄(Pepperidge Farm)</a></li>
							<li><a href="goodsList.html">可拉奥</a></li>
							<li><a href="goodsList.html">百乐可(baiocco)</a></li>
							<li><a href="goodsList.html">诺滋客</a></li>
							<li><a href="goodsList.html">宏亚77</a></li>
							<li><a href="goodsList.html">自然素材</a></li>
							<li><a href="goodsList.html">皇族</a></li>
						</ul>
					</div><!--par-left par2-->
					<div class="par-left par3">
						<div class="par-left-top" >浏览了该商品的用户最终购买</div>
						<div class="photo-ex">
							<a href="goodsList.html"><img src="images/par1.png" alt="#" width="171" height="171" alt="商品图片"/></a>
							<div class="ex-left">
								<a href="goodsList.html" class="ex-name">商品名称￥</a>
								<span class="ex">
									商品简介要在二十字内商品简介要在二十字内
								</span>
							</div><!--ex-left-->
							<div class="ex-right">
								<span class="ex-price">￥19.9</span>
								<a class="collect" title="喜欢">
									<i class="icon-col"></i>
								</a>
							</div><!--ex-right-->
						</div><!--photo-ex-->
						<div class="photo-ex">
							<a href="goodsList.html"><img src="images/par1.png" alt="#" width="171" height="171" alt="商品图片"/></a>
							<div class="ex-left">
								<a href="goodsList.html" class="ex-name">商品名称￥</a>
								<span class="ex">
									商品简介要在二十字内商品简介要在二十字内
								</span>
							</div><!--ex-left-->
							<div class="ex-right">
								<span class="ex-price">￥19.9</span>
								<a class="collect" title="喜欢">
									<i class="icon-col"></i>
								</a>
							</div><!--ex-right-->
						</div><!--photo-ex-->
						<div class="photo-ex">
							<a href="goodsList.html"><img src="images/par1.png" alt="#" width="171" height="171" alt="商品图片"/></a>
							<div class="ex-left">
								<a href="goodsList.html" class="ex-name">商品名称￥</a>
								<span class="ex">
									商品简介要在二十字内商品简介要在二十字内
								</span>
							</div><!--ex-left-->
							<div class="ex-right">
								<span class="ex-price">￥19.9</span>
								<a class="collect" title="喜欢">
									<i class="icon-col"></i>
								</a>
							</div><!--ex-right-->
						</div><!--photo-ex-->
					</div><!--par-left par3-->
					<a href="#"><img src="images/ad.png" alt="" class="ad"/></a>
					<a href="#"><img src="images/ad.png" alt="" class="ad"/></a>
				</div><!--left-->
				<div class="right">
					<ul class="right-goodshop">
						<li><a href="goodsInfo.html">商品介绍</a></li>
						<li><a href="#">规格参数</a></li>
						<li><a href="#">包装清单</a></li>
						<li><a href="#">商品评价</a></li>
						<li><a href="#">售后保障</a></li>
					</ul>
					<div class="right-goods-appraisal">
						<div class="right-goodsadd">
							<span class="well"><span>98%</span><br />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;好评度</span>
							<ul>
								<li>好评(98%)
									<span class="no1 no"></span> 
									<span class="yes1 yes"></span>
								</li>
								<li>中评(2%)
									<span class="no2 no"></span> 
									<span class="yes2 yes"></span>
								</li>
								<li>差评(0%)
									<span class="no3 no"></span>
								</li>
							</ul>
						</div>
						<div class="right-goodsimpress">
							<div>&nbsp;买家印象</div>
							<ul>
								<li>口感不错(92)</li>
								<li>商品不错(87)</li>
								<li>口味不错(77)</li>
								<li>味道不错(74)</li>
								<li>特价买的(56)</li>
								<li>价格便宜(58)</li>
							</ul>
						</div>
					</div><!--right-goods-->
					<div class="right-assesstop">
						<ul>
							<li><a href="#">全部评价(292)</a></li>
							<li><a href="#">好评(286)</a></li>
							<li><a href="#">中评(5)</a></li>
							<li><a href="#">差评(1)</a></li>
						</ul>
					</div><!--right-assesstop-->
					<div class="right-assess">
						<ul>
							<li>
								<div class="ass-name">
									<img src="#" alt="" width="65" height="65" /><br />
									<a>木木珍珍</a><br />
									银牌会员 &nbsp;云南
								</div>
								<div class="ass-con">
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<input type="submit" class="ass-push" value="回复(0)">
									<input type="submit" class="ass-push" value="有用(3)">
									<br />
									标签：
										<span>口感不错(92)</span>
										<span>商品不错(87)</span>
										<span>口味不错(77)</span>
									 <br />
									 心得：卖家的服务太棒了，考虑非常周到，完全超出期望值价格优惠。店家包装到位，物流很快，一次愉快的购物经历！	<br />
									 购买日期：2014-6-20
								</div>
							</li>
							<li>
								<div class="ass-name">
									<img src="#" alt="" width="65" height="65" /><br />
									<a>木木珍珍</a><br />
									银牌会员 &nbsp;云南
								</div>
								<div class="ass-con">
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<input type="submit" class="ass-push" value="回复(0)">
									<input type="submit" class="ass-push" value="有用(3)">
									<br />
									标签：
										<span>口感不错(92)</span>
										<span>商品不错(87)</span>
										<span>口味不错(77)</span>
									 <br />
									 心得：卖家的服务太棒了，考虑非常周到，完全超出期望值价格优惠。店家包装到位，物流很快，一次愉快的购物经历！	<br />
									 购买日期：2014-6-20
								</div>
							</li>
							<li>
								<div class="ass-name">
									<img src="#" alt="" width="65" height="65" /><br />
									<a>木木珍珍</a><br />
									银牌会员 &nbsp;云南
								</div>
								<div class="ass-con">
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<input type="submit" class="ass-push" value="回复(0)">
									<input type="submit" class="ass-push" value="有用(3)">
									<br />
									标签：
										<span>口感不错(92)</span>
										<span>商品不错(87)</span>
										<span>口味不错(77)</span>
									 <br />
									 心得：卖家的服务太棒了，考虑非常周到，完全超出期望值价格优惠。店家包装到位，物流很快，一次愉快的购物经历！	<br />
									 购买日期：2014-6-20
								</div>
							</li>
							<li>
								<div class="ass-name">
									<img src="#" alt="" width="65" height="65" /><br />
									<a>木木珍珍</a><br />
									银牌会员 &nbsp;云南
								</div>
								<div class="ass-con">
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<input type="submit" class="ass-push" value="回复(0)">
									<input type="submit" class="ass-push" value="有用(3)"><br />
									标签：
										<span>口感不错(92)</span>
										<span>商品不错(87)</span>
										<span>口味不错(77)</span>
									 <br />
									 心得：卖家的服务太棒了，考虑非常周到，完全超出期望值价格优惠。店家包装到位，物流很快，一次愉快的购物经历！	<br />
									 购买日期：2014-6-20
								</div>
							</li>
							<li>
								<div class="ass-name">
									<img src="#" alt="" width="65" height="65" /><br />
									<a>木木珍珍</a><br />
									银牌会员 &nbsp;云南
								</div>
								<div class="ass-con">
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<input type="submit" class="ass-push" value="回复(0)">
									<input type="submit" class="ass-push" value="有用(3)"><br />
									标签：
										<span>口感不错(92)</span>
										<span>商品不错(87)</span>
										<span>口味不错(77)</span>
									 <br />
									 心得：卖家的服务太棒了，考虑非常周到，完全超出期望值价格优惠。店家包装到位，物流很快，一次愉快的购物经历！	<br />
									 购买日期：2014-6-20
								</div>
							</li>
							<li>
								<div class="ass-name">
									<img src="#" alt="" width="65" height="65" /><br />
									<a>木木珍珍</a><br />
									银牌会员 &nbsp;云南
								</div>
								<div class="ass-con">
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<input type="submit" class="ass-push" value="回复(0)">
									<input type="submit" class="ass-push" value="有用(3)"><br />
									标签：
										<span>口感不错(92)</span>
										<span>商品不错(87)</span>
										<span>口味不错(77)</span>
									 <br />
									 心得：卖家的服务太棒了，考虑非常周到，完全超出期望值价格优惠。店家包装到位，物流很快，一次愉快的购物经历！	<br />
									 购买日期：2014-6-20
								</div>
							</li>
							<li>
								<div class="ass-name">
									<img src="#" alt="" width="65" height="65" /><br />
									<a>木木珍珍</a><br />
									银牌会员 &nbsp;云南
								</div>
								<div class="ass-con">
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<input type="submit" class="ass-push" value="回复(0)">
									<input type="submit" class="ass-push" value="有用(3)"><br />
									标签：
										<span>口感不错(92)</span>
										<span>商品不错(87)</span>
										<span>口味不错(77)</span>
									 <br />
									 心得：卖家的服务太棒了，考虑非常周到，完全超出期望值价格优惠。店家包装到位，物流很快，一次愉快的购物经历！	<br />
									 购买日期：2014-6-20
								</div>
							</li>
							<li>
								<div class="ass-name">
									<img src="#" alt="" width="65" height="65" /><br />
									<a>木木珍珍</a><br />
									银牌会员 &nbsp;云南
								</div>
								<div class="ass-con">
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<input type="submit" class="ass-push" value="回复(0)">
									<input type="submit" class="ass-push" value="有用(3)"><br />
									标签：
										<span>口感不错(92)</span>
										<span>商品不错(87)</span>
										<span>口味不错(77)</span>
									 <br />
									 心得：卖家的服务太棒了，考虑非常周到，完全超出期望值价格优惠。店家包装到位，物流很快，一次愉快的购物经历！	<br />
									 购买日期：2014-6-20
								</div>
							</li>
							<li>
								<div class="ass-name">
									<img src="#" alt="" width="65" height="65" /><br />
									<a>木木珍珍</a><br />
									银牌会员 &nbsp;云南
								</div>
								<div class="ass-con">
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<input type="submit" class="ass-push" value="回复(0)">
									<input type="submit" class="ass-push" value="有用(3)"><br />
									标签：
										<span>口感不错(92)</span>
										<span>商品不错(87)</span>
										<span>口味不错(77)</span>
									 <br />
									 心得：卖家的服务太棒了，考虑非常周到，完全超出期望值价格优惠。店家包装到位，物流很快，一次愉快的购物经历！	<br />
									 购买日期：2014-6-20
								</div>
							</li>
							<li>
								<div class="ass-name">
									<img src="#" alt="" width="65" height="65" /><br />
									<a>木木珍珍</a><br />
									银牌会员 &nbsp;云南
								</div>
								<div class="ass-con">
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<i class="icon-ass icon-con"></i>
									<input type="submit" class="ass-push" value="回复(0)">
									<input type="submit" class="ass-push" value="有用(3)"><br />
									标签：
										<span>口感不错(92)</span>
										<span>商品不错(87)</span>
										<span>口味不错(77)</span>
									 <br />
									 心得：卖家的服务太棒了，考虑非常周到，完全超出期望值价格优惠。店家包装到位，物流很快，一次愉快的购物经历！	<br />
									 购买日期：2014-6-20
								</div>
							</li>
						</ul>
					</div><!--right-assess-->
				</div><!--right-->
			</div><!--particular-->
			<div class="guess-top">根据浏览猜你喜欢</div>
			<ul class="guess">
				<li>
					<a href="goodsInfo.html"><img src="images/guess.png"  alt="" /></a> 
					<div class="ex-left">
						<a href="goodsInfo.html" class="ex-name">商品名称￥</a>
						<span class="ex">
							商品简介要在二十字内商品简介要在二十字内
						</span>
					</div><!--ex-left-->
					<div class="ex-right">
						<span class="ex-price">￥19.9</span>
						<a class="collect" title="喜欢">
							<i class="icon-col"></i>
						</a>
					</div><!--ex-right-->
				</li>
				<li>
					<a href="goodsInfo.html"><img src="images/guess.png"  alt="" /></a> 
					<div class="ex-left">
						<a href="goodsInfo.html" class="ex-name">商品名称￥</a>
						<span class="ex">
							商品简介要在二十字内商品简介要在二十字内
						</span>
					</div><!--ex-left-->
					<div class="ex-right">
						<span class="ex-price">￥19.9</span>
						<a class="collect" title="喜欢">
							<i class="icon-col"></i>
						</a>
					</div><!--ex-right-->
				</li>
				<li>
					<a href="goodsInfo.html"><img src="images/guess.png"  alt="" /></a> 
					<div class="ex-left">
						<a href="goodsInfo.html" class="ex-name">商品名称￥</a>
						<span class="ex">
							商品简介要在二十字内商品简介要在二十字内
						</span>
					</div><!--ex-left-->
					<div class="ex-right">
						<span class="ex-price">￥19.9</span>
						<a class="collect" title="喜欢">
							<i class="icon-col"></i>
						</a>
					</div><!--ex-right-->
				</li>
				<li>
					<a href="goodsInfo.html"><img src="images/guess.png"  alt="" /></a> 
					<div class="ex-left">
						<a href="goodsInfo.html" class="ex-name">商品名称￥</a>
						<span class="ex">
							商品简介要在二十字内商品简介要在二十字内
						</span>
					</div><!--ex-left-->
					<div class="ex-right">
						<span class="ex-price">￥19.9</span>
						<a class="collect" title="喜欢">
							<i class="icon-col"></i>
						</a>
					</div><!--ex-right-->
				</li>
				<li>
					<a href="goodsInfo.html"><img src="images/guess.png"  alt="" /></a> 
					<div class="ex-left">
						<a href="goodsInfo.html" class="ex-name">商品名称￥</a>
						<span class="ex">
							商品简介要在二十字内商品简介要在二十字内
						</span>
					</div><!--ex-left-->
					<div class="ex-right">
						<span class="ex-price">￥19.9</span>
						<a class="collect" title="喜欢">
							<i class="icon-col"></i>
						</a>
					</div><!--ex-right-->
				</li>
			</ul><!--guess-->
			


		</div><!--center-->
	</div><!--myhome-->
	<jsp:directive.include file="bottom.jsp"/>
</body>
</html>