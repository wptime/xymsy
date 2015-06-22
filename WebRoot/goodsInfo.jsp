<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>"/>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>msy商品详细页</title>
	<link rel="stylesheet" type="text/css" href="css/model.css" />
	<link rel="stylesheet" type="text/css" href="css/goodsinfo.css" />
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
		function submitForm(){
			//var form = document.getElementsByName("form1");
			//form.action = "main/createOrder";
			//form.submit();
			document.getElementById("form1").submit();
		}
	</script>
</head>
<body>
	<jsp:directive.include file="top.jsp"/>
	
	<div id="myhome">
		
		<div class="center">
			<div class="category">
				<ul>
					<li ><a href="goodsList.jsp" target="_blank">所有宝贝</a></li>
					<li><a href="#">跳蚕市场</a></li>
					<li><a href="index.jsp#here">今日推荐</a></li>
				</ul>
			</div><!--category-->
			<div class="goods">
				<div class="goods-img">
					<img id="img-icon" src=""/>
					<div class="goods-images">
						<p class="imgs-block"><i class="icon-img1 icon-con"></i></p>
						<ul style="float:left;" >
							<s:if test="recommendGoodsPicture==null">
								<li href="#"><img src="images/goods.png" alt="" id="icon"></img></li>
								<li href="#"><img src="images/goods1.png" alt=""  class="icon"></img></li>
								<li href="#"><img src="images/goods2.png" alt=""  class="icon"></img></li>
								<li href="#"><img src="images/goods3.png" alt=""  class="icon"></img></li>
								<li href="#"><img src="images/goods4.png" alt=""  class="icon"></img></li> 
							</s:if>
							<s:else>
								<s:iterator value="recommendGoodsPicture" id="r">
									<li href="#"><img src="<s:property value='#r'/>" class="icon"/></li>
								</s:iterator>
							</s:else>
						</ul>
						<p class="imgs-block"><i class="icon-img2 icon-con"></i></p>
					</div>
				</div>
				<div class="goods-name">
					<s:property value="#session.goodsInfo.gdGoodsname"/>
				</div>
				<div class="price">
					价&nbsp&nbsp&nbsp格&nbsp&nbsp&nbsp<span class="yellow"><s:property value="#session.goodsInfo.gdPrice"/></span>
					<span class="add">
						<span class="add-ex">
							<span class="add1"><s:property value="#session.goodsInfo.gdSaled"/></span>
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
						<li>店铺：<s:property value="#request.store.stStorename"/></li>
						<li>信誉：
							<i class="icon-news1 icon-con"></i>
							<i class="icon-news1 icon-con"></i>
							<i class="icon-news1 icon-con"></i>
						</li>
						<li>掌柜：<s:property value="#request.store.user.usUsername"/></li>
						<li>联系：<a href="#"><i class="icon-news2 icon-con"></i></a>
						</li>
						<li>认证：
							<s:if test="#request.store.stStorestatus==0">
								审核中...
							</s:if>
							<s:elseif test="#request.store.stStorestatus==2">
								审核通过！
							</s:elseif>
						</li>
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
					<s:if test="#request.store.stStoreid!=null">
						<a href="main/enterStore?storeId=<s:property value='#request.store.stStoreid'/>"><input type="button" class="news-in" value="进入店铺"></a>
					</s:if>
					<s:else>
						<input type="button" class="news-in" value="进入店铺">
					</s:else>
					<input type="submit" class="news-in" value="收藏店铺">
				</div>
				<form class="num" id="form1" name="from1" action="main/createOrder">
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
					<!-- <input type="submit" class="buy-1" value="立即购买"> -->
				</form>
				<div class="buy">
					<a onclick="submitForm()"><input type="submit" class="buy-1" value="立即购买"></a>
					<input type="submit" class="buy-2" value="加入购物车">
				</div>
				
			</div><!--goods-->
			<div class="particular">
				<div class="left">
					<div class="par-left par1">
						<div class="par-left-top">相关分类</div>
						<ul style="height: 57px">
							<li><a href="goodsList.jsp" target="_blank">糖果/巧克力</a></li>
							<li><a href="goodsList.jsp" target="_blank">休闲零食</a></li>
							<li><a href="goodsList.jsp" target="_blank">冲调饮品</a></li>
							<li><a href="goodsList.jsp" target="_blank">粮油调味</a></li>
							<li><a href="goodsList.jsp" target="_blank">牛奶</a></li>
						</ul>
					</div><!--par-left par1-->
					<div class="par-left par2">
						<div class="par-left-top" style="margin-top:0">同类其他品牌</div>
						<ul style="height: 160px">
							<li><a href="goodsList.jsp" target="_blank">丹麦蓝罐(Kjeldsens)</a></li>
							<li><a href="goodsList.jsp" target="_blank">吃透透</a></li>
							<li><a href="goodsList.jsp" target="_blank">蜜兰诺(Milano)</a></li>
							<li><a href="goodsList.jsp" target="_blank">乐天(Lotte)</a></li>
							<li><a href="goodsList.jsp" target="_blank">皇冠</a></li>
							<li><a href="goodsList.jsp" target="_blank">Tipo</a></li>
							<li><a href="goodsList.jsp" target="_blank">美人鱼</a></li>
							<li><a href="goodsList.jsp" target="_blank">益口(IKO)</a></li>
							<li><a href="goodsList.jsp" target="_blank">向日葵(sunflower)</a></li>
							<li><a href="goodsList.jsp" target="_blank">非凡农庄(Pepperidge Farm)</a></li>
							<li><a href="goodsList.jsp" target="_blank">可拉奥</a></li>
							<li><a href="goodsList.jsp" target="_blank">百乐可(baiocco)</a></li>
							<li><a href="goodsList.jsp" target="_blank">诺滋客</a></li>
							<li><a href="goodsList.jsp" target="_blank">宏亚77</a></li>
							<li><a href="goodsList.jsp" target="_blank">自然素材</a></li>
							<li><a href="goodsList.jsp" target="_blank">皇族</a></li>
						</ul>
					</div><!--par-left par2-->
					<div class="par-left par3">
						<div class="par-left-top" >浏览了该商品的用户最终购买</div>
						<div class="photo-ex">
							<a href="goodsInfo.jsp" target="_blank"><img src="images/par1.png" alt="#" width="171" height="171" alt="商品图片"/></a>
							<div class="ex-left">
								<a href="goodsInfo.jsp" target="_blank" class="ex-name">商品名称￥</a>
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
							<a href="goodsInfo.jsp" target="_blank"><img src="images/par1.png" alt="#" width="171" height="171" alt="商品图片"/></a>
							<div class="ex-left">
								<a href="goodsInfo.jsp" target="_blank" class="ex-name">商品名称￥</a>
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
							<a href="goodsInfo.jsp" target="_blank"><img src="images/par1.png" alt="#" width="171" height="171" alt="商品图片"/></a>
							<div class="ex-left">
								<a href="goodsInfo.jsp" target="_blank" class="ex-name">商品名称￥</a>
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
						<li><a href="#">商品介绍</a></li>
						<li><a href="#">规格参数</a></li>
						<li><a href="#">包装清单</a></li>
						<li><a href="goodsReply.jsp">商品评价</a></li>
						<li><a href="#">售后保障</a></li>
					</ul>
					<ul class="right-goods">
						<%-- <li>商品名称：<s:property value="#session.goodsInfo.gdGoodsname"/></li> --%>
						<li>商品编号：<s:property value="#session.goodsInfo.gdGoodsid"/></li>
						<li>类型：曲奇</li>	
						<%--<li>店铺：<s:property value="#session.goodsInfo.store.stStorename"/></li> --%>
						<li>上架时间：<s:property value="#session.goodsInfo.gdSaletime"/></li>
						<!-- <li>商品毛重：75.00g</li>
						<li>商品产地：荷兰</li>
						<li>包装：盒装</li>
						<li>口味：其他</li> -->
							 
						<li>商品简介：<s:property value="#session.goodsInfo.gdBrief"/></li>	
					</ul>
					<br/><br/><br/><br/><br/>
					<div class="infos">
						<ul class="right-goodshop"> <li><a href="#">商品详细信息</a></li></ul>
						<div class="right-goods">
						<s:property value="#session.goodsInfo.gdInfo"/><br /><br />
						马上有向您保证所售商品均为正品行货，京东自营商品开具机打发票或电子发票。凭质保证书及京东发票，可享受全国联保服务(奢侈品、钟表除外；奢侈品、钟表由马上有联系保修，享受法定三包售后服务)，与您亲临商场选购的商品享受相同的质量保证。马上有还为您提供具有竞争力的商品价格和运费政策，请您放心购买！<br /><br />
						注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商场没有及时更新，请大家谅解！
					马上有向您保证所售商品均为正品行货，京东自营商品开具机打发票或电子发票。凭质保证书及京东发票，可享受全国联保服务(奢侈品、钟表除外；奢侈品、钟表由马上有联系保修，享受法定三包售后服务)，与您亲临商场选购的商品享受相同的质量保证。马上有还为您提供具有竞争力的商品价格和运费政策，请您放心购买！<br /><br />
						注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商场没有及时更新，请大家谅解！
					马上有向您保证所售商品均为正品行货，京东自营商品开具机打发票或电子发票。凭质保证书及京东发票，可享受全国联保服务(奢侈品、钟表除外；奢侈品、钟表由马上有联系保修，享受法定三包售后服务)，与您亲临商场选购的商品享受相同的质量保证。马上有还为您提供具有竞争力的商品价格和运费政策，请您放心购买！<br /><br />
						注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商场没有及时更新，请大家谅解！
					马上有向您保证所售商品均为正品行货，京东自营商品开具机打发票或电子发票。凭质保证书及京东发票，可享受全国联保服务(奢侈品、钟表除外；奢侈品、钟表由马上有联系保修，享受法定三包售后服务)，与您亲临商场选购的商品享受相同的质量保证。马上有还为您提供具有竞争力的商品价格和运费政策，请您放心购买！<br /><br />
						注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商场没有及时更新，请大家谅解！
					马上有向您保证所售商品均为正品行货，京东自营商品开具机打发票或电子发票。凭质保证书及京东发票，可享受全国联保服务(奢侈品、钟表除外；奢侈品、钟表由马上有联系保修，享受法定三包售后服务)，与您亲临商场选购的商品享受相同的质量保证。马上有还为您提供具有竞争力的商品价格和运费政策，请您放心购买！<br /><br />
						注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商场没有及时更新，请大家谅解！
					
						<!-- 商品详细信息： --><s:property value="#session.goodsInfo.gdInfo" escape="false"/>
						</div>
					</div>
					<!-- <img src="images/1.png" alt="" />
					<img src="images/2.png" alt="" />
					<img src="images/3.png" alt="" /> -->
					
					<!--  <div class="right-help">
						服务承诺：<br />
						马上有向您保证所售商品均为正品行货，京东自营商品开具机打发票或电子发票。凭质保证书及京东发票，可享受全国联保服务(奢侈品、钟表除外；奢侈品、钟表由马上有联系保修，享受法定三包售后服务)，与您亲临商场选购的商品享受相同的质量保证。马上有还为您提供具有竞争力的商品价格和运费政策，请您放心购买！<br /><br />
						注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商场没有及时更新，请大家谅解！
					</div>  -->
					
					<div class="clear"style="clear: both;  height: 60px;"></div>
					<ul class="right-asstop">
						<li><a href="#">全部评价(0)</a></li>
						<li><a href="#">好评(0)</a></li>
						<li><a href="#">中评(0)</a></li>
						<li><a href="#">差评(0)</a></li>
					</ul>
					<div class="right-ass">
						<span>暂无商品评价！争抢产品评价前5名，前5位评价用户可获得精美礼品哦！</span> <br />
						只有购买过该商品的用户才能进行评价。
					</div><!--right-ass-->
				</div><!--right-->
			</div><!--particular-->
			<div class="guess-top">根据浏览猜你喜欢</div>
			<ul class="guess">
				<li>
					<a href="" target="_blank"><img src="images/guess.png"  alt="" /></a> 
					<div class="ex-left">
						<a href="" target="_blank" class="ex-name">商品名称￥</a>
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
					<a href="" target="_blank"><img src="images/guess.png"  alt="" /></a> 
					<div class="ex-left">
						<a href="" target="_blank" class="ex-name">商品名称￥</a>
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
					<a href="" target="_blank"><img src="images/guess.png"  alt="" /></a> 
					<div class="ex-left">
						<a href="" target="_blank" class="ex-name">商品名称￥</a>
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
					<a href="" target="_blank"><img src="images/guess.png"  alt="" /></a> 
					<div class="ex-left">
						<a href="" target="_blank" class="ex-name">商品名称￥</a>
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
					<a href="" target="_blank"><img src="images/guess.png"  alt="" /></a> 
					<div class="ex-left">
						<a href="" target="_blank" class="ex-name">商品名称￥</a>
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
	
	<script type="text/javascript" src="js/jQuery-Msy.js"></script>
	<script type="text/javascript" src="js/goodsinfo.js"></script>
</body>
</html>