package com.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import net.sf.json.JSONArray;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.Dept;
import com.bean.DeptInfo;
public class DeptDao extends BaseDao {
	public JSONArray queryAllDept(){	
		Session session = super.getSession();

        String hql="select a.deptId,a.deptName,a.deptManager,(select b.deptName from DeptInfo b where a.deptManager=b.deptId),a.lastUpdate from DeptInfo a where a.status=1";
        List<Object> list = session.createQuery(hql).list();
        
        Dept dept;
        List<Dept> listDept=new ArrayList<Dept>();
        for(int i=0;i<list.size();i++){
        	dept=new Dept();
        	Object[] object = (Object[])list.get(i);
        	dept.setDeptId((Integer)object[0]);
        	dept.setDeptName((String)object[1]);
        	dept.setPid((Integer)object[2]);
        	dept.setDeptManager((String)object[3]);
        	dept.setLastUpdate((String)object[4]);
        	listDept.add(dept);
        }

        JSONArray json = JSONArray.fromObject(listDept);
        return json;
	}
	
	/*
	 public List<DeptInfo> queryAllDept(){	
		Session session = super.getSession();
        //session.beginTransaction();
       
        //TSRole role=(TSRole) session.get(TSRole.class, 1); 
        //System.out.println(role.getId()+" "+role.getRoleName());

        List<DeptInfo> list=session.createQuery("From DeptInfo where status=1").list(); 
		
		//session.getTransaction().rollback();
		//session.getTransaction().commit();
		return list;
	}
	*/
	/*public List<DeptInfo> getDeptView(String deptName,String deptManager){
		
		Session session = super.getSession();
		List<DeptInfo> listOne =session.createQuery("From DeptInfo where status=1 and (deptName like '%"+deptName +"%' or deptManager like '%"+deptManager+"%')").list();
		
		return listOne;
	}*/

	public JSONArray getDeptView(String deptName,String deptManager){
		System.out.println(deptName+" daodaodaodaodaodao  "+deptManager);
		Session session = super.getSession();
		String hql="select a.deptId,a.deptName,a.deptManager,c.deptName,a.lastUpdate From DeptInfo as a,(select b.deptId,b.deptName from DeptInfo as b where b.deptName like '%"+deptManager+"%') as c where a.status=1 and a.deptName like '%"+deptName+"%' and a.deptManager=c.deptId";
		/*if(deptName!=null && !deptName.equals("")){
			hql+="and a.deptName like '%" + deptName + "%'";
		}
		if(deptManager!=null && !deptManager.equals("")){
			hql+="and a.deptName like '%"+deptName+"%' and a.deptManager=c.deptId";
		}*/
		/*if(deptName!=null && !deptName.equals("")){
			hql+="and deptName like '%"+deptName +"%' ";
		}
		if(deptManager!=null && !deptManager.equals("")){
			hql+="and deptName like '%"+deptName +"%' and deptManager like '%"+deptManager+"%' ";
		}*/
		System.out.println(hql);
		List<Object> list =session.createQuery(hql).list();  //?????????????会报错！！！！！！！！！！！！！！！！！！！！hibernate的多表嵌套问题   待解决
		
		Dept dept;
        List<Dept> listDept=new ArrayList<Dept>();
        for(int i=0;i<list.size();i++){
        	dept=new Dept();
        	Object[] object = (Object[])list.get(i);
        	dept.setDeptId((Integer)object[0]);
        	dept.setDeptName((String)object[1]);
        	dept.setPid((Integer)object[2]);
        	dept.setDeptManager((String)object[3]);
        	dept.setLastUpdate((String)object[4]);
        	listDept.add(dept);
        }
		
		JSONArray json = JSONArray.fromObject(listDept);
        System.out.println(json); 
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

		return json;
	}
	
