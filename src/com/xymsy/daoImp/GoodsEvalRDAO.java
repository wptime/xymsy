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

import com.xymsy.entity.GoodsEvalR;
import com.xymsy.entity.StoreEvalR;
import com.xymsy.util.PageMsg;

/**
 * A data access object (DAO) providing persistence and search support for
 * GoodsEvalR entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see .GoodsEvalR
 * @author MyEclipse Persistence Tools
 */

@Component("goodsEvalRDAO")
@Scope("singleton")
public class GoodsEvalRDAO extends BaseDAO {
	private static final Logger log = LoggerFactory
			.getLogger(GoodsEvalRDAO.class);
	// property constants
	public static final String GEVR_CONTENT = "gevrContent";
	public static final String GRVR_EVREPLYSTATUS = "grvrEvreplystatus";

	public void save(GoodsEvalR transientInstance) {
		log.debug("saving GoodsEvalR instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(GoodsEvalR persistentInstance) {
		log.debug("deleting GoodsEvalR instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public GoodsEvalR findById(java.lang.Integer id) {
		log.debug("getting GoodsEvalR instance with id: " + id);
		try {
			GoodsEvalR instance = (GoodsEvalR) getSession().get("GoodsEvalR",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<GoodsEvalR> findByExample(GoodsEvalR instance) {
		log.debug("finding GoodsEvalR instance by example");
		try {
			List<GoodsEvalR> results = (List<GoodsEvalR>) getSession()
					.createCriteria("GoodsEvalR").add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding GoodsEvalR instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from GoodsEvalR as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<GoodsEvalR> findByGevrContent(Object gevrContent) {
		return findByProperty(GEVR_CONTENT, gevrContent);
	}

	public List<GoodsEvalR> findByGrvrEvreplystatus(Object grvrEvreplystatus) {
		return findByProperty(GRVR_EVREPLYSTATUS, grvrEvreplystatus);
	}

	public List findAll() {
		log.debug("finding all GoodsEvalR instances");
		try {
			String queryString = "from GoodsEvalR";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public GoodsEvalR merge(GoodsEvalR detachedInstance) {
		log.debug("merging GoodsEvalR instance");
		try {
			GoodsEvalR result = (GoodsEvalR) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(GoodsEvalR instance) {
		log.debug("attaching dirty GoodsEvalR instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(GoodsEvalR instance) {
		log.debug("attaching clean GoodsEvalR instance");
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
		log.debug("finding GoodsEvalR instances");
		String queryString = "from GoodsEvalR";
		System.out.println(queryString);
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "gevr_everplyid", ((GoodsEvalR) instance).getGevrEverplyid());
				if(((GoodsEvalR) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_submituserid", ((GoodsEvalR) instance).getUser().getUsUserid());
				}
				if(((GoodsEvalR) instance).getGoodsEval() != null)
				{
					queryString = makeSQL(queryString, "gel_evaluateid", ((GoodsEvalR) instance).getGoodsEval().getGelEvaluateid());
				}
				queryString = makeSQL(queryString, "grvr_evreplystatus", ((GoodsEvalR) instance).getGrvrEvreplystatus());
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
		log.debug("finding GoodsEvalR instances");
		System.out.println("GoodsEvalRDAO中");
		String queryString = "select count(*) from com.xymsy.entity.GoodsEvalR";
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "gevr_everplyid", ((GoodsEvalR) instance).getGevrEverplyid());
				if(((GoodsEvalR) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_submituserid", ((GoodsEvalR) instance).getUser().getUsUserid());
				}
				if(((GoodsEvalR) instance).getGoodsEval() != null)
				{
					queryString = makeSQL(queryString, "gel_evaluateid", ((GoodsEvalR) instance).getGoodsEval().getGelEvaluateid());
				}
				queryString = makeSQL(queryString, "grvr_evreplystatus", ((GoodsEvalR) instance).getGrvrEvreplystatus());
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