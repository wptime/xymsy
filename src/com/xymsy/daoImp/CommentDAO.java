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
import com.xymsy.entity.Goods;
import com.xymsy.util.PageMsg;

/**
 * A data access object (DAO) providing persistence and search support for
 * Comment entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see .Comment
 * @author MyEclipse Persistence Tools
 */

@Component("commentDAO")
@Scope("singleton")
public class CommentDAO extends BaseDAO {
	private static final Logger log = LoggerFactory.getLogger(CommentDAO.class);
	// property constants
	public static final String CT_ISBUY = "ctIsbuy";
	public static final String CT_CONTENT = "ctContent";
	public static final String CT_CONTENTSTATUS = "ctContentstatus";

	public void save(Comment transientInstance) {
		log.debug("saving Comment instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Comment persistentInstance) {
		log.debug("deleting Comment instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Comment findById(java.lang.Integer id) {
		log.debug("getting Comment instance with id: " + id);
		try {
			Comment instance = (Comment) getSession().get("Comment", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Comment> findByExample(Comment instance) {
		log.debug("finding Comment instance by example");
		try {
			List<Comment> results = (List<Comment>) getSession()
					.createCriteria("Comment").add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Comment instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Comment as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Comment> findByCtIsbuy(Object ctIsbuy) {
		return findByProperty(CT_ISBUY, ctIsbuy);
	}

	public List<Comment> findByCtContent(Object ctContent) {
		return findByProperty(CT_CONTENT, ctContent);
	}

	public List<Comment> findByCtContentstatus(Object ctContentstatus) {
		return findByProperty(CT_CONTENTSTATUS, ctContentstatus);
	}

	public List findAll() {
		log.debug("finding all Comment instances");
		try {
			String queryString = "from Comment";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Comment merge(Comment detachedInstance) {
		log.debug("merging Comment instance");
		try {
			Comment result = (Comment) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Comment instance) {
		log.debug("attaching dirty Comment instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Comment instance) {
		log.debug("attaching clean Comment instance");
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
		log.debug("finding Comment instances");
		String queryString = "from Comment";
		System.out.println(queryString);
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "ct_commentid", ((Comment) instance).getCtCommentid());
				if(((Comment) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_userid", ((Comment) instance).getUser().getUsUserid());
				}
				if(((Comment) instance).getGoods() != null)
				{
					queryString = makeSQL(queryString, "gd_goodsid", ((Comment) instance).getGoods().getGdGoodsid());
				}
				queryString = makeSQL(queryString, "ct_commentstatus", ((Comment) instance).getCtCommentstatus());
				
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
			System.out.println("sql语句:" + queryString);
			log.error("find failed", re);
			throw re;
		}
	}
	
	
	@Override
	public int getTotalNum(Object instance, PageMsg msg) {
		log.debug("finding Comment instances");
		System.out.println("CommentDAO中");
		String queryString = "select count(*) from com.xymsy.entity.Comment";
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "ct_commentid", ((Comment) instance).getCtCommentid());
				if(((Comment) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_userid", ((Comment) instance).getUser().getUsUserid());
				}
				if(((Comment) instance).getGoods() != null)
				{
					queryString = makeSQL(queryString, "gd_goodsid", ((Comment) instance).getGoods().getGdGoodsid());
				}
				queryString = makeSQL(queryString, "ct_commentstatus", ((Comment) instance).getCtCommentstatus());
				
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