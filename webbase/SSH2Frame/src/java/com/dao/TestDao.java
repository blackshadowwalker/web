package com.dao;

import java.util.List;

import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.TSNvr;
public class TestDao extends BaseDao{

	@SuppressWarnings("unchecked")
	public List<TSNvr> queryAllNvr(){
		TSNvr nvr=new TSNvr();
		
		nvr.setId(299);
		
        Session session = this.getSession();
        //session.beginTransaction();
        System.out.println(nvr.getId()+"-------------------------");
        session.save(nvr);  
        
        //TSRole role=(TSRole) session.get(TSRole.class, 1); 
        //System.out.println(role.getId()+" "+role.getRoleName());

        List<TSNvr> list=session.createQuery("From TSNvr").list(); 
		
		//session.getTransaction().rollback();
		//session.getTransaction().commit();
		
		
		return list;
	}
	
	public TSNvr getById(int id){
		Session session = this.getSession();
        TSNvr nvr = (TSNvr)session.get(TSNvr.class, id);
		return nvr;
	}
}
