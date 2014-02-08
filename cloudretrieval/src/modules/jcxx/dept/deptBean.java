/*
 * @(#)deptBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.dept;

import java.sql.*;
import java.text.NumberFormat;
import java.util.ResourceBundle;
import java.io.UnsupportedEncodingException;
import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import modules.base.*;

/**
 * 功能:本类为机构管理的Bean类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: deptBean.java,v 1.1 2012/09/30 01:54:31 Administrator Exp $
 */
public class deptBean extends ResourceClose
{
	private NumberFormat nf;
	
    public deptBean()
    {
    	nf=NumberFormat.getPercentInstance();
    }

    /**
     * 构造函数
     */
    public deptBean(DataSource dataSource)
    {
    }

    /**
     * 删除机构管理AJAX
     */
    public String deleteTSDept(String values,String dept,ServletContext sc,HttpSession session)
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
        //System.out.println(dept);
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
            int num=0;
            con.setAutoCommit(false);
            
            // 判断该机构下面是否有人员
            
            sqlSB = new StringBuffer();
            sqlSB.append("select id from t_u_person where dept_code='"+dept+"'");
            pstm = con.prepareStatement(sqlSB.toString());
            
            rs = pstm.executeQuery();
            
            if(rs!=null && rs.next())
            {
            	return "have";
            }
            close(rs,pstm,null,null);
            
            sqlSB.delete(0, sqlSB.length());
           // System.out.println("删除机构中.........");
            //删除机构表
            sqlSB.append("update t_s_dept set status=0 WHERE status=1 and dept_code='").append(dept).append("'");
            //pstm.setString(1,dept);
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));          
            num = pstm.executeUpdate();
            
            close(null,pstm,null,null);           
            
            /* 
            //删除上级机构表信息
            sqlSB.append("delete from t_s_deptmgr where dept_code = '").append(dept).append("'");
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));          
            num = pstm.executeUpdate();
            
            close(null,pstm,null,null);           
            sqlSB.delete(0, sqlSB.length());
            
            
            //删除该机构下的人员表
            sqlSB.append("update t_b_jcxx_ryxx set status=0 where status=1 and dep_id='").append(dept).append("'");
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));          
            num = pstm.executeUpdate();
           
            close(null,pstm,null,null);           
            sqlSB.delete(0, sqlSB.length());
            
            //删除该机构的基础等级维护表
            sqlSB.append("update t_s_dept_grade set status=0 where status=1 and dept_code='").append(dept).append("'");
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));          
            num = pstm.executeUpdate();*/
            
            con.commit();
            
            infoSB.append("1</C></R>");
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
 					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
 					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
 					+ "删除机构！",deptBean.class.getName());

        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            try{
    			con.rollback();
    			basePublic.info("事务开始回滚");
    		}catch(Exception ee){
    			ee.printStackTrace();
    			
    		}
    		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.deleteTSDept出现数据库错误，操作为：" 
					+"删除机构信息失败" + sql.getMessage(),deptBean.class.getName());
    		throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            try{
    			con.rollback();
    			basePublic.info("事务开始回滚");
    		}catch(Exception ee){
    			ee.printStackTrace();
    			
    		}
    		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.deleteTSDept出现数据库错误，操作为：" 
					+"删除机构信息失败" + ue.getMessage(),deptBean.class.getName());
    		throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            try{
    			con.rollback();
    			basePublic.info("事务开始回滚");
    		}catch(Exception ee){
    			ee.printStackTrace();
    			
    		}
    		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.deleteTSDept出现错误，操作为：" 
					+"删除机构信息失败" + ce.getMessage(),deptBean.class.getName());
    		throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
        return infoSB.toString();
    }

    /**
     * 添加机构管理AJAX
     */
    public String addTSDept(String labels,String values,String dept_code,int dept_level,int dept_lx,ServletContext sc,HttpSession session)
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
            
            con.setAutoCommit(false);
            
            pstm=con.prepareStatement("select dept_code from t_s_dept where dept_code=? and status=1");
            
            pstm.setString(1,dept_code);
            
            rs=pstm.executeQuery();
            
            if(rs!=null && rs.next()){
            	
            	return "have";
            }
            
            close(rs,pstm,null,null);
            
            sqlSB.delete(0, sqlSB.length());
            
            //机构表
            
            sqlSB.append("INSERT INTO t_s_dept(dept_code,").append(labels).append(") VALUES ('").append(dept_code).append("',").append(values).append(")");

            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

            int num=pstm.executeUpdate();
            deptTrigger(con,dept_code,dept_level,dept_lx,ds,bform);
            
            close(null,pstm,null,null);
            sqlSB.delete(0, sqlSB.length());
