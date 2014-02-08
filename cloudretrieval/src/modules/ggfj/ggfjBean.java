/*
 * @(#)modules.ggfjBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.ggfj;

import org.apache.log4j.Logger;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.io.UnsupportedEncodingException;

import javax.sql.DataSource;

import cryptix.CryptixException;
import cryptix.provider.md.SHA1;
import cryptix.util.core.Hex;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import modules.base.*;

/**
 * 功能:本类为公共附件的Bean类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: ggfjBean.java,v 1.1 2012/10/13 08:45:55 Administrator Exp $
 */
public class ggfjBean extends ResourceClose
{
    private DataSource dataSource;

    public ggfjBean()
    {
    }

    /*
     * 构造函数
     */
    public ggfjBean(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }

    /*
     * 删除公共附件AJAX
     */
    public int deleteTSGgfj(String ids,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        // 判断环境实例是否为空
        if (sc == null)
        {
         //   System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
          //  System.out.println("HttpSession 为空，返回。");
            throw new CustomException("HttpSession 为空，返回");
        }
        
        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("连接失效，请重新登录系统。");
        }
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("数据库连接Connection为空，连接失败。");
            }

            int num=0;
            String[] id = ids.split("</C>");
            for(int i=0; i<id.length; i++){
//            	pstm=con.prepareStatement(basePublic.in("delete from t_s_ggfj where id=?"));
	            pstm=con.prepareStatement(basePublic.in("update t_s_ggfj set status=-1 where id=?"));
	            pstm.setString(1, id[i]);
	            num = pstm.executeUpdate();
	        }
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"删除公共附件成功！",ggfjBean.class.getName());

            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.deleteTSGgfj出现数据库连接错误，操作为：删除公共附件！"+sql.getMessage(),ggfjBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.deleteTSGgfj出现错误，操作为：删除公共附件！"+ue.getMessage(),ggfjBean.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.deleteTSGgfj出现错误，操作为：删除公共附件！"+ce.getMessage(),ggfjBean.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
            close(null,pstm,null,con);
        }
    }

    /*
     * 添加公共附件AJAX
     */
    public int addTSGgfj(String infos,
    		ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        //判断环境实例是否为空
        if (sc == null)
        {
        //    System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
        //    System.out.println("HttpSession 为空，返回。");
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
        PreparedStatement pstm=null;//保存预处理语句

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("数据库连接Connection为空，连接失败。");
            }

            sqlSB=new StringBuffer();
            
            SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String dqsj = sdf1.format(new Date());
            
            String labels=" value,path,sc_rq,person,status ";
            String values="";
            
            int sum =0;
            String[] rows = infos.split("</R>");
            for(int i=0; i<rows.length; i++){
            	String[] cols = rows[i].split("</C>");
            	values = "'"+cols[0]+"','"+cols[1]+"',null,'"+bform.user_code+"',1 ";
            	sqlSB.setLength(0);
            	sqlSB.append(" insert into t_s_ggfj(").append(labels).append(") values (").append(values).append(") ");
            	
           // 	System.out.println(sqlSB);
            	
            	pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            	int num=pstm.executeUpdate();
            	if(num!=0) sum++;
            }
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"增加公共附件成功！",ggfjBean.class.getName());
            
            return sum;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.addTSGgfj出现错误，操作为：增加公共附件！"+sql.getMessage(),ggfjBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.addTSGgfj出现错误，操作为：增加公共附件！"+ue.getMessage(),ggfjBean.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.addTSGgfj出现错误，操作为：增加公共附件！"+ce.getMessage(),ggfjBean.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
            close(null,pstm,null,con);
        }
    }


    /*
     * 修改前根据id值查询详细的公共附件AJAX
     */
    public String beforeUpdateTSGgfj(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //判断环境实例是否为空
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
                throw new CustomException("数据库连接Connection为空，连接失败。");
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("SELECT ");
            sqlSB.append("value");
            sqlSB.append(",");
            sqlSB.append("path");
            sqlSB.append(",");
            sqlSB.append("person");
            sqlSB.append(",");
            sqlSB.append("status");
            sqlSB.append(" FROM t_s_ggfj ");
            sqlSB.append("WHERE id=?");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, id);
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("value")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("path")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("person")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("status")) + "</C>");

                infoSB.append("</R>");
            }
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.beforeUpdateTSGgfj出现数据库错误，操作为：修改前查询公共附件！"+sql.getMessage(),ggfjBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.beforeUpdateTSGgfj出现错误，操作为：修改前查询公共附件！"+ue.getMessage(),ggfjBean.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.beforeUpdateTSGgfj出现错误，操作为：修改前查询公共附件！"+ce.getMessage(),ggfjBean.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /*
     * 修改公共附件AJAX
     */
    public int updateTSGgfj(String id,String values,
        ServletContext sc,HttpSession session) throws CustomException,Exception
    {
        //判断环境实例是否为空
        if (sc == null)
        {
        //    System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
          //  System.out.println("HttpSession 为空，返回。");
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
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("数据库连接Connection为空，连接失败。");
            }

            sqlSB=new StringBuffer();

            sqlSB.append("UPDATE t_s_ggfj SET ").append(values).append(" WHERE id=").append(id);
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

            int num=pstm.executeUpdate();
 			
 			LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"修改公共附件成功",ggfjBean.class.getName());

            return num;
        }
          catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.updateTSGgfj出现数据库连接错误，操作为：修改公共附件！"+sql.getMessage(),ggfjBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.updateTSGgfj出现错误，操作为：修改公共附件！"+ue.getMessage(),ggfjBean.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.updateTSGgfj出现错误，操作为：修改公共附件！"+ce.getMessage(),ggfjBean.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
       
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
    }
    
    /*
     * 根据条件语句查询公共附件AJAX
     */
    public String queryTSGgfj(int perPage,int curPage,String s,String paixu,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //判断环境实例是否为空
        if (sc == null)
        {
        //    System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
        //    System.out.println("HttpSession 为空，返回。");
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
        StringBuffer sqlSB=null;
        //保存查询总条数语句
        StringBuffer countSB=null;
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        
        PageMan pm=PageManFactory.getInstance();
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("数据库连接Connection为空，连接失败。");
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            countSB=new StringBuffer();
            
            sqlSB.append("select  ");
            sqlSB.append("id");
            sqlSB.append(",");
            sqlSB.append("value");
            sqlSB.append(",");
            sqlSB.append("path");
            sqlSB.append(",");
            sqlSB.append("sc_rq");
            sqlSB.append(",");
            sqlSB.append("person");
            sqlSB.append(",");
            //sqlSB.append("status,");
            sqlSB.append("(CASE status");
            pstm=con.prepareStatement("select code,value from t_s_code where type='status' order by code asc");
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
            
            countSB.append("select count(1) from view_ggfj "); 
            sqlSB.append(" from view_ggfj ");
            if (s != null && s.length()>0)
            {
                sqlSB.append(s);
                countSB.append(s);
            }
            
            sqlSB.append(" and status=1 ");
            countSB.append(" and status=1  ");

            sqlSB.append(" order by "+paixu);
            countSB.append(" order by "+paixu);
            
       //     System.out.println(sqlSB);
            
            rs=pm.list(con, perPage, curPage, countSB.toString(), sqlSB.toString());
            
            if(rs==null){
            	return "no";
            }
           
            ResultSetMetaData rsmd = rs.getMetaData();
            int numberOfColumns = rsmd.getColumnCount();
            
            while (rs!=null && rs.next())
            {
                for (int i = 1; i <= numberOfColumns; i ++)
                {
                    infoSB.append(basePublic.out(rs.getString(i))).append("</C>");
                }

                infoSB.append("</R>");
            }
            
            infoSB.append("</F>");
            
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
        }
         catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.queryTSGgfj出现数据库连接错误，操作为：查询公共附件！"+sql.getMessage(),ggfjBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.queryTSGgfj出现错误，操作为：查询公共附件！"+ue.getMessage(),ggfjBean.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.queryTSGgfj出现错误，操作为：查询公共附件！"+ce.getMessage(),ggfjBean.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /*
     * 根据id值查询详细的公共附件AJAX
     */
    public String detailTSGgfj(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //判断环境实例是否为空
        if (sc == null)
        {
        //    System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
        //    System.out.println("HttpSession 为空，返回。");
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
                throw new CustomException("数据库连接Connection为空，连接失败。");
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("select ");
            sqlSB.append("value");
            sqlSB.append(",");
            sqlSB.append("path ");
            sqlSB.append(",");
            sqlSB.append("sc_rq");
            sqlSB.append(",");
            sqlSB.append("person");
           
            sqlSB.append(" from view_ggfj ");
            sqlSB.append("where status=1");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
       
            rs=pstm.executeQuery();
            
            if(rs==null){
            	return "";
            }
            
            while (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("value")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("path")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("sc_rq")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("person")) + "</C>");
                infoSB.append("</R>");
            }
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.detailTSGgfj出现数据库连接错误，操作为：查看公共附件！"+sql.getMessage(),ggfjBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.detailTSGgfj出现错误，操作为：查看公共附件！"+ue.getMessage(),ggfjBean.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.detailTSGgfj出现错误，操作为：查看公共附件！"+ce.getMessage(),ggfjBean.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
}
