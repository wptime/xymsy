package com.xymsy.daoImp;
// default package

import java.util.Date;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;

import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.xymsy.entity.Certification;
import com.xymsy.entity.StoreEval;
import com.xymsy.util.PageMsg;

/**
 * A data access object (DAO) providing persistence and search support for
 * Certification entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see .Certification
 * @author MyEclipse Persistence Tools
 */

@Component("certificationDAO")
@Scope("singleton")
public class CertificationDAO extends BaseDAO {
	private static final Logger log = LoggerFactory
			.getLogger(CertificationDAO.class);
	// property constants
	public static final String CT_REALNAME = "ctRealname";
	public static final String CT_STUDENTID = "ctStudentid";
	public static final String CT_GRADE = "ctGrade";
	public static final String CT_ADDRESS = "ctAddress";
	public static final String CT_SCHOOL = "ctSchool";
	public static final String CT_MAJOR = "ctMajor";
	public static final String CT_STATUS = "ctStatus";

	public void save(Certification transientInstance) {
		log.debug("saving Certification instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Certification persistentInstance) {
		log.debug("deleting Certification instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Certification findById(java.lang.Integer id) {
		log.debug("getting Certification instance with id: " + id);
		try {
			Session s = getSession();
			Certification instance = (Certification) s.get(
					"Certification", id);
			s.close();
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Certification> findByExample(Certification instance) {
		log.debug("finding Certification instance by example");
		try {
			List<Certification> results = (List<Certification>) getSession()
					.createCriteria("Certification").add(create(instance))
					.list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Certification instance with property: "
				+ propertyName + ", value: " + value);
		try {
			Session s = getSession();
			String queryString = "from Certification as model where model."
					+ propertyName + "= ?";
			Query queryObject = s.createQuery(queryString);
			queryObject.setParameter(0, value);
			List<Certification> list = queryObject.list();
			s.close();
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Certification> findByCtRealname(Object ctRealname) {
		return findByProperty(CT_REALNAME, ctRealname);
	}

	public List<Certification> findByCtStudentid(Object ctStudentid) {
		return findByProperty(CT_STUDENTID, ctStudentid);
	}

	public List<Certification> findByCtGrade(Object ctGrade) {
		return findByProperty(CT_GRADE, ctGrade);
	}

	public List<Certification> findByCtAddress(Object ctAddress) {
		return findByProperty(CT_ADDRESS, ctAddress);
	}

	public List<Certification> findByCtSchool(Object ctSchool) {
		return findByProperty(CT_SCHOOL, ctSchool);
	}

	public List<Certification> findByCtMajor(Object ctMajor) {
		return findByProperty(CT_MAJOR, ctMajor);
	}

	public List<Certification> findByCtStatus(Object ctStatus) {
		return findByProperty(CT_STATUS, ctStatus);
	}

	public List findAll() {
		log.debug("finding all Certification instances");
		try {
			String queryString = "from Certification";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Certification merge(Certification detachedInstance) {
		log.debug("merging Certification instance");
		try {
			Certification result = (Certification) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Certification instance) {
		log.debug("attaching dirty Certification instance");
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

	public void attachClean(Certification instance) {
		log.debug("attaching clean Certification instance");
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
		log.debug("finding Certification instances");
		String queryString = "from Certification";
		System.out.println(queryString);
		try {
			isFirst = true;
			Session s = getSession();
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "ct_certificationid", ((Certification) instance).getCtCertificationid());
				if(((Certification) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_userid", ((Certification) instance).getUser().getUsUserid());
				}
				queryString = makeSQL(queryString, "ct_realname", ((Certification) instance).getCtRealname());
				queryString = makeSQL(queryString, "ct_studentid", ((Certification) instance).getCtStudentid());
				queryString = makeSQL(queryString, "ct_address", ((Certification) instance).getCtAddress());
				queryString = makeSQL(queryString, "ct_school", ((Certification) instance).getCtSchool());
				queryString = makeSQL(queryString, "ct_major", ((Certification) instance).getCtMajor());
				queryString = makeSQL(queryString, "ct_status", ((Certification) instance).getCtStatus());
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
			List<Certification> list = queryObject.list();
			s.close();
			return list;
		} catch (RuntimeException re) {
			System.out.println("sql语句error:" + queryString);
			log.error("find failed", re);
			throw re;
		}
	}
	
	
	@Override
	public int getTotalNum(Object instance, PageMsg msg) {
		log.debug("finding Comment instances");
		System.out.println("Certification中");
		String queryString = "select count(*) from com.xymsy.entity.Certification";
		try {
			isFirst = true;
			if(instance != null)//有搜索条件
			{
				System.out.println("find方法里面：有搜索条件");
				queryString = makeSQL(queryString, "ct_certificationid", ((Certification) instance).getCtCertificationid());
				if(((Certification) instance).getUser() != null)
				{
					queryString = makeSQL(queryString, "us_userid", ((Certification) instance).getUser().getUsUserid());
				}
				queryString = makeSQL(queryString, "ct_realname", ((Certification) instance).getCtRealname());
				queryString = makeSQL(queryString, "ct_studentid", ((Certification) instance).getCtStudentid());
				queryString = makeSQL(queryString, "ct_address", ((Certification) instance).getCtAddress());
				queryString = makeSQL(queryString, "ct_school", ((Certification) instance).getCtSchool());
				queryString = makeSQL(queryString, "ct_major", ((Certification) instance).getCtMajor());
				queryString = makeSQL(queryString, "ct_status", ((Certification) instance).getCtStatus());
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