package modules.base;
import java.util.Enumeration;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Timer;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.apache.struts.Globals;
import org.apache.struts.taglib.bean.StrutsTag;
import org.apache.struts.util.MessageResources;
import org.apache.xbean.spring.context.ClassPathXmlApplicationContext;
import org.springframework.context.ApplicationContext;

public class ContextListener
    extends HttpServlet 
    implements ServletContextListener {

	Logger logger = null;
	
  public ContextListener() {
	   logger= Logger.getLogger(baseServlet.class);
  }

  private java.util.Timer timer = null;
  private java.util.Timer autoBackupDatabaseTimer = null;
  
  private String title = "";
  
  public void contextInitialized(ServletContextEvent event) {
    timer = new java.util.Timer(true);
    
    autoBackupDatabaseTimer = new java.util.Timer(true);
    
    ServletContext sc = event.getServletContext();
    
    System.out.println("*************** init ContextListener **********************");
    Enumeration pars = sc.getInitParameterNames();
    while(pars.hasMoreElements()){
    	String name = (String)pars.nextElement();
    	String value = sc.getInitParameter(name);
    	System.out.println(name+"="+value);
    	sc.setAttribute(name, value);
    }
    title = sc.getInitParameter("systemName");
    System.out.println("*********************************************************");
	// set dataSource
	ApplicationContext ctx = new ClassPathXmlApplicationContext("../applicationContext.xml");  
	DataSource ds = (DataSource)ctx.getBean("dataSource");  
	sc.setAttribute("basedb", ds);
	
    logger.info(title+"--定时器启动");
    event.getServletContext().log(title+"--定时器启动");
    System.out.println(title+"--定时器启动");
    autoBackupDatabaseTimer.schedule(new MyTask_autoBackup(event.getServletContext()), 2000,  60*60*1000);

  }

  public void contextDestroyed(ServletContextEvent event) {
    timer.cancel();
    logger.info(title+"--定时器销毁");
    event.getServletContext().log(title+"--定时器销毁");
    System.out.println(title+"--定时器销毁");
    
  }

}
