package com.xymsy.action;

public interface ISellerAction {
	
	/**
	 * 查找商品列表（异步请求）
	 */
	public void storeGoodsList();
	
	/**
	 * 删除商品
	 */
	public void deleteGoods();

}
