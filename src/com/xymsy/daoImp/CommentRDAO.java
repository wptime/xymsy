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
import com.xymsy.util.PageMsg;

/**
 * A data access object (DAO) providing persistence and search support for
 * Comment_r entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see .Comment_r
 * @author MyEclipse Persistence Tools
 */

@Component("commentRDAO")
@Scope("singleton")
public class CommentRDAO extends BaseDAO {
	private static final Logger log = LoggerFactory
			.getLogger(CommentRDAO.class);
	// property constants
	public static final String CTR_CONTENT = "ctrContent";
	public static final String CTR_CTREPLYSTATUS = "ctrCtreplystatus";

	public void save(Comment_r transientInstance) {
		log.debug("saving Comment_r instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Comment_r persistentInstance) {
		log.debug("deleting Comment_r instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Comment_r findById(java.lang.Integer id) {
		log.debug("getting Comment_r instance with id: " + id);
		try {
			Comment_r instance = (Comment_r) getSession().get("Comment_r", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Comment_r> findByExample(Comment_r instance) {
		log.debug("finding Comment_r instance by example");
		try {
			List<Comment_r> results = (List<Comment_r>) getSession()
					.createCriteria("Comment_r").add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Comment_r instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Comment_r as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Comment_r> findByCtrContent(Object ctrContent) {
		return findByProperty(CTR_CONTENT, ctrContent);
	}

	public List<Comment_r> findByCtrCtreplystatus(Object ctrCtreplystatus) {
		return findByProperty(CTR_CTREPLYSTATUS, ctrCtreplystatus);
	}

	public List findAll() {
		log.debug("finding all Comment_r instances");
		try {
			String queryString = "from Comment_r";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Comment_r merge(Comment_r detachedInstance) {
		log.debug("merging Comment_r instance");
		try {
			Comment_r result = (Comment_r) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Comment_r instance) {
		log.debug("attaching dirty Comment_r instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Comment_r instance) {
		log.debug("attaching clean Comment_r instance");
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
		log.debug("finding ComentR instances");
		String queryString = "from Comment_r";
		System.out.println(queryString);
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "sel_evaluateid", ((Comment_r) instance).getCtrCtreplyid());
				if(((Comment_r) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_submituserid", ((Comment_r) instance).getUser().getUsUserid());
				}
				if(((Comment_r) instance).getComment() != null)
				{
					queryString = makeSQL(queryString, "ct_commentid", ((Comment_r) instance).getComment().getCtCommentid());
				}
				queryString = makeSQL(queryString, "ctr_ctreplystatus", ((Comment_r) instance).getCtrCtreplystatus());
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
		String queryString = "select count(*) from com.xymsy.entity.Comment_r";
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "sel_evaluateid", ((Comment_r) instance).getCtrCtreplyid());
				if(((Comment_r) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_submituserid", ((Comment_r) instance).getUser().getUsUserid());
				}
				if(((Comment_r) instance).getComment() != null)
				{
					queryString = makeSQL(queryString, "ct_commentid", ((Comment_r) instance).getComment().getCtCommentid());
				}
				queryString = makeSQL(queryString, "ctr_ctreplystatus", ((Comment_r) instance).getCtrCtreplystatus());
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