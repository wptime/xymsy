<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div id="top">
		<div class="tytop">
			<ul class="top-left">
				<li>缺什么，</li>
				<li>马上有！&nbsp;</li>
				
				<s:if test = "#session.user == null">
					<li class="blue">&nbsp;<a href="login.jsp" style="color:#1cabb4;">亲，请登录</a>&nbsp;</li>
					<li>&nbsp;<a href="register.jsp">免费注册</a></li>
				</s:if>
				<s:else>
					<li><strong class="blue"> <s:property value="#session.user.usNickname"/> </strong>,欢迎您光临本站!&nbsp;&nbsp;/&nbsp;&nbsp;<a href="account/logout">注销</a></li>
				</s:else>
				
			</ul>
			<ul class="top-right">
				<li class="index">
					<a href="main/findUser" class="index-top">个人中心</a>
					<i class="icon-self icon-pos"></i>
					<div class="self-all">
						<p><a href="main/findUser">已买到的宝贝</a></p>
						<p><a href="PC.jsp">爱逛街</a></p>
						<p><a href="PC.jsp">拾货</a></p>
						<p><a href="PC.jsp">我的足迹</a></p>
						<p><a href="PC.jsp">我的上新</a></p>
						<p><a href="PC.jsp">我的优惠</a></p>
					</div>
				</li>
				<li class="index">
					<i class="icon-self icon-shop"></i> 
					<a href="#" class="index-top">购物车
						<span style="color:#1cabb4;font-weight:bold;">0</span> </a>
					<i class="icon-self icon-pos"></i>
					<div class="self-car self-all">
						<p>
							您的购物车里没有任何宝贝
							<input type="button" value="查看我的购物车"/>
						</p>
							
					</div>
				</li>
				<li class="index">
					<i class="icon-self icon-save"></i>
					<a href="#" class="index-top">收藏夹</a>
					<i class="icon-self icon-pos"></i>
					<div class="self-all">
						<p><a href="#">收藏的宝贝</a></p>
						<p><a href="#">收藏的店铺</a></p>
					</div>
				</li>
				<li class="index">
					<a href="person/shopStatu" class="index-top">卖家中心</a>
					<i class="icon-self icon-pos"></i>
					<div class="self-all">
						<p><a href="person/shopStatu">免费开店</a></p>
						<p><a href="#">已卖出的宝贝</a></p>
						<p><a href="person/getStoreGoodsList">出售中的宝贝</a></p>
						<p><a href="#">卖家服务市场</a></p>
						<p><a href="#">卖家培训中心</a></p>
					</div>
				</li>
				<li >
					|&nbsp;&nbsp;&nbsp;
					<a href="#" >联系客服</a>&nbsp;&nbsp;
				</li>
				<li class="index">
					<a href="#" class="index-top" style="margin:0 auto">网站导航</a>
					<i class="icon-self icon-nav"></i>
					<div class="self-tour">
						<div class="tour-or" style="border:none;">
							<p style="color:#ea4444">主题市场</p>
							<div class="tour-er">
								<ul>
									<li><a href="goodsList.jsp" target="_blank">淘宝女人</a></li>
									<li><a href="goodsList.jsp" target="_blank">运动派</a></li>
									<li><a href="goodsList.jsp" target="_blank">情侣</a></li>
									<li><a href="goodsList.jsp" target="_blank">淘宝男人</a></li>
									<li><a href="goodsList.jsp" target="_blank">孕婴童</a></li>
									<li><a href="goodsList.jsp" target="_blank">家居</a></li>
									<li><a href="goodsList.jsp" target="_blank">美容护肤</a></li>
									<li><a href="goodsList.jsp" target="_blank">中老年</a></li>
									<li><a href="goodsList.jsp" target="_blank">美食</a></li>
									<li><a href="goodsList.jsp" target="_blank">美嫁新娘</a></li>
									<li><a href="goodsList.jsp" target="_blank">有车族</a></li>
									<li><a href="goodsList.jsp" target="_blank">装修</a></li>
									<li><a href="goodsList.jsp" target="_blank">生活家</a></li>
									<li><a href="goodsList.jsp" target="_blank">品牌控</a></li>
									<li><a href="goodsList.jsp" target="_blank">游戏</a></li>
									<li><a href="goodsList.jsp" target="_blank">潮流设计</a></li>
									<li><a href="goodsList.jsp" target="_blank">动漫</a></li>
									<li><a href="goodsList.jsp" target="_blank">爱好</a></li>
								</ul>
							</div><!--tour-er-->
						</div><!--1tour-or-->
						<div class="tour-or">
							<p style="color:#80cd97">特色购物</p>
							<div class="tour-er">
								<ul>
									<li><a href="goodsList.jsp" target="_blank">天天特价</a></li>
									<li><a href="goodsList.jsp" target="_blank">免费试用</a></li>
									<li><a href="goodsList.jsp" target="_blank">清仓</a></li>
									<li><a href="goodsList.jsp" target="_blank">一元起拍</a></li>
									<li><a href="goodsList.jsp" target="_blank">淘金币</a></li>
									<li><a href="goodsList.jsp" target="_blank">拾货</a></li>
									<li><a href="goodsList.jsp" target="_blank">淘宝二手</a></li>
									<li><a href="goodsList.jsp" target="_blank">全球购</a></li>
									<li><a href="goodsList.jsp" target="_blank">新欢</a></li>
									<li><a href="goodsList.jsp" target="_blank">淘宝奇葩</a></li>
									<li><a href="goodsList.jsp" target="_blank">淘女郎</a></li>
									<li><a href="goodsList.jsp" target="_blank">挑食</a></li>
									<li><a href="goodsList.jsp" target="_blank">淘宝同学</a></li>
									<li><a href="goodsList.jsp" target="_blank">夜淘宝</a></li>
									<li><a href="goodsList.jsp" target="_blank">星店</a></li>
									<li><a href="goodsList.jsp" target="_blank">淘宝星愿</a></li>
									<li><a href="goodsList.jsp" target="_blank">拍卖会</a></li>
									<li><a href="goodsList.jsp" target="_blank">腔调</a></li>
									<li><a href="goodsList.jsp" target="_blank">同城便民</a></li>
									<li><a href="goodsList.jsp" target="_blank">搭配</a></li>
								</ul>
							</div>
						</div><!--2tour-or-->
						<div class="tour-or">
							<P style="color:#b559b6">当前热点</P>
							<div class="tour-er">
								<ul>
									<li><a href="goodsList.jsp" target="_blank">天天中奖</a></li>
									<li><a href="goodsList.jsp" target="_blank">新鲜土货</a></li>
									<li><a href="goodsList.jsp" target="_blank">清凉一夏</a></li>
									<li><a href="goodsList.jsp" target="_blank">美白防晒</a></li>
									<li><a href="goodsList.jsp" target="_blank">热卖凉鞋</a></li>
									<li><a href="goodsList.jsp" target="_blank">新品数码</a></li>
									<li><a href="goodsList.jsp" target="_blank">海外精品</a></li>
									<li><a href="goodsList.jsp" target="_blank">美白防晒</a></li>
									<li><a href="goodsList.jsp" target="_blank">宝贝最爱</a></li>
									<li><a href="goodsList.jsp" target="_blank">夏日养车</a></li>
									<li><a href="goodsList.jsp" target="_blank">新房装修</a></li>
									<li><a href="goodsList.jsp" target="_blank">宝贝计划</a></li>
									<li><a href="goodsList.jsp" target="_blank">大码女装</a></li>
									<li><a href="goodsList.jsp" target="_blank">我要泡妞</a></li>
									<li><a href="goodsList.jsp" target="_blank">约伴神器</a></li>
									<li><a href="goodsList.jsp" target="_blank">急聘客服</a></li>
									<li><a href="goodsList.jsp" target="_blank">免费APP</a></li>
									<li><a href="goodsList.jsp" target="_blank">洗照片</a></li>
								</ul>
							</div><!--tour-er-->
						</div><!--3tour-or-->
						<div class="tour-or">
							<p style="#614dde">更多精彩</p>
							<div class="tour-er">
								<ul>
									<li><a href="#">阿里旺旺</a></li>
									<li><a href="#">支付宝</a></li>
									<li><a href="#">来往</a></li>
									<li><a href="#">房屋免佣</a></li>
									<li><a href="#">闺蜜淘货</a></li>
									<li><a href="#">天猫国际</a></li>
									<li><a href="#">全网底价</a></li>
									<li><a href="#">余额宝</a></li>
									<li><a href="#">整点秒杀</a></li>
									<li><a href="#">淘公仔</a></li>
									<li><a href="#">浏览器</a></li>
									<li><a href="#">我帮你</a></li>
									<li><a href="#">司法拍卖</a></li>
									<li><a href="#">查寄快递</a></li>
									<li><a href="#">淘宝香港</a></li>
									<li><a href="#">淘宝台湾</a></li>
									<li><a href="#">淘宝全球</a></li>
									<li><a href="#">淘宝视频</a></li>
								</ul>
							</div>
						</div><!--4tour-or-->
					</div><!--self-tour-->
				</li>
			</ul>
		</div><!--tytop-->
		
	</div><!--top-->