package com.xymsy.daoImp;

import javax.annotation.Resource;
import javax.persistence.Entity;

import org.hibernate.Session;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;


@Component
public class HibernateDaoSupport_ {

	private HibernateTemplate hibernateTemplate;
	private static ClassPathXmlApplicationContext context;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	private Session session;
	
	public Session getSession() {
		return this.hibernateTemplate.getSessionFactory().openSession();
	}

	public void setSession(Session session) {
		this.session = session;
	}
	
	public void deleteSession()
	{
		session = getSession();
		if(session != null)
		{
			this.session.close();
		}
	}
	
	
}
