<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@ taglib uri="/struts-tags" prefix="s"%>
	<jsp:directive.include file="navigation.jsp"/>
	 <div class="warpper1"> 
				<div class="navgitor">
					<div class="logo">
						<a href="index.jsp" class="navgitor-logo">
							<img src="images/logo.png" alt="首页">
						</a>
					</div><!--logo-->
					<div class="navgitor-search">
						<form name="" class="index-form" id="indexform" action="main/getGoodsListByKey" method="post">
							<a href="" class="navgitoraa">新品
								<i class="icon-self icon-new"></i>
							</a>
							<i class="icon-self icon-find"></i>
							<input type="text" name="keyWord" value="" class="search-in">
							<input type="submit" class="search-push"  value="搜索">
						</form>
						<!--
						<form name="" action="" method="" class="index-form" id="indexform">
							<lable class="navgitoraa">新品<i class="icon-self icon-new"></i></lable>
							<i class="icon-self icon-find"></i>
							<input type="text" name="user" value="" class="search-in">
							<input type="submit" class="search-push"  value="搜索">
						</form>-->

					</div><!--navgitor-search-->	
				</div><!--navgitor-->
			 </div> 
