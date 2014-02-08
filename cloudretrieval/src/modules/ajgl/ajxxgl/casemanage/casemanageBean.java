package modules.ajgl.ajxxgl.casemanage;

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

public class casemanageBean  extends ResourceClose
{
	public casemanageBean()
    {
		
    }
	/*
     * 根据条件语句查询代码信息AJAX
     */
	 public String queryCase(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
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
	        	sqlSB.append("SELECT c.id,c.caseName,t.name,c.caseNo,c.receiptNo,auser,department,caseTime,(CASE WHEN caseStatus=0 THEN '未侦破' WHEN caseStatus=1 THEN '已侦破' END),area,location ");
	        	sqlSB.append("FROM t_m_case c,t_m_caseType t WHERE c.status=1 AND c.caseType=t.id ");
	            countSB.append("SELECT COUNT(c.id)  FROM t_m_case c,t_m_caseType t WHERE c.status=1 AND c.caseType=t.id ");
	            if(s!=null&&!s.equals("")){
	            	sqlSB.append(s);
	            	countSB.append(s);
	            }
	            sqlSB.append("order by c.id desc ");
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
	            
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"查询案件信息成功！",casemanageBean.class.getName());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.queryCase出现数据库错误，操作为：查询案件信息失败！"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.queryCase出现数据库错误，操作为：查询案件信息失败！"+ue.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.queryCase出现数据库错误，操作为：查询案件信息失败！"+ce.getMessage(),casemanageBean.class.getName());
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
		public String detailCase(long id, ServletContext sc,HttpSession session) throws CustomException, Exception
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
	        
	        StringBuffer tsb = null;
	        
