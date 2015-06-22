<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'z_sellermanage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
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
	
	function getStoreGoodsList(pageNum,size,totalNum,totalPage,goodsStatu) {
		createXMLHttp();
		xmlHttp.open("GET", "seller/storeGoodsList?pageNum="+pageNum+"&size="+size+"&totalNum="+totalNum+"&totalPage="+totalPage+"&goodsStatu="+goodsStatu);
		xmlHttp.onreadystatechange = getListCallback;
		xmlHttp.send(null);

	}
	function getListCallback() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
			
				var text = eval("(" + xmlHttp.responseText + ")");
				show(text.list, "storeGoodslist", text.pageNum, text.size,  text.totalNum, text.totalPage);

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
			total = totalNum % size;
		}
		var i;
		for(i = 0; i < total; i++) {
			var div1 = document.createElement("div");	
			div1.className="photoshow-ex";
				var a1 = document.createElement("a");
				a1.innerHTML = "";
				a1.href = "main/getInfo?goodsId=" + list[i].gdGoodsid;
				if(true)
				{
					a1.innerHTML= "<img src='images/picture-example.png' alt='#' width='182' height='182'>";
				}
				else
				{
					a1.innerHTML= "<img src=" + list[i].gdPicture.substring(1,list[i].gdPicture.indexOf(1,"#")) + " alt='#' width='182' height='182'>";
				}
			div1.appendChild(a1);
				div2 = document.createElement("div");
				div2.className = "simple-left";
					var a2 = document.createElement("a");
					a2.href = "main/getInfo?goodsId=" + list[i].gdGoodsid;
					a2.innerHTML = "商品名称：" + list[i].gdGoodsname;
				div2.appendChild(a2);
			div1.appendChild(div2);
			
				var div3 = document.createElement("div");
				div3.className = "simple-right";
					var span1 = document.createElement("span");
					span1.className="price";
					span1.innerHTML = "价格：" + list[i].gdPrice;
				div3.appendChild(span1);
			div1.appendChild(div3);
			
				var div4 = document.createElement("div");
				div4.innerHTML = "商品状态：";/*
				if(list[i].gdStatus.equals("0"))
				{
					div4.innerHTML = "商品状态：审核中";
				}
				else if(list[i].gdStatus.equals("1"))
				{
					div4.innerHTML = "商品状态：未发布";
						var a = document.createElement("a");
						a.href = "";
						a.innerHTML = "发布";
					div4.appendChild(a);
				}
				else if(list[i].gdStatus.equals("2"))
				{
					div4.innerHTML = "商品状态：已发布";
						var a = document.createElement("a");
						a.href = "";
						a.innerHTML = "下架";
					div4.appendChild(a);
				}
				else if(list[i].gdStatus.equals("3"))
				{
					div4.innerHTML = "商品状态：已下架";
						var a = document.createElement("a");
						a.href = "";
						a.innerHTML = "重新上架";
					div4.appendChild(a);
				}
				else if(list[i].gdStatus.equals("4"))
				{
					div4.innerHTML = "商品状态：审核未通过";
				}  */
					var ad = document.createElement("a");
					ad.href = "";
					ad.innerHTML = "删除";
				div4.appendChild(ad);
			div1.appendChild(div4);
			
		maindiv.appendChild(div1);
		}
		
		var page = document.getElementById("page");
		page.innerHTML = "";
		if(pageNum > 1)
		{
			var a = document.createElement("button");
			a.className = "form1";
			a.innerHTML = "&lt上一页";
			a.onclick = function(){getGoodsList(pageNum-1,size,totalNum,totalPage,goodsStatu);};
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
			c.onclick = function(){getGoodsList(pageNum+1,size,totalNum,totalPage,goodsStatu);};
			page.appendChild(c);
		}
	}
	
	</script>

  </head>
  
  <body onload="getStoreGoodsList(1,16,-1,-1,0)">
    This is 'z_sellermanage' JSP page. <br>
    <div id="storeGoodslist">
    </div>
  </body>
</html>
