<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<div class="warpper-right">
					<div class="own-shop">
						<div class="title">我的店铺
							<s:if test="#session.storeStatu.equals('auditing')">
								：正在审核中
							</s:if>
						</div>
						<div class="own-con">
							<div class="own-image">
								<img src=<s:property value="#session.store.stPicture.substring(1)"/> alt="" style="width: 180px;"/>
								<div><s:property value="#session.store.stStorename"/></div>
							</div>
							<ul class="own-center">
								<li>店主: <span><s:property value="#session.user.usNickname"/></span></li>
								<li>商品数：<span><s:property value="#session.store.stGoodsnum"/></span></li>
								<li>被关注量：<span><s:property value="#session.store.stAttentionnum"/></span></li>
								<li>店铺评分：<span><s:property value="#session.store.stScore"/></span></li>
								<li>主要销售：<span><s:property value="#session.store.stMain"/></span></li>
							</ul>
						</div>
					</div>
				</div>		
