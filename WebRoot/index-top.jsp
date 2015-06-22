<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<jsp:directive.include file="navigation.jsp"/>
	<div class="navgitor">
			<div class="logo">
				<a href="#" class="navgitor-logo">
					<img src="images/logo-index.png" alt="首页">
				</a>
			</div>
			<div class="navgitor-search">
				<form name="" class="index-form" id="indexform" action="main/getGoodsListByKey" method="post">
					<a href="" class="navgitoraa">新品
						<i class="icon-self icon-new"></i>
					</a>
					<i class="icon-self icon-find"></i>
					<input type="text" name="keyWord" value="<s:property value="keyWord"/>" class="search-in">
					<input type="submit" class="search-push"  value="搜索">
				</form>
				<div class="popular">
						<ul>
							<li>热门搜索：</li>
							<li><a href="goodsList.jsp" class="index-selected">正妆</a></li>
							<li class="popular-li"><a href="goodsList.jsp">蝴蝶节</a></li>
							<li class="popular-li"><a href="goodsList.jsp">娱乐生活</a></li>
							<li class="popular-li"><a href="goodsList.jsp">日用百货</a></li>
							<li class="popular-li"><a href="goodsList.jsp">鞋包服饰</a></li>
							<li class="popular-li"><a href="goodsList.jsp">交通工具</a></li>
							<li class="popular-li"><a href="goodsList.jsp">电子产品</a></li>
							<li class="popular-li"><a href="goodsList.jsp">时尚卫衣</a></li>
							<li class="popular-li"><a href="goodsList.jsp">护肤品</a></li>
							<li class="popular-li"><a href="goodsList.jsp">食品</a></li>	
						</ul>
				</div>
			</div>		
		</div><!--navgitor-->
