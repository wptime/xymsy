package com.xymsy.daoImp;
// default package

import java.util.Date;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.xymsy.entity.Comment_r;
import com.xymsy.entity.StoreEval;
import com.xymsy.entity.StoreEvalR;
import com.xymsy.util.PageMsg;

/**
 * A data access object (DAO) providing persistence and search support for
 * StoreEvalR entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see .StoreEvalR
 * @author MyEclipse Persistence Tools
 */

@Component("storeEvalRDAO")
@Scope("singleton")
public class StoreEvalRDAO extends BaseDAO {
	private static final Logger log = LoggerFactory
			.getLogger(StoreEvalRDAO.class);
	// property constants
	public static final String SEVR_CONTENT = "sevrContent";
	public static final String SEVR_EVREPLYSTATUS = "sevrEvreplystatus";

	public void save(StoreEvalR transientInstance) {
		log.debug("saving StoreEvalR instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StoreEvalR persistentInstance) {
		log.debug("deleting StoreEvalR instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StoreEvalR findById(java.lang.Integer id) {
		log.debug("getting StoreEvalR instance with id: " + id);
		try {
			StoreEvalR instance = (StoreEvalR) getSession().get("StoreEvalR",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<StoreEvalR> findByExample(StoreEvalR instance) {
		log.debug("finding StoreEvalR instance by example");
		try {
			List<StoreEvalR> results = (List<StoreEvalR>) getSession()
					.createCriteria("StoreEvalR").add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding StoreEvalR instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from StoreEvalR as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<StoreEvalR> findBySevrContent(Object sevrContent) {
		return findByProperty(SEVR_CONTENT, sevrContent);
	}

	public List<StoreEvalR> findBySevrEvreplystatus(Object sevrEvreplystatus) {
		return findByProperty(SEVR_EVREPLYSTATUS, sevrEvreplystatus);
	}

	public List findAll() {
		log.debug("finding all StoreEvalR instances");
		try {
			String queryString = "from StoreEvalR";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StoreEvalR merge(StoreEvalR detachedInstance) {
		log.debug("merging StoreEvalR instance");
		try {
			StoreEvalR result = (StoreEvalR) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StoreEvalR instance) {
		log.debug("attaching dirty StoreEvalR instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StoreEvalR instance) {
		log.debug("attaching clean StoreEvalR instance");
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
		log.debug("finding StoreEvalR instances");
		String queryString = "from StoreEvalR";
		System.out.println(queryString);
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "sevr_evreplyid", ((StoreEvalR) instance).getSevrEvreplyid());
				if(((StoreEvalR) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_submituserid", ((StoreEvalR) instance).getUser().getUsUserid());
				}
				if(((StoreEvalR) instance).getStoreEval() != null)
				{
					queryString = makeSQL(queryString, "sel_evaluateid", ((StoreEvalR) instance).getStoreEval().getSelEvaluateid());
				}
				queryString = makeSQL(queryString, "sevr_evreplystatus", ((StoreEvalR) instance).getSevrEvreplystatus());
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
		log.debug("finding StoreEval instances");
		System.out.println("StoreEvalRDAO中");
		String queryString = "select count(*) from com.xymsy.entity.StoreEvalR";
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "sevr_evreplyid", ((StoreEvalR) instance).getSevrEvreplyid());
				if(((StoreEvalR) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_submituserid", ((StoreEvalR) instance).getUser().getUsUserid());
				}
				if(((StoreEvalR) instance).getStoreEval() != null)
				{
					queryString = makeSQL(queryString, "sel_evaluateid", ((StoreEvalR) instance).getStoreEval().getSelEvaluateid());
				}
				queryString = makeSQL(queryString, "sevr_evreplystatus", ((StoreEvalR) instance).getSevrEvreplystatus());
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