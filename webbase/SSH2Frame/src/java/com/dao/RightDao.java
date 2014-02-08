package com.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.RulerRole;

public class RightDao extends BaseDao {
	public String getRights(int roleId,int rulerId) throws Exception{
		Session session = super.getSession();
		Query query = session.createQuery("From RulerRole r where r.roleId=:roleId and r.rulerId=:rulerId");
		query.setInteger("roleId", roleId);
		query.setInteger("rulerId", rulerId);
		RulerRole rulerRole = (RulerRole) query.uniqueResult();
		if(rulerRole!=null){
			return rulerRole.getRulerWord();
		}
		return null;
	}
}
