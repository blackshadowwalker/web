package modules.ajgl.ajxxgl.casetype;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
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
import modules.cloud.watchedFolder.WatchedFolder;

public class casetypeBean  extends ResourceClose
{
	public casetypeBean()
    {
		
    }
	/*
     * 根据条件语句查询代码信息AJAX
     */
	 public String queryCasetype(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
	    throws CustomException,Exception
	    {
		 
		 if (sc == null)
	        {
	            throw new CustomException("ServletContext 为空，返回");
	        }

	        //判断会话实例是否为空
	        if (session==null)
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
	        //保存SQL语句
	        StringBuffer sqlSB = null;
	        Connection con=null;//保存数据库连接
	        PreparedStatement pstm=null;//保存预处理语句
	        ResultSet rs=null;//保存查询的结果集
	        
	        StringBuffer countSB = null;
	        PageMan pm=PageManFactory.getInstance();
	        
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	            }
	            infoSB=new StringBuffer();
	            sqlSB=new StringBuffer();
	            countSB=new StringBuffer();
	        	sqlSB.append("SELECT id,name ");
	        	sqlSB.append("FROM t_m_caseType  WHERE status=1 ");
	            countSB.append("SELECT COUNT(id)  FROM t_m_caseType WHERE status=1 ");
	            if(s!=null&&!s.equals("")){
	            	sqlSB.append(s);
	            	countSB.append(s);
	            }
	            sqlSB.append("order by id desc ");
	            rs=pm.list(con, perPage, curPage, countSB.toString(), basePublic.in(sqlSB.toString()));
	            
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
						infoSB.append(basePublic.out(rs.getString(i))).append(
								"</C>");
					}
					infoSB.append("</R>");
	            }
	            infoSB.append("|");
	            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
	            
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"查询案件信息成功！",casetypeBean.class.getName());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.queryCase出现数据库错误，操作为：查询案件信息失败！"+sql.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.queryCase出现数据库错误，操作为：查询案件信息失败！"+ue.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.queryCase出现数据库错误，操作为：查询案件信息失败！"+ce.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	            //关闭所有可用资源
	            close(rs,pstm,null,con);
	        }
	 }
	 	
	 
		/*
		 * 根据ID值查询详细的代码信息AJAX
		 */
		public String beforUpdateCasetype(long id, ServletContext sc,HttpSession session) throws CustomException, Exception
		{
			if (sc == null)
	        {
	            throw new CustomException("ServletContext 为空，返回");
	        }

	        //判断会话实例是否为空
	        if (session==null)
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
	        //保存SQL语句
	        StringBuffer sqlSB = null;
	        
	        Connection con=null;//保存数据库连接
	        PreparedStatement pstm=null;//保存预处理语句
	        ResultSet rs=null;//保存查询的结果集
	        
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	            }

	            infoSB=new StringBuffer();
	            sqlSB=new StringBuffer();
	            sqlSB.append("SELECT name ");
	        	sqlSB.append("FROM t_m_caseType WHERE id=? ");
	        	pstm=con.prepareStatement(sqlSB.toString());
	        	pstm.setLong(1, id);
	        	rs=pstm.executeQuery();
				ResultSetMetaData rsmd = rs.getMetaData();
				int numberOfColumns = rsmd.getColumnCount();

				while (rs != null && rs.next())
				{
					for (int i = 1; i <= numberOfColumns; i++)
					{
						infoSB.append(basePublic.out(rs.getString(i))).append("</C>");
					}
					infoSB.append("</R>");
	            }
	            //System.out.println(infoSB.toString());
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"查看案件详细信息成功！",casetypeBean.class.getName());
	            //System.out.println(infoSB.toString());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现数据库错误，操作为：查看案件详细信息失败！"+sql.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现转化字符集错误，操作为：查看案件详细信息失败！"+ue.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现错误，操作为：查看案件详细信息失败！"+ce.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	            //关闭所有可用资源
	            close(rs,pstm,null,con);
	        }
		
		}
		
		/*
		 * 根据ID值查询详细的代码信息AJAX
		 */
		public int updateCasetype(long id,String sqlString, ServletContext sc,HttpSession session) throws CustomException, Exception
		{
			if (sc == null)
	        {
	            throw new CustomException("ServletContext 为空，返回");
	        }

	        //判断会话实例是否为空
	        if (session==null)
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
	        int num=0;//保存查询的结果集
	        
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	            }

	            sqlSB=new StringBuffer();
	            sqlSB.append("UPDATE t_m_caseType SET ");
	            sqlSB.append(sqlString);
	            sqlSB.append(" WHERE id=?");
	            
	        	pstm=con.prepareStatement(sqlSB.toString());
	        	pstm.setLong(1, id);
	        	num=pstm.executeUpdate();
				
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"修改案件信息成功！",casetypeBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.updateCase出现数据库错误，操作为：修改案件信息失败！"+sql.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.updateCase出现错误，操作为：修改案件信息失败！"+ce.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	            //关闭所有可用资源
	            pstm.close();
	            con.close();
	        }
		
		}
		
		
		/*
		 * 根据ID值查询详细的代码信息AJAX
		 */
		public int insertCasetype(String sqlString1,String sqlString2, ServletContext sc,HttpSession session) throws CustomException, Exception
		{
			if (sc == null)
	        {
	            throw new CustomException("ServletContext 为空，返回");
	        }

	        //判断会话实例是否为空
	        if (session==null)
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
	        int num=0;//保存查询的结果集
	        
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	            }

	            sqlSB=new StringBuffer();
	            sqlSB.append("INSERT t_m_caseType (");
	            sqlSB.append(sqlString1);
	            sqlSB.append(") VALUES (");
	            sqlSB.append(sqlString2);
	            sqlSB.append(")");
	            
	        	pstm=con.prepareStatement(sqlSB.toString());
	        	num=pstm.executeUpdate();
				
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"添加案件信息成功！",casetypeBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.insertCase出现数据库错误，操作为：添加案件信息失败！"+sql.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.insertCase出现错误，操作为：添加案件信息失败！"+ce.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	            //关闭所有可用资源
	            pstm.close();
	            con.close();
	        }
		
		}
		
		
	    /*
		 * 根据ID值查询详细的代码信息AJAX
		 */
		public int deleteCasetype(long id, ServletContext sc,HttpSession session) throws CustomException, Exception
		{
			if (sc == null)
	        {
	            throw new CustomException("ServletContext 为空，返回");
	        }

	        //判断会话实例是否为空
	        if (session==null)
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
	        int num=0;//保存查询的结果集
	        
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	            }

	            sqlSB=new StringBuffer();
	            sqlSB.append("UPDATE t_m_caseType SET status=0 WHERE id=?");
	        	pstm=con.prepareStatement(sqlSB.toString());
	        	pstm.setLong(1, id);
	        	num=pstm.executeUpdate();
				
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"添加案件信息成功！",casetypeBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.insertCase出现数据库错误，操作为：添加案件信息失败！"+sql.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.insertCase出现错误，操作为：添加案件信息失败！"+ce.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	            //关闭所有可用资源
	            pstm.close();
	            con.close();
	        }
		
		}
}
