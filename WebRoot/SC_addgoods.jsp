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
	<base href="<%=basePath%>
	"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>马上有个人中心</title>
	<link rel="stylesheet" href="css/SC.css">
	<link rel="stylesheet" href="css/model.css">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<link rel="stylesheet" href="kindeditor/themes/default/default.css" />

	<script charset="utf-8" type="text/javascript" language="javascript" src="kindeditor/kindeditor-min.js"></script>

	<script charset="utf-8" type="text/javascript" language="javascript" src="kindeditor/lang/zh_CN.js"></script>

	<script>

KindEditor.ready(function(K) {

K.create('textarea[name="clubIntroduction"]', {

uploadJson : 'kindeditor/jsp/upload_json.jsp',

                fileManagerJson : 'kindeditor/jsp/file_manager_json.jsp',

                allowFileManager : true,

                allowImageUpload : true, 

autoHeightMode : true,

afterCreate : function() {this.loadPlugin('autoheight');},

afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息

});

});

</script>
	<%-- <script type="text/javascript">
KE.show({    
id : 'tg',//TEXTAREA输入框的ID 
imageUploadJson : '../../jsp/upload_json.jsp',  //注意路径别写错！！
   fileManagerJson : '../../jsp/file_manager_json.jsp',  
   allowFileManager : true, 
   allowUpload : true, //允许上传图片 
   afterCreate : function(id) {  
       KE.event.ctrl(document, 13, function() {  
           KE.util.setData(id);  
           document.forms['example'].submit();  
       });  
       KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {  
           KE.util.setData(id);  
           document.forms['example'].submit();  
       });  
   } 
}); 
</script> --%>
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
		
		xmlHttp.open("GET", "seller/deleteGoods?goodsId=" + id + "&aimStatu=7"+"&size="+asize+"&pageNum="+apageNum+"&goodsStatu="+agoodsStatu);
		//xmlHttp.open("GET", "seller/storeGoodsList?pageNum="+apageNum+"&size="+asize+"&totalNum="+atotalNum+"&totalPage="+atotalPage+"&goodsStatu="+agoodsStatu);
		//getStoreGoodsList(apageNum,asize,atotalNum,atotalPage,agoodsStatu);
		xmlHttp.onreadystatechange = getListCallback;
		xmlHttp.send(null);
	}
	
	function xiajiaGoods(id)
	{
		createXMLHttp();
		//alert("pageNum="+apageNum+"&size="+asize+"&totalNum="+atotalNum+"&totalPage="+atotalPage+"&goodsStatu="+agoodsStatu);
		xmlHttp.open("GET", "seller/deleteGoods?goodsId=" + id + "&aimStatu=3"+"&size="+asize+"&pageNum="+apageNum+"&goodsStatu="+agoodsStatu);
		//xmlHttp.open("GET", "seller/storeGoodsList?pageNum="+apageNum+"&size="+asize+"&totalNum="+atotalNum+"&totalPage="+atotalPage+"&goodsStatu="+agoodsStatu);
		//getStoreGoodsList(apageNum,asize,atotalNum,atotalPage,agoodsStatu);
		xmlHttp.onreadystatechange = getListCallback;
		xmlHttp.send(null);
		
		//location.reload(true);
	}
	
	function shangjiaGoods(id)
	{
		createXMLHttp();
		xmlHttp.open("GET", "seller/deleteGoods?goodsId=" + id + "&aimStatu=2"+"&size="+asize+"&pageNum="+apageNum+"&goodsStatu="+agoodsStatu);
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
				<li>
					<a href="goodsList.jsp">所有宝贝</a>
				</li>
				<li>
					<a href="">跳蚤市场</a>
				</li>
				<li>
					<a href="">今日推荐</a>
				</li>
			</ul>
		</div>
		<div id="warpper2">

			<div class="warpper-body" >
				<div class="warpper-top">
					<p>
						<a href="person/shopStatu">卖家中心</a>
					</p>
					<ul>
						<li>
							<a href="person/shopStatu">卖家主页</a>
						</li>
						<li class="setup">
							<a href="">设置</a>
						</li>
					</ul>
					<span class="gift">
						<a href="">支付有礼</a>
					</span>
				</div>

				<jsp:directive.include file="SC_left.jsp"/>
				<div class="warpper-middle warpper-addgoods">

					<form name="form" id="form" method="post" action="person/addGoods" enctype="multipart/form-data">
						<div class="addgoods">
							<div class="title">添加商品</div>
							<div class="add-center">
								<table class="add-table">
									<tr>
										<td class="th">商品名称：</td>
										<td>
											<input type="text" name="goodsName"/>
										</td>
									</tr>
									<tr>
										<td class="th">商品图片:</td>
										<td class="add-full">
											<table id="gallery-table" align="center">
												<tbody>
													<tr>
														<td>
															<div id="pho">
																<input type="file" onchange="c(this)" name="photo"/>
																<a href="javascript:;" onclick="addImg()">[+]</a>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="th">商品价格：</td>
										<td>
											<input type="text" name="goodsPrice"/>
										</td>
									</tr>
									<!-- <tr>
										<td class="th">参考价格：(现在先没有用)</td>
										<td>
											<input type="text" />
										</td>
									</tr> -->
									<tr class="kinds">
										<td class="th">商品类型:</td>
										<td>
											<div class="kind" >
												<p class="kind-title">--请选择--</p>
												<ul class="kinded showul" >
													<li class="kd">服装鞋包</li>
													<li class="kd">手机数码</li>
													<li class="kd">家用电器</li>
													<li class="kd">其他</li>
												</ul>
											</div>
											<div class="kind-1">

												<p class="kind-title">--请选择--</p>
												<ul class="kinded">
													<li class="ex">服装鞋包</li>
													<li class="ex">服装鞋包</li>
													<li class="ex">其他</li>
												</ul>
												<ul class="kinded">
													<li class="ex">手机数码</li>
													<li class="ex">手机数码</li>
													<li class="ex">其他</li>
												</ul>
												<ul class="kinded">
													<li class="ex">家用电器</li>
													<li class="ex">家用电器</li>
													<li class="ex">其他</li>
												</ul>
												<ul class="kinded">
													<li class="ex">其他</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<td class="th">商品标签:</td>
										<td>
											<table>
												<tr>
													<td>
														<div id="addtitle">
															<input  type="text" name="title"/>
															<a href="javascript:;"  onclick="add()">[+]</a>
														</div>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="th">商品库存量:</td>
										<td>
											<input type="text" name="goodsSum"/>
										</td>
									</tr>
									<tr>
										<td class="th">商品简介(20字内):</td>
										<td>
											<textarea name="goodsBrief" id="" cols="30" rows="10"></textarea>
										</td>
									</tr>
									<tr>
										<td class="th">商品详情:</td>
										<td>(建议点击“全屏显示”后编辑)</td>

										<!--<td>
										<a href="add-full.html">点击编辑</a>
									</td>
									-->
								</tr>
								<tr>
									<td>
										<!-- <textarea id="tg" name="goodsInfo" style="width:546px;height:320px;"></textarea>
									-->
									<textarea runat="server" id="tg" name='clubIntroduction' style="overflow:hidden;width:570px;">
										<%-- <s:property value='club.getClubIntroduction()' escape="false"/>
										--%>
									</textarea>
								</td>
							</tr>

						</table>
					</div>
				</div>
				<input type="submit" value="提交" class="sub" />
				<input type="reset" value="重置" class="sub"/>
			</form>

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

<%
	String msg = (String) request.getSession().getValue("msg");
%>

<%if(msg!=null) {%>

<script language="javascript">
    alert('<%=msg%>');
</script>

<% session.putValue("msg", null); } %>

<script language="javascript"></script>
<script type="text/javascript">

	
	
	html = document.getElementById('tg').value; // 原生API
	
	html = $('#tg').val(); // jQuery

	// 设置HTML内容
	
</script>
</html>