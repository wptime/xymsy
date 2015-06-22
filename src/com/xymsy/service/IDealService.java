package com.xymsy.service;

import com.xymsy.entity.Goods;
import com.xymsy.entity.Order;
import com.xymsy.entity.User;
import com.xymsy.util.PageMsg;
import com.xymsy.util.ServiceResult;

/**
 * 订单有关
 * @author Administrator
 *
 */
public interface IDealService {
	
	/**
	 * 向数据库插入订单数据
	 * @return
	 * @time 2015-1-29-16:36
	 */
	public ServiceResult insertOrder(Order order);
	
	/**
	 * 获取该用户所下的所有订单
	 * @return
	 * @time 2015-2-13-16:07
	 */
	public ServiceResult getUserOrder(User user, PageMsg msg);

}