	        Connection con=null;//保存数据库连接
	        PreparedStatement pstm=null;//保存预处理语句
	        ResultSet rs=null;//保存查询的结果集
	        String caseNo=null;
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	            }
	            tsb=new StringBuffer();
	            infoSB=new StringBuffer();
	            sqlSB=new StringBuffer();
	            sqlSB.append("SELECT c.caseName,t.name,c.caseNo,c.receiptNo,c.auser,c.department,c.caseTime,(CASE WHEN caseStatus=0 THEN '未侦破' WHEN caseStatus=1 THEN '已侦破' END),area,location ");
	        	sqlSB.append("FROM t_m_case c,t_m_caseType t WHERE c.id=? ");
	        	pstm=con.prepareStatement(sqlSB.toString());
	        	pstm.setLong(1, id);
	        	rs=pstm.executeQuery();
				ResultSetMetaData rsmd = rs.getMetaData();
				int numberOfColumns = rsmd.getColumnCount();

				if (rs != null && rs.next())
				{
					caseNo=rs.getString("caseNo");
					for (int i = 1; i <= numberOfColumns; i++)
					{
						infoSB.append(basePublic.out(rs.getString(i))).append("</C>");
					}
					infoSB.append("</R>");
	            }
				infoSB.append("|");
				pstm=con.prepareStatement("SELECT GROUP_CONCAT(v.name),GROUP_CONCAT(v.value),GROUP_CONCAT(v.url),GROUP_CONCAT(v.path),GROUP_CONCAT(v.id) FROM t_m_casevideos c,t_m_videos v WHERE " +
						"c.video_code=v.id AND c.status=1 AND  c.case_code=? ");
				pstm.setString(1, caseNo);
				rs=pstm.executeQuery();
				if(rs!=null && rs.next()){
					infoSB.append(rs.getString(1)).append("</C>");
					infoSB.append(rs.getString(2)).append("</C>");
					infoSB.append(rs.getString(3)).append("</C>");
					infoSB.append(rs.getString(4)).append("</C>");
					infoSB.append(rs.getString(5)).append("</C>");
				}
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"查看案件详细信息成功！",casemanageBean.class.getName());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现数据库错误，操作为：查看案件详细信息失败！"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现转化字符集错误，操作为：查看案件详细信息失败！"+ue.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现错误，操作为：查看案件详细信息失败！"+ce.getMessage(),casemanageBean.class.getName());
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
		public String beforUpdateCase(long id, ServletContext sc,HttpSession session) throws CustomException, Exception
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
	            sqlSB.append("SELECT c.caseName,c.caseType,c.caseNo,c.receiptNo,c.auser,c.department,c.caseTime,c.caseStatus,c.area,c.location,GROUP_CONCAT(v.video_code) ");
	        	sqlSB.append("FROM t_m_case c,t_m_casevideos v WHERE c.caseNo=v.case_code AND v.status=1 AND c.id=? ");
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
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"查看案件详细信息成功！",casemanageBean.class.getName());
	            //System.out.println(infoSB.toString());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现数据库错误，操作为：查看案件详细信息失败！"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现转化字符集错误，操作为：查看案件详细信息失败！"+ue.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现错误，操作为：查看案件详细信息失败！"+ce.getMessage(),casemanageBean.class.getName());
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
		public int updateCase(long id,String sqlString,String v_str,String caseCode, ServletContext sc,HttpSession session) throws CustomException, Exception
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
	            sqlSB.append("UPDATE t_m_case SET ");
	            sqlSB.append(sqlString);
	            sqlSB.append(" WHERE id=?");
	            con.setAutoCommit(false);
		        	pstm=con.prepareStatement(sqlSB.toString());
		        	pstm.setLong(1, id);
		        	num=pstm.executeUpdate();
		        	pstm=con.prepareStatement("UPDATE t_m_casevideos SET status=0 WHERE case_code='"+caseCode+"'");
		        	pstm.executeUpdate();
		        	if(v_str!=null && !v_str.equals("")){
		        		String[] v_array=v_str.split(",");
		        		for(int i=0;i<v_array.length;i++){
		        			pstm=con.prepareStatement("INSERT INTO t_m_casevideos (case_code,video_code) VALUES ('"+caseCode+"','"+v_array[i]+"')");
		        			pstm.executeUpdate();
		        		}
		        	}
				con.commit();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"修改案件信息成功！",casemanageBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.updateCase出现数据库错误，操作为：修改案件信息失败！"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.updateCase出现错误，操作为：修改案件信息失败！"+ce.getMessage(),casemanageBean.class.getName());
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
		public int insertCase(String sqlString1,String sqlString2,String sqlString3,String caseNo, ServletContext sc,HttpSession session) throws CustomException, Exception
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
	            String[] v_array=sqlString3.split(",");
	            sqlSB=new StringBuffer();
	            sqlSB.append("INSERT t_m_case (");
	            sqlSB.append(sqlString1);
	            sqlSB.append(") VALUES (");
	            sqlSB.append(sqlString2);
	            sqlSB.append(")");
	            con.setAutoCommit(false);
		        	pstm=con.prepareStatement(sqlSB.toString());
		        	num=pstm.executeUpdate();
		        	pstm.addBatch();
		        	if(v_array.length>0 && !sqlString3.equals("")){
		        		for(int m=0;m<v_array.length;m++){
			        		pstm=con.prepareStatement("INSERT INTO t_m_casevideos (case_code,video_code) VALUES ('"+caseNo+"','"+v_array[m]+"')");
			        		num=pstm.executeUpdate();
			        		pstm.addBatch();
		        		}
		        	}
		        	
		        //pstm.executeBatch();
		        con.commit();
				
				LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"添加案件信息成功！",casemanageBean.class.getName());
	            return 1;
	        }
	        catch (SQLException sql)
	        {
	        	con.rollback();
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.insertCase出现数据库错误，操作为：添加案件信息失败！"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	        }
	        catch (Exception ce)
	        {
	        	con.rollback();
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.insertCase出现错误，操作为：添加案件信息失败！"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	        	con.setAutoCommit(true);
	            //关闭所有可用资源
	            pstm.close();
	            con.close();
	        }
		
		}
		
		//随机编码
	    public String getRandId(ServletContext sc,HttpSession session)
	    throws CustomException,Exception
	    {
	 	   String retString=""; 
	 	   if (sc == null)
	        {
	       //     System.out.println("ServletContext 为空，返回。");
	            throw new CustomException("ServletContext 为空，返回");
	        }
	        if (session==null)
	        {
	        //    System.out.println("HttpSession 为空，返回。");
	            throw new CustomException("HttpSession 为空，返回");
	        }
	        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	        
	        baseForm bform=(baseForm)session.getAttribute("baseuser");
	        if (bform==null)
	        {
	        	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
	        }
	        
	        String sqlSB = "";
	        
	        Connection con=null;//保存数据库连接
	        PreparedStatement pstm=null;//保存预处理语句
	        ResultSet rs=null;
	        String randIdStr ="";
	        long  randId = 0;
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	            }
	            sqlSB = ("select count(*) from t_m_case");
	            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
	            rs=pstm.executeQuery();
	            
	            rs=pstm.executeQuery();
	            if(rs!=null && rs.next()){
	         	   randId =  rs.getLong(1);
	            }
	            
	            while(true){
	         	   randId++;
	         	   randIdStr = String.format("case%d", randId);
	         	   sqlSB = "select '"+randIdStr+"' from t_m_case";
	                pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
	                rs=pstm.executeQuery();
	                if(rs.getRow()<1)
	          		  break;
	                if(rs!=null && rs.next())
	             	   ;
	            }
	            
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"添加案件时随机编码生成成功！",casemanageBean.class.getName());
	            
	            retString = randIdStr;
	           
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.getRandId出现数据库连接错误，操作为：添加案件时随机编码生成失败"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.getRandId出现转化字符集连接错误，操作为：添加案件时随机编码生成失败："+ue.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.getRandId出现连接错误，操作为：添加案件时随机编码生成失败"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	            //关闭所有可用资源
	            close(null,pstm,null,con);
	        }
	 	   return retString;
	    }
	    
	    /*
		 * 根据ID值查询详细的代码信息AJAX
		 */
		public int deleteCase(long id, ServletContext sc,HttpSession session) throws CustomException, Exception
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
	            sqlSB.append("UPDATE t_m_case SET status=0 WHERE id=?");
	        	pstm=con.prepareStatement(sqlSB.toString());
	        	pstm.setLong(1, id);
	        	num=pstm.executeUpdate();
				
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"删除案件信息成功！",casemanageBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.deleteCase出现数据库错误，操作为：删除案件信息失败！"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误.
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.deleteCase出现错误，操作为：删除案件信息失败！"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	            //关闭所有可用资源
	            pstm.close();
	            con.close();
	        }
		
		}
		
		public String getVideos(String s,ServletContext sc,HttpSession session)
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
	        	sqlSB.append("SELECT v.id,v.name,v.uploader,l.locationName,v.absTime ");
	        	sqlSB.append("FROM t_m_videos v,t_s_location l  WHERE v.locationId=l.locationId ");
	            if(s!=null&&!s.equals("")){
	            	sqlSB.append(s);
	            }
	            sqlSB.append(" ORDER BY id DESC LIMIT 10000 ");
	            pstm=con.prepareStatement(sqlSB.toString());
	            rs=pstm.executeQuery();
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
	            
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"查询视频列表信息成功！",casemanageBean.class.getName());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.getvideos出现数据库错误，操作为：查询视频列表信息失败！"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.getvideos出现数据库错误，操作为：查询视频列表信息失败！"+ue.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.getvideos出现数据库错误，操作为：查询视频列表信息失败！"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	            //关闭所有可用资源
	            close(rs,pstm,null,con);
	        }
	 }
		public String videoDetail(Long v_id,ServletContext sc,HttpSession session)
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
	            pstm=con.prepareStatement("SELECT v.url,v.path,v.value FROM t_m_videos v WHERE v.id=?");
	            pstm.setLong(1, v_id);
	            rs=pstm.executeQuery();

				if (rs != null && rs.next())
				{
					infoSB.append(rs.getString(1)).append("/").append(rs.getString(2)).append("/").append(rs.getString(3));
	            }
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"查询案件视频详情信息成功！",casemanageBean.class.getName());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.videoDetail出现数据库错误，操作为：查询案件视频详情信息失败！"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.videoDetail出现数据库错误，操作为：查询案件视频详情信息失败！"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	            //关闭所有可用资源
	            close(rs,pstm,null,con);
	        }
	 }
		
		
		public void videoSession(long v_id,long c_id,ServletContext sc,HttpSession session)
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
	        StringBuffer sessionSB=null;
	        //保存SQL语句
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
	            sessionSB=new StringBuffer();
	            pstm=con.prepareStatement("select id,caseId,videoId,videoTime,content,user,ctTime from t_m_videocomment where caseId=? and videoId=? and status=1 order by id desc");
	            //System.out.println("select id,caseId,videoId,videoTime,content,user,ctTime from t_m_videocomment where caseId='"+c_id+"' and videoId='"+v_id+"'");
	            pstm.setLong(1, c_id);
	            pstm.setLong(2, v_id);
	            rs=pstm.executeQuery();
	            while(rs!=null && rs.next()){
	            	sessionSB.append("<tr id='"+rs.getLong(1)+"'  onclick='jump(this);'>");
	            	sessionSB.append("<td style='ttd'>"+rs.getLong(2)+"</td>");
	            	sessionSB.append("<td style='ttd'>"+rs.getLong(3)+"</td>");
	            	sessionSB.append("<td style='ttd'>"+rs.getString(4)+"</td>");
	            	sessionSB.append("<td style='ttd'>"+rs.getString(6)+"</td>");
	            	sessionSB.append("<td style='ttd'>"+rs.getString(7)+"</td>");
	            	sessionSB.append("<td style='ttd'>"+rs.getString(5)+"</td>");
	            	sessionSB.append("</tr>");
	            }
	            //System.out.println(sessionSB.toString());
	            session.setAttribute("v_content", sessionSB.toString());
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.videoSession出现数据库错误，操作为：查询案视频件信息失败！"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.videoSession出现数据库错误，操作为：查询案件视频信息失败！"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	            //关闭所有可用资源
	            close(rs,pstm,null,con);
	        }
	 }
		
		/*
		 * 添加视频备注
		 */
		public long addVideoComment(String sqlString,String videoTime, ServletContext sc,HttpSession session) throws CustomException, Exception
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
	        
	        Connection con=null;//保存数据库连接
	        PreparedStatement pstm=null;//保存预处理语句
	        long info=0;
	        ResultSet rs=null;
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	            }
	            
	            con.setAutoCommit(false);
		        	pstm=con.prepareStatement(sqlString);
		        	pstm.executeUpdate();
		        	pstm.addBatch();
		        	pstm=con.prepareStatement("select id from t_m_videocomment where user=? and ctTime=?");
		        	pstm.setString(1, bform.user_code);
		        	pstm.setString(2, videoTime);
		        	rs=pstm.executeQuery();
		        	pstm.addBatch();
		        	if(rs!=null && rs.next()){
		        		info=rs.getLong(1);
		        	}
		        con.commit();
				
				LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"添加备注信息成功！",casemanageBean.class.getName());
	            return info;
	        }
	        catch (SQLException sql)
	        {
	        	con.rollback();
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.addVideoComment出现数据库错误，操作为：添加备注信息失败！"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	        }
	        catch (Exception ce)
	        {
	        	con.rollback();
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.addVideoComment出现错误，操作为：添加备注信息失败！"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	        	con.setAutoCommit(true);
	            //关闭所有可用资源
	            pstm.close();
	            con.close();
	        }
		
		}
		/*
		 * 添加视频备注
		 */
		
		public int updateVideoComment(String sqlString,ServletContext sc,HttpSession session) throws CustomException, Exception
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
	        
	        Connection con=null;//保存数据库连接
	        PreparedStatement pstm=null;//保存预处理语句
	        int num=0;
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	            }
	            
	        	pstm=con.prepareStatement(sqlString);
	        	num=pstm.executeUpdate();
		        	
				LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"修改备注信息成功！",casemanageBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	        	con.rollback();
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.updateVideoComment出现数据库错误，操作为：修改备注信息失败！"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	        }
	        catch (Exception ce)
	        {
	        	con.rollback();
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.updateVideoComment出现错误，操作为：修改备注信息失败！"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	        	con.setAutoCommit(true);
	            //关闭所有可用资源
	            pstm.close();
	            con.close();
	        }
		
		}
		
		public int deleteVideoComment(String sqlString,ServletContext sc,HttpSession session) throws CustomException, Exception
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
	        
	        Connection con=null;//保存数据库连接
	        PreparedStatement pstm=null;//保存预处理语句
	        int num=0;
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	            }
	            
	        	pstm=con.prepareStatement(sqlString);
	        	num=pstm.executeUpdate();
		        	
				LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"删除备注信息成功！",casemanageBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	        	con.rollback();
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.deleteVideoComment出现数据库错误，操作为：删除备注信息失败！"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	        }
	        catch (Exception ce)
	        {
	        	con.rollback();
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.deleteVideoComment出现错误，操作为：删除备注信息失败！"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	        }
	        finally
	        {
	        	con.setAutoCommit(true);
	            //关闭所有可用资源
	            pstm.close();
	            con.close();
	        }
		
		}
}
