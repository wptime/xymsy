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
	<title>商品浏览页</title>
	<link rel="stylesheet" type="text/css" href="css/goodslist.css">
	<link rel="stylesheet" type="text/css" href="css/model.css">
	
	<script language="JavaScript" type="text/javascript">
	//异步请求，分页
	
	var xmlHttp;
	function createXMLHttp() {
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	
	function getGoodsList(pageNum,size,totalNum,totalPage) {
		createXMLHttp();
		xmlHttp.open("GET", "main/getGoodsList?pageNum="+pageNum+"&size="+size+"&totalNum="+totalNum+"&totalPage="+totalPage);
		xmlHttp.onreadystatechange = getListCallback;
		xmlHttp.send(null);

	}
	function getListCallback() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
			//alert("请求成功");
				//	var text = xmlHttp.responseText ;
				var text = eval("(" + xmlHttp.responseText + ")");
				//show(text.list, "goods");
				/*  alert(text.list);
				alert(text.pageNum);
				alert(text.size);
				alert(text.totalPage);
				alert(text.totalNum);  */
				show(text.list, "goodslist", text.pageNum, text.size,  text.totalNum, text.totalPage);
				//show(text.list, "new_tr");
			}
		}
	}

	function show(list, e_id, pageNum, size, totalNum, totalPage) {

		var maindiv = document.getElementById(e_id);
		maindiv.className="photoshow";
		//alert("1");
		maindiv.innerHTML = "";
		//alert("2");
		
		var total = size;//每页显示数据量
		if(pageNum*size > totalNum)
		{
			total = totalNum%size;
		}
		var i;
		for(i = 0; i < total; i++) {
			var div1 = document.createElement("div");	
			div1.className="photoshow-ex";
					var a1 = document.createElement("a");
					a1.innerHTML = "";
					a1.href = "main/getInfo?goodsId=" + list[i].gdGoodsid;
				/* 	if(true)
					{
						a1.innerHTML= "<img src='images/picture-example.png' alt='#' width='182' height='182'>";
					}
					else
					{ */
					//alert(list[i].gdPicture.indexOf("#",1));
						a1.innerHTML= "<img src='" + list[i].gdPicture.substring(1,list[i].gdPicture.indexOf("#",1)) + "' alt='#' width='182' height='182'>";
					//}
				div1.appendChild(a1);
			div2 = document.createElement("div");
			div2.className = "simple-left";
				var a2 = document.createElement("a");
				a2.href = "main/getInfo?goodsId=" + list[i].gdGoodsid;
				a2.innerHTML = list[i].gdGoodsname;
			div2.appendChild(a2);
			div1.appendChild(div2);
			
			var div3 = document.createElement("div");
			div3.className = "simple-right";
				var span1 = document.createElement("span");
				span1.className="price";
				//alert(list[i].gdPrice);
				span1.innerHTML = "￥" + list[i].gdPrice;
			div3.appendChild(span1);
			div1.appendChild(div3);
			
			maindiv.appendChild(div1);
		}
		
		var page = document.getElementById("page");
		page.innerHTML = "";
		if(pageNum > 1)
		{
			var a = document.createElement("button");
			a.className = "form1";
			a.innerHTML = "&lt上一页";
			a.onclick = function(){getGoodsList(pageNum-1,size,totalNum,totalPage);};
			page.appendChild(a);
		}
		
		var b = document.createElement("a");
		b.innerHTML = "第"+pageNum+"/"+totalPage+"页";
		page.appendChild(b);
		
		//alert(pageNum*size + "   " + totalNum);
		
		if(pageNum*size < totalNum )
		{
			var c = document.createElement("button");
			c.className = "form1";
			c.innerHTML = "下一页&gt";
			c.onclick = function(){getGoodsList(pageNum+1,size,totalNum,totalPage);};
			page.appendChild(c);
		}
	}
	
	</script>
	<script type="text/javascript">
		function nextPage(num)//下一页
		{
			//alert(num);
			var url="main/index?size=16&pageNum=" + (num+1) + "&keyWord=" + <%=request.getAttribute("keyWord") %>;
			window.location.href = url;
		}
		
		function lastPage(num)//上一页
		{
			//alert(num);
			if(num <= 1)
			num=2;
			var url="main/index?size=16&pageNum=" + (num-1) + "&keyWord=" + <%=request.getAttribute("keyWord") %>;
			window.location.href = url;
		}
		
		function setPage(num)
		{
			var url="main/index?size=16&pageNum=" + num + "&keyWord=" + <%=request.getAttribute("keyWord") %>;
			window.location.href = url;
		}
	</script>
