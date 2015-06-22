package com.xymsy.action;

public interface IMainAction {
	
	/**
	 * 获取商品详细信息
	 * @return
	 */
	public String getInfo();
	
	/**
	 * 获取主页商品推荐表
	 * @return
	 */
	public String index();
	
	/**
	 * 获取商品列表
	 * @return
	 */
	public void getGoodsList();
	
	/**
	 * 通过商品信息页面进入卖该商品的店铺
	 * @return
	 */
	public String enterStore();
	
	/**
	 * 通过关键字查询商品，获取商品列表
	 * @return
	 * @time 2015-1-10-15:10
	 */
	public String getGoodsListByKey();

	/**
	 * 创建订单
	 * @return
	 * @time 2015-1-28-21:34
	 */
	public String createOrder();
	
	/**
	 * 插入订单
	 * @return
	 * @time 2015-1-29-16:28
	 */
	public String addOrder();
	
	/**
	 * 进入个人中心
	 * @return
	 * @time 2015-2-13-15:50
	 */
	public String findUser();

}
