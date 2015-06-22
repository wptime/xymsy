package com.xymsy.action;

import com.xymsy.util.ServiceResult;

public interface IAdminAction {
	
	/**
	 * 获得所有用户简略信息
	 * @return
	 * @time 2015-1-9-15:36
	 */
	public String getAllUser();
	
	/**
	 * 获得所有用户信息
	 * @return
	 * @time 2015-1-9-15:36
	 */
	public String getAllUserInfo();
	
	/**
	 * 获得所有用户时间有关信息
	 * @return
	 * @time 2015-1-9-15:36
	 */
	public String getTimeInfo();
	
	/**
	 * 获得所有买家信息
	 * @return
	 * @time 2015-1-9-15:36
	 */
	public String getBuyerInfo();
	
	/**
	 * 获得所有卖家信息
	 * @return
	 * @time 2015-1-9-15:36
	 */
	public String getSellerInfo();
	
	/**
	 * 获得所有店铺信息
	 * @return
	 * @time 2015-1-9-17:36
	 */
	public String getAllStore();
	
	/**
	 * 获得所有商品信息
	 * @return
	 * @time 2015-1-9-21:27
	 */
	public String getAllGoods();
	
	/**
	 * 获得所有商品信息
	 * @return
	 * @time 2015-1-9-21:27
	 */
	public String getSellingGoods();
	
	/**
	 * 获得所有商品信息
	 * @return
	 * @time 2015-1-9-21:27
	 */
	public String getSelledGoods();
	
	/**
	 * 获取所用管理员信息
	 * @return
	 * @time 2015-1-12-14:13
	 */
	public String getAllAdmin();

}
