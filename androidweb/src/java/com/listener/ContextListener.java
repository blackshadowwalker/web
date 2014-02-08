package com.listener;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ContextListener  extends HttpServlet 
	implements ServletContextListener{
	
	static Logger logger = Logger.getLogger(ContextListener.class);
	private static String  JDBC_PROPERTIES= "WEB-INF/classes/jdbc.properties";
	static String database="";

	public void contextDestroyed(ServletContextEvent arg0) {
		
	}
	


	public void contextInitialized(ServletContextEvent event) {
		 
	    ServletContext sc = event.getServletContext();

	    // set dataSource
		ApplicationContext ctx = new ClassPathXmlApplicationContext("../applicationContext.xml");  
		DataSource basedb = (DataSource)ctx.getBean("dataSource");  
		DataSource sqlite = (DataSource)ctx.getBean("sqlite");  
		sc.setAttribute("basedb", basedb);
		sc.setAttribute("sqlite", sqlite);
		Connection conn;
		try {
			conn = sqlite.getConnection();
			DatabaseMetaData dbmd = conn.getMetaData();  
			System.out.println( "Sqlite.db = ["+dbmd.getURL()+"]");
			
			PreparedStatement pstm = conn.prepareStatement("select * from t_s_user");
			ResultSet rs = pstm.executeQuery();
			while(rs!=null && rs.next()){
				System.out.println(rs.getString(2)+"  ");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		logger.info("mysql jdbc="+basedb.toString());
		logger.info("sqlite jdbc="+sqlite.toString());
		
		logger.info("ContextInitialized!");
		
	}
	
	/*
	public void initSqlite(ServletContext sc) throws FileNotFoundException{
		
		String thisRealPath = sc.getRealPath("/");
		String thisPath = sc.getContextPath();
		
		String sqliteDir = thisRealPath+"/WEB-INF";//thisRealPath.substring(0, thisRealPath.lastIndexOf(thisPath));
		String sqlitePath = sqliteDir+"/sqlite.db";
		System.out.println("init sqlite @ "+sqlitePath);
		File file  = new File(sqlitePath);
		if(file.exists()){
			return ;
		}
        
		 try {  
	            long start = System.currentTimeMillis();  
	            // 连接SQLite的JDBC  
	            Class.forName("org.sqlite.JDBC");  
	            // 建立一个数据库名test.db的连接，如果不存在就在当前目录下创建之  
	            Connection conn = DriverManager.getConnection("jdbc:sqlite://"+sqlitePath);  
	            long end = System.currentTimeMillis();  
	            System.out.println("创建数据库文件并连接耗费时间：" + (end - start));  
	              
	            conn.close();  
	              
	            start = System.currentTimeMillis();  
	            conn = DriverManager.getConnection("jdbc:sqlite://"+sqlitePath);   
	            end = System.currentTimeMillis();  
	            System.out.println("数据库连接耗费时间：" + (end - start));  
	              
	            start = System.currentTimeMillis();  
	            Statement stat = conn.createStatement();  
	            // 创建一个表，两列  
	            stat.executeUpdate("create table tbl1(name varchar(20), salary int);");           
	            end = System.currentTimeMillis();  
	            System.out.println("创建表耗费时间：" + (end - start));  
	              
	            // 插入数据  
	            start = System.currentTimeMillis();  
	            stat.executeUpdate("insert into tbl1 values('ZhangSan',8000);");  
	            stat.executeUpdate("insert into tbl1 values('LiSi',7800);");  
	            stat.executeUpdate("insert into tbl1 values('WangWu',5800);");  
	            stat.executeUpdate("insert into tbl1 values('ZhaoLiu',9100);");  
	            end = System.currentTimeMillis();  
	            System.out.println("插入四行数据耗费时间：" + (end - start));  
	              
	            start = System.currentTimeMillis();  
	            ResultSet rs = stat.executeQuery("select * from tbl1;"); // 查询数据  
	            while (rs.next()) { // 将查询到的数据打印出来  
	                System.out.print("name = " + rs.getString("name") + " "); // 列属性一  
	                System.out.println("salary = " + rs.getString("salary")); // 列属性二  
	            }  
	            rs.close();  
	            end = System.currentTimeMillis();  
	            System.out.println("查询数据耗费时间：" + (end - start));              
	              
	            conn.close(); // 结束数据库的连接  
	  
	  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	}
	*/

}
