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
	<script type="text/javascript"> 
	/* $(".delete").click(function(){
		var name = $(this).parent().parent().children(".goodsname").html();
		confirm("确定删除“"+name+"”");
	}); */
	</script>
	<script language="JavaScript" type="text/javascript">
	//异步请求，分页
	
	var xmlHttp;
	var apageNum,asize,atotalNum,atotalPage,agoodsStatu;
	function createXMLHttp() {
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	
	function getStoreGoodsList(pageNum,size,totalNum,totalPage,goodsStatu) {
		apageNum = pageNum;
		asize = size;
		atotalNum = totalNum;
		atotalPage = totalPage;
		agoodsStatu = goodsStatu;
		createXMLHttp();
		xmlHttp.open("GET", "seller/storeGoodsList?pageNum="+pageNum+"&size="+size+"&totalNum="+totalNum+"&totalPage="+totalPage+"&goodsStatu="+goodsStatu);
		xmlHttp.onreadystatechange = getListCallback;
		xmlHttp.send(null);

	}
	function getListCallback() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
			
				var text = eval("(" + xmlHttp.responseText + ")");
				show(text.list, "storeGoodslist", text.pageNum, text.size,  text.totalNum, text.totalPage, text.goodsStatu);

			}
		}
	}

	function show(list, e_id, pageNum, size, totalNum, totalPage, goodsStatu) {

		var maindiv = document.getElementById(e_id);
		//maindiv.className="photoshow";
		//alert("1");
		maindiv.innerHTML = "";
		//alert("2");
			var tr0 = document.createElement("tr");
			tr0.style = "border:0";
				var th = document.createElement("th");
				th.innerHTML = "id";
			tr0.appendChild(th);
				var th = document.createElement("th");
			 	th.innerHTML = "照片";
			tr0.appendChild(th);
				var th = document.createElement("th");
				th.innerHTML = "名称";
			tr0.appendChild(th);
				var th = document.createElement("th");
				th.innerHTML = "价格/元";
			tr0.appendChild(th);
				var th = document.createElement("th");
				//alert(goodsStatu);
				if(goodsStatu == "2")//居然要用==不用equals
				{
					th.innerHTML = "上架时间";
				}
				else if(goodsStatu == "1" || goodsStatu == "3")
				{
					th.innerHTML = "添加时间";
				}
			tr0.appendChild(th);
				var th = document.createElement("th");
				th.innerHTML = "购买次数";
			tr0.appendChild(th);
				var th = document.createElement("th");
				th.innerHTML = "商品评价";
			tr0.appendChild(th);
				var th = document.createElement("th");
				th.innerHTML = "操作";
			tr0.appendChild(th); 
			if(goodsStatu == "1" || goodsStatu == "3")
			{
				var th = document.createElement("th");
				th.innerHTML = "删除";
			tr0.appendChild(th);
			} 
		maindiv.appendChild(tr0);
		
		var total = size;//每页显示数据量
		if(pageNum*size > totalNum)
		{
			total = totalNum % size;
		}
		
		var i;
		for(i = 0; i < total; i++) {
		//alert(list[i].gdStatus.toString());
			var tr1 = document.createElement("tr");
				var td;
				td = document.createElement("td");
				td.innerHTML = list[i].gdGoodsid;
			tr1.appendChild(td);
			
				td = document.createElement("td");
				/* if(true)
				{
					td.innerHTML= "<a href=main/getInfo?goodsId=" + list[i].gdGoodsid + "><img src='images/picture-example.png' alt='#'/></a>";
				}
				else
				{ */
					td.innerHTML= "<a href=main/getInfo?goodsId=" + list[i].gdGoodsid + "><img src=" + list[i].gdPicture.substring(1,list[i].gdPicture.indexOf("#",1)) + " alt='#'/></a>";
				//}
			tr1.appendChild(td);
			
				td = document.createElement("td");
				td.innerHTML = "";
					var a2 = document.createElement("a");
					a2.href = "main/getInfo?goodsId=" + list[i].gdGoodsid;
					a2.innerHTML = list[i].gdGoodsname;
				td.appendChild(a2);
			tr1.appendChild(td);
			
				td = document.createElement("td");
				td.innerHTML = list[i].gdPrice;
			tr1.appendChild(td);
			
			if(goodsStatu=="2")
			{
				td = document.createElement("td");
				var date = new Date(list[i].gdSaletime);
				td.innerHTML = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
			tr1.appendChild(td);
			}
			else if(goodsStatu=="1" || goodsStatu=="3")
			{
				td = document.createElement("td");
				var date = new Date(list[i].gdCreatetime);
				td.innerHTML = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
			tr1.appendChild(td);
			}
			
				td = document.createElement("td");
				td.innerHTML = list[i].gdSaled;
			tr1.appendChild(td);
			
				td = document.createElement("td");
				td.innerHTML = "暂时没有";
					//var a2 = document.createElement("a");
					//a2.href = "main/getInfo?goodsId=" + list[i].gdGoodsid;
					//a2.innerHTML = list[i].gdGoodsname;
				//td.appendChild(a2);
			tr1.appendChild(td);
			
			if(goodsStatu=="2")
			{
				td = document.createElement("td");
				td.innerHTML = "<a onclick=xiajiaGoods(" + list[i].gdGoodsid + ")>下架</a>";
			tr1.appendChild(td);
			}
			else if(goodsStatu == "1" || goodsStatu == "3")
			{
				td = document.createElement("td");
				td.innerHTML = "<a onclick=shangjiaGoods(" + list[i].gdGoodsid + ")>上架</a>|<a class='revise'>编辑</a>";
			tr1.appendChild(td);				
			}
			
			if(goodsStatu == "1" || goodsStatu == "3")
			{
				td = document.createElement("td");
				td.innerHTML = "<a  class='delete' onclick=deleteGoods(" + list[i].gdGoodsid + ")>删除</a>";
				tr1.appendChild(td);				
			}
		maindiv.appendChild(tr1);
		}
		
		var page = document.getElementById("page");
		page.innerHTML = "";
		if(pageNum > 1)
		{
			var a = document.createElement("a");
			a.className = "";
			a.innerHTML = "&lt上一页";
			a.onclick = function(){getStoreGoodsList(pageNum-1,size,totalNum,totalPage,goodsStatu);};
			page.appendChild(a);
		}
		
		var b = document.createElement("a");
		b.innerHTML = "第"+pageNum+"/"+totalPage+"页";
		page.appendChild(b);
		
		//alert(pageNum*size + "   " + totalNum);
		
		if(pageNum*size < totalNum )
		{
			var c = document.createElement("a");
			c.className = "";
			c.innerHTML = "下一页&gt";
			c.onclick = function(){getStoreGoodsList(pageNum+1,size,totalNum,totalPage,goodsStatu);};
			page.appendChild(c);
		}
	}
	
	function deleteGoods(id)
	{
	    
		if(!confirm("确认删除商品："  + "？"))
		{
			return;
		}
		
		createXMLHttp();
		
		xmlHttp.open("GET", "seller/deleteGoods?goodsId=" + id + "&aimStatu=7");
		//xmlHttp.open("GET", "seller/storeGoodsList?pageNum="+apageNum+"&size="+asize+"&totalNum="+atotalNum+"&totalPage="+atotalPage+"&goodsStatu="+agoodsStatu);
		//getStoreGoodsList(apageNum,asize,atotalNum,atotalPage,agoodsStatu);
		xmlHttp.onreadystatechange = getListCallback;
		xmlHttp.send(null);
	}
	
	function xiajiaGoods(id)
	{
		createXMLHttp();
		xmlHttp.open("GET", "seller/deleteGoods?goodsId=" + id + "&aimStatu=3");
		//xmlHttp.open("GET", "seller/storeGoodsList?pageNum="+apageNum+"&size="+asize+"&totalNum="+atotalNum+"&totalPage="+atotalPage+"&goodsStatu="+agoodsStatu);
		//getStoreGoodsList(apageNum,asize,atotalNum,atotalPage,agoodsStatu);
		xmlHttp.onreadystatechange = getListCallback;
		xmlHttp.send(null);
	}
	
	function shangjiaGoods(id)
	{
		createXMLHttp();
		xmlHttp.open("GET", "seller/deleteGoods?goodsId=" + id + "&aimStatu=2");
		//xmlHttp.open("GET", "seller/storeGoodsList?pageNum="+apageNum+"&size="+asize+"&totalNum="+atotalNum+"&totalPage="+atotalPage+"&goodsStatu="+agoodsStatu);
		//getStoreGoodsList(apageNum,asize,atotalNum,atotalPage,agoodsStatu);
		xmlHttp.onreadystatechange = getListCallback;
		//xmlHttp.send(null);
		//xmlHttp.open("GET", "seller/storeGoodsList?pageNum="+pageNum+"&size="+size+"&totalNum="+totalNum+"&totalPage="+totalPage+"&goodsStatu="+goodsStatu);
		xmlHttp.send(null);
	}
	</script>
