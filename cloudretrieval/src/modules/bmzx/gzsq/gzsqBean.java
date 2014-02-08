/*
 * @(#)modules.gzsqBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.bmzx.gzsq;

import org.apache.log4j.Logger;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import javax.sql.DataSource;

import cryptix.CryptixException;
import cryptix.provider.md.SHA1;
import cryptix.util.core.Hex;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import modules.base.*;

/**
 * 功能:本类为工资申请的Bean类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: gzsqBean.java,v 1.3 2012/10/01 09:25:47 Administrator Exp $
 */
public class gzsqBean extends ResourceClose
{
    private DataSource dataSource;

    public gzsqBean()
    {
    }

    /*
     * 构造函数
     */
    public gzsqBean(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }

    /*
     * 删除工资申请AJAX
     */
    public int deleteStuSalary(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        // 判断环境实例是否为空
        if (sc == null)
        {
            System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
            System.out.println("HttpSession 为空，返回。");
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

            pstm=con.prepareStatement(basePublic.in("update  stu_salary set status='-1' where id=?"));
            pstm.setLong(1, id);
            num = pstm.executeUpdate();
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"删除工资申请成功！",gzsqBean.class.getName());

            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.deleteStuSalary出现数据库连接错误，操作为：删除工资申请！"+sql.getMessage(),gzsqBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.deleteStuSalary出现错误，操作为：删除工资申请！"+ue.getMessage(),gzsqBean.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.deleteStuSalary出现错误，操作为：删除工资申请！"+ce.getMessage(),gzsqBean.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
            close(null,pstm,null,con);
        }
    }

    /*
     * 添加工资申请AJAX
     */
    public int addStuSalary(String labels,String values,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        //判断环境实例是否为空
        if (sc == null)
        {
            System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
            System.out.println("HttpSession 为空，返回。");
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
            
            SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            
            String dqsj = sdf1.format(new Date());
            
            String xh = values.split(",")[0];
            if(xh=="") return -1;
            
            String sql1 = "select * from stu_info where stu_code=" + xh + "  and re1 in (select dept_code from t_s_deptmgr where dept_manager='"+bform.dept_code+"')";
        //    String sql1 = "select * from stu_info where stu_code=" + xh + "";
            
            pstm = con.prepareStatement(sql1);
            System.out.println(sql1);
            ResultSet rs = pstm.executeQuery();
            if(rs==null || !rs.next()) return -1;
            
            sqlSB.append("insert into stu_salary(").append(labels).append(",sq_rq ,xg_rq ) values (").append(values).append(",'"+dqsj+"',null)");
            System.out.println(sqlSB);
            
         
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            int num=pstm.executeUpdate();
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"增加工资申请成功！",gzsqBean.class.getName());
            
            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.addStuSalary出现错误，操作为：增加工资申请！"+sql.getMessage(),gzsqBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.addStuSalary出现错误，操作为：增加工资申请！"+ue.getMessage(),gzsqBean.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.addStuSalary出现错误，操作为：增加工资申请！"+ce.getMessage(),gzsqBean.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
            close(null,pstm,null,con);
        }
    }


    /*
     * 修改前根据id值查询详细的工资申请AJAX
     */
    public String beforeUpdateStuSalary(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //判断环境实例是否为空
        if (sc == null)
        {
            System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
            System.out.println("HttpSession 为空，返回。");
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
            sqlSB.append("a.stu_code");
            sqlSB.append(",");
            sqlSB.append("gz_desp");
            sqlSB.append(",");
            sqlSB.append("xxhd");
            sqlSB.append(",");
            sqlSB.append("yhhd");
            sqlSB.append(",");
            sqlSB.append("error_msg");
            sqlSB.append(",");
            sqlSB.append("sfff");
            sqlSB.append(",");
            sqlSB.append("a.status");
            sqlSB.append(",");
            sqlSB.append("salary ");
            sqlSB.append(",");
            sqlSB.append("sq_rq ");
            sqlSB.append(",");
            sqlSB.append("b.stu_name ");
            
            sqlSB.append(" FROM stu_salary a, stu_info b ");
            sqlSB.append("WHERE a.id=? and a.stu_code=b.stu_code ");
            
            System.out.println(sqlSB.toString());
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, id);
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("a.stu_code")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("gz_desp")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("xxhd")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("yhhd")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("error_msg")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("sfff")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("status")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("salary")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("sq_rq")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("b.stu_name")) + "</C>");

                infoSB.append("</R>");
            }
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.beforeUpdateStuSalary出现数据库错误，操作为：修改前查询工资申请！"+sql.getMessage(),gzsqBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.beforeUpdateStuSalary出现错误，操作为：修改前查询工资申请！"+ue.getMessage(),gzsqBean.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.beforeUpdateStuSalary出现错误，操作为：修改前查询工资申请！"+ce.getMessage(),gzsqBean.class.getName());
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
     * 修改工资申请AJAX
     */
    public int updateStuSalary(String id,String values,
        ServletContext sc,HttpSession session) throws CustomException,Exception
    {
        //判断环境实例是否为空
        if (sc == null)
        {
            System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
            System.out.println("HttpSession 为空，返回。");
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

            sqlSB.append("UPDATE stu_salary SET ").append(values).append(" WHERE id=").append(id);
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

            int num=pstm.executeUpdate();
 			
 			LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"修改工资申请成功",gzsqBean.class.getName());

            return num;
        }
          catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.updateStuSalary出现数据库连接错误，操作为：修改工资申请！"+sql.getMessage(),gzsqBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.updateStuSalary出现错误，操作为：修改工资申请！"+ue.getMessage(),gzsqBean.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.updateStuSalary出现错误，操作为：修改工资申请！"+ce.getMessage(),gzsqBean.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
       
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
    }
    
    /*
     * 根据条件语句查询工资申请AJAX
     */
    public String queryStuSalary(int perPage,int curPage,String s,String sq_rq, String paixu,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //判断环境实例是否为空
        if (sc == null)
        {
            System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
            System.out.println("HttpSession 为空，返回。");
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
            sqlSB.append("a.id");
            sqlSB.append(",");
            sqlSB.append("a.stu_code");
            sqlSB.append(",");
            sqlSB.append("b.stu_name");
            sqlSB.append(",");
            sqlSB.append("a.gz_desp");
            sqlSB.append(",");
            sqlSB.append("a.salary,");
            sqlSB.append("(CASE a.xxhd");
            pstm=con.prepareStatement("select code,value from t_s_code where type='stu_salary.sfhd' order by code asc");
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
            //sqlSB.append("yhhd,");
            sqlSB.append("(CASE a.yhhd");
            pstm=con.prepareStatement("select code,value from t_s_code where type='stu_salary.sfhd' order by code asc");
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
            //sqlSB.append("error_msg,");
            sqlSB.append("(CASE a.error_msg");
            pstm=con.prepareStatement("select code,value from t_s_code where type='Error_msg' order by code asc");
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
            //sqlSB.append("sfff,");
            sqlSB.append("(CASE a.sfff");
            pstm=con.prepareStatement("select code,value from t_s_code where type='stu_salary.sfff' order by code asc");
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
            //sqlSB.append("status,");
            sqlSB.append("(CASE a.status");
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
            
            sqlSB.append(",");
            sqlSB.append("a.sq_rq");
            sqlSB.append(",");
            sqlSB.append("a.xg_rq");
            
            countSB.append("select count(1) from stu_salary "); 
            sqlSB.append(" from stu_salary a , stu_info b ");
            if (s != null && s.length()>0)
            {
                sqlSB.append(s);
                countSB.append(s);
            }
            
            String rqs=sq_rq + "-01";
            String rqe;
            
            String[] rq1 = sq_rq.split("-");
            int year= Integer.parseInt(rq1[0]);
            int month = Integer.parseInt(rq1[1]);
            if(month==12) {
            	year++;
            	month=1;
            }
            else month++;
            rqe =String.format("%d-%d-01",year, month );
            
            sqlSB.append(" and sq_rq between \""+rqs+"\" and \""+rqe+"\" ");
            sqlSB.append(" and a.stu_code=b.stu_code and a.status='1'and b.status='1' ");
            sqlSB.append(" and a.stu_code in (select stu_code from stu_info where re1 in (select dept_code from t_s_deptmgr where dept_manager='"+bform.dept_code+"'))");
            sqlSB.append(" order by "+paixu);
            countSB.append(" order by "+paixu);
            
            System.out.println("Gzsq[queryStuSalary]: "+sqlSB);
            
            rs=pm.list(con, perPage, curPage, countSB.toString(), sqlSB.toString());
            
            if(rs==null){
            	return "no";
            }
           
            ResultSetMetaData rsmd = rs.getMetaData();
            int numberOfColumns = rsmd.getColumnCount();
            
            boolean isNull=true;
            while (rs!=null && rs.next())
            {
            	isNull = false;
            	
                for (int i = 1; i <= numberOfColumns; i ++)
                {
                    infoSB.append(basePublic.out(rs.getString(i))).append("</C>");
                }

                infoSB.append("</R>");
            }
            
            if(!isNull){
            	infoSB.append("</F>");
            	infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
            }
            
        }
         catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.queryStuSalary出现数据库连接错误，操作为：查询工资申请！"+sql.getMessage(),gzsqBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.queryStuSalary出现错误，操作为：查询工资申请！"+ue.getMessage(),gzsqBean.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.queryStuSalary出现错误，操作为：查询工资申请！"+ce.getMessage(),gzsqBean.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
        
//      System.out.println(infoSB.toString());
        
        return infoSB.toString();
    }

    /*
     * 根据id值查询详细的工资申请AJAX
     */
    public String detailStuSalary(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //判断环境实例是否为空
        if (sc == null)
        {
            System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
            System.out.println("HttpSession 为空，返回。");
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
            sqlSB.append("stu_code");
            sqlSB.append(",");
            sqlSB.append("gz_desp");
            sqlSB.append(",");
            //sqlSB.append("xxhd,");
            sqlSB.append("(CASE xxhd");
            pstm=con.prepareStatement("select code,value from t_s_code where type='stu_salary.xxhd' order by code asc");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" when ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" then ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" end) as xxhd");
            //关闭资源rs,pstm
            close(rs,pstm,null,null);
            
            sqlSB.append(",");
            //sqlSB.append("yhhd,");
            sqlSB.append("(CASE yhhd");
            pstm=con.prepareStatement("select code,value from t_s_code where type='stu_salary.yhhd' order by code asc");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" when ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" then ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" end) as yhhd");
            //关闭资源rs,pstm
            close(rs,pstm,null,null);
            
            sqlSB.append(",");
            //sqlSB.append("error_msg,");
            sqlSB.append("(CASE error_msg");
            pstm=con.prepareStatement("select code,value from t_s_code where type='stu_salary.error_msg' order by code asc");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" when ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" then ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" end) as error_msg");
            //关闭资源rs,pstm
            close(rs,pstm,null,null);
            
            sqlSB.append(",");
            //sqlSB.append("sfff,");
            sqlSB.append("(CASE sfff");
            pstm=con.prepareStatement("select code,value from t_s_code where type='stu_salary.sfff' order by code asc");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" when ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" then ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" end) as sfff");
            //关闭资源rs,pstm
            close(rs,pstm,null,null);
            
            sqlSB.append(",");
            sqlSB.append("sq_rq");
            sqlSB.append(",");
            sqlSB.append("xg_rq");
            sqlSB.append(" from stu_salary ");
            sqlSB.append("where id=?");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, id);
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("stu_code")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("gz_desp")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("xxhd")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("yhhd")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("error_msg")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("sfff")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("sq_rq")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("xg_rq")) + "</C>");
                infoSB.append("</R>");
            }
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.detailStuSalary出现数据库连接错误，操作为：查看工资申请！"+sql.getMessage(),gzsqBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.detailStuSalary出现错误，操作为：查看工资申请！"+ue.getMessage(),gzsqBean.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"gzsqBean.detailStuSalary出现错误，操作为：查看工资申请！"+ce.getMessage(),gzsqBean.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    public String forPlsq(String filename, int IgnoreRows,int IgnoreCols, int sheetN,
    		int readRows, int readCols,
	ServletContext sc, HttpSession session)
	throws CustomException,Exception
	{
    	
    	System.out.println("forPlsq");
    	
    	String table="<table border='1'>";
    	
    	StringBuffer labels = new StringBuffer();
    	StringBuffer values = new StringBuffer();
    	
    	String excelStr = readExcel(filename, IgnoreRows, IgnoreCols, sheetN, readRows, readCols, sc, session);
    	
    	if(excelStr=="") return "";
    	
    	labels.append("stu_code");
    	labels.append(",");
    	labels.append("salary");
    	labels.append(",");
    	labels.append("gz_desp");
    	labels.append(",");
    	labels.append("xxhd");
    	labels.append(",");
    	labels.append("yhhd");
    	labels.append(",");
    	labels.append("Error_msg");
    	labels.append(",");
    	labels.append("sfff");
    	labels.append(",");
    	labels.append("status");
    	
    	table += "<tr><td>学号</td>";
    	table += "<td>返回状态</td></tr>";
    	
    	String[] str1=excelStr.split("</R>");
		for (int i=0; i<str1.length; i++)
		{
		//	System.out.println(str1[i]);
			values.setLength(0);
			String[] str2 = str1[i].split("</C>");
			if(str2.length<readCols ) continue;
			for (int j=0; j<str2.length; j++){
				values.append( "'" + str2[j] + "'" );
				values.append(",");
				System.out.print(str2[j]+"  ");
			}
			table += "<tr>";
			table += "<td>" +str2[0]+ "</td>";
			values.append("0, 0, 0, -1, 1 ");
		
			System.out.print("\n");
			
			int num = addStuSalary(labels.toString(), values.toString(), sc, session);
			if(num<0) table += "<td><font color='blue'>该学号不正确</font></td></tr>";
			else if(num==0) table += "<td><font color='red'>录入失败</font></td></tr>";
			else table += "<td><font color='green'>成功</font></td></tr>";
			
			
		//	System.out.println( labels.toString()+"   " + values.toString() );
			
		}
		table += "</table>";
	
    	
    	return table;
	}
    
    
    /*
	 * 函数功能		: 读取excel文件
	 * return		: String 
	 * filename 	: *.xls 的完整路径
	 * IgnoreRows	: 忽略前IgnoreRows行
	 * IgnoreCols	: 忽略前IgnoreCols列
	 * sheetN		: sheet 总数（0 --  (sheetN-1)）
 	 * */
	//public String readExcel(String filename, ServletContext sc, HttpSession session)
	public String readExcel(String filename, int IgnoreRows,int IgnoreCols,  int sheetN,
			int readRows, int readCols,
			ServletContext sc, HttpSession session)
			throws CustomException,Exception
	{
		System.out.println("ReadExcel--[filename]: "+ filename);
		String table="";
		String returnstr="";
        try 
        {
            InputStream stream = new FileInputStream(filename);
            //打开文件
    		Workbook workbook = null;
            try {
                workbook = Workbook.getWorkbook(stream);
            } catch (Exception e) {
            	System.out.println("建立workbook对象出错!");
            	throw new CustomException("建立workbook对象出错！");
            }
            
            
            String poststr="";
            String rulstr="";
            Sheet st = workbook.getSheet(0);//取得第一个sheet
            
            int rsColumns = 0;
            if(readCols<1) rsColumns= st.getColumns();//取得列数
            else rsColumns = readCols + IgnoreCols;
            
            int rsRows = 0;
            if(readRows<1) rsRows = st.getRows(); //取得行数
            else rsRows = readRows + IgnoreRows;
            
            System.out.println("rows:"+rsRows+"  cols:"+rsColumns);
            
            String temp;
            
            for (int i=IgnoreRows; i<rsRows; i++)
            {   	
            	for (int j=IgnoreCols; j<rsColumns; j++)
            	{
            		Cell cont = st.getCell(j,i);
            		temp = cont.getContents();
            		poststr += temp +"</C>";
            	}
            	poststr += "</R>";
            }
            //关闭文件
            workbook.close();
           

			returnstr = poststr;
			
        } 
        catch (IOException e) 
        {
            e.printStackTrace();
        } 
        catch (Exception e) {
        	System.out.println("建立workbook对象出错!");
        	e.printStackTrace();
        	throw new CustomException("建立workbook对象出错！");
        }
        
        return returnstr;
    }

    
    
}
