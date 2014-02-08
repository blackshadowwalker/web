/*
 * @(#)userBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.user;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;
import java.io.UnsupportedEncodingException;
import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import modules.base.*;
import modules.baseInfo.baseInfoBean;
import modules.jcxx.dept.deptBean;
import modules.location.locationBean;

/**
 * 功能:本类为用户信息的Bean类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: userBean.java,v 1.1 2012/09/30 01:54:22 Administrator Exp $
 */
public class userBean extends ResourceClose
{
    public userBean()
    {
    }

    

    /*
     * 删除用户信息AJAX
     */
    public int deleteTSUser(String values,ServletContext sc,HttpSession session)
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
        
        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("连接失效，请重新登录系统。");
        }

        //保存SQL语句
        StringBuffer sqlSB = null;
        
        Connection con=null;//保存数据库连接
        Statement stm=null;//保存预处理语句
        PreparedStatement pstm=null;
        DataSource ds=null;

        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
                throw new CustomException("数据库连接Connection为空，连接失败。");
            }

            sqlSB=new StringBuffer();
            
            stm=con.createStatement();

            sqlSB.append("update t_s_userrole set status=0 where user_code='").append(values).append("'");
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
 					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
 					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
 					+ "删除用户角色成功！",userBean.class.getName());
         
            return stm.executeUpdate(sqlSB.toString());

        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.deleteTSUser出现数据库错误，操作为：" 
					+"删除用户角色失败" + sql.getMessage(),userBean.class.getName());

            throw new CustomException("出现错误："+sql.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.deleteTSUser出现错误，操作为：" 
					+"删除用户角色失败" + ce.getMessage(),userBean.class.getName());
            throw new CustomException("出现错误："+ce.getMessage());
        }
        finally
        {
            //关闭所有可用资源
            close(null,pstm,null,con);
        }
        //return infoSB.toString();
    }

    /*
     * 添加用户信息AJAX
     */
    public String addTSUser(String user_name,String roles,ServletContext sc,HttpSession session)
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

        //判断用户是否登录
        
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("连接失效，请重新登录系统。");
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
            	throw new CustomException("出现错误，操作员ID："+bform.login_id);
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            con.setAutoCommit(false);

            String[] roleArray = roles.split(",");
            
          

            for (int ii=0; ii<roleArray.length; ii+=3)
            {
                close(null,pstm,null,null);
               
                sqlSB.delete(0,sqlSB.length());
                sqlSB.append("insert into t_s_userrole(user_code,role_code) values('");
                sqlSB.append(roleArray[ii]);
                sqlSB.append("','");
                sqlSB.append(roleArray[ii+1]);
                sqlSB.append("')");
                
               // System.out.println("userrole==="+sqlSB.toString() );
                pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
                pstm.executeUpdate();

            }
            con.commit();
            
            infoSB.append("1</C></R>");

            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
 					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
 					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
 					+ "添加用户角色成功！",userBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            try
            {
    			con.rollback();
    			basePublic.error("事务开始回滚");
    		}catch(Exception ee)
    		{
    			ee.printStackTrace();
    			
    		}
    		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.addTSUser出现数据库错误，操作为：" 
					+"添加用户角色失败" + sql.getMessage(),userBean.class.getName());
            
            throw new CustomException("出现错误:"+sql.getMessage());
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            try
            {
    			con.rollback();
    			basePublic.error("事务开始回滚");
    		}catch(Exception ee)
    		{
    			ee.printStackTrace();
    			
    		}
    		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.addTSUser出现错误，操作为：" 
					+"添加用户角色失败" + ue.getMessage(),userBean.class.getName());
            throw new CustomException("出现错误:"+ue.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            try
            {
    			con.rollback();
    			basePublic.error("事务开始回滚");
    		}catch(Exception ee)
    		{
    			ee.printStackTrace();
    			
    		}
    		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.addTSUser出现错误，操作为：" 
					+"添加用户角色失败" + ce.getMessage(),userBean.class.getName());
            throw new CustomException("出现错误："+ce.getMessage());
        }
        finally
        {
            //关闭所有可用资源
            close(null,pstm,null,con);
        }
        return infoSB.toString();
    }

    /*
     * 修改前根据ID值查询详细的用户信息AJAX
     */
    public String beforeUpdateTSUser(String s,ServletContext sc,HttpSession session)
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
        
        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("连接失效，请重新登录系统。");
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
            {  //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|修改前查询详细的用户信息时，数据库连接Connection为空，连接失败。");
            throw new CustomException("出现错误，操作员ID："+bform.login_id);
            }
            
            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("select distinct ");
            sqlSB.append("user_code");
            sqlSB.append(",");
            sqlSB.append("user_name");

            sqlSB.append(" from t_s_userrole ");
            sqlSB.append("where user_code=?");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setString(1,s);

            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                String userCode = basePublic.out(rs.getString("user_code"));
                infoSB.append(basePublic.out(rs.getString("user_code")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("user_name")) + "</C>");

                infoSB.append("</R>");

                close(rs,pstm,null,null);

                sqlSB.delete(0,sqlSB.length());
                sqlSB.append("select b.dept_code,a.role_code,c.role_name ");
                sqlSB.append("from t_s_userrole a,t_s_dept b,t_s_role c ");
                sqlSB.append("where a.user_code=? ");
                sqlSB.append("and a.dept_code=b.dept_code ");
                sqlSB.append("and a.role_code=c.role_code ");
                sqlSB.append("and a.status=1 and c.status=1");
                
                pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
                pstm.setObject(1, userCode);
                rs=pstm.executeQuery();
                while (rs!=null && rs.next())
                {
                    infoSB.append(basePublic.out(rs.getString(1)) + "</C>");
                    infoSB.append(basePublic.out(rs.getString(2)) + "</C>");
                    infoSB.append(basePublic.out(rs.getString(3)) + "</C>");
                    infoSB.append("</R>");
                }
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
 					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
 					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
 					+ "修改前查询用户角色成功！",userBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.beforeUpdateTSUser出现错误，操作为：" 
					+"修改前查询用户角色失败" + sql.getMessage(),userBean.class.getName());
            throw new CustomException("出现错误："+sql.getMessage());
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.beforeUpdateTSUser出现错误，操作为：" 
					+"修改前查询用户角色失败" + ue.getMessage(),userBean.class.getName());
            throw new CustomException("出现错误："+ue.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.beforeUpdateTSUser出现错误，操作为：" 
					+"修改前查询用户角色失败" + ce.getMessage(),userBean.class.getName()); 
            throw new CustomException("出现错误："+ce.getMessage());
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /*
     * 修改用户信息AJAX
     */
    public String updateTSUser(String values,String depts,String roles,ServletContext sc,HttpSession session)
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

        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if (bform==null)
        {
            throw new CustomException("连接失效，请重新登录系统。");
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
            	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|修改用户信息时，数据库连接Connection为空，连接失败。");
            	 throw new CustomException("出现错误，操作员ID："+bform.login_id);
            }
            con.setAutoCommit(false);
            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            String[] user=values.split(",");

            sqlSB.append("delete from t_s_userrole where user_code=");
            sqlSB.append("'"+user[0]+"'");
                 
            close(rs,pstm,null,null);
            pstm = con.prepareStatement(basePublic.in(sqlSB.toString()));
            int num=pstm.executeUpdate();
                    
            if (num > 0)
            {
                close(null,pstm,null,null);
                sqlSB.delete(0,sqlSB.length());

                sqlSB.append("insert into t_s_userrole(id,user_code,dept_code,role_code,user_name) values(");
                sqlSB.append("t_s_userrole_seq.nextval,?,?,?,?)");
                pstm = con.prepareStatement(basePublic.in(sqlSB.toString()));

                String[] deptsArray = depts.split(",");
                String[] rolesArray = roles.split(",");
                for (int i = 0; i < rolesArray.length; i ++)
                {

                    pstm.setObject(1, user[0]);
                    pstm.setObject(2, deptsArray[i]);
                    pstm.setObject(3, rolesArray[i]);
                    pstm.setObject(4, user[1]);
                    pstm.executeUpdate();

                }
            }
                
            con.commit();
            
            infoSB.append("1</C></R>");
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
 					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
 					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
 					+ "修改用户角色成功！",userBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            try
            {
    			con.rollback();
    			basePublic.error("事务开始回滚");
    		}catch(Exception ee)
    		{
    			ee.printStackTrace();
    			
    		}
    		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.updateTSUser出现错误，操作为：" 
					+"修改前查询用户角色失败" + sql.getMessage(),userBean.class.getName()); 
            throw new CustomException("出现错误："+sql.getMessage());
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            try
            {
    			con.rollback();
    			basePublic.error("事务开始回滚");
    		}catch(Exception ee)
    		{
    			ee.printStackTrace();
    			
    		}
    		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.updateTSUser出现错误，操作为：" 
					+"修改前查询用户角色失败" + ue.getMessage(),userBean.class.getName()); 
            throw new CustomException("出现错误："+ue.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            try
            {
    			con.rollback();
    			basePublic.error("事务开始回滚");
    		}catch(Exception ee)
    		{
    			ee.printStackTrace();
    			
    		}
    		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.updateTSUser出现错误，操作为：" 
					+"修改前查询用户角色失败" + ce.getMessage(),userBean.class.getName()); 
            throw new CustomException("出现错误："+ce.getMessage());
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    /*
     * 根据条件语句查询用户信息AJAX
     */
    public String queryTSUser(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
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
        
        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("连接失效，请重新登录系统。");
        }
        
        //保存查询结果信息
        StringBuffer infoSB=null;
        //保存SQL语句
        StringBuffer sqlSB = null;
        
        StringBuffer countSB=null;
        
        Connection con=null;//保存数据库连接

        ResultSet rs=null;//保存查询的结果集
        
        PreparedStatement pstm2=null;//保存预处理语句
        ResultSet rs2=null;//保存查询的结果集
        
        String user_code="";
        
        PageMan pm=PageManFactory.getInstance();
        
        try
        {  
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|根据条件查询用户信息时，数据库连接Connection为空，连接失败。");
            	 throw new CustomException("出现错误，操作员ID："+bform.login_id);
            }
            
            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            countSB=new StringBuffer();
            
            sqlSB.append("select distinct  ");
            sqlSB.append("a.user_code");
            sqlSB.append(",");
            sqlSB.append("b.user_name,");
            sqlSB.append("b.dept_code");
            sqlSB.append(" from t_s_userrole a,t_u_person b ");
            
            countSB.append("select count(distinct b.user_code)  from t_s_userrole a,t_u_person b ");
            if (s != null && s.length()>0)
            {
                sqlSB.append(s);
                
                countSB.append(s);
            }
            sqlSB.append("  and a.status=1 and b.status=1 and a.user_code=b.user_code order by b.user_code asc");
            
            countSB.append(" and a.status=1 and b.status=1 and a.user_code=b.user_code order by b.user_code asc");
            
            
            
            rs=pm.list(con, perPage, curPage, countSB.toString(), sqlSB.toString());
            
            if(rs==null){
            	
            	return "no";
            }
 
            
            pstm2=con.prepareStatement("select a.role_name from t_s_role a,t_s_userrole b where b.user_code=? and a.role_code = b.role_code and a.status=1 and b.status=1 ");
    
            while (rs!=null && rs.next())
            {
            	
            	if(user_code.equals(rs.getString("user_code"))){
                	
                	continue;
                }
                
                infoSB.append(basePublic.out(rs.getString("user_code")) + "</C>");
                
                infoSB.append(basePublic.out(rs.getString("user_name")) + "</C>");
                
                user_code=rs.getString("user_code");
                pstm2.setString(1, user_code);
                
                rs2=pstm2.executeQuery();
                
                while(rs2!=null && rs2.next()){
                	
                	infoSB.append(basePublic.out(rs2.getString("role_name"))).append("</C>");
                }
                
                close(rs2,null,null,null);
                
                infoSB.append(basePublic.out(rs.getString("dept_code")));
                
                infoSB.append("</C>"); 

                infoSB.append("</R>");
            }
            
            infoSB.append("|");
            
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
          
           
            
            close(rs2,pstm2,null,null);
  
            
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|userBean.java--queryTSUser():根据条件查询用户信息(t_s_user)出现数据库连接方面的错误,错误代码："+sql.getErrorCode()+"错误信息:"+sql.getMessage());
            throw new CustomException("出现错误，操作员ID："+bform.login_id);
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|userBean.java--queryTSUser():根据条件查询用户信息(t_s_user)转化字符集时出现错误 错误信息:"+ue.getMessage());
            throw new CustomException("出现错误，操作员ID："+bform.login_id);
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|userBean.java--queryTSUser():根据条件查询用户信息(t_s_user)出现未知异常错误 错误信息:"+ce.getMessage());
            throw new CustomException("出现错误，操作员ID："+bform.login_id);
        }
        finally
        {
        	
        	pm.close(true);
            //关闭所有可用资源
            close(rs,null,null,con);
        }

        return infoSB.toString();
    }

    /*
     * 根据ID值查询详细的用户信息AJAX
     */
    public String detailTSUser(String s,ServletContext sc,HttpSession session)
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
        
        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("连接失效，请重新登录系统。");
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
            	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|根据ID值查询用户详细信息，数据库连接Connection为空，连接失败。");
            	 throw new CustomException("出现错误，操作员ID："+bform.login_id);
            }
            
            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("select ");
            sqlSB.append("user_code,");
            
            sqlSB.append("user_name");

            sqlSB.append(" from t_u_person  ");
            sqlSB.append("where user_code=? and status=1 ");
          
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setString(1,s);
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                String userCode = basePublic.out(rs.getString("user_code"));
                infoSB.append(basePublic.out(rs.getString("user_code")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("user_name")) + "</C>");
                

                infoSB.append("</R>");

                close(rs,pstm,null,null);

                sqlSB.delete(0,sqlSB.length());
                sqlSB.append("select b.dept_name,c.role_name ");
                sqlSB.append("from t_u_person a,t_s_userrole d,t_s_dept b,t_s_role c ");
                sqlSB.append("where a.user_code=? ");
                sqlSB.append("and a.dept_code=b.dept_code ");
                sqlSB.append("and d.role_code=c.role_code and d.user_code = a.user_code ");
                sqlSB.append("and a.status=1  and c.status=1 and d.status = 1");

                pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
                pstm.setObject(1, userCode);
                rs=pstm.executeQuery();
                while (rs!=null && rs.next())
                {
                    infoSB.append(basePublic.out(rs.getString(1)) + "</C>");
                    infoSB.append(basePublic.out(rs.getString(2)) + "</C>");
                    infoSB.append("</R>");
                }
            }
            //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|根据ID值查询用户详细信息成功!");
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|userBean.java--detailTSUser():根据ID值查询用户详细信息(t_s_user)出现数据库连接方面的错误 ,错误代码："+sql.getErrorCode()+"错误信息:"+sql.getMessage());
            throw new CustomException("出现错误，操作员ID："+bform.login_id);
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|userBean.java--detailTSUser():根据ID值查询用户详细信息(t_s_user)转化字符集时出现错误 错误信息:"+ue.getMessage());
            throw new CustomException("出现错误，操作员ID："+bform.login_id);
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|userBean.java--detailTSUser():根据ID值查询用户详细信息(t_s_user)出现未知异常错误 错误信息:"+ce.getMessage());
            throw new CustomException("出现错误，操作员ID："+bform.login_id);
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    /*
     判断用户代码是否已用的AJAX
     */
    public String isExist(String s,ServletContext sc,HttpSession session)throws CustomException,Exception
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
    			basePublic.error("HttpSession为空!");
    			basePublic.error("HttpSession 为空，返回。");
    		    throw new CustomException("HttpSession 为空，返回");
    		}
    		
    		//判断用户是否登录
    		baseForm bform=(baseForm)session.getAttribute("baseuser");
    		
    		if (bform==null)
    		{	
    			basePublic.error("连接系统失败，获得用户登录信息出错");
    		    throw new CustomException("连接失效，请重新登录系统。");
    		}
    		
    		
    		
    		//保存查询结果信息
    		StringBuffer infoSB=null;
    		//保存SQL语句
    		//StringBuffer sqlSB = null;
    	        Connection con=null;//保存数据库连接
    		Statement pstm=null;//保存预处理语句
    		ResultSet rs=null;//保存查询的结果集
    		ResultSet result=null;
    		String per_name = "";
    		try
    		{	
    			
    			//basePublic.error(user_name+datetime+"做机构查询交易!");
    		    con=((DataSource)sc.getAttribute("basedb")).getConnection();
    		    if (con==null)
    		    {	
    		    	basePublic.error("建立数据库连接失败!");	
    		    	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|判断用户代码是否已用（t_s_user）时数据库连接Connection为空，连接失败!");
    		    	 throw new CustomException("出现错误，操作员ID："+bform.login_id);
    		    }
    		    
    		    infoSB=new StringBuffer();
    		    //sqlSB=new StringBuffer();
    		    String sql = "select * from t_s_userrole where user_code='"+s+"' and status=1";//先看有无重复用户名
    		    pstm = con.createStatement();
    		    rs = pstm.executeQuery(basePublic.in(sql));
    		    if(rs!=null&&rs.next())
    		    {
    		    	infoSB.append("used");
    		    }
    		    else
    		    {
    		    	close(rs,null,null,null);
    		    	result = pstm.executeQuery(basePublic.in("select user_name,dept_code from t_u_person where user_code = '"+s+"' and status=1 "));

    		    	while(result!=null&&result.next())
    		    	{
    		    		per_name = basePublic.out(result.getString("user_name"));
    		    		infoSB.append(per_name).append("</C>");
    		    		
    		    		infoSB.append(result.getString("dept_code"));
    		    	}
    		    	
    		    	close(result,null,null,null);
    		    	
    		    }
    		    //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|判断用户代码是否已用（t_s_user）成功！");
    		    
    		}catch (SQLException sql)
    		{
    		    //basePublic.error(user_name+datetime+"增加人员信息，操作't_b_jcxx_ryxx'时出现错误:"+sql.getMessage());
    		    sql.printStackTrace();
    		    //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|userBean.java--isExist():判断用户代码是否已用（t_s_user）出现数据库连接方面的错误 ,错误代码："+sql.getErrorCode()+"错误信息:"+sql.getMessage());
    		    throw new CustomException("出现错误，操作员ID："+bform.login_id);
    		}
    		catch (Exception ce)
    		{	
    			//basePublic.error(user_name+datetime+"查询机构，出现未知异常错误:"+ce.getMessage());
    		    ce.printStackTrace();
    		    //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|userBean.java--isExist():判断用户代码是否已用（t_s_user）出现未知异常错误,错误信息:"+ce.getMessage());
    		    throw new CustomException("出现错误，操作员ID："+bform.login_id);
    		}
    		finally
    		{
    		    //关闭所有可用资源
			close(rs,null,pstm,con);
    		}
    		return infoSB.toString();
    }	
    
    
    public String getRole(String dept,ServletContext sc,HttpSession session)
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
    
    //判断用户是否登录
    baseForm bform=(baseForm)session.getAttribute("baseuser");
    
    if (bform==null)
    {
        throw new CustomException("连接失效，请重新登录系统。");
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
        	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|根据ID值查询用户详细信息，数据库连接Connection为空，连接失败。");
        	 throw new CustomException("出现错误，操作员ID："+bform.login_id);
        }
        
        infoSB=new StringBuffer();
        sqlSB=new StringBuffer();
        
        sqlSB.append("select ");
        sqlSB.append("role_name");
        sqlSB.append(",");
        sqlSB.append("role_code");
        sqlSB.append(" from ");
        sqlSB.append("t_s_role");
        sqlSB.append(" where ");
        sqlSB.append("dept_level>=(select dept_level from t_s_dept where dept_code=?) and status=1 and role_code<>'jcz'");
        sqlSB.append(" order by 2");

        pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
        pstm.setString(1,dept);
        
        rs=pstm.executeQuery();
        
        while(rs!=null && rs.next()){
        	
        	infoSB.append(rs.getString("role_code")).append("</C>");
        	
        	infoSB.append(basePublic.out(rs.getString("role_name"))).append("</C>").append("</R>");
        }

    }
    catch (SQLException sql)
    {
        sql.printStackTrace();
        //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|userBean.java--detailTSUser():根据ID值查询用户详细信息(t_s_user)出现数据库连接方面的错误 ,错误代码："+sql.getErrorCode()+"错误信息:"+sql.getMessage());
        throw new CustomException("出现错误，操作员ID："+bform.login_id);
    }
    catch (UnsupportedEncodingException ue)
    {
        ue.printStackTrace();
        //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|userBean.java--detailTSUser():根据ID值查询用户详细信息(t_s_user)转化字符集时出现错误 错误信息:"+ue.getMessage());
        throw new CustomException("出现错误，操作员ID："+bform.login_id);
    }
    catch (Exception ce)
    {
        ce.printStackTrace();
        //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|userBean.java--detailTSUser():根据ID值查询用户详细信息(t_s_user)出现未知异常错误 错误信息:"+ce.getMessage());
        throw new CustomException("出现错误，操作员ID："+bform.login_id);
    }
    finally
    {
        //关闭所有可用资源
        close(rs,pstm,null,con);
    }

    return infoSB.toString();
}

    //修改前查询用户信息
    public String beforeUser(String s,ServletContext sc,HttpSession session)
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

		// 保存查询结果信息
		StringBuffer infoSB = null;

		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句
		ResultSet rs = null;// 保存查询的结果集
		DataSource ds = null;
		try
		{
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}

			infoSB = new StringBuffer();

			pstm = con.prepareStatement("select id, user_name,passwd,photo_path  from t_u_person where user_code=?");

			pstm.setString(1, s);

			rs = pstm.executeQuery();

			if(rs != null && rs.next())
			{
				infoSB.append(basePublic.out(rs.getString("id"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("user_name"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("passwd"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("photo_path"))).append("</C></R>");
			}
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
 					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
 					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
 					+ "修改前查询用户角色成功！",userBean.class.getName());
			
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.beforeUser出现错误，操作为：" 
					+"修改前查询用户角色失败" + sql.getMessage(),userBean.class.getName());
            throw new CustomException("出现错误："+sql.getMessage());
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.beforeUser出现错误，操作为：" 
					+"修改前查询用户角色失败" + ue.getMessage(),userBean.class.getName());
            throw new CustomException("出现错误："+ue.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.beforeUser出现错误，操作为：" 
					+"修改前查询用户角色失败" + ce.getMessage(),userBean.class.getName()); 
            throw new CustomException("出现错误："+ce.getMessage());
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

		return infoSB.toString();
	}
    
     //修改用户信息
    public int updateUser(String id,String username, String password,String photo_path,ServletContext sc,HttpSession session)
    throws CustomException,Exception
    {//判断环境实例是否为空
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

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }
            
            
            SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String dqsj = sdf1.format(new Date());
    		String nowTime=System.currentTimeMillis()+"";
    		sqlSB=new StringBuffer();
            sqlSB.append("update t_u_person set user_name='"+username+"',passwd='"+password+"',photo_path='"+photo_path+"' where  id='"+id+"' ");
    		pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            int num=pstm.executeUpdate();
            
            bform.photo_path = photo_path;
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
 					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
 					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
 					+ "修改用户信息成功！",userBean.class.getName());
            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.updateUser出现错误，操作为：" 
					+"修改用户信息失败" + sql.getMessage(),userBean.class.getName());
            throw new CustomException("出现错误："+sql.getMessage());
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.updateUser出现错误，操作为：" 
					+"修改用户信息失败" + ue.getMessage(),userBean.class.getName());
            throw new CustomException("出现错误："+ue.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userBean.updateUser出现错误，操作为：" 
					+"修改用户信息失败" + ce.getMessage(),userBean.class.getName()); 
            throw new CustomException("出现错误："+ce.getMessage());
        }
        finally
        {
            //关闭所有可用资源
            close(null,pstm,null,con);
        }
    }	
}
