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
	<title>订单结算</title>
	<link rel="stylesheet" type="text/css" href="css/model.css" />
	<link rel="stylesheet" type="text/css" href="css/pc-orders.css" />
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/jQuery-Msy.js"></script>
	<script type="text/javascript" src="js/jQuery-top.js"></script>
	<script type="text/javascript" src="js/pcorders.js"></script>
</head>
<body>
	<jsp:directive.include file="top.jsp"/>

	<div id="myhome">

		<form name="subOrder" action="main/addOrder" method="post">
		<div class="main">
			<div class="head">
				<h2>填写并核对订单信息</h2>
			</div>
			<div class="">
				<div id="one" class="step step-current">
					<div class="step-title"> <strong>收货人信息</strong>
						<span>
							<a href="">保存收货人信息</a>
						</span>
					</div>
					<div class="one-content">
						<div class="box-wrap">
							<div class="box">
							<script>
								function addElement() {
									var person = document.createTextNode(form1.person.value); //创建收货人节点
									var address = document.createTextNode(form1.address.value); //创建地址节点
									var phone = document.createTextNode(form1.phone.value);	//创建联系方式节点
									
									if (person.length<1) {
										alert("错误");
										return false;
									};
									//创建td类型的Element节点
									var s_person = document.createElement("span");
									var s_address = document.createElement("span");
									var s_phone = document.createElement("span");
	
									var div = document.createElement("div");
									div.setAttribute("class","op");
									s_person.appendChild(person);
									s_address.appendChild(address);
									s_phone.appendChild(phone);

									div.appendChild(s_person);
									div.appendChild(s_address);
									div.appendChild(s_phone);

									
									var tComment = document.getElementById("comment");
									tComment.appendChild(div);
									form1.person.value = "";
									form1.address.value = "";
									form1.phone.value = "";

								}
							</script>
								<div id="comment"></div>
								<form name="form1" method="post" action="">
									<div class="consignee-form">

										<div class="list" id="name-div">
											<span class="lable"> <em>*</em>
												收货人：
											</span>
											<div class="field">
												<input type="text" class="textbox" id="consignee_name" name="person" maxlength="20" onblur=""></div>
											<span class="status error" id="">请您填写收货人姓名</span>
										</div>
										<!--list name-div-->

										<div class="list full-address" id="address-div">
											<span class="lable"> <em>*</em>
												详细地址：
											</span>
											<div class="field" style="width:554px">
												<span class="fl selected-address" id="areaNameTxt"></span>
												<input type="text" class="textbox" id="consignee_address" name="address" maxlength="50" onblur=""></div>
											<span class="status error" id="">请您填写收货人详细地址</span>
										</div>
										<!--list full-address-->

										<div class="list" id="call-div">
											<span class="lable">
												<em>*</em>
												手机号码：
											</span>
											<div class="field">
												<div class="phone">
													<input type="text" class="textbox" id="consignee_mobile" name="phone" maxlength="11" onblur=""></div>
											</div>
											<span class="status error" id="">请您填写收货人手机号码</span>
										</div>
										<!--list call-div-->
									</div>
									

								<div class="form-btn group">
									<a class="btn-submit">
										<span id="saveConsigneeTitleDiv" onClick = "addElement()">保存收货人信息</span>
									</a>
									<!-- <div class="loading loading-1" style="display:none"> <b></b>
										正在提交信息，请等待！
									</div> -->
								</div>
								<!--form-btn group-->
								<!--consignee-form-->
								</form>

							</div>
							<!--box-->
						</div>
						<!--box-wrap-->
					</div>
					<!--one-content-->
				</div>
				<!--step step-current-->
			</div>

			<div class="shoplist">
				<p class="shoplist1">商品清单</p>
				<table>
					<thead>
						<tr>
							<th>商品</th>
							<th>价格</th>
							<th>优惠</th>
							<th>数量</th>
							<th>库存状态</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<img src='<s:property value="#session.goodsInfo.gdPicture.substring(1,#session.goodsInfo.gdPicture.indexOf('#',1))"/>' alt="">
								<p class="shopname"><s:property value="#session.goodsInfo.gdGoodsname"/></p>
								<p class="shopnumber">商品编号：<s:property value="#session.goodsInfo.gdGoodsid"/></p>
								<p class="shopreturn">该商品不支持7天无理由退换</p>
							</td>
							<td>&yen;<s:property value="#session.goodsInfo.gdPrice"/></td>
							<td>
								<input type="submit" value="赠逗20"></td>
							<td>&times;<input type="hidden" name="goodsNum" value="<s:property value='#session.buyNum'/>"/><s:property value="#session.buyNum"/></td>
							<td><s:property value="#session.goodsInfo.gdSum"/></td>
						</tr>
					</tbody>
				</table>
				<div class="settle-account">
					<p>
						<span class="settle-num "><s:property value="#session.buyNum"/></span>
						&nbsp;
						<span class="settle1">件商品，总金额：</span>
						<span class="money">&yen;<s:property value="#session.buyNum*#session.goodsInfo.gdPrice"/></span>
					</p>
					<p>
						<span class="settle2">返现：</span>
						<span class="money">-&yen;0.00</span>
					</p>
					<p>
						<span class="settle3">运费：</span>
						&nbsp;&nbsp;
						<span class="money">&yen;0.00</span>
					</p>
					<p>
						<span class="settle4">应付总额：</span>
						&nbsp;
						<span class="money">&yen;<s:property value="#session.buyNum*#session.goodsInfo.gdPrice"/></span>
					</p>
				</div>
				<!--settle-account-->

			</div>
			<!--shoplist-->
			<div class="settle-accounts">
				<p>
					应付总额：
					<span>&yen;<s:property value="#session.buyNum*#session.goodsInfo.gdPrice"/></span>
					元
					<input type="submit"  value="提交订单"/>
				</p>
			</div>
		</div>
		<!--main-->
		</form>
	</div>
	<!--myhome-->
	<jsp:directive.include file="bottom.jsp"/>
</body>
</html>