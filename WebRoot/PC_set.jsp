
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>“马上有”首页</title>
	<link rel="stylesheet" type="text/css" href="css/model.css" />
	<link rel="stylesheet" type="text/css" href="css/PC_set.css" />
</head>
<body>
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
					<a href="index.jsp">今日推荐</a>
				</li>
			</ul>
		</div>
		<div id="warpper2">
			<div class="warpper-body">
				<div class="warpper-top">
					<p>
						<a href="">个人中心</a>
					</p>
					<ul>
						<li>
							<a class="per_main" href="PC.jsp">个人主页</a>
						</li>
						<li class="setup">
							<a class="turn" >设置</a> <i class="icon-posicon-self1 "></i>
							<div class="set">
								<p class="set1">
									<a href="">设置</a>
								</p>
								<p>
									<a href="">个人信息</a>
								</p>
								<p>
									<a href="">账户安全</a>
								</p>
								<p>
									<a href="">我的等级</a>
								</p>
								<p>
									<a href="">增票资质</a>
								</p>
								<p>
									<a href="">收获地址</a>
								</p>
								<p>
									<a href="">快捷支付</a>
								</p>
								<p>
									<a href="">分享设置</a>
								</p>
								<p>
									<a href="">邮件订阅</a>
								</p>
								<p>
									<a href="">消费记录</a>
								</p>
								<p>
									<a href="">京东云盘</a>
								</p>
								<p>
									<a href="">应用授权</a>
								</p>
							</div>
						</li>
						<li class="comm">
							<a href="">消息</a>
							<span>(3)</span> <i class="icon-self2 icon-pos"></i>
							<div class="community">
								<p class="community1">
									<a href="" style="margin-left: 13px;">社区</a>
									<span>(3)</span>
								</p>
								<p>
									<a href="">评价晒单</a>
								</p>
								<p>
									<a href="">购买咨询</a>
								</p>
								<p class="message">
									<a href="">消息精灵</a>
									<span>(3)</span>
								</p>
							</div>
						</li>
					</ul>
					<span class="gift">
						<a href="">支付有礼</a>
					</span>
				</div>
				<div class="main">
					<div class="warpper-left">
						<div class="trade">
							<p>设置</p>
							<ul>
								<li>
									<a href="">个人信息</a>
								</li>
								<li>
									<a href="">账户安全</a>
								</li>
								<li>
									<a href="">我的级别</a>
								</li>
								<li>
									<a href="">收货地址</a>
								</li>
								<li>
									<a href="">快捷支付</a>
								</li>
								<li>
									<a href="">我的订单</a>
								</li>
								<li>
									<a href="">消费记录</a>
								</li>
								<li>
									<a href="">分享设置</a>
								</li>
							</ul>
							</div>
						</div>
						<div class="warpper-right">
							<div class="mt">
								<ul>
									<li>
										<a href="">基本信息</a>
									</li>
									<li>
										<a href="">头像照片</a>
									</li>
									<li>
										<a href="">更多个人信息</a>
									</li>
								</ul>
							</div>
							<div class="mc">
								<div class="form">
									<div class="item">
										<label for="" class="lab"> <em>*</em>
											昵称：
										</label>
										<input type="text" class="name"></div>
									<div class="item sex">
										<label for="" class="lab"> <em>*</em>
											性别：
										</label>
										<input type="radio" name="sex">
										<span>男</span>
										<input type="radio" name="sex">
										<span>女</span>
										<input type="radio" name="sex" checked="checked">
										<span>保密</span>
									</div>
									<div class="item">
										<label for="" class="lab">生日：</label>
										<div class="birthday">
											<select name="birthdayyear" id="">
												<option value="请选择">请选择</option>
												<option value="">2001</option>
												<option value="">2002</option>
												<option value="">2003</option>
											</select>
											<span>年</span>
											<select name="birthdayyear" id="">
												<option value="请选择">请选择</option>
												<option value="">2001</option>
												<option value="">2002</option>
												<option value="">2003</option>
											</select>
											<span>月</span>
											<select name="birthdayyear" id="">
												<option value="请选择">请选择</option>
												<option value="">2001</option>
												<option value="">2002</option>
												<option value="">2003</option>
											</select>
											<span>日</span>
											<span>填写生日有惊喜哦~</span>
										</div>
									</div>
									<div class="item">
										<label for="" class="lab">兴趣爱好：</label>
										<div class="hobby">
											<span>请选择您感兴趣的分类，给您最精准的推荐</span>
											<ul>
												<li class="hob">图书/音像/数字商品</li>
												<li class="hob">家用电器</li>
												<li class="hob">手机/数码</li>
												<li class="hob">图书/音像/数字商品</li>
												<li class="hob">家用电器</li>
												<li class="hob">手机/数码</li>
												<li class="hob">图书/音像/数字商品</li>
												<li class="hob">家用电器</li>
												<li class="hob">手机/数码</li>
											</ul>
										</div>
									</div>
									<div class="item email">
										<label for="" class="lab">邮箱：</label>
										<span>513475041@qq.com</span>
										<a href="">立即验证</a>
									</div>
									<div class="item">
										<label for="" class="lab">真实姓名：</label>
										<input type="text" class="name"></div>
									<div class="item">
										<label for="" class="lab">所在地：</label>
										<div class="place">
											<select name="place1" id="">
												<option value="请选择">请选择</option>
												<option value="">2001</option>
												<option value="">2002</option>
												<option value="">2003</option>
											</select>
											<select name="place2" id="">
												<option value="请选择">请选择</option>
												<option value="">2001</option>
												<option value="">2002</option>
												<option value="">2003</option>
											</select>
											<select name="place3" id="">
												<option value="请选择">请选择</option>
												<option value="">2001</option>
												<option value="">2002</option>
												<option value="">2003</option>
											</select>
										</div>
									</div>
									<div class="item">
										<label for=""></label>
										<input type="text" class="place-detail"></div>
								</div>
								<div class="item">
									<label for=""></label>
									<a href="" class="btn">提交</a>
								</div>
								<div  class="user-info">
									<img src="images/myjd-bg2.png" alt="">
									<div class="info-m">
										<ul>
											<li> <b>用户名：</b>
												314141412
											</li>
											<li class="u-level">
												<i></i>
												金牌会员
											</li>
											<li class="shop-level">
												购物行为评级:
												<i></i>
											</li>
											<li>会员类型：个人用户</li>
										</ul>
									</div>
									<p class="change">
										注：改手机和邮箱请到
										<a href="">账户安全</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

	<jsp:directive.include file="bottom.jsp"/>
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/jQuery-Msy.js"></script>
	<script type="text/javascript" src="js/jQuery-top.js"></script>
</body>
</html>