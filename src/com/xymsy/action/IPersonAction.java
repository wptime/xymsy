package com.xymsy.action;

public interface IPersonAction {
	
	/**
	 * 添加商品
	 * @return
	 */
	public String addGoods();
	
	/**
	 * 显示该店铺里的所有商品
	 * @return
	 */
	public String getStoreGoodsList();
	
	/**
	 * 实名认证
	 * 
	 */
	public void certification();
	
	/**
	 * 获取实名认证状态
	 */
	public String certificationStatu();
	
	/**
	 * 申请开店
	 */
	public void applyShop();
	
	/**
	 * 获取用户店铺状态
	 */
	public String shopStatu();
	

}
