package com.xymsy.daoImp;
// default package

import java.util.Date;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;

import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.xymsy.entity.Goods;
import com.xymsy.entity.Store;
import com.xymsy.entity.User;
import com.xymsy.util.PageMsg;

/**
 * A data access object (DAO) providing persistence and search support for Store
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see .Store
 * @author MyEclipse Persistence Tools
 */

@Component("storeDAO")
@Scope("singleton")
public class StoreDAO extends BaseDAO {
	private static final Logger log = LoggerFactory.getLogger(StoreDAO.class);
	// property constants
	public static final String ST_STORENAME = "stStorename";
	public static final String ST_STORESTATUS = "stStorestatus";
	public static final String ST_GOODSNUM = "stGoodsnum";
	public static final String ST_ATTENTIONNUM = "stAttentionnum";
	public static final String ST_SCORE = "stScore";
	public static final String ST_MAIN = "stMain";
	
	public StoreDAO()
	{
		entityName = "com.xymxy.entity.Store";
	}

	public void save(Store transientInstance) {
		log.debug("saving Store instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Store persistentInstance) {
		log.debug("deleting Store instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Store findById(java.lang.Integer id) {
		/*log.debug("getting Store instance with id: " + id);
		try {
			Store instance = (Store) getSession().get("Store", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}*/
		return (Store) super.findById(id);
	}

	public List<Store> findByExample(Store instance) {
		log.debug("finding Store instance by example");
		try {
			List<Store> results = (List<Store>) getSession()
					.createCriteria("Store").add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Store instance with property: " + propertyName
				+ ", value: " + value);
		try {
			Session s = getSession();
			String queryString = "from Store as model where model."
					+ propertyName + "= ?";
			Query queryObject = s.createQuery(queryString);
			queryObject.setParameter(0, value);
			
			List<Store> list = queryObject.list();
			s.close();
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Store> findByStStorename(Object stStorename) {
		return findByProperty(ST_STORENAME, stStorename);
	}

	public List<Store> findByStStorestatus(Object stStorestatus) {
		return findByProperty(ST_STORESTATUS, stStorestatus);
	}

	public List<Store> findByStGoodsnum(Object stGoodsnum) {
		return findByProperty(ST_GOODSNUM, stGoodsnum);
	}

	public List<Store> findByStAttentionnum(Object stAttentionnum) {
		return findByProperty(ST_ATTENTIONNUM, stAttentionnum);
	}

	public List<Store> findByStScore(Object stScore) {
		return findByProperty(ST_SCORE, stScore);
	}

	public List<Store> findByStMain(Object stMain) {
		return findByProperty(ST_MAIN, stMain);
	}

	public List findAll() {
		log.debug("finding all Store instances");
		try {
			String queryString = "from Store";
			//Query queryObject = getSession().createQuery(queryString);
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Store merge(Store detachedInstance) {
		log.debug("merging Store instance");
		try {
			Store result = (Store) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Store instance) {
		log.debug("attaching dirty Store instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Store instance) {
		log.debug("attaching clean Store instance");
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
		log.debug("finding Store instances");
		String queryString = "from Store";
		System.out.println("find Store");
		try {
			Session s = getSession();
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "st_storeid", ((Store) instance).getStStoreid());
				if(((Store) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_userid", ((Store) instance).getUser().getUsUserid());
				}
				queryString = makeSQL(queryString, "st_storename", ((Store) instance).getStStorename());
				queryString = makeSQL(queryString, "st_storestatus", ((Store) instance).getStStorestatus());
				queryString = makeSQL(queryString, "st_main", ((Store) instance).getStMain());
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
			Query queryObject = s.createQuery(queryString);
			
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
			
			List<Store> list = queryObject.list();
			s.close();
			return list;
		} catch (RuntimeException re) {
			System.out.println("sql语句:" + queryString);
			log.error("find failed", re);
			throw re;
		}
	}
	
	
	@Override
	public int getTotalNum(Object instance, PageMsg msg) {
		log.debug("finding Store instances");
		System.out.println("StoreDAO中");
		String queryString = "select count(*) from com.xymsy.entity.Store";
		try {
			isFirst = true;
			if(instance != null)
			{
				queryString = makeSQL(queryString, "st_storeid", ((Store) instance).getStStoreid());
				if(((Store) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_userid", ((Store) instance).getUser().getUsUserid());
				}				
				queryString = makeSQL(queryString, "st_storename", ((Store) instance).getStStorename());				
				queryString = makeSQL(queryString, "st_storestatus", ((Store) instance).getStStorestatus());
				queryString = makeSQL(queryString, "st_main", ((Store) instance).getStMain());
			}
			
				System.out.println("sql语句" + queryString);
				Long num = (Long) getHibernateTemplate().find(queryString)
						.listIterator().next();
				
				//找到该找的数据之后
				System.out.println("getTotalNumber方法里面的getnum:" + num);
				msg.setNum(num.intValue());
				
				return num.intValue();
		}catch(RuntimeException re)
		{
			System.out.println("sql语句" + queryString);
			log.error("get total failed", re);
			throw re;
		}
	}
}