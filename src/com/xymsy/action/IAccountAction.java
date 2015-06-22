package com.xymsy.action;

public interface IAccountAction {
	
	/**
	 * 登录
	 * @return
	 */
	public String login();
	
	/**
	 * 注册
	 * @return
	 */
	public String register();
	
	/**
	 * 注销
	 * @return
	 */
	public String logout();

}
