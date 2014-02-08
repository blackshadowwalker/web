package com.base;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class BaseDao{
    Session session=null;
    
	private SessionFactory sessionFactory; 
	
	
	/*private static Configuration configuration = null;
    private static ServiceRegistry serviceRegistry = null;*/
	
	

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/*
	private ApplicationContext ctx; 

    public SessionFactory getSessionFactory() { 

        String[] configLocations = new String[] {"classpath:applicationContext.xml"}; 

        ctx = new ClassPathXmlApplicationContext(configLocations); 

        sessionFactory = ctx.getBean("sessionFactory", SessionFactory.class); 
        
        return sessionFactory;

    } */
    
    public Session getSession(){
    	if(sessionFactory==null){
    		session=this.getSessionFactory().getCurrentSession();
    		//session=this.getSessionFactory().openSession();
    	}else{
    		session=sessionFactory.getCurrentSession();
    		//session=sessionFactory.openSession();
    	}
    	return session;
    }
}
