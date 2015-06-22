<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>民院交易市场</title>
	<link rel="stylesheet" type="text/css" href="css/homepage.css"/>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/homepage.js"></script>
		 <script type="text/javascript">
    $(function(){       
            $(document).on('click','.like',function(){
            	// if(!VJue.islogin()) return !1;
            	if($(this).attr("title")=="点赞"){
                	$(this).css("background-image","url(images/zw.png)");
                	$(this).attr("title","取消赞");
                }
                else{
                	$(this).css("background-image","url(images/like1.png)");
                	$(this).attr("title","点赞");

                }
                return false;
            });
            $(".like").hover(function(){
            	if($(this).attr("title")=="点赞"){
                	$(this).css("background-image","url(images/like2.png)");
            	}
            },function(){
            	if($(this).attr("title")=="点赞"){
                	$(this).css("background-image","url(images/like1.png)");
            	}
            	else{
                	$(this).css("background-image","url(images/zw.png)");
            	}
            })

            
    })
    
 
    
    /**取推荐商品**/
    var xmlHttp;
	function createXMLHttp() {
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	function getGoodsByAttention(page) {
		createXMLHttp();
		/* xmlHttp.open("POST", "test_showall?pageNumber=" + page); */
		xmlHttp.open("POST", "page_getGoodsByAttention");
		xmlHttp.onreadystatechange = getListCallback;
		xmlHttp.send(null);

	}
	function getListCallback() {//推荐物品
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				//	var text = xmlHttp.responseText ;
				var text = eval("(" + xmlHttp.responseText + ")");
				//show(text.list, "goods");
				show(text.list, "host_goods");
				//show(text.list, "new_tr");
			}
		}
	}

	function show(list, e_id) {

		var maindiv = document.getElementById(e_id);

		if (maindiv.firstChild != null) {

			maindiv.removeChild(maindiv.firstChild);
		}
		var main_ul = document.createElement("ul");

		for ( var i = 0; i < 8; i++) {
			var tr;
			if (e_id == "new_tr") {
				tr = document.createElement("td");
			}
			var mainLi = document.createElement("li");
			mainLi.className = "wall";

			var div5 = document.createElement("div");
			div5.className = "pic";

			var img = document.createElement("img");
			img.onload = "AutoResizeImage(this)";
			img.title = list[i].gsName;
			img.src = "images/linshi.png";//list[i].gsPicture;
			img.height = "205";
			img.width = "205";
			
			div5.appendChild(img);

			mainLi.appendChild(div5);

			var a2 = document.createElement("a");
			a2.className = "info";
			a2.title = list[i].gsName;
			a2.style = "display:none";
			a2.href = "#";

			var span1 = document.createElement("span");
			span1.className = "price";
			span1.innerHTML = "￥" + list[i].gsPrice;
			var loacl = "开发区";
			if (list[i].gsWhere = "1") {
				loacl = "金石滩";
			}

			var span2 = document.createElement("span");
			span2.className = "area";
			span2.innerHTML = loacl;
			
			var span3 = document.createElement("span");
			span3.className = "goods-name";
			var name = list[i].gsName;
			span3.innerHTML = name;
			

			var myform = document.createElement("form");
			var input = document.createElement("input");
			input.className = "like";
			input.type = "submit";
			input.value = "";
			myform.appendChild(input);

			a2.appendChild(span1);
			a2.appendChild(span2);
			a2.appendChild(span3);
			
			a2.appendChild(myform);
			mainLi.appendChild(a2);

			if (e_id == "new_tr") {
				tr.appendChild(mainLi);
				maindiv.appendChild(tr);
			} else {
				main_ul.appendChild(mainLi);
			}
		}
		if (e_id != "new_tr") {
			maindiv.appendChild(main_ul);
		}
		//alert(list[0].gsName);
	}
	
	/**最新物品**/
	var xmlHttp2;
	function createXMLHttp2() {
		if (window.XMLHttpRequest) {
			xmlHttp2 = new XMLHttpRequest();
		} else {
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	function getGoodsByTime() {
		createXMLHttp2();
		/* xmlHttp.open("POST", "test_showall?pageNumber=" + page); */
		xmlHttp2.open("POST", "page_getGoodsByTime");
		xmlHttp2.onreadystatechange = getGoodsListByTimeCallback;
		xmlHttp2.send(null); 
	}
	
	function getGoodsListByTimeCallback() {
				
		if (xmlHttp2.readyState == 4) {
			if (xmlHttp2.status == 200) {
				//	var text = xmlHttp.responseText ;
				var list = eval("(" + xmlHttp2.responseText + ")");
				showListByTime(list, "new_tr");
			}
		} 
	}

	function showListByTime(list, e_id) {

		var maindiv = document.getElementById(e_id);
		if (maindiv.firstChild != null) {//清空div内容
			maindiv.removeChild(maindiv.firstChild);
		}
		
		var main_ul = document.createElement("ul");
		main_ul.className = "sc_menu";
		
		for(var i=0; i < 10; i++) {
			var mainLi = document.createElement("li");
			mainLi.className = "wall";
			
				var pic_div = document.createElement("div");
				pic_div.className = "pic";
					var img = document.createElement("img");
					img.onload = "AutoResizeImage(this)";
					img.title = list[i].gsName;
					img.src = "images/linshi.png";//list[i].gsPicture;
					img.height = "205";
					img.width = "205";
				pic_div.appendChild(img);
				mainLi.appendChild(pic_div);
				
				var a2 = document.createElement("a");
				a2.className = "info";
				a2.title = list[i].gsName;
				a2.style = "display:none";
				a2.href = "mh_goods-detail.html";

					var span1 = document.createElement("span");
					span1.className = "price";
					span1.innerHTML = "￥" + list[i].gsPrice;
					a2.appendChild(span1);
					
					var loacl = "开发区";
					if (list[i].gsWhere = "1") {
						loacl = "金石滩";
					}
					var span2 = document.createElement("span");
					span2.className = "area";
					span2.innerHTML = loacl;
					a2.appendChild(span2);
					
					var span3 = document.createElement("span");
					span3.className = "goods-name";
					var name = list[i].gsName;
					span3.innerHTML = name;
					a2.appendChild(span3);

					var myform = document.createElement("form");
						var input = document.createElement("input");
						input.className = "like";
						input.type = "submit";
						input.value = "";
						input.title = "点赞";
					myform.appendChild(input);
					a2.appendChild(myform);
			mainLi.appendChild(a2);
			
			main_ul.appendChild(mainLi);
		}
		maindiv.appendChild(main_ul); 
	}
	
	/**获取卖家推荐**/
	var xmlHttp3;
	function createXMLHttp3() {
		if (window.XMLHttpRequest) {
			xmlHttp3 = new XMLHttpRequest();
		} else {
			xmlHttp3 = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	function getRGoods() {
		createXMLHttp3();
		/* xmlHttp.open("POST", "test_showall?pageNumber=" + page); */
		xmlHttp3.open("POST", "page_getRGoods");
		xmlHttp3.onreadystatechange = getRGoodsListCallback;
		xmlHttp3.send(null); 
	}
	
	function getRGoodsListCallback() {
				
		if (xmlHttp3.readyState == 4) {
			if (xmlHttp3.status == 200) {
				//	var text = xmlHttp.responseText ;
				var list = eval("(" + xmlHttp3.responseText + ")");
				showRGoods(list, "rgoods");
			}
		} 
	}

	function showRGoods(list, e_id) {

		var maindiv = document.getElementById(e_id);
		if (maindiv.firstChild != null) {//清空div内容
			maindiv.removeChild(maindiv.firstChild);
		}
		//var aa = document.createElement("a");
		//aa.innerHTML = "TEST";
		//maindiv.appendChild(aa);
		
		var main_ul = document.createElement("ul");
		//main_ul.className = "sc_menu";
		
		for(var i=0; i < 8; i++) {
			var mainLi = document.createElement("li");
			mainLi.className = "wall";
			
				var pic_div = document.createElement("div");
				pic_div.className = "pic";
					var img = document.createElement("img");
					img.onload = "AutoResizeImage(this)";
					img.title = list[i].goods.gsName;
					img.src = "images/linshi.png";//list[i].gsPicture;
					img.height = "205";
					img.width = "205";
				pic_div.appendChild(img);
				mainLi.appendChild(pic_div);
				
				var a2 = document.createElement("a");
				a2.className = "info";
				a2.title = list[i].goods.gsName;
				a2.style = "display:none";
				a2.href = "mh_goods-detail.html";

					var span1 = document.createElement("span");
					span1.className = "price";
					span1.innerHTML = "￥" + list[i].goods.gsPrice;
					a2.appendChild(span1);
					
					var loacl = "开发区";
					if (list[i].goods.gsWhere = "1") {
						loacl = "金石滩";
					}
					var span2 = document.createElement("span");
					span2.className = "area";
					span2.innerHTML = loacl;
					a2.appendChild(span2);
					
					var span3 = document.createElement("span");
					span3.className = "goods-name";
					var name = list[i].goods.gsName;
					span3.innerHTML = name;
					a2.appendChild(span3);

					var myform = document.createElement("form");
						var input = document.createElement("input");
						input.className = "like";
						input.type = "submit";
						input.value = "";
						input.title = "点赞";
					myform.appendChild(input);
					a2.appendChild(myform);
			mainLi.appendChild(a2);
			
			main_ul.appendChild(mainLi);
		}
		maindiv.appendChild(main_ul); 
	}
	
	/**获取排名前10的用户**/
	var xmlHttp4;
	function createXMLHttp4() {
		if (window.XMLHttpRequest) {
			xmlHttp4 = new XMLHttpRequest();
		} else {
			xmlHttp4 = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	function getUserRank() {
		createXMLHttp4();
		// xmlHttp.open("POST", "test_showall?pageNumber=" + page); 
		xmlHttp4.open("POST", "page_getUserRank");
		xmlHttp4.onreadystatechange = getUserRankCallback;
		xmlHttp4.send(null); 
	}
	
	function getUserRankCallback() {
				
		if (xmlHttp4.readyState == 4) {
			if (xmlHttp4.status == 200) {
				//	var text = xmlHttp.responseText ;
				var list = eval("(" + xmlHttp4.responseText + ")");
				showUserRank(list, "userRank");
			}
		} 
	}

	function showUserRank(list, e_id) {

		var maindiv = document.getElementById(e_id);
		
	} 
    
   function getContent() {
    	getGoodsByAttention(1);//获取最热上品牌
    	getGoodsByTime();//获取最新商品
    	getRGoods();//获取卖家推荐商品
    	getUserRank();//获取积分排名前10的学生
    } 
	</script>

</head>
<body onload="getContent();">


<!--田原的 top&footer-->
<div id="top">
	<div id="top-text">
	<ul class="leftcolumn">
		<li><a href="ty_personalfollow.html">我的关注</a>&nbsp;&nbsp;</li>
			<li><a href="ty_personalcollect.html">我的收藏</a>&nbsp;&nbsp;</li>
			<li class="news">
				<a href="ty_personalmanage.html">新消息</a>
				<ul class="slide">
					<li><a href="ty_personalmanage.html">留言</a><h5 class="sn">+4</h5></li>
					<li><a href="ty_personalmanage.html">回复</a><h5 class="sn">+4</h5></li>
					<li><a href="ty_personalmanage.html">关注我</a><h5 class="sn">+4</h5></li>
					<li><a href="ty_personalmanage.html">收藏我</a><h5 class="sn">+4</h5></li>
					<li><a href="ty_personalmanage.html">管理员私信</a><h5 class="sn">+4</h5></li>
				</ul>
			</li>
	</ul>
	<ul class="rightcolumn">
		<li class="login">
			<a href="#">登录</a>&nbsp;&nbsp;
		</li>
		<li><a href="mh_register.html">注册</a>&nbsp;&nbsp;</li>
		<li class="name">
			<a class="yonghuming">用户名</a>
			<div class="nameshow">
				<div class="myself_tou">
					<img src="images/ty_toptou.jpg" style=" height:120px; width:120px;" alt="头像" />
				</div>
				<div class="myself_name">
					<span>sdjhfjdknvsd</span>
					<span>积分：28</span>
				</div>
				<div class="myself_back">
					<span><a href="ty_personalmessage.html" title="点击进入个人中心">个人中心</a></span>
					<span class="back"><a href="homepage.html">注销</a></span>
				</div>
			</div>
		</li>
	</ul>
</div>
</div>
<div id="pingmu"></div>
	<div class="login_box">
				<h2>登&nbsp;&nbsp;&nbsp;录</h2><a href="#" class="close">退出</a>
				 <div class="form-bak">
					<form method="post" action="#" id="tform" onsubmit="adaptValue();">
						<div class="line" id="line_account">
							<div class="info">
								<span class="login_seg">邮箱</span>
								<span class="tips">邮箱就是账号&nbsp;&nbsp;请正确填写</span>
							</div>
							<div class="input">
								<input type="text" name="account" id="account" onblur="v_account();" onkeyup="v_account();"/>
								<div class="none">
									<span></span>
								</div>
							</div>
						</div>

						<div class="line" id="line_password">
							<div class="info">
								<span class="login_seg">密码</span>
								<span class="tips">请正确填写您的密码</span>
							</div>
							<div class="input">
								<input type="password" name="password" id="password" onblur="v_password();" onkeyup="v_password();" />
								<div class="none">
									<span></span>
								</div>
							</div>
						</div>
						<input type="submit" id="submit" value="确认" disabled="disabled"/>
					</form>
				</div>
			</div>
<!--end of -田原的 top&footer-->




	<!--logo+搜索-->
	<div id="logoSearch">
		<div id="ls">
			<div id="ls-logo"><a href="#" title="首页"><img src="images/diu_logo.png"></a></div>
			<div id="ls-search">
				<form>
					<input id="search" type="text" value="请输入您想淘到的宝贝" /><input id="searchButton" type="submit" value="" title="点赞"/>
				</form>
			</div>
		</div>
	</div>
	<!--logo+搜索 end-->




	<!--主导航-->
<div id="mainNav">
		<!--子导航-->
		<div id="subNav">
			<a id="classify" href="#">全部分类</a>
			<div id="subOthers">
				<a href="mh_goods-classify.html">全部</a>
				<a href="mh_goods-classify.html">全新</a>
				<a href="mh_goods-classify.html">二手</a>
			</div>
		</div>
		<!--子导航下的分类-->
		<ul id="classify-zi" style="display:block">
			<li type="1"><a href="mh_goods-classify.html"><img src="images/diu_tubiao1.png">电子产品</a></li>
			<li type="2"><a href="mh_goods-classify.html"><img src="images/diu_tubiao2.png">生活用品</a></li>
			<li type="3"><a href="mh_goods-classify.html"><img src="images/diu_tubiao3.png">男生世界</a></li>
			<li type="4"><a href="mh_goods-classify.html"><img src="images/diu_tubiao4.png">女生世界</a></li>
			<li type="5"><a href="mh_goods-classify.html"><img src="images/diu_tubiao5.png">图书杂志</a></li>
			<li type="6" id="last"><a href="mh_goods-classify.html"><img src="images/diu_tubiao6.png">吃吃喝喝</a></li>
		</ul>
<!--第一种-->
		<div id="menu1" style="display:none">
			<dl class="subMenu">
				<dt class="subTitle"><a href="mh_goods-classify.html">手机</a></dt>
				<dd>
					<ul>
						<li><a href="mh_goods-classify.html">1手机壳</a></li>
						<li><a href="mh_goods-classify.html">手机挂件</a></li>
						<li><a href="mh_goods-classify.html">手机</a></li>
						<li><a href="mh_goods-classify.html">手机链</a></li>
					</ul>
				</dd>
			</dl>
			<dl class="subMenu">
				<dt class="subTitle"><a href="#">相机</a></dt>
				<dd>
					<ul>
						<li><a href="mh_goods-classify.html">相机</a></li>
						<li><a href="mh_goods-classify.html">镜头</a></li>
						<li><a href="mh_goods-classify.html">单反</a></li>
						<li><a href="mh_goods-classify.html">摄像</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">胶片</a></li>
					</ul>
				</dd>
			</dl>
			<dl class="subMenu">
				<dt class="subTitle"><a href="#">电脑</a></dt>
				<dd>
					<ul>
						<li><a href="mh_goods-classify.html">相机</a></li>
						<li><a href="mh_goods-classify.html">镜头</a></li>
						<li><a href="mh_goods-classify.html">单反</a></li>
						<li><a href="mh_goods-classify.html">摄像</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">胶片</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">胶片</a></li>
					</ul>
				</dd>
			</dl>
			<dl class="subMenu">
				<dt class="subTitle"><a href="#">电玩</a></dt>
				<dd>
					<ul>
						<li><a href="mh_goods-classify.html">相机</a></li>
						<li><a href="mh_goods-classify.html">镜头</a></li>
						<li><a href="mh_goods-classify.html">单反</a></li>
						<li><a href="mh_goods-classify.html">摄像</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">胶片</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">胶片</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="hot-elements">
				<dt class="subTitle"><a href="#">热点元素</a></dt>
				<dd>
					<ul>
						<li><a href="mh_goods-classify.html">相机</a></li>
						<li><a href="mh_goods-classify.html">镜s头</a></li>
						<li><a href="mh_goods-classify.html">单反</a></li>
						<li><a href="mh_goods-classify.html">摄像s</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">手机壳</a></li>
						<li><a href="mh_goods-classify.html">手机挂件</a></li>
						<li><a href="mh_goods-classify.html">胶片s</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">胶片</a></li>
						<li><a href="mh_goods-classify.html">手机</a></li>
						<li><a href="mh_goods-classify.html">手机配件</a></li>
						<li><a href="mh_goods-classify.html">手机链</a></li>
						<li><a href="mh_goods-classify.html">手机膜</a></li>
					</ul>
				</dd>
			</dl>
		</div>
<!--第一种结束-->
<!--第二种-->
		<div id="menu2" style="display:none">
			<dl class="subMenu">
				<dt class="subTitle"><a href="mh_goods-classify.html">手机</a></dt>
				<dd>
					<ul>
						<li><a href="mh_goods-classify.html">2手机壳</a></li>
						<li><a href="mh_goods-classify.html">手机挂件</a></li>
						<li><a href="mh_goods-classify.html">手机</a></li>
						<li><a href="mh_goods-classify.html">手机链</a></li>
						<li><a href="mh_goods-classify.html">手机膜</a></li>
						<li><a href="mh_goods-classify.html">手机配件</a></li>
					</ul>
				</dd>
			</dl>
			<dl class="subMenu">
				<dt class="subTitle"><a href="mh_goods-classify.html">相机</a></dt>
				<dd>
					<ul>
						<li><a href="mh_goods-classify.html">相机</a></li>
						<li><a href="mh_goods-classify.html">镜头</a></li>
						<li><a href="mh_goods-classify.html">单反</a></li>
						<li><a href="mh_goods-classify.html">摄像</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">胶片</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">胶片</a></li>
					</ul>
				</dd>
			</dl>
			<dl class="subMenu">
				<dt class="subTitle"><a href="mh_goods-classify.html">电脑</a></dt>
				<dd>
					<ul>
						<li><a href="mh_goods-classify.html">相机</a></li>
						<li><a href="mh_goods-classify.html">镜头</a></li>
						<li><a href="mh_goods-classify.html">单反</a></li>
						<li><a href="mh_goods-classify.html">摄像</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">胶片</a></li>
					</ul>
				</dd>
			</dl>
			<dl class="subMenu">
				<dt class="subTitle"><a href="mh_goods-classify.html">电玩</a></dt>
				<dd>
					<ul>
						<li><a href="mh_goods-classify.html">相机</a></li>
						<li><a href="mh_goods-classify.html">镜头</a></li>
						<li><a href="mh_goods-classify.html">单反</a></li>
						<li><a href="mh_goods-classify.html">摄像</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">胶片</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="hot-elements">
				<dt class="subTitle"><a href="mh_goods-classify.html">热点元素</a></dt>
				<dd>
					<ul>
						<li><a href="mh_goods-classify.html">相机</a></li>
						<li><a href="mh_goods-classify.html">镜s头</a></li>
						<li><a href="mh_goods-classify.html">单反</a></li>
						<li><a href="mh_goods-classify.html">摄像s</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">手机壳</a></li>
						<li><a href="mh_goods-classify.html">手机挂件</a></li>
						<li><a href="mh_goods-classify.html">胶片s</a></li>
						<li><a href="mh_goods-classify.html">微单</a></li>
						<li><a href="mh_goods-classify.html">胶片</a></li>
						<li><a href="mh_goods-classify.html">手机</a></li>
						<li><a href="mh_goods-classify.html">手机配件</a></li>
						<li><a href="mh_goods-classify.html">手机链</a></li>
						<li><a href="mh_goods-classify.html">手机膜</a></li>
					</ul>
				</dd>
			</dl>
		</div>
<!--第二种结束-->




<!--焦点图-->
	<div id="v_show">
		<div class="v_sh1ow">
			<div class="v_caption">
				<h2 class="cartoon" title="卡通动漫"></h2>
				<div class="highlight_tip">
					<span class="current" id="tip1"></span><span id="tip2"></span><span id="tip3"></span><span id="tip4"></span>
				</div>
				<div class="change_btn" style="display:none">
					<span class="prev"><img src="images/diu_left.png"/></span>
					<span class="next"><img src="images/diu_right.png"/></span>
				</div>
			</div>
			<div class="v_content">
				<div class="v_content_list">
					<ul>
						<li><a href="mh_goods-detail.html"><img src="images/diu_focus1.jpg" alt="1"/></a></li>
						<li><a href="mh_goods-detail.html"><img src="images/diu_focus2.jpg" alt="2"/></a></li>
						<li><a href="mh_goods-detail.html"><img src="images/diu_focus3.jpg" alt="3"/></a></li>
						<li><a href="mh_goods-detail.html"><img src="images/diu_focus4.jpg" alt="4"/></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
<!--end of -焦点图-->




<!--宣传框-->
	<div id="publicize">
		<div id="resell"><h2>低碳生活<br/>从卖二手开始</h2><a href="#"><h3>我要转卖</h3></a></div>
		<div id="publicizeBottom"><a href="#"><div id="pbtext"><h4>民院交易市场</h4><h5>手机客户端</h5></div></a><a id="pburl"><img src="images/erwei.png" title="点击放大"/></a></div>
	</div>

<!--end of -宣传框-->
</div>

<!--end of 主导航-->





<div id="allcontent">
<!--推荐框-->
<div class="recommended">
	<div class="title"><a href="#"><h2>热门推荐</h2></a></div>
		<div class="recommend"></div>
	<div class="content" id="host_goods">
		<!-- <ul>
			
			<li class="wall">
				<div class="pic">
			         <img onload="AutoResizeImage(this)"  src="images/linshi.png" >
		        </div>

				
					<a class="info" style="display:none" href="mh_goods-detail.html">
						<span class="price">￥20</span>
						<span class="area">金石滩</span>
						<span class="goods-name">商品</span>
						<form>
							<input class="like" type="submit" value="" title="点赞" />
						</form>
				    </a>
				
		    </li>
			
		</ul> -->
	</div>
</div>
<!--end of -推荐框-->




<!--排名框-->
<div id="order">
	<div id="order-list">
		<div class="title"><a href="#"><h2>用户排名</h2></a></div>
		<div class="order-text">
			<table>
				<tr id="no1">
					<td class="circleBox"><img class="circle" src="images/diu_circle_box1.png"/><img class="first" src="images/ty_toptou.jpg"/></td>
					<td class="nopeople">
						<div class="noname"><a href="ty_personalmessage.html">用户名用户名用户名</a></div>
						<div class="nointegral"><h5>积分：236</h5></div>
					</td>
				</tr>
				<tr id="no2" >
					<td class="circleBox" border="1"><img class="circle" src="images/diu_circle_box2.png"/><img class="first"src="images/ty_toptou.jpg"/></td>
					<td class="nopeople">
						<div class="noname"><a href="ty_personalmessage.html">用户名用户名用户名</a></div>
						<div class="nointegral"><h5>积分：236</h5></div>
					</td>
				</tr>
				<tr id="no3">
					<td class="circleBox"><img class="circle" src="images/diu_circle_box3.png"/><img class="first"src="images/ty_toptou.jpg"/></td>
					<td class="nopeople">
						<div class="noname"><a href="ty_personalmessage.html">用户名用户名用户名</a></div>
						<div class="nointegral"><h5>积分：236</h5></div>
					</td>
				</tr>
				<tr class="others">
					<td class="numbers">4</td>
					<td class="nopeople">
						<div class="noname"><a href="ty_personalmessage.html">用户名用户名用户名</a></div>
						<div class="nointegral"><h6>积分：236</h6></div>
					</td>
				</tr>
				<tr class="others">
					<td class="numbers">5</td>
					<td class="nopeople">
						<div class="noname"><a href="ty_personalmessage.html">用户名用户名用户名</a></div>
						<div class="nointegral"><h6>积分：236</h6></div>
					</td>
				</tr>
				<tr class="others">
					<td class="numbers">6</td>
					<td class="nopeople">
						<div class="noname"><a href="ty_personalmessage.html">用户名用户名用户名</a></div>
						<div class="nointegral"><h6>积分：236</h6></div>
					</td>
				</tr>
				<tr class="others">
					<td class="numbers">7</td>
					<td class="nopeople">
						<div class="noname"><a href="ty_personalmessage.html">用户名用户名用户名</a></div>
						<div class="nointegral"><h6>积分：236</h6></div>
					</td>
				</tr>
				<tr class="others">
					<td class="numbers">8</td>
					<td class="nopeople">
						<div class="noname"><a href="ty_personalmessage.html">用户名用户名用户名</a></div>
						<div class="nointegral"><h6>积分：236</h6></div>
					</td>
				</tr>
				<tr class="others">
					<td class="numbers">9</td>
					<td class="nopeople">
						<div class="noname"><a href="ty_personalmessage.html">用户名用户名用户名</a></div>
						<div class="nointegral"><h6>积分：236</h6></div>
					</td>
				</tr>
				<tr class="others">
					<td class="numbers">10</td>
					<td class="nopeople">
						<div class="noname"><a href="ty_personalmessage.html">用户名用户名用户名</a></div>
						<div class="nointegral"><h6>积分：236</h6></div>
					</td>
				</tr>
			</table>
	</div>
	</div>
<img id="chahua" src="images/diu_some.png">




<div id="tagscloud">
	<a href="mh_goods-classify.html" class="tagc1">羽绒服</a>
	<a href="mh_goods-classify.html" class="tagc2">连衣裙</a>
	<a href="mh_goods-classify.html" class="tagc5">javascript</a>
	<a href="mh_goods-classify.html" class="tagc2">羽绒服<a>
    <a href="mh_goods-classify.html" class="tagc2" >连衣裙</a>
	<a href="mh_goods-classify.html" class="tagc1" >玩偶</a>
	<a href="mh_goods-classify.html" class="tagc2">羽绒服</a>
	<a href="mh_goods-classify.html" class="tagc5">javascript</a>
	<a href="mh_goods-classify.html" class="tagc2">连衣裙</a>
	<a href="mh_goods-classify.html" class="tagc2">代码笔记</a>
	<a href="mh_goods-classify.html" class="tagc5">羽绒服表</a>
	<a href="mh_goods-classify.html" class="tagc2">javascript</a>
	<a href="mh_goods-classify.html" class="tagc1">羽绒服</a>
	<a href="mh_goods-classify.html" class="tagc2">连衣裙</a>
	<a href="mh_goods-classify.html" class="tagc5">javascript</a>
	<a href="mh_goods-classify.html" class="tagc2">羽绒服<a>
	<a href="mh_goods-classify.html" class="tagc2" >连衣裙</a>
	<a href="mh_goods-classify.html" class="tagc1" >玩偶</a>
	<a href="mh_goods-classify.html" class="tagc2">羽绒服</a>
	<a href="mh_goods-classify.html" class="tagc5">javascript</a>
	<a href="mh_goods-classify.html" class="tagc2">连衣裙</a>
	<a href="mh_goods-classify.html" class="tagc2">相册代码</a>
	<a href="mh_goods-classify.html" class="tagc5">羽绒服表</a>
	<a href="mh_goods-classify.html" class="tagc2">javascript</a>
</div>















</div>
<!--end of-排名框-->







<!--推荐框-->
<div class="recommended">
	<div class="title"><a href="#"><h2>卖家推荐</h2></a></div>
		<div class="recommend"></div>
	<div class="content" id="rgoods">
		<!-- <ul>
			<li class="wall">
				<div class="pic">
			         <img onload="AutoResizeImage(this)"  src="images/linshi.png" >
		        </div>

				
					<a class="info" style="display:none" href="mh_goods-detail.html">
						<span class="price">￥20</span>
						<span class="area">金石滩</span>
						<span class="goods-name">商品商品商品商品商品商品商品商品商品</span>
						<form>
							<input class="like" type="submit" value="" title="点赞"/>
						</form>
				    </a>
				
		    </li>
		</ul> -->
	</div>
</div>

</div>






<div id="newMaterial">
	<div class="title"><a href="#"><h2>最新发布</h2></a></div>
	<div class="sc_menu" id="new_tr">
	   		<!-- <ul class="sc_menu">
			<li class="wall">
					<div class="pic">
				         <img onload="AutoResizeImage(this)"  src="images/linshi.png" >
			        </div>
					<a class="info" style="display:none" href="mh_goods-detail.html">
						<span class="price">￥20</span>
						<span class="area">金石滩</span>
						<span class="goods-name">商品商品商品商品商品商品商品商品商品</span>
						<form>
							<input class="like" type="submit" value="" title="点赞"/>
						</form>
					</a>
				</li>
			</ul> -->
	</div>
</div>
<!--end of -推荐框-->





<!--田原的 top&footer-->
<div id="footer">
	<span>Copyright&nbsp;<span id="bq">&copy;</span>&nbsp;I&nbsp;Max&nbsp;&nbsp;|&nbsp;&nbsp;联系我们:&nbsp;&nbsp;<a href="#">I&nbsp;Max</a></span>
</div>
<!--end of -田原的 top&footer-->




</body>
</html>