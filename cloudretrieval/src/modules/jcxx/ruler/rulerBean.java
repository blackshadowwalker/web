/*
 * @(#)rulerBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.ruler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.ResultSetMetaData;
import java.util.ResourceBundle;
import java.io.UnsupportedEncodingException;
import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import modules.base.*;

/**
 * 功能:本类为权限信息的Bean类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: rulerBean.java,v 1.1 2012/09/30 01:54:28 Administrator Exp $
 */
public class rulerBean extends ResourceClose
{
    //private DataSource dataSource;
    //private String date = TimeBean.getCurrentTime();
  
    public rulerBean()
    {
    }

    /*
     * 构造函数
     */
    /*
    public rulerBean(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
	*/
    /*
     * 删除权限信息AJAX
     */
    public int deleteTSRuler(String value,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        // 判断环境实例是否为空
        if (sc == null)
        {
            basePublic.error("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
        	basePublic.error("HttpSession 为空，返回。");
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
        //ResultSet rs=null;//保存查询的结果集
        DataSource ds=null;
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            { 
            	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|删除权限信息（t_s_ruler）时，数据库连接Connection为空，连接失败");
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            sqlSB=new StringBuffer();
            int num = 0;

            sqlSB.append("update t_s_ruler set status=0 where id=?");
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

            pstm.setLong(1,Long.parseLong(value));
            
            num = pstm.executeUpdate();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "删除菜单管理信息成功！",rulerBean.class.getName());
            return num;

        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.deleteTSRuler出现数据库连接错误,操作为：删除菜单管理信息失败!" + sql.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.deleteTSRuler出现转化字符错误,操作为：删除菜单管理信息失败!" + ue.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.deleteTSRuler出现错误,操作为：删除菜单管理信息失败!" + ce.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
        finally
        {
            //关闭所有可用资源
            close(null,pstm,null,con);
        }

    }

    /*
     * 添加权限信息AJAX
     */
    public String addTSRuler(String labels,String values,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        //判断环境实例是否为空
        if (sc == null)
        {
        	basePublic.error("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
        	basePublic.error("HttpSession 为空，返回。");
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
        //ResultSet rs=null;//保存查询的结果集
        DataSource ds=null;
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
            	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|添加权限信息（t_s_ruler）时，数据库连接Connection为空，连接失败");
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("insert into t_s_ruler(").append(labels).append(") values (").append(values).append(")");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            int num=pstm.executeUpdate();
            infoSB.append(Integer.toString(num)).append("</C></R>");
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "添加菜单管理信息成功！",rulerBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.addTSRuler出现数据库连接错误,操作为：添加菜单管理信息失败!" + sql.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.addTSRuler出现转化字符错误,操作为：添加菜单管理信息失败!" + ue.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.addTSRuler出现错误,操作为：添加菜单管理信息失败!" + ce.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
        finally
        {
            //关闭所有可用资源
            close(null,pstm,null,con);
        }
        return infoSB.toString();
    }


    /*
     * 修改前根据ID值查询详细的权限信息AJAX
     */
    public String beforeUpdateTSRuler(String s,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //判断环境实例是否为空
        if (sc == null)
        {
        	basePublic.error("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
        	basePublic.error("HttpSession 为空，返回。");
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
            sqlSB=new StringBuffer();
            
            sqlSB.append("select ");
            sqlSB.append("id");
            sqlSB.append(",");
            sqlSB.append("ruler_code");
            sqlSB.append(",");
            sqlSB.append("ruler_name");
            sqlSB.append(",");
            sqlSB.append("ruler_desc");
            sqlSB.append(",");
            sqlSB.append("ruler_page");
            sqlSB.append(",");
            sqlSB.append("ruler_level");
            sqlSB.append(",");
            sqlSB.append("target");
            sqlSB.append(",");
            sqlSB.append("ruler_echo");
            sqlSB.append(",");
            sqlSB.append("ruler_manager");
            sqlSB.append(" from t_s_ruler ");
            sqlSB.append("where id=?");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1,Long.parseLong(s));
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("id"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_code"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_name"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_desc"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_page"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_level"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("target"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_echo"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_manager"))).append("</C>");

                infoSB.append("</R>");
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "菜单管理信息修改前查询成功！",rulerBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.beforeUpdateTSRuler出现数据库连接错误,操作为：菜单管理信息修改前查询失败!" + sql.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.beforeUpdateTSRuler出现转化字符错误,操作为：菜单管理信息修改前查询失败!" + ue.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.beforeUpdateTSRuler出现错误,操作为：菜单管理信息修改前查询失败!" + ce.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /*
     * 修改权限信息AJAX
     */
    public String updateTSRuler(String id,String values,
        ServletContext sc,HttpSession session) throws CustomException,Exception
    {
        //判断环境实例是否为空
        if (sc == null)
        {
        	basePublic.error("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
        	basePublic.error("HttpSession 为空，返回。");
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
            sqlSB=new StringBuffer();

            sqlSB.append("update t_s_ruler set ").append(values).append(" where id=").append(id);
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            

            int num=pstm.executeUpdate();

            infoSB.append(num).append("</C></R>");
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "修改菜单管理信息成功！",rulerBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.updateTSRuler出现数据库连接错误,操作为：修改菜单管理信息失败!" + sql.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.updateTSRuler出现转化字符错误,操作为：修改菜单管理信息失败!" + ue.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.updateTSRuler出现错误,操作为：修改菜单管理信息失败!" + ce.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    /*
     * 根据条件语句查询权限信息AJAX
     */
    public String queryTSRuler(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //判断环境实例是否为空
        if (sc == null)
        {
        	basePublic.error("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
        	basePublic.error("HttpSession 为空，返回。");
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
        
        StringBuffer countSB = null;
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        
        PageMan pm=PageManFactory.getInstance();
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|根据条件语句查询权限信息（t_s_ruler）时，数据库连接Connection为空，连接失败");
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            countSB=new StringBuffer();
            
            sqlSB.append("select ");
            sqlSB.append("id");
            sqlSB.append(",");
            sqlSB.append("ruler_code");
            sqlSB.append(",");
            sqlSB.append("ruler_name");
            sqlSB.append(",");
            sqlSB.append("ruler_page");
            sqlSB.append(",");
            sqlSB.append("ruler_level,");
            sqlSB.append("(case ruler_level");
            pstm=con.prepareStatement("select code,value from t_s_code where type='t_s_ruler.ruler_level' order by code asc");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" when ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" then ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" end)");
            //关闭资源rs,pstm
            close(rs,pstm,null,null);
            
            sqlSB.append(",");
            sqlSB.append("ruler_echo,");
            sqlSB.append("(case ruler_echo");
            pstm=con.prepareStatement("select code,value from t_s_code where type='t_s_ruler.ruler_echo' order by code asc");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" when ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" then ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" end)");
            //关闭资源rs,pstm
            close(rs,pstm,null,null);
            
            sqlSB.append(",");
            sqlSB.append("ruler_manager");
            sqlSB.append(" from t_s_ruler");
            
            countSB.append("select count(1)  from t_s_ruler ");
            
            if (s != null && s.length()>0)
            {
                sqlSB.append(s);
                
                countSB.append(s);
            }
            sqlSB.append(" order by id desc ");
            
           
            
            rs=pm.list(con, perPage, curPage, countSB.toString(), basePublic.in(sqlSB.toString()));
            
            if(rs==null){
            	
            	return "no";
            }
            
            ResultSetMetaData rsmd = rs.getMetaData();
            int numberOfColumns = rsmd.getColumnCount();
    
            while (rs!=null && rs.next())
            {
                for (int i = 1; i <= numberOfColumns; i ++)
                {
                    infoSB.append(basePublic.out(rs.getString(i)) + "</C>");
                    //infoSB.append(rs.getString(i) + "</C>");
                }

                infoSB.append("</R>");
            }
            
            infoSB.append("|");
            
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "查询菜单管理信息成功！",rulerBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.queryTSRuler出现数据库连接错误,操作为：查询菜单管理信息失败!" + sql.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.queryTSRuler出现转化字符错误,操作为：查询菜单管理信息失败!" + ue.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.queryTSRuler出现错误,操作为：查询菜单管理信息失败!" + ce.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
        finally
        {
        	pm.close(true);
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /*
     * 根据ID值查询详细的权限信息AJAX
     */
    public String detailTSRuler(String s,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //判断环境实例是否为空
        if (sc == null)
        {
        	basePublic.error("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
        	basePublic.error("HttpSession 为空，返回。");
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
             //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|根据ID值查询详细的权限信息（t_s_ruler）时，数据库连接Connection为空，连接失败");
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("select ruler_code");
            sqlSB.append(",");
            sqlSB.append("ruler_name");
            sqlSB.append(",");
            sqlSB.append("ruler_desc");
            sqlSB.append(",");
            sqlSB.append("ruler_page");
            sqlSB.append(",");
            sqlSB.append("(case ruler_level");
            pstm=con.prepareStatement("select code,value from t_s_code where type='t_s_ruler.ruler_level' order by code asc");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" when ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" then ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" end) as level_name ");
            //关闭资源rs,pstm
            close(rs,pstm,null,null);
            sqlSB.append(",");
            sqlSB.append("target,");
            sqlSB.append("(case ruler_echo");
            pstm=con.prepareStatement("select code,value from t_s_code where type='t_s_ruler.ruler_echo' order by code asc");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" when ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" then ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" end) as echo_name");
            //关闭资源rs,pstm
            close(rs,pstm,null,null);
            sqlSB.append(",");
            sqlSB.append("ruler_manager");
            sqlSB.append(",");
            sqlSB.append("time");
            sqlSB.append(" from t_s_ruler ");
            sqlSB.append("where id=?");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            
            
            pstm.setLong(1,Long.parseLong(s));
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("ruler_code"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_name"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_desc"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_page"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("level_name"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("target"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("echo_name"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_manager"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("time"))).append("</C>");
                infoSB.append("</R>");
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "菜单管理详细信息查询成功！",rulerBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.detailTSRuler出现数据库连接错误,操作为：菜单管理详细信息查询失败!" + sql.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.detailTSRuler出现转化字符错误,操作为：菜单管理详细信息查询失败!" + ue.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.detailTSRuler出现错误,操作为：菜单管理详细信息查询失败!" + ce.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
}
