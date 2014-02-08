/*
 * @(#)statisticBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.cloud.statistic;

import java.sql.*;
import java.util.ResourceBundle;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.Authenticator;
import java.net.PasswordAuthentication;

import modules.log.*;
import javax.sql.DataSource;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import modules.base.*;
import modules.cloud.watchedFolder.WatchedFolder;

/**
 * 功能:本类为代码信息的Bean类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: statisticBean.java,v 1.1 2012/09/30 01:54:04 Administrator Exp $
 */
public class statisticBean extends ResourceClose
{   
    public statisticBean()
    {
    }

    /*
     * 构造函数
     */
    /*
    public statisticBean(DataSource dataSource)
    {
    }
    */

    /*
     * 根据条件语句查询代码信息AJAX
     */
    public String queryStatistic(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
    throws CustomException,Exception
    {
    	//System.out.println("queryRT traffic!");
//    	判断环境实例是否为空
        if (sc == null)
        {
        //    System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
         //   System.out.println("HttpSession 为空，返回。");
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
        StringBuffer sqlSB2 = null;
        
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
            sqlSB2=new StringBuffer();
            countSB=new StringBuffer();
        	//sqlSB.append("select r.id,r.LPNumber,r.frameCTS,r.absTime ");
        	//sqlSB.append("from t_m_report r,t_m_tasks t,t_m_videos v where r.status=1 and r.taskId=t.taskID and t.inputVideoId=v.id and v.uploader='"+bform.user_code+"' ");
        	sqlSB.append("select r.id,r.LPNumber,r.absTime,l.locationName ");
        	sqlSB.append("from t_m_report r,t_m_tasks t,t_m_videos v,(SELECT id FROM t_m_report ORDER BY id DESC " );
        	sqlSB.append(") s,t_s_location l where r.id=s.id and v.locationId=l.locationId and r.status=1 and r.taskId=t.taskID and t.inputVideoId=v.id ");
            countSB.append("select count(r.id)  from t_m_report r,t_m_tasks t,t_m_videos v,t_s_location l where r.status=1 and v.locationId=l.locationId and r.taskId=t.taskID and t.inputVideoId=v.id ");
            if(s!=null&&!s.equals("")){
            	sqlSB.append(" ");
            	sqlSB.append(s);
            	countSB.append(s);
            }
            sqlSB.append("order by r.id desc ");
            //System.out.println(sqlSB);
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
					// System.out.println(infoSB.toString());

				}
				// System.out.println(basePublic.out(rs.getString(2)));
				infoSB.append("</R>");
            }
            //System.out.println(infoSB.toString());
            infoSB.append("|");
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"根据watchedFolder查询分析结果成功！",WatchedFolder.class.getName());
            return infoSB.toString();
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现数据库错误，操作为：根据watchedFolder查询分析结果失败！"+sql.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现转化字符集错误，操作为：根据watchedFolder查询分析结果失败！"+ue.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现错误，操作为：根据watchedFolder查询分析结果失败！"+ce.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
    }
	
	
	public String statisticDetail(String id,ServletContext sc,HttpSession session)
    throws CustomException,Exception
    {
    	//System.out.println("queryRT traffic!");
//    	判断环境实例是否为空
        if (sc == null)
        {
        //    System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
         //   System.out.println("HttpSession 为空，返回。");
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
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
               return new PasswordAuthentication("admin", "resonate".toCharArray());
            }
        };
    	Authenticator.setDefault(auth);
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
        	sqlSB.append("select r.id,r.LPNumber,r.frameCTS,r.absTime,r.picUrl,t.outputVideoId,l.locationName ");
        	sqlSB.append("from t_m_report r,t_m_tasks t,t_s_location l,t_m_videos v where r.status=1 and l.locationId=v.locationId and r.taskId=t.taskID and r.id=?");
        	pstm=con.prepareStatement(sqlSB.toString());
        	pstm.setString(1, id);
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
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"根据watchedFolder查询分析结果成功！",WatchedFolder.class.getName());
            //System.out.println(infoSB.toString());
            return infoSB.toString();
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现数据库错误，操作为：根据watchedFolder查询分析结果失败！"+sql.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现转化字符集错误，操作为：根据watchedFolder查询分析结果失败！"+ue.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现错误，操作为：根据watchedFolder查询分析结果失败！"+ce.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
    }   
	public int deleteStatistic(int id,ServletContext sc,HttpSession session)
    throws CustomException,Exception
    {
    	//System.out.println("queryRT traffic!");
//    	判断环境实例是否为空
        if (sc == null)
        {
        //    System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
         //   System.out.println("HttpSession 为空，返回。");
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
        int num=0;//保存查询的结果集
        
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
        	sqlSB.append("update t_m_report set status=0 ");
        	sqlSB.append("where id=?");
        	pstm=con.prepareStatement(sqlSB.toString());
        	pstm.setInt(1, id);
        	num=pstm.executeUpdate();
		
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"根据watchedFolder查询分析结果成功！",WatchedFolder.class.getName());
            //System.out.println(infoSB.toString());
            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现数据库错误，操作为：根据watchedFolder查询分析结果失败！"+sql.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
        }
        
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现错误，操作为：根据watchedFolder查询分析结果失败！"+ce.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            con.close();
            pstm.close();
        }
    }
	
	public String chartReport(String time_1,String time_2,String location,ServletContext sc,HttpSession session)
    throws CustomException,Exception
    {
		//System.out.println(time_1+" "+time_2+" "+location);
		//System.out.println("queryRT traffic!");
//    	判断环境实例是否为空
        if (sc == null)
        {
        //    System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
         //   System.out.println("HttpSession 为空，返回。");
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
        StringBuffer infoSB1=null;
        StringBuffer infoSB2=null;
        StringBuffer infoSB3=null;
        StringBuffer infoSB4=null;
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
            infoSB1=new StringBuffer();
            infoSB2=new StringBuffer();
            infoSB3=new StringBuffer();
            infoSB4=new StringBuffer();
            
            sqlSB=new StringBuffer();
        	sqlSB.append("SELECT COUNT(r.id),SUBSTR(r.absTime,1,10) ");
        	sqlSB.append("FROM t_m_report r,t_m_tasks t,t_m_videos v WHERE r.status=1 AND t.inputVideoId=v.id AND r.taskId=t.taskID AND r.absTime BETWEEN ? AND ? AND v.locationId LIKE ? GROUP BY SUBSTR(r.absTime,1,10)");
        	pstm=con.prepareStatement(sqlSB.toString());
        	pstm.setString(1, time_1);
        	pstm.setString(2, time_2);
        	pstm.setString(3, "%"+location+"%");
        	rs=pstm.executeQuery();

			while (rs != null && rs.next())
			{
				if(rs.isLast()){
					infoSB1.append(rs.getString(1));
					infoSB2.append(rs.getString(2));
				}else{
					infoSB1.append(rs.getString(1));
					infoSB1.append("</C>");
					infoSB2.append(rs.getString(2));
					infoSB2.append("</C>");
				}
            }
			pstm=con.prepareStatement("SELECT COUNT(r.id),l.locationName " +
					"FROM t_m_report r,t_m_tasks t,t_m_videos v,t_s_location l " +
					"WHERE r.status=1 AND t.inputVideoId=v.id AND r.taskId=t.taskID AND SUBSTR(v.locationId,1,"+(location.length()+2)+")=l.locationId " +
					"AND r.absTime BETWEEN ? AND ? AND v.locationId LIKE ? GROUP BY SUBSTR(v.locationId,1,"+(location.length()+2)+")");
			pstm.setString(1, time_1);
        	pstm.setString(2, time_2);
        	pstm.setString(3, "%"+location+"%");
        	rs=pstm.executeQuery();
			while (rs != null && rs.next())
			{
				if(rs.isLast()){
					infoSB3.append(rs.getString(1));
					infoSB4.append(rs.getString(2));
				}else{
					infoSB3.append(rs.getString(1));
					infoSB3.append("</C>");
					infoSB4.append(rs.getString(2));
					infoSB4.append("</C>");
				}
            }
			
            infoSB.append(infoSB1.toString()).append("</R>").append(infoSB2.toString()).append("</R>").append(infoSB3.toString()).append("</R>").append(infoSB4.toString()).append("</R>");
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"根据watchedFolder查询分析结果成功！",WatchedFolder.class.getName());
            
            return infoSB.toString();
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现数据库错误，操作为：根据watchedFolder查询分析结果失败！"+sql.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现错误，操作为：根据watchedFolder查询分析结果失败！"+ce.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
    }
}