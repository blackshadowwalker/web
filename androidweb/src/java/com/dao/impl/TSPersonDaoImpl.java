package com.dao.impl;

import java.sql.Timestamp;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.dao.ITSPersonDao;
import com.domain.TSPerson;

/**
 * A data access object (DAO) providing persistence and search support for
 * TSPerson entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.dao.TSPerson
 * @author MyEclipse Persistence Tools
 */

public class TSPersonDaoImpl extends HibernateDaoSupport implements ITSPersonDao {
	private static final Log log = LogFactory.getLog(TSPersonDaoImpl.class);
	// property constants
	public static final String USER_CODE = "userCode";
	public static final String USER_NAME = "userName";
	public static final String PASSWORD = "password";
	public static final String LANGUAGE = "language";
	public static final String EMAIL = "email";
	public static final String PHOTO = "photo";
	public static final String STATUS = "status";
	public static final String LAST_LOGIN_AT = "lastLoginAt";

	public void save(TSPerson transientInstance) {
		log.debug("saving TSPerson instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TSPerson persistentInstance) {
		log.debug("deleting TSPerson instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TSPerson findById(Integer id) {
		log.debug("getting TSPerson instance with id: " + id);
		try {
			TSPerson instance = (TSPerson) getSession().get("com.dao.TSPerson",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TSPerson instance) {
		log.debug("finding TSPerson instance by example");
		try {
			List results = getSession().createCriteria("com.dao.TSPerson").add(
					Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TSPerson instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TSPerson as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserCode(Object userCode) {
		return findByProperty(USER_CODE, userCode);
	}

	public List findByUserName(Object userName) {
		return findByProperty(USER_NAME, userName);
	}

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List findByLanguage(Object language) {
		return findByProperty(LANGUAGE, language);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByPhoto(Object photo) {
		return findByProperty(PHOTO, photo);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findByLastLoginAt(Object lastLoginAt) {
		return findByProperty(LAST_LOGIN_AT, lastLoginAt);
	}

	public List findAll() {
		log.debug("finding all TSPerson instances");
		try {
			String queryString = "from TSPerson";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TSPerson merge(TSPerson detachedInstance) {
		log.debug("merging TSPerson instance");
		try {
			TSPerson result = (TSPerson) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TSPerson instance) {
		log.debug("attaching dirty TSPerson instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TSPerson instance) {
		log.debug("attaching clean TSPerson instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}