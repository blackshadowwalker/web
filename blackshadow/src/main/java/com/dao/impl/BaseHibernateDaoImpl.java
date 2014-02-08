package com.dao.impl;

import modules.base.HibernateSessionFactory;

import org.hibernate.Session;

import com.dao.IBaseHibernateDao;


/**
 * Data access object (DAO) for domain model
 * @author MyEclipse Persistence Tools
 */
public class BaseHibernateDaoImpl implements IBaseHibernateDao {
	
	public Session getSession() {
		return HibernateSessionFactory.getSession();
	}
	
}