</head>
<body onload="getStoreGoodsList(1,5,-1,-1,2)">
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
					<form action="">
		<div>
			<div class="title">
				已卖出的宝贝<span style="font-size:10px">(共10件宝贝)</span> 
			</div>
			<div class="table-center selled-table">
				<table id="">
					<!--商品id，名称，价格，上架时间，购买次数，商品评价（可进入查看及回复，暂时不进入），修改状态（下架），删除-->
					<tbody>
						<tr style="border:0">
							<th>id</th>
							<th>照片</th>
							<th>名称</th>
							<th>价格/元</th>
							<th>上架时间</th>
							<th>买家</th>
							<th>商品评价</th>
							<th>店铺评价</th>
							<th>删除</th>
						</tr>
						<tr>
							<td>1</td>
							<td><img src="#" alt=""> </td>
							<td class="goodsname">曲奇饼干</td>
							<td>12</td>
							<td>2012-12-12</td>
							<td>哈哈哈</td>
							<td><a href="#">买家评论</a></td>
							<td><a href="#">店铺评论</a></td>
							<td><a class="delete" >删除</a> </td>
						</tr>
						<tr>
							<td>2</td>
							<td><img src="#" alt=""> </td>
							<td class="goodsname">曲奇饼干</td>
							<td>12</td>
							<td>2012-12-12</td>
							<td>哈哈哈</td>
							<td><a href="#">买家评论</a></td>
							<td><a href="#">店铺评论</a></td>
							<td><a class="delete">删除</a> </td>
						</tr>
						<tr>
							<td>3</td>
							<td><img src="#" alt=""> </td>
							<td class="goodsname">曲奇饼干</td>
							<td>12</td>
							<td>2012-12-12</td>
							<td>哈哈哈</td>
							<td><a href="#">买家评论</a></td>
							<td><a href="#">店铺评论</a></td>
							<td><a class="delete">删除</a> </td>
						</tr>
					</tbody>
				</table>
				<div class="pagination">
					<button>《上一页</button>
					<span>1/2</span>
					<button>下一页》</button>
				</div>
			</div><!--selling-center-->
		</div>
	</form>
<script type="text/javascript">
	$(".delete").click(function(){
		var name = $(this).parent().parent().children(".goodsname").html();
		confirm("确定删除“"+name+"”");
	})
</script>
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