package com.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.RulerInfo;
import com.bean.RulerRole;

@SuppressWarnings("unchecked")
public class RulerDao extends BaseDao {

	public List<RulerInfo> ruler(List<Integer> list2){
		//System.out.println("list2="+list2);
		Session session =this.getSession();
		Query query = session.createQuery(" from RulerInfo p where p.rulerId in (:list2) and p.status=1 ");
		query.setParameterList("list2", list2);
		List<RulerInfo> list = (List<RulerInfo>)query.list();
		if(list!=null){
			
			return  list;
		}
		return null;
	}
	
	public List<Integer> rulerRole(int roleId){
		List< RulerRole> list = null;
		List<Integer> list2=new ArrayList();
		Session session =this.getSession();
		Query query = session.createQuery(" from RulerRole r where r.roleId=:roleId  and r.status=1");
		query.setInteger("roleId", roleId);
		list=(List< RulerRole>)query.list();
		if(list!=null){
			for(int i=0;i<list.size();i++){
				list2.add(list.get(i).getRulerId());
			}
			return list2;
		}
		return null;
	}

	public List<RulerInfo> query(RulerInfo rulerInfo) {
		Session session = this.getSession();
		String hql="from RulerInfo where status=1 ";
		if(rulerInfo!=null && rulerInfo.getRulerName()!=null && !rulerInfo.getRulerName().trim().equals("")){
			hql+="and rulerName like '%"+rulerInfo.getRulerName().trim()+"%' ";
		}
		Query query = session.createQuery(hql);
		List<RulerInfo> list = (List<RulerInfo>)query.list();
		
		return list;
	}

	public String delete(int id) {
		
		Session session = this.getSession();
		RulerInfo rulerInfo = (RulerInfo) session.createQuery("from RulerInfo r where r.rulerId="+id).uniqueResult();
		rulerInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		rulerInfo.setStatus(0);
		session.update(rulerInfo);
		return "ok";
	}
	
	public String add(RulerInfo rulerInfo) {
		
		Session session =this.getSession();
		session.save(rulerInfo);
		
		return "ok";
	}
	
	public List<RulerInfo> beforeUpdate(int id) {
		
		Session session = this.getSession();
		Query query = session.createQuery("from RulerInfo where rulerId=:rulerId");
		query.setParameter("rulerId", id);
		List<RulerInfo>  list = query.list();
		return list;
	}

	public String update(int id, RulerInfo rulerInfo) {
		String name =rulerInfo.getRulerName();
		String manager = rulerInfo.getRulerManager();
		Session session = this.getSession();
		rulerInfo = (RulerInfo) session.createQuery("from RulerInfo r where r.rulerId="+id).uniqueResult();
		rulerInfo.setRulerName(name);
		rulerInfo.setRulerManager(manager);
		rulerInfo.setLastUpdate(new Timestamp(System.currentTimeMillis()));
		session.update(rulerInfo);
		return "ok";
	}
}
