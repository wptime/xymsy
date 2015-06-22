package com.xymsy.dao;

import java.util.List;

import com.xymsy.util.PageMsg;

/**
 * 
 * @author Administrator
 *
 */
public interface IBaseDAO {
	
	/**
	 * 存数据
	 * @param 要保存的数据的实例
	 * */
	public void save(Object instance);
	
	/**
	 * 删除数据
	 * @param 要删除的数据的实例
	 * */
	public void delete(Object instance);
	
	/**
	 * 根据数据的id查找数据
	 * @param 要查找的数据的id(integer)
	 */
	public Object findById(Integer id);
	
	/**
	 * 查找出来的数据的条数总量
	 * @param void
	 * @return 满足条件的数据的总数
	 */
	/**
	 * 
	 * @param instance
	 * @param msg
	 * @return
	 */
	public int getTotalNum(Object instance, PageMsg msg);
	
	/**
	 * 
	 * @param instance
	 * @param orderby
	 * @param isAsc
	 * @param start
	 * @param size
	 * @param msg 页面信息 不可为null
	 * @return
	 */
	public List<Object> find(Object instance,String orderby,boolean isAsc,int start,int size,PageMsg msg);
}
