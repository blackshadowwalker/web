package modules.cloud.taskMgr;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import modules.base.CustomException;
import modules.base.LogBean;
import modules.base.PageMan;
import modules.base.PageManFactory;
import modules.base.ResourceClose;
import modules.base.baseForm;
import modules.base.basePublic;

public class taskMgrBean  extends ResourceClose
{ 
	private DataSource dataSource;
	public taskMgrBean()
	{

	}
	public taskMgrBean(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
    /*
	 * 根据条件语句查询代码信息AJAX
	 */
	public String queryTask(int perPage, int curPage, String s,
			ServletContext sc, HttpSession session) throws CustomException,
			Exception
	{
		
		// 判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		
		// 判断用户是否登录
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}
		// 保存查询结果信息
		StringBuffer infoSB = null;
		// 保存SQL语句
		StringBuffer sqlSB = null;
		StringBuffer countSB = null;

		Connection con = null;// 保存数据库连接
		ResultSet rs = null;// 保存查询的结果集

		PageMan pm = PageManFactory.getInstance();
		
		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();

			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}
			infoSB = new StringBuffer();
			sqlSB = new StringBuffer();
			countSB = new StringBuffer();

			sqlSB.append("select t.id,t.taskID,t.taskName,t.state,l.locationName,v.name,t.outputVideoId,t.creator,t.ctTime,t.lastUpdateTime from  t_m_tasks t ,t_s_location l,t_m_videos v   ");
            countSB.append("select count(*)  from  t_m_tasks t " );
            if(s!=null&&!s.equals("")){
            	sqlSB.append(s);
            	countSB.append(s);
            }
            sqlSB.append(" AND v.locationId = l.locationId  AND t.inputVideoId=v.id AND t.status=1 order by t.id desc");
            countSB.append(" AND t.status=1 order by t.id desc");
         //    System.out.println(sqlSB.toString());
         //  System.out.println(countSB.toString());
			rs = pm.list(con, perPage, curPage, countSB.toString(), sqlSB
					.toString());
			
			if(rs == null)
			{

				return "no";
			}

			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();
			

			while (rs != null && rs.next())
			{
				for (int i = 1; i <= numberOfColumns; i++)
				{
					if(i==2){
						infoSB.append("<input type='checkbox' id='check_"+basePublic.out(rs.getString(i))+"'  name='checkList' onclick='forGet(this)'>").append("</C>");
						
						}
					infoSB.append(basePublic.out(rs.getString(i))).append("</C>");

				}
			//  System.out.println(basePublic.out(rs.getString(2)));
				infoSB.append("</R>");
			}

			infoSB.append("|");

			infoSB.append(pm.getTotalPage()).append("</C>").append(
					pm.getTotalRow()).append("</C>").append(pm.getCurPage())
					.append("</C>");
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "查询任务管理信息成功！",taskMgrBean.class.getName());
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.queryTask出现数据库连接错误,操作为：查询任务管理信息信息失败!" + sql.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.queryTask出现转化字符错误,操作为：查询任务管理信息失败!" + ue.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.queryTask出现错误,操作为：查询任务管理信息失败!" + ce.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally
		{
			pm.close(true);

			close(rs, null, null, con);
			// 关闭所有可用资源
			// close(rs,pstm,null,con);
		}

		return infoSB.toString();
	}
	/*
	 * 根据ID值停止任务AJAX
	 */
	public int stopTask(String id,ServletContext sc,HttpSession session)
	   throws CustomException,Exception
	   {
		

		int flag = 0;
		// 判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
			throw new CustomException("HttpSession 为空，返回");
		}

		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		// 判断用户是否登录
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统

		}
		long task = 0;
		// 保存SQL语句
		StringBuffer sqlSB = null;
		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句
		ResultSet rs = null;// 保存查询的结果集
		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();

			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败

			}
			sqlSB = new StringBuffer();
			

			sqlSB.append("select taskID from  t_m_tasks where id=? ");
        