</head>
<body onload="getGoodsList(1,16,-1,-1);">
<!-- <button onclick="getGoodsList(1,5,-1,-1)">每页5个测试</button> -->
	<jsp:directive.include file="top.jsp"/>
	当前关键字：<hidden name="oldKeyWord"><s:property value="keyWord"/></hidden>
	<div id="warpper">
			
			<div id="left">
			<div class="left2">
				<div id="allba">
					<ul >
						<li><a href="main/index">所有宝贝</a></li>
						<li><a href="">跳蚤市场</a></li>
						<li><a href="index.jsp#here">今日推荐</a></li>
					</ul>
				</div>
				<p id="sper">
					所有分类&gt
					<span>共123456个宝贝<input type="submit" value="" class="vv"></span>
				</p>
				<div id="sper1">
						<div id="selecthot" class="lef">
					<p>选购热点：</p>
					<span><a href="">商务出差</a></span>
					<span><a href="">柳丁</a></span>
					<span><a href="">邮差包</a></span>
					<span><a href="">明星杂志</a></span>
					<span><a href="">小流苏</a></span>
					<span><a href="">水桶包</a></span>
					<span><a href="">真皮钱包</a></span>
					<span><a href="">专柜新款</a></span>
					<span class="more3"></span>
					<span class="more1">更多</span>
					
				</div>
				<div id="material" class="lef">
					<p>材质：</p>
					<span><a href="">牛皮</a></span>
					<span><a href="">PU</a></span>
					<span><a href="">帆布</a></span>
					<span><a href="">锦纶</a></span>
					<span><a href="">PVC</a></span>
					<span><a href="">羊皮</a></span>
					<span><a href="">草</a></span>
					<span><a href="">麻</a></span>
					<span class="more3"></span>
					<span class="more1">更多</span>
					
				
				</div>
				<div id="brand1" class="lef">
					<p>品牌：</p>
					<span><a href="">COACH/蔻驰</a></span>
					<span><a href="">欧时力</a></span>
					<span><a href="">北包包</a></span>
					<span><a href="">Prada</a></span>
					<span><a href="">AXIXI/花心小铺</a></span>
					<span class="more3"></span>
					<span class="more1">更多</span>
					
				
				</div>
				<div id="brand2" class="lef">
					<p>品牌</p>
					<span><a href="">COACH/蔻驰</a></span>
					<span><a href="">欧时力</a></span>
					<span><a href="">北包包</a></span>
					<span><a href="">Prada</a></span>
					<span><a href="">AXIXI/花心小铺</a></span>
					<span class="more3"></span>
					<span class="more1">更多</span>
					
				
				</div>
				</div>
				<div id="want" class="lef">
					<p>您是不是想找：</p >
					<span><a href="">女士包包</a></span>
					<span><a href="">小包</a></span>
					<span><a href="">零钱包</a></span>
					<span><a href="">旅行包</a></span>
					<span><a href="">男士包</a></span>
					<span><a href="">手拿包</a></span>
					<span><a href="">透明包包</a></span>
					<span><a href="">化妆包</a></span>
					<span><a href="">妈咪包</a></span>
					<span class="more3"></span>
					<span class="more1">更多</span>	
				</div>
			</div>
			<div class="left3">

				<div class="left31">
					<ul style="height: 35px;">
						<li id="left33"><a class="left33-a1" style="display:none">综合</a>
							<div class="paixu">综合排序</div>
						</li>
						<li class="people"><a class="left33-a2">人气</a>
							<div class="paixu1">人气从高到底</div>
						</li>
						<li class="sell"><a href="main/index?saled=true" class="left33-a3">销量</a>
							<div class="paixu2">销量从高到底</div>
						</li>
						<li class="price-t"><a >价格</a>
							<div class="price-paixu">
								<ul>
									<li><a href="main/index?price=false">价格从高到底</a></li>
									<li><a href="main/index?price=true">价格从低到高</a></li>
									<!-- 
									<li><a href="">总价从高到底</a></li>
									<li><a href="">总价从低到高</a></li> -->
								</ul>
							</div>
							<span class="price1"></span>
						</li>


				
				<div id="pricediv" class="pricediv">
					<form action="main/index" method="post">
						<span class="topleft32" >
							<input type="text" name="left" placeholder="￥" class="left32" id="left32">
							<span class="xian">-</span>
							<input type="text" name="right" placeholder="￥" class="left32" >
						</span>
						<span id="yes33">
							<input type="submit" value="确定"/>
							<!-- <a href="">确定</a> -->
						</span>
					</form>
				</div>
						<li class="fa"><a >发货地</a>
							<div class="place">
								<div class="place1">
									<p class="pp11">
										<span><a href="">北京</a></span>
										<span><a href="">上海</a></span>
										<span><a href="">深圳</a></span>
										<span><a href="">杭州</a></span>
										<span><a href="">广州</a></span>
										<span><a href="">海外</a></span>
									</p>
									<p class="pp12">
										<span><a href="">江浙泸</a></span>
										<span><a href="">珠三角</a></span>
										<span><a href="">京津冀</a></span>
										<span><a href="">东三省</a></span>
										<span><a href="">港澳台</a></span>
										<span><a href="">江浙沪</a></span>
									</p>
								</div>
								<div class="place2">
									<p class="pp21">
										<span><a href="">长沙</a></span>
										<span><a href="">长春</a></span>
										<span><a href="">成都</a></span>
										<span><a href="">重庆</a></span>
										<span><a href="">大连</a></span>
										<span><a href="">东莞</a></span>
										<span><a href="">佛山</a></span>
										<span><a href="">福州</a></span>
									</p>
									<p class="pp22">
										<span><a href="">长沙</a></span>
										<span><a href="">长春</a></span>
										<span><a href="">成都</a></span>
										<span><a href="">重庆</a></span>
										<span><a href="">大连</a></span>
										<span><a href="">东莞</a></span>
										<span><a href="">佛山</a></span>
										<span><a href="">福州</a></span>
									</p>
									<p class="pp23">
										<span><a href="">长沙</a></span>
										<span><a href="">长春</a></span>
										<span><a href="">成都</a></span>
										<span><a href="">重庆</a></span>
										<span><a href="">大连</a></span>
										<span><a href="">东莞</a></span>
										<span><a href="">佛山</a></span>
										<span><a href="">福州</a></span>
									</p>
									<p class="pp24">
										<span><a href="">长沙</a></span>
										<span><a href="">长春</a></span>
										<span><a href="">成都</a></span>
										<span><a href="">重庆</a></span>
										<span><a href="">大连</a></span>
										<span><a href="">东莞</a></span>
										<span><a href="">佛山</a></span>
										<span><a href="">福州</a></span>
									</p>
								</div>
								<div class="place3">
									<p class="pp21">
										<span><a href="">长沙</a></span>
										<span><a href="">长春</a></span>
										<span><a href="">成都</a></span>
										<span><a href="">重庆</a></span>
										<span><a href="">大连</a></span>
										<span><a href="">东莞</a></span>
										<span><a href="">佛山</a></span>
										<span><a href="">福州</a></span>
									</p>
									<p class="pp22">
										<span><a href="">长沙</a></span>
										<span><a href="">长春</a></span>
										<span><a href="">成都</a></span>
										<span><a href="">重庆</a></span>
										<span><a href="">大连</a></span>
										<span><a href="">东莞</a></span>
										<span><a href="">佛山</a></span>
										<span><a href="">福州</a></span>
									</p>
									<p class="pp23">
										<span><a href="">长沙</a></span>
										<span><a href="">长春</a></span>
										<span><a href="">成都</a></span>
										<span><a href="">重庆</a></span>
										<span><a href="">大连</a></span>
										<span><a href="">东莞</a></span>
										<span><a href="">佛山</a></span>
										<span><a href="">福州</a></span>
									</p>
									<p class="pp24">
										<span><a href="">长沙</a></span>
										<span><a href="">长春</a></span>
										<span><a href="">成都</a></span>
										<span><a href="">重庆</a></span>
										<span><a href="">大连</a></span>
										<span><a href="">东莞</a></span>
										<span><a href="">佛山</a></span>
										<span><a href="">福州</a></span>
									</p>
								</div>
								<div class="place4">
									<input type="text" placeholder=" 多个地区逗号隔开" class="place-sub"><input type="submit" class="place-sub1">
								</div>
								
							</div>
						</li>
						<span class="fd"></span>
						<span class="zuo">&lt</span>
						<span class="yi">1</span> 
						<span class="yb">/100</span>
						<span class="you">&gt</span>      
					</ul>
				</div>
				<div class="left34">
					<ul>
						<li><input type="checkbox"><span>包邮</span></li>
						<li><input type="checkbox"><span>天猫</span></li>
						<li><input type="checkbox"><span>海外商品</span></li>
						<li><input type="checkbox"><span>二手</span></li>
						<li><input type="checkbox"><span>正品保障</span></li>
						<li><input type="checkbox"><span>24小时发货</span></li>
						<li><input type="checkbox"><span>7+天内退货</span></li>
						<span class="left35">更多</span>
						<span class="more35"></span>
						<span class="left36">
							<input type="submit" value="合并同款宝贝">
						</span>
					</ul>

				</div>
				<div class="float34 left34" >
					<ul >
						<li><input type="checkbox"><span>货到付款</span></li>
						<li><input type="checkbox"><span>旺旺在线</span></li>
						<li><input type="checkbox"><span>信用卡支付</span></li>
					</ul>

				</div>

				<div id="goodslista"><!-- 验证异步请求去掉a -->
				</div>
				<div id="pagea"><!-- 验证异步请求去掉a -->
				</div>
				
				<div class="photoshow">
					<s:iterator value="recommendSGoodsList" id="r">
						<div class="photoshow-ex">
							<a href="main/getInfo?goodsId=<s:property value="#r.gdGoodsid"/>" target="_blank"><img src=<s:property value="#r.gdPicture.substring(1,#r.gdPicture.indexOf('#',1))"/> alt="#" width="182" height="182"></a>
							<div class="simple-left">
								<a href="main/getInfo?goodsId=<s:property value="#r.gdGoodsid"/>" target="_blank" class="big"><s:property value="#r.gdGoodsname"/></a>
								<span class="small"><s:property value="#r.gdBrief"/></span>
							</div>
							<div class="simple-right">
								<span class="price">￥<s:property value="#r.gdPrice"/></span>
								<a class="collect" title="喜欢"><i class="icon-col"></i></a>
							</div>
						</div>
					</s:iterator>
				</div>

			<form action="" class="for"><!-- 
			<h1><s:property value="#request.pageMsg.hasLastPage"/></h1>
			<h1><s:property value="#request.pageMsg.hasNextPage"/></h1> -->
			<s:if test="#request.pageMsg.hasLastPage">
				<a href="main/index?size=16&keyWord=<s:property value='keyWord'/>&pageNum=<s:property value='%{pageMsg.pageNum-1}'/>"><input  type="button" value="&lt上一页" class="form1">
			</s:if>
			
				<%--  <%for(int i = 1;i <= %><s:property value="pageMsg.pageTotal"/><%; i++){%>
				<input type="button" value="<%=i%>" class="form2">
				<%} %>  --%>
				
				<s:bean name="org.apache.struts2.util.Counter" id="counter">
			     <s:param name="first" value="1" />
			     <s:param name="last" value="%{pageMsg.pageNum-1}" />
			     <s:iterator>
				     <a href="main/index?size=16&keyWord=<s:property value='keyWord'/>&pageNum=<s:property/>"><s:property/></a>
			     </s:iterator>
			     [<s:property value="#request.pageMsg.pageNum"/>]
			     <s:param name="first" value="%{pageMsg.pageNum+1}" />
			     <s:param name="last" value="%{pageMsg.pageTotal}" />
			     <s:iterator>
				     <a href="main/index?size=16&keyWord=<s:property value='keyWord'/>&pageNum=<s:property/>"><s:property/></a>
			     </s:iterator>
			    </s:bean>
				<span id="dian">&#8230</span>
				
			<s:if test="#request.pageMsg.hasNextPage">
				<!-- <a href="main/index?size=15&pageNum=1">下一页</a> -->
				
				<a href="main/index?size=16&keyWord=<s:property value='keyWord'/>&pageNum=<s:property value='%{pageMsg.pageNum+1}'/>"><input  type="button" value="下一页&gt" class="form1"></a>
			</s:if>
				<span >共<s:property value="pageMsg.pageTotal"/>页</span>
				<span id="1">
					去第 
					<input id="go2"type="text" class="form3"> 
					<span id="go3" >
						<a >确定</a>
						<lable id="go3-lable" >页</lable>
					</span>
				</span>
			</form>
			</div>
		</div>
		<div id="right">
			<div class="hot">
				<h5>掌柜热卖</h5>
				<div class="photoshow-ex right-ps">
						<a href="goodsInfo.jsp" target="_blank"><img src="images/picture-example.png" alt="#" width="185" height="185" alt="商品图片"/></a>
						<div class="simple-left">
							<a href="goodsInfo.jsp" target="_blank" class="big">1商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect"><i class="icon-col"></i></a>
						</div>
					</div>
				<div class="photoshow-ex right-ps" >
						<a href="goodsInfo.jsp" target="_blank"><img src="images/picture-example.png" alt="#" width="185" height="185" alt="商品图片"/></a>
						<div class="simple-left">
							<a href="goodsInfo.jsp" target="_blank" class="big">1商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect"><i class="icon-col"></i></a>
						</div>
					</div>
				<div class="photoshow-ex right-ps">
						<a href="goodsInfo.jsp" target="_blank"><img src="images/picture-example.png" alt="#" width="185" height="185" alt="商品图片"/></a>
						<div class="simple-left">
							<a href="goodsInfo.jsp" target="_blank" class="big">1商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect"><i class="icon-col"></i></a>
						</div>
					</div>
			</div>
			<div class="boutique" >
				<h5>店家精选</h5>
				<div class="photoshow-ex right-ps">
						<a href="goodsInfo.jsp" target="_blank"><img src="images/picture-example.png" alt="#" width="185" height="185" alt="商品图片"/></a>
						<div class="simple-left">
							<a href="goodsInfo.jsp" target="_blank" class="big">1商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect"><i class="icon-col"></i></a>
						</div>
					</div>
				<div class="photoshow-ex right-ps">
						<a href="goodsInfo.jsp" target="_blank"><img src="images/picture-example.png" alt="#" width="185" height="185" alt="商品图片"/></a>
						<div class="simple-left">
							<a href="goodsInfo.jsp" target="_blank" class="big">1商品名称￥</a>
							<span class="small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect"><i class="icon-col"></i></a>
						</div>
					</div>
			</div>
		</div>
		<div id="down">
			<div class="down1"><h4>掌柜热卖<span>我也要出现在这里</span></h4></div>
			<div class="zhot">
				<div class="photoshow-ex down-ps">
						<a href="goodsInfo.jsp" target="_blank"><img src="images/shop11.png" alt="#" width="185" height="185" alt="商品图片"/></a>
						<div class="simple-left">
							<a href="goodsInfo.jsp" target="_blank" class="big">1商品名称￥</a>
							<span class="small down-small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect"><i class="icon-col"></i></a>
						</div>
					</div>
				<div class="photoshow-ex down-ps">
						<a href="goodsInfo.jsp" target="_blank"><img src="images/shop11.png" alt="#" width="185" height="185" alt="商品图片"/></a>
						<div class="simple-left">
							<a href="goodsInfo.jsp" target="_blank" class="big">1商品名称￥</a>
							<span class="small down-small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect"><i class="icon-col"></i></a>
						</div>
					</div>
				<div class="photoshow-ex down-ps">
						<a href="goodsInfo.jsp" target="_blank"><img src="images/shop11.png" alt="#" width="185" height="185" alt="商品图片"/></a>
						<div class="simple-left">
							<a href="goodsInfo.jsp" target="_blank" class="big">1商品名称￥</a>
							<span class="small down-small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect"><i class="icon-col"></i></a>
						</div>
					</div>
				<div class="photoshow-ex down-ps">
						<a href="goodsInfo.jsp" target="_blank"><img src="images/shop11.png" alt="#" width="185" height="185" alt="商品图片"/></a>
						<div class="simple-left">
							<a href="goodsInfo.jsp" target="_blank" class="big">1商品名称￥</a>
							<span class="small down-small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect"><i class="icon-col"></i></a>
						</div>
					</div>
				<div class="photoshow-ex down-ps">
						<a href="goodsInfo.jsp" target="_blank"><img src="images/shop11.png" alt="#" width="185" height="185" alt="商品图片"/></a>
						<div class="simple-left">
							<a href="goodsInfo.jsp" target="_blank" class="big">1商品名称￥</a>
							<span class="small down-small">商品简介要在二十字内商品简介要在二十字内</span>
						</div>
						<div class="simple-right">
							<span class="price">￥19.9</span>
							<a class="collect"><i class="icon-col"></i></a>
						</div>
					</div>
			</div>
			<div id="sub1" >
					<form action="">
						<input type="text" value="" class="sub2"><input type="submit" value="搜索" class="sub3">
					</form>
				</div>
			
		</div>
		
	</div>
	<jsp:directive.include file="bottom.jsp"/>
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/jQuery-Msy.js"></script>
	<script type="text/javascript" src="js/goodslist.js"></script>
</body>
</html>