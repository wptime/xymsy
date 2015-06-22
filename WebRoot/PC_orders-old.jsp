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
		
		<div class="main">
			<div class="head">
				<h2>填写并核对订单信息</h2>
			</div>
			<div class="">
				<div id="one" class="step step-current">
					<div class="step-title">
						<strong>收货人信息</strong>
						<span>
							<a href="">保存收货人信息</a>
						</span>
					</div>
					<div class="one-content">
						<div class="box-wrap">
							<div class="box">
								<form>
									<div class="consignee-form">

										<div class="list" id="name-div">
											<span class="lable"><em>*</em>收货人：</span>
											<div class="field">
												<input type="text" class="textbox" id="consignee_name" name="" maxlength="20" onblur="">
											</div>
											<span class="status error" id="">请您填写收货人姓名</span>
										</div><!--list name-div-->

										<div class="list select-address">
											<span class="lable"><em>*</em>所在地区：</span>
											<div class="field" style="width:810px;">
				  								<span id="span_area" style="float:left">
				  									<span id="span_province">
				  										<select id="consignee_province" name="consigneeParam.provinceId" onchange="loadCitys()">
				  										<option value="">请选择：</option>
				  										<option value="1">北京*</option>
				  										<option value="2">上海*</option>
				  										<option value="3">天津*</option>
				  										<option value="4">重庆*</option>
				  										<option value="5">河北*</option>
				  										<option value="6">山西*</option>
				  										<option value="7">河南*</option>
				  										<option value="8">辽宁*</option>
				  										<option value="9">吉林*</option>
				  										<option value="10">黑龙江*</option><option value="11">内蒙古*</option><option value="12">江苏*</option>
				  										<option value="13">山东*</option>
				  										<option value="14">安徽*</option>
				  										<option value="15">浙江*</option>
				  										<option value="16">福建*</option>
				  										<option value="17">湖北*</option>
				  										<option value="18">湖南*</option>
				  										<option value="19">广东*</option>
				  										<option value="20">广西*</option>
				  										<option value="21">江西*</option>
				  										<option value="22">四川*</option>
				  										<option value="23">海南*</option>
				  										<option value="24">贵州*</option>
				  										<option value="25">云南*</option>
				  										<option value="26">西藏*</option>
				  										<option value="27">陕西*</option>
				  										<option value="28">甘肃*</option>
				  										<option value="29">青海*</option>
				  										<option value="30">宁夏*</option>
				  										<option value="31">新疆*</option>
				  										<option value="32">台湾*</option>
				  										<option value="42">香港*</option>
				  										<option value="43">澳门*</option>
				  										<option value="84">钓鱼岛*</option></select>
				  									</span>
				  									<span id="span_city">
				  										<select id="consignee_city" name="consigneeParam.cityId" onchange="loadCountys()">
				  											<option value="" selected="">请选择：</option>
				  										</select>
				  									</span><!--span_city-->
				  									<span id="span_county">
				  										<select id="consignee_county" name="consigneeParam.countyId" onchange="loadTowns()">
				  											<option value="" selected="">请选择：</option>
				  										</select>
				  									</span>
				  									<span id="span_town" style="display: none;">
				  										<select id="consignee_town" name="consigneeParam.townId" onblur="check_Consignee('area_div')" onchange="setTownName()">
				  											<option value="" selected="">请选择：</option>
				  										</select>
				  									</span>
				  								</span><!--span_area-->
				  								<span class="form-tip">
				  									<span class="status error" id="area_div_error"></span>&nbsp;&nbsp;标“*”的为支持货到付款的地区,
				  									<a style="font-size: 12.5px" target="_blank" href="http://help.jd.com/help/distribution-768-0-0-0-0-1407121263203.html" id="codHelpUrl">查看货到付款地区</a>
				  								</span><!--form-tip-->
	            							</div><!--field-->
										</div><!--list select-address-->

										<div class="list full-address" id="address-div">
											<span class="lable"><em>*</em>详细地址：</span>
											<div class="field" style="width:554px">
												<span class="fl selected-address" id="areaNameTxt"></span>
												<input type="text" class="textbox" id="consignee_address" name="" maxlength="50" onblur="">
											</div>
											<span class="status error" id="">请您填写收货人详细地址</span>
										</div><!--list full-address-->

										<div class="list" id="call-div">
											<span class="lable">
												<em>*</em>手机号码：
											</span>
											<div class="field">
												<div class="phone">
													<input type="text" class="textbox" id="consignee_mobile" name="" maxlength="11" onblur="">
													<em>或</em>
													<span>固定电话：</span>
													<input type="text" class="textbox" id="consignee_phone" name="" maxlength="20" onblur="">
												</div>												
											</div>
											<span class="status error" id="">请您填写收货人手机号码</span>
										</div><!--list call-div-->

										<div class="list" id="email-div">
											<span class="lable"><em></em>邮箱：</span>
											<div class="field">
												<input type="text" class="textbox" id="consignee_email" name="" maxlength="20" onblur="">
												<span id="tip">用来接收订单提醒邮件，便于您及时了解订单状态</span>
											</div>
										</div><!--list email-div-->

									</div><!--consignee-form-->
								</form>

								<div class="form-btn group">
									<a href="#none" class="btn-submit">
										<span id="saveConsigneeTitleDiv" style="padding-right: 20px;height: 30px;padding-top: 5px;padding-bottom: 7px;font-size: 15px;color:#fff;font-weight:normal">保存收货人信息</span>
									</a>
									<div class="loading loading-1" style="display:none">
										<b></b>正在提交信息，请等待！
									</div>
								</div><!--form-btn group-->

							</div><!--box-->
						</div><!--box-wrap-->
					</div><!--one-content-->
				</div><!--step step-current-->
			</div>
			<div class="payway">
				<p class="payway1">支付及配送方式
					<span>如需修改，请先保存收货人信息</span>
				</p>
				<p class="onlinepay">在线支付</p>
				<p class="selectpay">快递运输&nbsp;&nbsp;由商家选择合作快递为您配送</p>
				<div class="payway-in">
					<p class="payway-in1">
						支付及配送方式
						<span>
							<a href="">保存支付及配送方式</a>
						</span>
					</p>
					<div class="payment-way">
						<p class="payment-wayh">支付方式</p>
						<div class="payment-wayh1 payment-top">
							<input type="radio" name="payway"/>
							<p>
								货到付款
								<span>
									运货上门后再付款，支持现金、POS机刷卡、支票支付
									<a href="">查看服务及配送范围</a>
								</span>
							</p>
						</div><!--payment-wayh1 payment-top-->
						<div class="payment-wayh1">
							<input type="radio" name="payway"/>
							<p>
								在线支付 
								<span>
									即时到账，支持绝大多数银行借记卡及部分银行信用卡
									<a href="">查看银行及限额</a>
								</span>
							</p>
						</div><!--payment-wayh1-->
						<div class="payment-wayh1">
							<input type="radio" name="payway"/>
							<p>分期付款 
								<span>
									信用卡网上支付订单，按月还款，减轻资金周转压力
									<a href="">查看分期付款帮助</a>
								</span>
							</p>
						</div><!--payment-wayh1-->
						<div class="payment-wayh1">
							<input type="radio" name="payway"/>
							<p>
								公司转账 
								<span>
									通过块钱平台转账 转账后1-3个工作日内到账
									<a href="">查看账户信息</a>
								</span>
							</p>
						</div><!--payment-wayh1-->
						<div class="payment-wayh1">
							<input type="radio" name="payway"/>
							<p>
								邮局汇款 
								<span>
									通过快钱平台收款 汇款后1-3个工作日到账
									<a href="">查看帮助</a>
								</span>
							</p>
						</div><!--payment-wayh1-->
					</div><!--payment-way-->
					<div class="sent-way">
						<p class="sent-wayp">配送方式</p>
						<div class="sent-jdh sent-jdhone">
							<div class="sentway-11">
								<input type="radio" name="sentway-fast" class="sent-input" id="sentway-1" checked="checked"/>
								<label for="sentway-1">
									<p class="sent-jd1">
										京东快递
									</p>
								</label>
							</div>
							<span>
								此订单预约配送，您可以选择指定的时间段
							</span>
							
						</div><!--sent-jdh sent-jdhone-->
						<div class="sent-jd">
							<div class="sent-jdh">
								<input type="radio" name="sellway" class="sent-input" checked="checked"/>
								<p class="sent-jd1">
									京东快递
									<span>
										此订单预约配送，您可以选择指定的时间段
									</span>
								</p>
							</div><!--sent-jdh-->
							<div class="sent-time">
								<div class="point-time">
									<p class="sent-timep">运货时间：</p>
									<input type="radio"  class="sent-radio" checked="checked"/>
									<p class="sent-timep1">&nbsp; 指定送货时间</p>
									<div class="sent-time2">
										<input type="text" value="2014-8-19" class="time-input1"/>
										<input type="text" value="（周二）" class="time-input2"/>
										<input type="text" value="9:00-19:00" class="time-input3"/>
										<div class="time-imgs" style="float:left;">
											<i class="time-img"></i>
											<div class="sent-time3">
												<table cellpadding="0" cellspacing="0">
													<thead>
														<tr>
															<th class="atime">时间段</th>
															<th>8-18<br/>今天</th>
															<th>8-19<br/>周二</th>
															<th>8-20<br/>周三</th>
															<th>8-21<br/>周四</th>
															<th>8-22<br/>周五</th>
															<th>8-23<br/>周六</th>
															<th>8-24<br/>周日</th>
															<th>8-25<br/>周一</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>9:00-19:00</td>
															<td>可选</td>
															<td>可选</td>
															<td>可选</td>
															<td>可选</td>
															<td>可选</td>
															<td>可选</td>
															<td>可选</td>
															<td>可选</td>
														</tr>
													</tbody>
												</table>
											</div><!--sent-time3-->
										</div><!--time-imgs-->
									</div><!--sent-time2-->
								</div><!--point-time-->
								<div class="warm-prompt">
									<p>温馨提示：</p>
									<p>1.我们会努力按照您指定的时间配送，但因天气、交通等各类因素影响，您的订单有可能会有延误现象！</p>
									<p>2.部分服务仅在京东配送区域提供，非京东配送区域无法选择！</p>
								</div><!--warm-prompt-->	
							</div><!--sent-time-->
						</div><!--sent-jd-->
						<div class="sent-sell">
							<div class="sell-jdh sell-jdhone">
								<input type="radio" name="sentway-fast" class="sell-input" id="sentway-2" />
								<label for="sentway-2">
									<p class="sell-jd1">
										上门自提
									</p>
								</label>
									<span>自提时付款，支持现金、POS刷卡、支票支付</span>
									<a href=""> 查看自提流程</a>
								
							</div>
							<div class="sell-inside">
								<div class="sell-jdh ">
									<input type="radio" name="sellways" class="sell-input" checked="checked"/><p class="sell-jd1">上门自提<span>自提时付款，支持现金、POS刷卡、支票支付</span><a href=	""> 查看自提流程</a></p>
								</div>
								<h4 class="way-selector">全部自提点：</h4>
								<div class="store-selector-in">
									<div class="inone index-back">
										<div class="text1">
											<p> &nbsp;南宁市全部区域</p>
										</div>
										<div class="text2"></div>
									</div>
									<div class="intwo">
										<div class="inthr"><p><a href="">全部区域</a></p></div>
										<div class="infor"><p><a href="">其他区域</a></p></div>
									</div>
								</div><!--store-selector-in-->
								<div class="item-selected item-selected-1">
									<div class="lable">
								    	<input type="radio" name="radio" id="radio-1" class="radio-1-1" checked="checked" />
								    	<label for="radio-1"><p>西乡塘自提点</p></label>
									</div>
									<div class="field">
										<span class="tip">地址：南宁市西乡塘科园大道广西税务干部学校对面科园西一巷瑞达花园斜对面 0771-3821600 </span><a href="">[详细地图]</a>
									</div>
								</div><!--item-selected-->
								<div class="item-selected item-selected-2">
									<div class="lable">
								    	<input type="radio" name="radio" id="radio-2" class="radio-2-2" />
								    	<label for="radio-2"><p>西乡塘自提点</p></label>
									</div>
									<div class="field">
										<span class="tip">地址：南宁市西乡塘科园大道广西税务干部学校对面科园西一巷瑞达花园斜对面 0771-3821600 </span>
										<a href="">[详细地图]</a>
									</div>
								</div><!--item-selected-->
								<p class="time-selector">提货日期：</p>
								<div class="daytime">
									<div id="store-selector">
										<div class="text1">
											<p> &nbsp;8月19日[周二]</p>
										</div>
										<div class="text2"></div>
									</div>
									<div class="day-select">
										<ul>
											<li>&nbsp;8月19日[周二]</li>
											<li>&nbsp;8月19日[周二]</li>
											<li>&nbsp;8月19日[周二]</li>
											<li>&nbsp;8月19日[周二]</li>
											<li>&nbsp;8月19日[周二]</li>
										</ul>
									</div>
								</div><!--daytime-->
								<div class="warm-prompt2">
									<p>温馨提示：</p>
									<p>1、您选择的时间可能会因库存不足等因素导致订单延迟，请您谅解！</p>
									<p>2、我们会在您选定提货日期的前一天处理您的订单，在此之前您的订单处于暂停状态。</p>
								</div>
							</div><!--sell-inside-->
						</div><!--sent-sell-->
					</div><!--sent-way-->
					<div class="save-sub">
						<input type="submit" value="保存支付及配送方式" class="save-submit"/>
					</div>
				</div><!--payway-in-->
			</div><!--payway-->
			<div class="invoice">
				<p class="invoice1">发票信息
					<span>如需修改，请先保存收货人信息</span>
				</p>
				<p class="noinvoice">不开发票</p>
				<p class="remark">备注：如果商品由第三方卖家销售，发票内容由其卖家决定，发票由卖家开具并寄出</p>
				<div class="invoice-inside">
					<p class="invoice-save">发票信息
						<span><a href="">保存发票信息</a></span>
					</p><!--invoice-save-->
					<div class="invoice-save2">
						<strong>类型和抬头</strong>
						<div class="invoice-personal">
							<input type="radio" name="invty" />&nbsp;个人普通发票
							<span>
								<a href="">修改</a>
								<a href="">删除</a>
							</span>
						</div>
						<div class="invoice-new">
							<input type="radio" name="invty" />&nbsp;使用新的发票信息
						</div>
						<div class="invoice-open">
							<div class="open1">
								<p>发票开具方式：</p>
								<div class="invoice-type">
									<div class="invoice-type1">
										<input type="radio" name="kty"/>&nbsp;普通发票（纸质）
									</div>
									<div class="invoice-type2">
										<input type="radio" name="kty"/>&nbsp;增值税发票
									</div>
								</div>
							</div>
							<div class="open2">
								<p>发票抬头：</p>
								<div class="open-up">
									<div class="open-up1">
										<input type="radio" name="tty" />&nbsp;个人
									</div>
									<div class="open-up2">
										<input type="radio" name="tty"/>&nbsp;单位
									</div>
								</div>
							</div>
						</div><!--invoice-open-->
						<div class="invoice-content">
							<strong>发票内容</strong>
							<div class="asks">
								<span class="invoice-ask"></span>
								<div class="ask-inside">
									<a>我下单使用余额、优惠券、京东卡的金额会开具发票吗？</a><br/>
									<a>请问我购买的商品发票由谁来开具？</a><br/>
									<a>发票开具非明细内容是否享受保修？</a><br/>
									<a>更多>></a><br/>
								</div>
							</div>
						</div><!--invoice-content-->
						<div class="invoice-content-selected">
							<p>发票内容：</p>
							<div>
								<input type="radio" name="invoice" />&nbsp;明细
							</div>
							<div>
								<input type="radio"  name="invoice"/>&nbsp;办公用品（附购物清单）
							</div>
							<div>
								<input type="radio"  name="invoice"/>&nbsp;电脑配件
							</div>
							<div>
								<input type="radio" name="invoice" />&nbsp;耗材
							</div>
						</div><!--invoice-content-selected-->
						<div class="message-save">
							<input type="submit" value="保存发票信息"/>
						</div>
					</div><!--invoice-save2-->
				</div><!--invoice-inside-->
			</div><!--invoice-->
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
								<img src="images/biscuit.png" alt="">
								<p class="shopname">丹麦皇冠曲奇200g*3进口零食品Danisa/皇冠曲奇饼干</p>
								<p class="shopnumber">商品编号：1059918626</p>
								<p class="shopreturn">该商品不支持7天无理由退换</p>
							</td>
							<td>&yen;58.00</td>
							<td> <input type="submit" value="赠逗20"> </td>
							<td>&times;1</td>
							<td>有货</td>
						</tr>
					</tbody>
				</table>
				<div class="settle-account">
					<p> 
						<span class="settle-num ">1</span>&nbsp;
						<span class="settle1">件商品，总金额：</span> 
						<span class="money">&yen;58.00</span> 
					</p>
					<p>
						<span class="settle2">返现：</span>
						<span class="money">-&yen;0.00</span>
					</p>
					<p>
						<span class="settle3">运费：</span>&nbsp;&nbsp;
						<span class="money">&yen;0.00</span>
					</p>
					<p>
						<span class="settle4">应付总额：</span>&nbsp;
						<span class="money">&yen;58.00</span>
					</p>
				</div><!--settle-account-->
				<div class="order-coupon" data-bind="coupon">
				</div>
				<div class="extra">
					<div class="extra1">
						<div class="extra2"> 
							<i class="extra-img extra-gif"></i>
							<p>使用优惠券抵消部分总额</p>
						</div>
						<div class="extra-in">
							<p class="discount1">可用优惠券
								<span>(0)</span>
							</p>
							<p class="discount2">
								此订单暂无可用的优惠券。您可以&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="">查看所有优惠券</a>
								了解使用限制。&nbsp;&nbsp;&nbsp;
								<a href="">[了解京东优惠券规则]</a>
							</p>
							<p class="ensure">
								为保障您的账户资金安全，优惠券暂不可用，请先
								<a href="">[开启支付密码]</a>
							</p>
							<p class="ifhave">
								有优惠券兑换码？
								<a href="">[点击输入兑换码]</a>
								<a href="" class="ifhave1">有实体券？</a>
							</p>
							<p class="alluse">
								共使用了 <span>0</span> 张优惠券　可以优惠 
								<span>0.00</span> 元
							</p>
						</div><!--extra-in-->
					</div><!--extra1-->
					<div class="extra1">
						<div class="extra2"> 
							<i class="extra-img extra-gif"></i>
							<p>京东卡</p>
						</div>
						<div class="jdk">
							<p>
								提示：一个订单最多能使用49张京东卡，京东卡不可购买金银投资类商品。
								<a href="">[了解京东卡]</a>
							</p>
							<p class="usejdk">使用京东卡支付</p>
							<p class="inputbox">请输入您手中京东卡的密码：
								<input type="text" class="jdkma"/>- 
								<input type="text" class="jdkma"/>- 
								<input type="text" class="jdkma"/>- 
								<input type="text" class="jdkma"/>
								<input type="submit" value="使用" id="usesub"/>&nbsp;密码只包含数字0-9，大写字母A-F
							</p>
							<p class="canuse">可使用的京东卡：</p>
							<table>
								<tbody>
									<tr>
										<th class="cardnum">卡号</th>
										<th class="card1">面值</th>
										<th class="card3">本次使用</th>
										<th class="card4">余额</th>
										<th class="card5">有效期</th>
										<th class="card6">类型</th>
									</tr>
								</tbody>
							</table>
							<p class="totalluse">共使用了 
								<span>0</span> 
								张京东卡可以优惠 
								<span>0.00</span> 元
							</p>
							<p class="forsafe">
								为保障您的账户资金安全，京东卡暂不可用，请先 
								<a href="">开启支付密码</a>
							</p>
						</div><!--jdk-->
					</div><!--extra1-->
					<div class="extra1">
						<div class="extra2"> 
							<i class="extra-img extra-gif"></i>
							<p>京东E卡（此卡不能与京东卡同时使用）</p>
						</div>
						<div class="jdk">
							<p>
								提示：一个订单最多能使用49张京东E卡，京东卡不可购买金银投资类商品。
								<a href="">[了解京东E卡]</a>
							</p>
							<p class="usejdk">使用京东E卡支付</p>
							<p class="inputbox">请输入您手中京东E卡的密码：
								<input type="text" class="jdkma"/>- 
								<input type="text" class="jdkma"/>- 
								<input type="text" class="jdkma"/>- 
								<input type="text" class="jdkma"/>
								<input type="submit" value="使用" id="usesub"/>&nbsp;密码只包含数字0-9，大写字母A-F
							</p>
							<p class="canuse">可使用的京东E卡：</p>
							<table>
								<tbody>
									<tr>
										<th class="cardnum">卡号</th>
										<th class="card1">面值</th>
										<th class="card3">本次使用</th>
										<th class="card4">余额</th>
										<th class="card5">有效期</th>
										<th class="card6">类型</th>
									</tr>
								</tbody>
							</table>
							<p class="totalluse">共使用了 <span>0</span> 张京东E卡可以优惠 <span>0.00</span> 元</p>
							<p class="forsafe">
								为保障您的账户资金安全，京东卡暂不可用，请先 
								<a href="">开启支付密码</a>
							</p>
						</div><!--jdk-->
					</div><!--extra1-->
					<div class="extra1">
						<div class="extra2"> 
							<i class="extra-img extra-gif"></i>
							<p>使用京豆支付</p>
						</div>
						<div class="dou">
							<p class="thisuse">本次使用&nbsp;&nbsp;
								<input type="text" class="thisuse1"/>京豆支付&nbsp;&nbsp;
								<input type="submit" value="使用" class="thisuse2"/>
							</p>
							<p class="yourdou">
								您有京豆<span class="numdou">0</span>
								个，本次可用<span class="numdou1">0</span>个<span class="knowndou">[了解什么是京豆]</span>
							</p>
							<p class="forsafe1">
								为保障您的账户资金安全，京豆暂时不可用，请先 
								<a href="">开启支付密码</a>
							</p>
						</div><!--dou-->
					</div><!--extra1-->
					<div class="extra1">
						<div class="extra2"> 
							<i class="extra-img extra-gif"></i>
							<p>添加订单备注</p>
						</div>
						<div></div>
					</div><!--extra1-->
				</div><!--extra-->	
			</div><!--shoplist-->
			<div class="settle-accounts">
		<p>
			应付总额：<span>&yen;58.00</span> 
			元<input type="submit"  value="提交订单"/>
		</p>
			</div>
		</div><!--main-->
		
	</div><!--myhome-->
	<jsp:directive.include file="bottom.jsp"/>
</body>
</html>