//			System.out.println(sqlSB.toString());
			pstm=con.prepareStatement(sqlSB.toString());
			
			pstm.setString(1, id);
			
 	        rs=pstm.executeQuery();
	        
		    if (rs!=null && rs.next())
	        {
		    	task = Long.parseLong(rs.getString("taskID"));
	        }
		    
		    System.out.println(task);
		//    medi.cancelTask(task, sc, session);
		    flag = 1;
	        LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "停止任务管理信息成功！",taskMgrBean.class.getName());
	    }
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.stopTask出现数据库连接错误,操作为：停止任务管理信息失败!" + sql.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.stopTask出现错误,操作为：停止任务管理信息失败!" + ce.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally
		{
			// 关闭所有可用资源
			close(rs, pstm, null, con);
		}
		 
		  return flag ;
		
	   }
	
	
	/*
	    * 修改前根据ID值查询详细的代码信息AJAX
	    */
	   public String beforeUpdateTask(long id,ServletContext sc,HttpSession session)
	       throws CustomException,Exception
	   {

		// 判断环境实例是否为空
			if(sc == null)
			{
				throw new CustomException("ServletContext 为空，返回");
			}

			// 判断会话实例是否为空
			if(session == null)
			{
				throw new CustomException("HttpSession 为空，返回");
			}
			
			ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	       //判断用户是否登录
	       baseForm bform=(baseForm)session.getAttribute("baseuser");
	       
	       if (bform==null)
	       {
	    	   throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统

	       }
	       
	       //保存查询结果信息
	       StringBuffer infoSB=null;
	       
	       Connection con=null;//保存数据库连接
	       PreparedStatement pstm=null;//保存预处理语句
	       ResultSet rs=null;//保存查询的结果集
	       DataSource ds=null;
	       try
	       {
	       	ds=(DataSource)sc.getAttribute("basedb");
	           con=ds.getConnection();
	           if (con==null)
	           {
	        	   throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败

	           }
	           
	           infoSB=new StringBuffer();
	           
	           pstm=con.prepareStatement("select t.taskID,t.taskName,t.state,l.locationName,v.name,t.creator,t.ctTime,t.lastUpdateTime,t.locationId,t.inputVideoId from  t_m_tasks t ,t_s_location l,t_m_videos v  WHERE  t.id=? AND v.locationId = l.locationId AND t.inputVideoId=v.id");
	         
	           pstm.setLong(1, id);
	           
	           rs=pstm.executeQuery();
	           if (rs!=null && rs.next())
	           {
	               infoSB.append(id).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("taskID"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("taskName"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("state"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("locationName"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("name"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("creator"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("ctTime"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("lastUpdateTime"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("locationId"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("inputVideoId"))).append("</C></R>");
	           }
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "修改前查询任务管理详细信息成功！",taskMgrBean.class.getName());
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "taskMgrBean.beforeUpdateTask出现数据库错误，操作为：" 
						+"修改前查询任务管理详细信息失败" + sql.getMessage(),taskMgrBean.class.getName());
	           throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "taskMgrBean.beforeUpdateTask出现转化字符集错误，操作为：" 
						+"修改前查询任务管理详细信息失败" + ue.getMessage(),taskMgrBean.class.getName());
	           throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//转化字符集时出现错误
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "taskMgrBean.beforeUpdateTask出现错误，操作为：" 
						+"修改前查询任务管理详细信息失败" + ce.getMessage(),taskMgrBean.class.getName());
	           throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
	       }
	       finally
	       {
	           //关闭所有可用资源
	           close(rs,pstm,null,con);
	       }

	       return infoSB.toString();
	   }
	
	/*
	 * 根据ID值查询报表信息AJAX
	 */
	public String taskReport(String[] taskIds,ServletContext sc,HttpSession session)
	   throws CustomException,Exception
	   {

		// 判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
			throw new CustomException("HttpSession 为空，返回");
		}

		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		// 判断用户是否登录
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null) 
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统

		}
		int task = 0;
		String local = "";
		//保存查询结果信息
        StringBuffer infoSB=null;
		// 保存SQL语句
		StringBuffer sqlSB = null;
		StringBuffer sqlSB1 = null;
		StringBuffer sqlSB2 = null;
		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句
		PreparedStatement pstm1 = null;// 保存预处理语句
		PreparedStatement pstm2 = null;// 保存预处理语句
		ResultSet rs = null;// 保存查询的结果集
		ResultSet rs1 = null;// 保存查询的结果集
		ResultSet rs2 = null;// 保存查询的结果集
		
		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();

			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败

			}
			infoSB = new StringBuffer();
			sqlSB = new StringBuffer();
			sqlSB1 = new StringBuffer();
			sqlSB2 = new StringBuffer();
			con.setAutoCommit(false);
			sqlSB.append("select t.taskID,v.locationId from  t_m_tasks t, t_m_videos v where t.taskID=? and t.inputVideoId = v.id ");
			for(int t=0;t<taskIds.length;t++){
				
				pstm=con.prepareStatement(sqlSB.toString());
				pstm.setString(1, taskIds[t]);				
			//	System.out.println(taskIds[t]);
				rs=pstm.executeQuery();
				pstm.addBatch();
				if(rs!=null && rs.next())
				{
					task = Integer.parseInt(rs.getString("taskID"));
					local = rs.getString("locationId");
				//	System.out.println(local);
					
				}
				sqlSB1.append("SELECT LPNumber,absTime FROM t_m_report  WHERE taskId='"+task+"' ");
				pstm2=con.prepareStatement(sqlSB1.toString());
			//	System.out.println(sqlSB1.toString());
				rs1=pstm2.executeQuery();
				sqlSB2.append("SELECT locationName FROM t_s_location WHERE ( ");
				// System.out.println(local);
				
				for(int i=1;i<=local.length()/2;i++){
					if(i==1){
						sqlSB2.append("  locationId='"+local.substring(0, i*2)+"' ");
					}else{
						sqlSB2.append(" or locationId='"+local.substring(0, i*2)+"' ");
					}
				}
				sqlSB2.append(" )");
				//  System.out.println(sqlSB1.toString());
				while(rs1!=null&&rs1.next()){
					int rowCount = rs1.getRow();
					infoSB.append(rowCount).append("</C>");
					infoSB.append(rs1.getString(1)).append("</C>");
					infoSB.append(rs1.getString(2)).append("</C>");
					
					pstm1=con.prepareStatement(sqlSB2.toString());
					rs2=pstm1.executeQuery();
					
					while(rs2!=null && rs2.next()){
						infoSB.append(rs2.getString(1));
					//	System.out.println(rs1.getString(1));
					}
					infoSB.append("</C>");
					infoSB.append("</R>");
				}
				sqlSB1 = new StringBuffer();
				sqlSB2 = new StringBuffer();
			}
		    con.commit();
		 // System.out.println(infoSB.toString());
	        LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "获取报表信息成功！",taskMgrBean.class.getName());
	    }
		catch (SQLException sql)
		{
			con.rollback();
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.taskReport出现数据库连接错误,操作为：获取报表信息失败!" + sql.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.taskReport出现错误,操作为：获取报表信息失败!" + ce.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally
		{
			// 关闭所有可用资源
			close(rs, pstm, null, con);
		}
		
		return infoSB.toString();
		
	   }
	
	
	
	/*
	    * 修改代码信息AJAX
	    */
	   public int updateTSTask(String id,String values,
	       ServletContext sc,HttpSession session) throws CustomException,Exception
	   {

		// 判断环境实例是否为空
			if(sc == null)
			{
				throw new CustomException("ServletContext 为空，返回");
			}

			// 判断会话实例是否为空
			if(session == null)
			{
				throw new CustomException("HttpSession 为空，返回");
			}

		   ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	       //判断用户是否登录
	       baseForm bform=(baseForm)session.getAttribute("baseuser");
	       if (bform==null)
	       {
	    	   throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统

	       }


	       //保存SQL语句
	       StringBuffer sqlSB = null;
	       
	       Connection con=null;//保存数据库连接
	       PreparedStatement pstm=null;//保存预处理语句
	       DataSource ds=null;
	       try
	       {
	       	ds=(DataSource)sc.getAttribute("basedb");
	           con=ds.getConnection();
	           if (con==null)
	           {
	        	   throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败

	           }

	           sqlSB=new StringBuffer();

	           sqlSB.append("update t_m_tasks set ").append(values).append(" where id=").append(id);
	           pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

	           int num=pstm.executeUpdate();

	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "修改任务管理信息成功！",taskMgrBean.class.getName());
	          
	          return num;
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "taskMgrBean.updateTSTask出现数据库错误，操作为：" 
						+"修改任务管理信息失败" + sql.getMessage(),taskMgrBean.class.getName());
	           throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "taskMgrBean.updateTSTask出现转化字符集错误，操作为：" 
						+"修改任务管理信息失败" + ue.getMessage(),taskMgrBean.class.getName());
	           throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//出现数据库连接方面的错误
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "taskMgrBean.updateTSTask出现错误，操作为：" 
						+"修改任务管理信息失败" + ce.getMessage(),taskMgrBean.class.getName());
	           throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
	       }
	       finally
	       {
	           //关闭所有可用资源
	           close(null,pstm,null,con);
	       }
	   }
	
	
	/*
	 * 根据ID值查询详细的代码信息AJAX
	 */
	public String detailTask(String id, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{
		// 判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
			throw new CustomException("HttpSession 为空，返回");
		}

		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		// 判断用户是否登录
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统

		}
		// 保存查询结果信息
		StringBuffer infoSB = null;
		// 保存SQL语句
		StringBuffer sqlSB = null;
		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句
		ResultSet rs = null;// 保存查询的结果集

		
		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();

			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
				
			}
			infoSB = new StringBuffer();
			sqlSB = new StringBuffer();

			sqlSB.append("select t.taskID,t.taskName,t.state,l.locationName,v.name,t.creator,t.ctTime,t.lastUpdateTime from  t_m_tasks t ,t_s_location l,t_m_videos v  WHERE  t.id=? AND v.locationId = l.locationId AND t.inputVideoId=v.id ");
			pstm=con.prepareStatement(sqlSB.toString());
			pstm.setString(1, id);
		    rs=pstm.executeQuery();
		    while (rs!=null && rs.next())
	        {
		    	 infoSB.append(basePublic.out(rs.getString(1))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(2))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(3))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(4))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(5))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(6))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(7))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(8))).append("</C>");
	             infoSB.append("</R>");
	        }
	        LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "任务管理详细信息查询成功！",taskMgrBean.class.getName());
	    }
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.detailTask出现数据库连接错误,操作为：任务管理详细信息查询失败!" + sql.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.detailTask出现错误,操作为：任务管理详细信息查询失败!" + ce.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally
		{
			// 关闭所有可用资源
			close(rs, pstm, null, con);
		}

		return infoSB.toString();
	}

}
