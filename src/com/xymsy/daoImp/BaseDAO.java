package com.xymsy.daoImp;

import java.util.List;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.xymsy.dao.IBaseDAO;
import com.xymsy.entity.Order;
import com.xymsy.util.PageMsg;

public abstract class BaseDAO extends HibernateDaoSupport_ implements IBaseDAO{

	private static final Logger log = LoggerFactory.getLogger(OrderDAO.class);
	protected String entityName;
	protected static boolean isFirst = true;//拼接hql标志
	
	@Override
	public void save(Object instance) {
		log.debug("saving Order instance");
		System.out.println("基类里面的save");
		try {
			Session session = getSession();
			System.out.println(instance);
			session.save(instance);
			System.out.println("save success");
			session.close();
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	@Override
	public void delete(Object instance) {
		log.debug("deleting Order instance");
		System.out.println("基类里面的delete");
		try {
			Session session = getSession();
			session.delete(instance);
			session.close();
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	@Override
	public Object findById(Integer id) {
		System.out.println("基类里面的findbyid...." + this.entityName);
		log.debug("getting " + this.getClass() + " instance with id: " + id);
		try {
			Session session = getSession();
			Object instance =  session.get(this.entityName, id);
			session.close();
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@Override
	public int getTotalNum(Object instance, PageMsg msg) {
		return 0;
	}

	@Override
	public List<Object> find(Object instance, String orderby,
			boolean isAsc, int start, int size, PageMsg msg) {
		return null;
	}
	
	public String makeSQL(String query, String column, Object a)
	{
		if(a != null)
		{
			if(isFirst)
			{
				query += " where";
				isFirst = false;
			}
			else
			{
				query += " and";
			}
			if(column.contains("status"))
			{
				query = query + " " + column + " like '" + a.toString() + "'";
			}
			else
			{
				query = query + " " + column + " like '%" + a.toString() + "%'";
			}
			System.out.println(query);
		}
		return query;
	}


}