	public String deptAdd(DeptInfo dept){
		Session session = super.getSession();
		int n=0;
		int i;
		List<DeptInfo> list=session.createQuery("From DeptInfo where status=1").list();
		
		for(i=0;i<list.size();i++){
			if(dept.getDeptName().equals(list.get(i).getDeptName())&& dept.getDeptManager().equals(list.get(i).getDeptManager())){
				//System.out.println(dept.getDeptName()+"  aaaaaaaaaaaaa   "+list.get(i).getDeptName());
				return "nameError";
			}
			/*if(!(dept.getDeptManager().equals(list.get(i).getDeptName()))){
				n++;
			}
			if(dept.getDeptManager().equals("") || dept.getDeptManager()==null)
				n--;*/
		}
		if(n==i)
			return "managerError";
		DateFormat dateFormat = new SimpleDateFormat("yy-MM-dd HH-mm-ss");
		dept.setLastUpdate(dateFormat.format(new Date()));
		session.clear();
		session.save(dept);	
		return "true";
	}
	
	public List<Dept> deptBeforUpdate(int id){
		
		Session session = super.getSession();
		String hql="select a.deptId,a.deptName,a.deptManager,(select b.deptName from DeptInfo b where a.deptManager=b.deptId),a.lastUpdate from DeptInfo a where a.deptId="+id;
		List<Object> listOne =session.createQuery(hql).list();
		Dept dept;
        List<Dept> listDept=new ArrayList<Dept>();
        for(int i=0;i<listOne.size();i++){
        	dept=new Dept();
        	Object[] object = (Object[])listOne.get(i);
        	dept.setDeptId((Integer)object[0]);
        	dept.setDeptName((String)object[1]);
        	dept.setPid((Integer)object[2]);
        	dept.setDeptManager((String)object[3]);
        	dept.setLastUpdate((String)object[4]);
        	listDept.add(dept);
        }
		
		return listDept;
	}

	public String deptUpdate(int id,Dept dept){
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		Session session = super.getSession();
		/*int m=0;
		int i;
		List<DeptInfo> list=session.createQuery("From DeptInfo where status=1").list();
		for(i=0;i<list.size();i++){
			if(dept.getDeptName().equals(list.get(i).getDeptName()) && dept.getDeptManager().equals(list.get(i).getDeptManager()))
				return "nameError";
			if(!(dept.getDeptManager().equals(list.get(i).getDeptManager()))){
				m++;
			}	
			if(dept.getDeptManager().equals("") || dept.getDeptManager()==null)
				m--;
		}
		
		if(m==i)
			return "managerError";*/
	/*	System.out.println("============update=========");
		System.out.println(dept.getDeptId());
		System.out.println(dept.getPid());
		System.out.println("============update=========");*/
		
		DeptInfo deptInfo=new DeptInfo();
		deptInfo.setDeptId(dept.getDeptId());
		deptInfo.setDeptName(dept.getDeptName());
		deptInfo.setDeptManager(dept.getPid());
		deptInfo.setStatus(dept.getStatus());
		DateFormat dateFormat = new SimpleDateFormat("yy-MM-dd HH-mm-ss");
	
		deptInfo.setLastUpdate(dateFormat.format(new Date()));
		
		session.clear();
		session.update("DeptInfo where deptId="+id,deptInfo);

		
		return "true";
	}
	
	public List<DeptInfo> deptBeforDel(int id){
		
		Session session = super.getSession();
		List<DeptInfo> listOne =session.createQuery("From DeptInfo where deptId="+id).list();
		
		
		return listOne;
	}
	
	public boolean deptDel(int id){
		//System.out.println("============del========="+id+"==========");
		Session session = super.getSession();
		List<DeptInfo> list=session.createQuery("From DeptInfo where status=1").list();
		Query query = session.createQuery("from DeptInfo where deptId=:id ");
		query.setParameter("id", id);
		
		DeptInfo dept=(DeptInfo)query.uniqueResult();
		
		//当删除的部门有子部门时修改子部门的上级部门
	/*	for(int i=0;i<list.size();i++){
			if(dept.getDeptName().equals(list.get(i).getDeptManager())){
				list.get(i).setDeptManager(dept.getDeptManager());
			}
		}
		*/
		//System.out.println("============del========="+dept.getDeptId());
		dept.setStatus(0);
		
		//session.update("DeptInfo where deptId="+id,dept);
		
		return true;
	}
	
}
