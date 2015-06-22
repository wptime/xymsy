package com.xymsy.daoImp;
// default package

import java.util.Date;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.hibernate.Query;
import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.xymsy.entity.Comment;
import com.xymsy.entity.StoreEval;
import com.xymsy.util.PageMsg;

/**
 * A data access object (DAO) providing persistence and search support for
 * StoreEval entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see .StoreEval
 * @author MyEclipse Persistence Tools
 */

@Component("storeEvalDAO")
@Scope("singleton")
public class StoreEvalDAO extends BaseDAO {
	private static final Logger log = LoggerFactory
			.getLogger(StoreEvalDAO.class);
	// property constants
	public static final String SEL_SCORE = "selScore";
	public static final String SEL_CONTENT = "selContent";
	public static final String SEL_EVALUATESTATUS = "selEvaluatestatus";

	public void save(StoreEval transientInstance) {
		log.debug("saving StoreEval instance");
		getSession();
		System.out.println(transientInstance);
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
			System.out.println(transientInstance);
		} catch (RuntimeException re) {
			log.error("save failed", re);
			System.out.println("fedfefdsfas");
			throw re;
		}
	}

	public void delete(StoreEval persistentInstance) {
		log.debug("deleting StoreEval instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StoreEval findById(java.lang.Integer id) {
		log.debug("getting StoreEval instance with id: " + id);
		try {
			StoreEval instance = (StoreEval) getSession().get("StoreEval", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<StoreEval> findByExample(StoreEval instance) {
		log.debug("finding StoreEval instance by example");
		try {
			List<StoreEval> results = (List<StoreEval>) getSession()
					.createCriteria("StoreEval").add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding StoreEval instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from StoreEval as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<StoreEval> findBySelScore(Object selScore) {
		return findByProperty(SEL_SCORE, selScore);
	}

	public List<StoreEval> findBySelContent(Object selContent) {
		return findByProperty(SEL_CONTENT, selContent);
	}

	public List<StoreEval> findBySelEvaluatestatus(Object selEvaluatestatus) {
		return findByProperty(SEL_EVALUATESTATUS, selEvaluatestatus);
	}

	public List findAll() {
		log.debug("finding all StoreEval instances");
		try {
			String queryString = "from StoreEval";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StoreEval merge(StoreEval detachedInstance) {
		log.debug("merging StoreEval instance");
		try {
			StoreEval result = (StoreEval) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StoreEval instance) {
		log.debug("attaching dirty StoreEval instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StoreEval instance) {
		log.debug("attaching clean StoreEval instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	@Override
	public List find(Object instance, String orderby,
			boolean isAsc, int start, int size, PageMsg msg) {
		log.debug("finding StoreEval instances");
		String queryString = "from StoreEval";
		System.out.println(queryString);
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "sel_evaluateid", ((StoreEval) instance).getSelEvaluateid());
				if(((StoreEval) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_userid", ((StoreEval) instance).getUser().getUsUserid());
				}
				if(((StoreEval) instance).getStore() != null)
				{
					queryString = makeSQL(queryString, "st_storeid", ((StoreEval) instance).getStore().getStStoreid());
				}
				queryString = makeSQL(queryString, "sel_evaluatestatus", ((StoreEval) instance).getSelEvaluatestatus());
				queryString = makeSQL(queryString, "sel_score", ((StoreEval) instance).getSelScore());
			}
			
			if(orderby != null)
			{
				System.out.println("有排序规则:" + orderby);
				queryString = queryString + " order by " + orderby;
				if(isAsc)
				{
					System.out.println("升序");
					queryString += " asc";
				}
				else
				{
					System.out.println("降序");
					queryString += " desc";
				}
			}
			
			System.out.println("sql语句:" + queryString);
			Query queryObject = getSession().createQuery(queryString);
			
			System.out.println(queryObject.list());
			
			queryObject.setFirstResult(start);
			queryObject.setMaxResults(size);
			
			//找到该找的数据之后
			this.getTotalNum(instance, msg);
			System.out.println("find方法里面的：" + msg.getNum());
			
			if(start == 0)//如果是从找到的数据的第一个开始获取的，则没有上一页
			{
				msg.setHasLastPage(false);
			}
			else
			{
				msg.setHasLastPage(true);
			}
			
			if(start+size < msg.getNum())//如果当前页面显示不完，则有下一页
			{
				msg.setHasNextPage(true);
			}
			else
			{
				msg.setHasNextPage(false);
			}
			
			return queryObject.list();
		} catch (RuntimeException re) {
			System.out.println("sql语句error:" + queryString);
			log.error("find failed", re);
			throw re;
		}
	}
	
	
	@Override
	public int getTotalNum(Object instance, PageMsg msg) {
		log.debug("finding Comment instances");
		System.out.println("StoreEvalDAO中");
		String queryString = "select count(*) from com.xymsy.entity.StoreEval";
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "sel_evaluateid", ((StoreEval) instance).getSelEvaluateid());
				if(((StoreEval) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_userid", ((StoreEval) instance).getUser().getUsUserid());
				}
				if(((StoreEval) instance).getStore() != null)
				{
					queryString = makeSQL(queryString, "st_storeid", ((StoreEval) instance).getStore().getStStoreid());
				}
				queryString = makeSQL(queryString, "sel_evaluatestatus", ((StoreEval) instance).getSelEvaluatestatus());
				queryString = makeSQL(queryString, "sel_score", ((StoreEval) instance).getSelScore());
			}
				System.out.println("sql语句" + queryString);
				Long num = (Long) getHibernateTemplate().find(queryString).listIterator().next();
				
				//找到该找的数据之后
				System.out.println("getTotalNumber方法里面的getnum:" + num);
				msg.setNum(num.intValue());
				
				return num.intValue();
		}catch(RuntimeException re)
		{
			System.out.println("sql语句error" + queryString);
			log.error("get total failed", re);
			throw re;
		}
	}
}