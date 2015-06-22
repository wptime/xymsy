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

import com.xymsy.daoImp.HibernateDaoSupport_;
import com.xymsy.entity.Order;
import com.xymsy.entity.User;
import com.xymsy.util.PageMsg;

/**
 * A data access object (DAO) providing persistence and search support for User
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see .User
 * @author MyEclipse Persistence Tools
 */

@Component("userDAO")
@Scope("singleton")
public class UserDAO extends BaseDAO {
	private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
	// property constants
	public static final String US_USERNAME = "usUsername";
	public static final String US_PASSWORD = "usPassword";
	public static final String US_NICKNAME = "usNickname";
	public static final String US_SEX = "usSex";
	public static final String US_AGE = "usAge";
	public static final String US_PHONE = "usPhone";
	public static final String US_PRICTURE = "usPricture";
	public static final String US_TOTALONLINETIME = "usTotalonlinetime";
	public static final String US_PURCHASE = "usPurchase";
	public static final String US_STOREUPGOODSNUM = "usStoreupgoodsnum";
	public static final String US_ATTENTIONSTORENUM = "usAttentionstorenum";
	public static final String US_EXP = "usExp";
	public static final String US_BUYERCREDIT = "usBuyercredit";
	public static final String US_SELLERCREIT = "usSellercreit";
	public static final String US_STORENUM = "usStorenum";
	//private final String entityName="com.xymsy.entity.User";

	public UserDAO() {
		entityName = "com.xymsy.entity.User";
	}
	

	public void save(User transientInstance) {
		/*log.debug("saving User instance");
		try {
			getSession().save(transientInstance);
			System.out.println("save");
			log.debug("save successful");
		} catch (RuntimeException re) {
			System.out.println("chucuo");
			log.error("save failed", re);
			throw re;
		}*/
		super.save(transientInstance);
	}


	public void delete(User persistentInstance) {
		/*log.debug("deleting User instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}*/
		super.delete(persistentInstance);
	}

	public User findById(Integer id) {
	/*	log.debug("getting User instance with id: " + id);
		try {
			User instance = (User) getSession().get("User", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}*/
		return (User) super.findById(id);
		
	}

	public List<User> findByExample(User instance) {
		log.debug("finding User instance by example");
		try {
			List<User> results = (List<User>) getSession()
					.createCriteria("User").add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding User instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from User as model where model."
					+ propertyName + "= ?";
			Session s = getSession();
			Query queryObject = s.createQuery(queryString);
			queryObject.setParameter(0, value);
			List l = queryObject.list();
			s.close();
			return l;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<User> findByUsUsername(Object usUsername) {
		return findByProperty(US_USERNAME, usUsername);
	}

	public List<User> findByUsPassword(Object usPassword) {
		return findByProperty(US_PASSWORD, usPassword);
	}

	public List<User> findByUsNickname(Object usNickname) {
		return findByProperty(US_NICKNAME, usNickname);
	}

	public List<User> findByUsSex(Object usSex) {
		return findByProperty(US_SEX, usSex);
	}

	public List<User> findByUsAge(Object usAge) {
		return findByProperty(US_AGE, usAge);
	}

	public List<User> findByUsPhone(Object usPhone) {
		return findByProperty(US_PHONE, usPhone);
	}

	public List<User> findByUsPricture(Object usPricture) {
		return findByProperty(US_PRICTURE, usPricture);
	}

	public List<User> findByUsTotalonlinetime(Object usTotalonlinetime) {
		return findByProperty(US_TOTALONLINETIME, usTotalonlinetime);
	}

	public List<User> findByUsPurchase(Object usPurchase) {
		return findByProperty(US_PURCHASE, usPurchase);
	}

	public List<User> findByUsStoreupgoodsnum(Object usStoreupgoodsnum) {
		return findByProperty(US_STOREUPGOODSNUM, usStoreupgoodsnum);
	}

	public List<User> findByUsAttentionstorenum(Object usAttentionstorenum) {
		return findByProperty(US_ATTENTIONSTORENUM, usAttentionstorenum);
	}

	public List<User> findByUsExp(Object usExp) {
		return findByProperty(US_EXP, usExp);
	}

	public List<User> findByUsBuyercredit(Object usBuyercredit) {
		return findByProperty(US_BUYERCREDIT, usBuyercredit);
	}

	public List<User> findByUsSellercreit(Object usSellercreit) {
		return findByProperty(US_SELLERCREIT, usSellercreit);
	}

	public List<User> findByUsStorenum(Object usStorenum) {
		return findByProperty(US_STORENUM, usStorenum);
	}

	public List findAll() {
		log.debug("finding all User instances");
		try {
			
			String queryString = "from User";
			List l = getHibernateTemplate().find(queryString);/*
			Session s = getSession();
			Query queryObject = s.createQuery(queryString);
			List l = queryObject.list(); 
			s.close();*/
			return l;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public User merge(User detachedInstance) {
		log.debug("merging User instance");
		try {
			User result = (User) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(User instance) {
		log.debug("attaching dirty User instance");
		try {
//			Session s = getSession();
//			s.saveOrUpdate(instance);
//			s.close();
			getHibernateTemplate().update(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(User instance) {
		log.debug("attaching clean User instance");
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
		log.debug("finding User instances");
		String queryString = "from User";
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "us_userid", ((User) instance).getUsUserid());
				queryString = makeSQL(queryString, "us_username", ((User) instance).getUsUsername());
				queryString = makeSQL(queryString, "us_sex", ((User) instance).getUsSex());
				queryString = makeSQL(queryString, "us_phone", ((User) instance).getUsPhone());
				
				
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
			}
			
			System.out.println("sql语句:" + queryString);
			Session s = getSession();
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
			
			List l = queryObject.list();
			s.close();
			return l;
		} catch (RuntimeException re) {
			System.out.println("sql语句:" + queryString);
			log.error("find failed", re);
			throw re;
		}
	}
	
	
	@Override
	public int getTotalNum(Object instance, PageMsg msg) {
		log.debug("finding User instances");
		System.out.println("UserDAO中");
		String queryString = "select count(*) from com.xymsy.entity.User";
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "us_userid", ((User) instance).getUsUserid());
				queryString = makeSQL(queryString, "us_username", ((User) instance).getUsUsername());
				queryString = makeSQL(queryString, "us_sex", ((User) instance).getUsSex());
				queryString = makeSQL(queryString, "us_phone", ((User) instance).getUsPhone());
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