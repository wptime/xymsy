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
 * A data access object (DAO) providing persistence and search support for Goods
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see .Goods
 * @author MyEclipse Persistence Tools
 */

@Component("goodsDAO")
@Scope("prototype")
public class GoodsDAO extends BaseDAO {
	private static final Logger log = LoggerFactory.getLogger(GoodsDAO.class);
	// property constants
	public static final String GD_GOODSNAME = "gdGoodsname";
	public static final String GD_PICTURE = "gdPicture";
	public static final String GD_BRIEF = "gdBrief";
	public static final String GD_INFO = "gdInfo";
	public static final String GD_SUM = "gdSum";
	public static final String GD_PRICE = "gdPrice";
	public static final String GD_STATUS = "gdStatus";
	public static final String GD_KIND = "gdKind";
	public static final String GD_TAG = "gdTag";
	public static final String GD_CLICKED = "gdClicked";
	public static final String GD_SALED = "gdSaled";
	public static final String GD_STOREUPNUM = "gdStoreupnum";
	
	public GoodsDAO()
	{
		entityName = "com.xymsy.entity.Goods";
	}

	public void save(Goods transientInstance) {
		/*log.debug("saving Goods instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}*/
		super.save(transientInstance);
	}

	public void delete(Goods persistentInstance) {
		/*log.debug("deleting Goods instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}*/
		super.delete(persistentInstance);
	}

	public Goods findById(java.lang.Integer id) {
		/*log.debug("getting Goods instance with id: " + id);
		try {
			Goods instance = (Goods) getSession().get("Goods", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}*/
		return (Goods) super.findById(id);
	}

	public List<Goods> findByExample(Goods instance) {
		log.debug("finding Goods instance by example");
		try {
			List<Goods> results = (List<Goods>) getSession()
					.createCriteria("Goods").add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Goods instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Goods as model where model."
					+ propertyName + "= ?";
			Session session = getSession();
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			List<Goods> list = queryObject.list(); 
			session.close();
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Goods> findByGdGoodsname(Object gdGoodsname) {
		return findByProperty(GD_GOODSNAME, gdGoodsname);
	}

	public List<Goods> findByGdPicture(Object gdPicture) {
		return findByProperty(GD_PICTURE, gdPicture);
	}

	public List<Goods> findByGdBrief(Object gdBrief) {
		return findByProperty(GD_BRIEF, gdBrief);
	}

	public List<Goods> findByGdInfo(Object gdInfo) {
		return findByProperty(GD_INFO, gdInfo);
	}

	public List<Goods> findByGdSum(Object gdSum) {
		return findByProperty(GD_SUM, gdSum);
	}

	public List<Goods> findByGdPrice(Object gdPrice) {
		return findByProperty(GD_PRICE, gdPrice);
	}

	public List<Goods> findByGdStatus(Object gdStatus) {
		return findByProperty(GD_STATUS, gdStatus);
	}

	public List<Goods> findByGdKind(Object gdKind) {
		return findByProperty(GD_KIND, gdKind);
	}

	public List<Goods> findByGdTag(Object gdTag) {
		return findByProperty(GD_TAG, gdTag);
	}

	public List<Goods> findByGdClicked(Object gdClicked) {
		return findByProperty(GD_CLICKED, gdClicked);
	}

	public List<Goods> findByGdSaled(Object gdSaled) {
		return findByProperty(GD_SALED, gdSaled);
	}

	public List<Goods> findByGdStoreupnum(Object gdStoreupnum) {
		return findByProperty(GD_STOREUPNUM, gdStoreupnum);
	}

	public List findAll() {
		log.debug("finding all Goods instances");
		try {
			String queryString = "from Goods";
			Session session = getSession();
			Query queryObject = session.createQuery(queryString);
			List<Goods> list = queryObject.list();
			session.close();
			return list;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Goods merge(Goods detachedInstance) {
		log.debug("merging Goods instance");
		try {
			Goods result = (Goods) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Goods instance) {
		log.debug("attaching dirty Goods instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Goods instance) {
		log.debug("attaching clean Goods instance");
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
		log.debug("finding Goods instances");
		String queryString = "from Goods";
		System.out.println("find Goods");
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "gd_goodsid", ((Goods) instance).getGdGoodsid());
				if(((Goods) instance).getStore() != null)
				{
					queryString = makeSQL(queryString, "st_storeid", ((Goods) instance).getStore().getStStoreid());
				}
				queryString = makeSQL(queryString, "gd_goodsname", ((Goods) instance).getGdGoodsname());
				queryString = makeSQL(queryString, "gd_status", ((Goods) instance).getGdStatus());
				queryString = makeSQL(queryString, "gd_kind", ((Goods) instance).getGdKind());
				queryString = makeSQL(queryString, "gd_tag", ((Goods) instance).getGdTag());
				
			}
				if(msg.getLeft() != 0)
				{
					System.out.println("有价格左界:" + msg.getLeft());
					if(true == isFirst)
					{
						queryString += " where";
						isFirst = false;
					}
					else
					{
						queryString += " and";
					}
					queryString = queryString + " gd_price>=" + msg.getLeft();
				}
				if(msg.getRight() != 99999999)
				{
					System.out.println("有价格右界:" + msg.getRight());
					if(true == isFirst)
					{
						queryString += " where";
						isFirst = false;
					}
					else
					{
						queryString += " and";
					}
					queryString = queryString + " gd_price<" + msg.getRight();
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
			Session session = getSession();
			Query queryObject = session.createQuery(queryString);
			
			queryObject.setFirstResult(start);
			queryObject.setMaxResults(size);
			
			//找到该找的数据之后
			getTotalNum(instance, msg);
			System.out.println("find方法里面的：" + msg.getNum());

			msg.setPageTotal(Math.max((msg.getNum()+size-1) / size,1));
			if(start <= 0)//如果是从找到的数据的第一个开始获取的，则没有上一页
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
			
			List<Goods> list = queryObject.list();
			session.close();
			
			return list;
		} catch (RuntimeException re) {
			System.out.println("sql语句:" + queryString);
			log.error("find failed", re);
			throw re;
		}
	}
	
	
	@Override
	public int getTotalNum(Object instance, PageMsg msg) {
		log.debug("finding Goods instances");
		System.out.println("GoodsDAO中");
		String queryString = "select count(*) from com.xymsy.entity.Goods";
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("getTotalNum方法里面：有搜索条件");
				queryString = makeSQL(queryString, "gd_goodsid", ((Goods) instance).getGdGoodsid());
				if(((Goods) instance).getStore() != null)
				{
					queryString = makeSQL(queryString, "st_storeid", ((Goods) instance).getStore().getStStoreid());
				}
				queryString = makeSQL(queryString, "gd_goodsname", ((Goods) instance).getGdGoodsname());
				queryString = makeSQL(queryString, "gd_status", ((Goods) instance).getGdStatus());
				queryString = makeSQL(queryString, "gd_kind", ((Goods) instance).getGdKind());
				queryString = makeSQL(queryString, "gd_tag", ((Goods) instance).getGdTag());
				
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