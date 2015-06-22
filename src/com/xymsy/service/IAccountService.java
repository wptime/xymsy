package com.xymsy.service;

import com.xymsy.entity.User;
import com.xymsy.util.ServiceResult;

public interface IAccountService {
	
	/**
	 * 登录
	 * @param user
	 * @return 服务结果信息
	 */
	public ServiceResult login(User user);
	
	
	/**
	 * 
	 * @param user
	 * @return 服务结果信息
	 */
	public ServiceResult register(User user);
	
	/**
	 * 
	 * @param user
	 * @return 服务结果信息
	 */
	public ServiceResult logout(User user);
	
	/**
	 * 获得所有用户信息
	 * @return
	 * @time 2015-1-9-15:36
	 */
	public ServiceResult getAllUser();
	
	/**
	 * 获取所有店铺信息
	 * @return
	 * @time 2015-1-9-19:29
	 */
	public ServiceResult getAllStore();
	
	/**
	 * 获取所有管理员信息
	 * @return
	 * @time 2015-1-12-14:14
	 */
	public ServiceResult getAllAdmin();

}
