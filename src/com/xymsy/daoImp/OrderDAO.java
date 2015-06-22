package com.xymsy.daoImp;
// default package

import java.text.SimpleDateFormat;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;

import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.xymsy.entity.Order;
import com.xymsy.entity.User;
import com.xymsy.util.PageMsg;

/**
 * A data access object (DAO) providing persistence and search support for Order
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see .Order
 * @author MyEclipse Persistence Tools
 */

@Component("orderDAO")
@Scope("singleton")
public class OrderDAO extends BaseDAO {
	private static final Logger log = LoggerFactory.getLogger(OrderDAO.class);
	// property constants
	public static final String OD_PRICE = "odPrice";
	public static final String OD_ORDERWAY = "odOrderway";
	public static final String OD_STATUS = "odStatus";
	public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//date格式化为mysql的datetime
	
	public static final String[] columns = {//实体属性
		"us_userid",
		"gd_goodsid",
		"od_orderid",
		"od_orderway",
		"od_orderid"};
	
	

	public OrderDAO() {
		entityName = "com.xymsy.entity.Order";
	}

	public void save(Order transientInstance) {
		/*log.debug("saving Order instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}*/
		super.save(transientInstance);
	}

	public void delete(Order persistentInstance) {
		/*log.debug("deleting Order instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}*/
		super.delete(persistentInstance);
	}

	public Order findById(Integer id) {
		/*log.debug("getting Order instance with id: " + id);
		try {
			Order instance = (Order) getSession().get("Order", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}*/
		return (Order) super.findById(id);
	}

	public List<Order> findByExample(Order instance) {
		log.debug("finding Order instance by example");
		try {
			List<Order> results = (List<Order>) getSession()
					.createCriteria("Order").add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Order instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Order as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Order> findByOdPrice(Object odPrice) {
		return findByProperty(OD_PRICE, odPrice);
	}

	public List<Order> findByOdOrderway(Object odOrderway) {
		return findByProperty(OD_ORDERWAY, odOrderway);
	}

	public List<Order> findByOdStatus(Object odStatus) {
		return findByProperty(OD_STATUS, odStatus);
	}

	public List findAll() {
		log.debug("finding all Order instances");
		try {
			String queryString = "from Order";
			Session s = getSession();
			Query queryObject = getSession().createQuery(queryString);
			List l = queryObject.list();
			s.close();
			return l;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Order merge(Order detachedInstance) {
		log.debug("merging Order instance");
		try {
			Order result = (Order) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Order instance) {
		log.debug("attaching dirty Order instance");
		try {
			Session s = getSession();
			s.saveOrUpdate(instance);
			s.close();
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Order instance) {
		log.debug("attaching clean Order instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	
	/**
	 * 按各种条件查找：用户id，订单提交时间，订单结束时间，订单状态，按照什么排序，升序还是降序
	 * @param 实例，排序规则，是否升序，从第几个开始，最多每页数据的条数，页面情况
	 * 
	 * */
	@Override
	public List find(Object instance,String orderby,boolean isAsc, int start, int size, PageMsg msg) {
		log.debug("finding find Order instances");
			String queryString = "from Order";
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				if(((Order) instance).getUser() != null)//用户id
				{
					queryString = makeSQL(queryString, "us_userid", ((Order) instance).getUser().getUsUserid());
				}
				if(((Order) instance).getGoods() != null)
				{
					queryString = makeSQL(queryString, "gd_goodsid", ((Order) instance).getGoods().getGdGoodsid());
				}
				queryString = makeSQL(queryString, "od_orderid", ((Order) instance).getOdOrderid());
				queryString = makeSQL(queryString, "od_orderway", ((Order) instance).getOdOrderway());
				queryString = makeSQL(queryString, "od_orderway", ((Order) instance).getOdStatus());
				
				
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
					queryString = queryString + " od_price>=" + msg.getLeft();
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
					queryString = queryString + " od_price<" + msg.getRight();
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
			}
			
			System.out.println("sql语句" + queryString);
			Session session = getSession();
			Query queryObject = session.createQuery(queryString);
			
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
			session.close();
			return l;
		} catch (RuntimeException re) {
			System.out.println("sql语句:" + queryString);
			log.error("find failed", re);
			throw re;
		}
	}

	@Override
	public int getTotalNum(Object instance, PageMsg msg) {
		log.debug("finding getnum Order instances");
		String queryString = "select count(*) from com.xymsy.entity.Order";
	try {
		isFirst = true;
		if(instance != null)//有搜索条件
		{
			System.out.println("gettotalnumber方法里面：有搜索条件");
			if(((Order) instance).getUser() != null)//用户id
			{
				queryString = makeSQL(queryString, "us_userid", ((Order) instance).getUser().getUsUserid());
			}
			if(((Order) instance).getGoods() != null)
			{
				queryString = makeSQL(queryString, "gd_goodsid", ((Order) instance).getGoods().getGdGoodsid());
			}
			queryString = makeSQL(queryString, "od_orderid", ((Order) instance).getOdOrderid());
			queryString = makeSQL(queryString, "od_orderway", ((Order) instance).getOdOrderway());
			queryString = makeSQL(queryString, "od_orderway", ((Order) instance).getOdStatus());
			
			if(msg != null)
			{
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
					queryString = queryString + " od_price>=" + msg.getLeft();
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
					queryString = queryString + " od_price<" + msg.getRight();
				}
			}
		}
		
		
		System.out.println("sql语句" + queryString);
		Long num = (Long) getHibernateTemplate().find(queryString)
				.listIterator().next();
		
		//找到该找的数据之后
		System.out.println("getTotalNumber方法里面的getnum:" + num);
		msg.setNum(num.intValue());
		
		
		return num.intValue();
		} catch (RuntimeException re) {
			System.out.println("sql语句" + queryString);
			log.error("get total failed", re);
			throw re;
		}
	}

}