/*            
            //机构等级表
            
            sqlSB.append("insert into t_s_dept_grade(id,").append(label2s).append(") values (t_s_dept_grade_seq.nextval,").append(value2s).append(")");

            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
           
            num=pstm.executeUpdate();
*/            
            con.commit();
            
            infoSB.append(num).append("</C></R>");
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "添加机构信息成功！",deptBean.class.getName());

        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            
            try{
            	con.rollback();
            }
            catch(SQLException e){
            	
            	e.printStackTrace();
            }
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.addTSDept出现数据库错误，操作为：" 
					+"添加机构信息失败" + sql.getMessage(),deptBean.class.getName());
            
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            
            try{
            	con.rollback();
            }
            catch(SQLException e){
            	
            	e.printStackTrace();
            }
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.addTSDept出现数据库错误，操作为：" 
					+"添加机构信息失败" + ue.getMessage(),deptBean.class.getName());
            
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            
            try{
            	con.rollback();
            }
            catch(SQLException e){
            	
            	e.printStackTrace();
            }
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.addTSDept出现错误，操作为：" 
					+"添加机构信息失败" + ce.getMessage(),deptBean.class.getName());
            
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
        return infoSB.toString();
    }


    /**
     * 修改前根据id值查询详细的机构管理AJAX
     */
    public String beforeUpdateTSDept(String s,ServletContext sc,HttpSession session)
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
        
        PreparedStatement pstm2=null;//保存预处理语句
        ResultSet rs2=null;//保存查询的结果集
        
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
            
            sqlSB.append("SELECT ");
            sqlSB.append("dept_code");
            sqlSB.append(",");
            sqlSB.append("dept_name");
            sqlSB.append(",");
            sqlSB.append("dept_manager");
            sqlSB.append(",");
            sqlSB.append("fgld");

            sqlSB.append(" FROM t_s_dept ");
            sqlSB.append("WHERE id=? ");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, Long.parseLong(s));
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("dept_code"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("dept_name"))).append("</C>");            
                infoSB.append(basePublic.out(rs.getString("dept_manager"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("fgld"))).append("</C>");
                //判断该分管领导的姓名
                
                sqlSB = new StringBuffer();
        		sqlSB.append("select user_name from t_u_person where user_code='"+rs.getString("fgld")+"'");
        		
        		pstm2 = con.prepareStatement(sqlSB.toString());
        		rs2 = pstm2.executeQuery();
        		
        		if(rs2!=null && rs2.next())
        		{
        			infoSB.append(basePublic.out(rs2.getString("user_name"))).append("</C>");
        		}
        		else
        		{
        			infoSB.append("</C>");
        		}
        		close(rs2,pstm2,null,null);
                
                infoSB.append("</R>");
            }
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "修改前查询机构息成功！",deptBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.beforeUpdateTSDept出现数据库错误，操作为：" 
					+"修改前查询机构息失败" + sql.getMessage(),deptBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.beforeUpdateTSDept出现数据库错误，操作为：" 
					+"修改前查询机构息失败" + ue.getMessage(),deptBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.beforeUpdateTSDept出现数据库错误，操作为：" 
					+"修改前查询机构息失败" + ce.getMessage(),deptBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /**
     * 修改机构管理AJAX
     */
    public String updateTSDept(String id,String values,String curr_dept,
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
            
            
            String[] value = values.split("</C>");
            
            int num = 1;
            
            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();

            con.setAutoCommit(false);
            
            sqlSB.append("UPDATE t_s_dept SET ").append(value[0]).append(" WHERE id=").append(id);
         
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            
            num=pstm.executeUpdate();
            
           /* sqlSB.delete(0, sqlSB.length());
            
            sqlSB.append("UPDATE t_s_dept_grade SET ").append(value[1]).append(" WHERE id='").append(id2).append("'");
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

            num=pstm.executeUpdate();
            */
            String[] dept_tr = curr_dept.split(",");
            if(!dept_tr[0].equals("no"))
            {
            	deptTrigger(con,dept_tr[0],Integer.parseInt(dept_tr[1]),Integer.parseInt(dept_tr[2]),ds,bform);
            }
            con.commit();

            infoSB.append(num).append("</C></R>");
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "修改机构信息成功！",deptBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            try{
            	con.rollback();
            }
            catch(SQLException e){
            	
            	e.printStackTrace();
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.updateTSDept出现数据库错误，操作为：" 
					+"修改机构息失败" + sql.getMessage(),deptBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            try{
            	con.rollback();
            }
            catch(SQLException e){
            	
            	e.printStackTrace();
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.updateTSDept出现数据库错误，操作为：" 
					+"修改机构息失败" + ue.getMessage(),deptBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            try{
            	con.rollback();
            }
            catch(SQLException e){
            	
            	e.printStackTrace();
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.updateTSDept出现数据库错误，操作为：" 
					+"修改机构息失败" + ce.getMessage(),deptBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    /**
     * 根据条件语句查询机构管理AJAX
     */
    public String queryTSDept(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
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
        
        PreparedStatement pstm2=null;//保存预处理语句
        ResultSet rs2=null;//保存查询的结果集
        
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
            
            sqlSB.append("SELECT ");
            sqlSB.append("id");
            sqlSB.append(",");
            sqlSB.append("dept_code");
            sqlSB.append(",");
            sqlSB.append("dept_name");

            sqlSB.append(",fgld,");
            
            sqlSB.append("(CASE status");
            pstm=con.prepareStatement("SELECT code,value FROM t_s_code WHERE type='t_u_person.status' ORDER BY code ASC");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" WHEN ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" THEN ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" END)");
            close(rs,pstm,null,null);
            
            
            sqlSB.append(" FROM t_s_dept ");
            
            countSB.append("select count(1) from t_s_dept ");
            if (s != null && s.length()>0)
            {
                sqlSB.append(s);
                
                countSB.append(s);
            }
            sqlSB.append("  ORDER BY id ASC");
            
            
         
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
                	if(i==4)
                	{
                		//进行人员姓名的转换
                		sqlSB = new StringBuffer();
                		sqlSB.append("select user_name from t_u_person where user_code='"+rs.getString(i)+"'");
                		
                		pstm2 = con.prepareStatement(sqlSB.toString());
            //    		System.out.println(sqlSB.toString());
                		rs2 = pstm2.executeQuery();
                		
                		if(rs2!=null && rs2.next())
                		{
                			infoSB.append(basePublic.out(rs2.getString("user_name"))).append("</C>");
                		}
                		else
                		{
                			infoSB.append("</C>");
                		}
                		close(rs2,pstm2,null,null);
                		
                	}
                	else 
                	{
                		infoSB.append(basePublic.out(rs.getString(i))).append("</C>");
                	}
                }

                infoSB.append("</R>");
                
            }
            
            close(rs,pstm,null,null);
            
            pstm=con.prepareStatement("select count(*) from t_s_dept where status=1");
            
            rs=pstm.executeQuery();
            
            double a = 0;//总数
            
            int b = 0;//符合条件的数量
            
            if(rs!=null && rs.next()){
            	
            	 a = rs.getDouble(1);//总数
            }
            
            close(rs,pstm,null,null);
                
            pstm=con.prepareStatement(countSB.toString());
            
            rs=pstm.executeQuery();
            
            if(rs!=null && rs.next()){
            	
            	b=rs.getInt(1);
            	
            }
            
            nf.setMaximumFractionDigits(3);
            
            String rate=""; 
            
            if(b>0)
            {
            
            	rate=nf.format((double)b/a);
            	
            }
            else
            {	
            	rate ="0%";
            }
            
            infoSB.append("</S>").append(rate).append("</C>").append(b).append("</C>");
            
            infoSB.append("|");
            
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");

        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
        }
        finally
        {
        	pm.close(true);
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
        
        return infoSB.toString();
    }

    /**
     * 根据id值查询详细的机构管理AJAX
     */
    public String detailTSDept(String s,ServletContext sc,HttpSession session)
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
        
        PreparedStatement pstm2=null;//保存预处理语句
        ResultSet rs2=null;//保存查询的结果集
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("SELECT ");
            sqlSB.append("dept_code");
            sqlSB.append(",");
            sqlSB.append("dept_name");

            sqlSB.append(",dept_manager,fgld,");
            
            sqlSB.append("(CASE status");
            pstm=con.prepareStatement("SELECT code,value FROM t_s_code WHERE type='t_u_person.status' ORDER BY code ASC");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" WHEN ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" THEN ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" END)");
            close(rs,pstm,null,null);
            
            
            sqlSB.append(" FROM t_s_dept  ");
            sqlSB.append("WHERE id=? ");
            
            ////System.out.println(sqlSB.toString());
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, Long.parseLong(s));
            rs=pstm.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int numberOfColumns = rsmd.getColumnCount();
            while (rs!=null && rs.next())
            {
                for (int i = 1; i <= numberOfColumns; i ++)
                {
                	if(i==4)
                	{
//                		进行人员姓名的转换
                		sqlSB = new StringBuffer();
                		sqlSB.append("select user_name from t_u_person where user_code='"+rs.getString(i)+"'");
                	
                		pstm2 = con.prepareStatement(sqlSB.toString());
                		rs2 = pstm2.executeQuery();
                		
                		if(rs2!=null && rs2.next())
                		{
                			infoSB.append(basePublic.out(rs2.getString("user_name"))).append("</C>");
                		}
                		else
                		{
                			infoSB.append("</C>");
                		}
                		close(rs2,pstm2,null,null);
                	}
                	else
                	{
                		 infoSB.append(basePublic.out(rs.getString(i)) + "</C>");
                	}
                   
                }

                infoSB.append("</R>");
            }
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    private void deptTrigger(Connection con,String dept_code,int dept_level,int dept_lx,DataSource ds,baseForm bform) throws Exception{
    	

    	PreparedStatement pstm = null,pstm2 = null;
    	
    	ResultSet rs = null;
    	
    	try{
    		//从t_s_deptmgr表中删除dept_code相关所有数据
    		pstm = con.prepareStatement("delete from t_s_deptmgr where dept_code = ?");
    		
    	//	System.out.println("删除t_s_deptmgr表中dept_code="+dept_code);
    		
    		pstm.setString(1, dept_code);
    		
    		pstm.executeUpdate();
    		
    		
    		pstm.close();
    		pstm=null;
    		
    		
    		//往t_s_deptmgr表中增加相关数据
    		
    		pstm = con.prepareStatement("insert into t_s_deptmgr (dept_code,dept_manager,dept_level,dept_lx) values (?,?,?,?)");
    		
    		pstm.setString(1,dept_code);
    		pstm.setString(2, dept_code);
    		pstm.setInt(3,dept_level);
    		pstm.setInt(4, dept_lx);
    		
    		pstm.executeUpdate();
    		
    		//System.out.println("往t_s_deptmgr表中增加dept_code="+dept_code+"\tdept_manager="+dept_code+"数据（本身）");
    		
    		pstm2 = con.prepareStatement("select dept_code,dept_level,dept_lx from t_s_dept where dept_code=(select dept_manager from t_s_dept where dept_code=? and dept_code<> dept_manager and status=1 )");
    		
    		String manager = dept_code;
    		
    		
    		for(int i=0;i<dept_level;i++){
    			
    			pstm2.setString(1, manager);
    			
    			rs = pstm2.executeQuery();
    			
    			if(rs!=null && rs.next()){
    				
    				manager = rs.getString(1);
    				
    				pstm.setString(1, dept_code);
    				pstm.setString(2, manager);
    				pstm.setInt(3, rs.getInt(2));
    				pstm.setInt(4, rs.getInt(3));
    				
    				pstm.executeUpdate();
    				
    			//	System.out.println("往t_s_deptmgr表中增加dept_code="+dept_code+"\tdept_manager="+manager+"数据（上级）");
    			}
    			else{
    				
    				break;
    			}
    			
    			rs.close();
    			rs=null;
    		}
    		
    	}
    	catch(SQLException sql){
    		
    		
    		throw sql;
    	}
    	finally{
    		
    		
    		if(rs != null){
    			
    			try{
    				rs.close();
    				rs = null;
    			}
    			catch(SQLException sql){
    				
    				
    			}
    		}
    		
    		if(pstm != null){
    			
    			try{
    				pstm.close();
    				pstm = null;
    			}
    			catch(SQLException sql){
    			}
    		}

    		if(pstm2 != null){
    			
    			try{
    				pstm2.close();
    				pstm2 = null;
    			}
    			catch(SQLException sql){
    			}
    		}
    	}
    }
}