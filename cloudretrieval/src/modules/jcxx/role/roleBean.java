/*
 * @(#)roleBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.role;

import java.sql.*;
import java.util.ResourceBundle;
import java.io.UnsupportedEncodingException;
import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import modules.base.*;

/**
 * 功能:本类为角色信息的Bean类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: roleBean.java,v 1.1 2012/09/30 01:54:27 Administrator Exp $
 */
public class roleBean extends ResourceClose
{
    //private DataSource dataSource;
    //private String date = TimeBean.getCurrentTime();
    public roleBean()
    {
    }

    /*
     * 构造函数
     */
    /*
    public roleBean(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
	*/
    /*
     * 查询所有权限信息，并返回IE客户端生成树
     */
    public String createRulerTree(ServletContext sc,HttpSession session) throws CustomException,Exception{
    	
//    	判断环境实例是否为空
        if (sc == null){
        	
        	basePublic.error("ServletContext 为空，返回。");
            
        	throw new CustomException("ServletContext 为空，返回");
        }
        
            
        //判断会话实例是否为空
        if(session==null){
        	basePublic.error("HttpSession 为空，返回。");
        	throw new CustomException("HttpSession 为空，返回");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if(bform==null){
        	
        	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
        }
        
        //保存查询结果信息
        StringBuffer infoSB=null;
    	
    	Connection con=null;//保存数据库连接
    	PreparedStatement pstm=null;//保存预处理语句
    	ResultSet rs=null;//保存查询的结果集
    	
    	
    	try{
    		con=((DataSource)sc.getAttribute("basedb")).getConnection();
    		
    		if(con==null){
    			
    			throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
    		}
    		infoSB=new StringBuffer();
    		infoSB.append("select a.ruler_code,b.ruler_name,ruler_level,ruler_manager from t_s_ruler a,t_s_rulervalue b, t_s_rolevalue c " +
    				" where a.status=1 and b.language=? and a.ruler_code=b.ruler_code ");
    		if(!bform.role_code.equals("super"))//not spuer role
    			infoSB.append(" and a.ruler_code=c.ruler_code and c.role_code=? and c.status=1 ");
    		infoSB.append(" order by ruler_level asc");
    		
    		pstm=con.prepareStatement(infoSB.toString());
    		
    		pstm.setString(1, bform.language);
    		if(!bform.role_code.equals("super"))
    			pstm.setString(2, bform.role_code);
    		System.out.println(infoSB);
    		rs=pstm.executeQuery();
    		
    		while(rs!=null && rs.next()){
    			
    			infoSB.append(rs.getString("ruler_code").trim()).append(",");
    			infoSB.append(basePublic.out(rs.getString("ruler_name").trim())).append(",");
    			infoSB.append(rs.getInt("ruler_level")).append(",");
    			infoSB.append(rs.getString("ruler_manager").trim()).append(";");
    		}
    		LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"角色管理修改前权限树生成成功！",roleBean.class.getName());
    	}
    	catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.createRulerTree出现数据库连接错误，操作为：角色管理修改前权限树生成失败！"+sql.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.createRulerTree出现转化字符集错误，操作为：角色管理修改前权限树生成失败！"+ue.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.createRulerTree出现错误，操作为：角色管理修改前权限树生成失败！"+ce.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally{
        	//关闭所有可用资源
        	close(rs,pstm,false,null,false,con);
        }
    	
    	
    	return infoSB.toString();
    }
    
    /*
     * 查询所有权限信息，并返回IE客户端生成树
     */
    public String queryRulerTree(String role_code,ServletContext sc,HttpSession session) throws CustomException,Exception{
    	
//    	判断环境实例是否为空
        if (sc == null){
        	
        	basePublic.error("ServletContext 为空，返回。");
            
        	throw new CustomException("ServletContext 为空，返回");
        }
        
            
        //判断会话实例是否为空
        if(session==null){
        	
        	basePublic.error("HttpSession 为空，返回。");
            
        	throw new CustomException("HttpSession 为空，返回");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        //判断用户是否登录
        
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if(bform==null){
        	
        	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
        }
        
        
        //保存查询结果信息
        StringBuffer infoSB=null;
    	
    	Connection con=null;//保存数据库连接
    	PreparedStatement pstm=null;//保存预处理语句
    	ResultSet rs=null;//保存查询的结果集
    	
    	
    	try{
    		con=((DataSource)sc.getAttribute("basedb")).getConnection();
    		
    		if(con==null){
    			
    			throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
    		}
    		
    		infoSB=new StringBuffer();
    		//获得已绑定的角色权限
    		pstm=con.prepareStatement("select a.ruler_code,c.ruler_name,a.ruler_level,a.ruler_manager,b.ruler_word " +
    				"from t_s_ruler a,t_s_rolevalue b, t_s_rulervalue c " +
    				"where a.ruler_code=b.ruler_code and a.ruler_code=c.ruler_code and a.ruler_echo=0 and b.role_code=? and c.language=? and a.status=1 and b.status=1 " +
    				"order by a.ruler_level asc");
    		
    		pstm.setString(1,role_code);
    		pstm.setString(2, bform.language);
    		System.out.println(infoSB);
    		rs=pstm.executeQuery();
    		while(rs!=null && rs.next()){
    			infoSB.append(rs.getString("ruler_code").trim()).append(",");
    			infoSB.append(basePublic.out(rs.getString("ruler_name").trim())).append(",");
    			infoSB.append(rs.getInt("ruler_level")).append(",");
    			infoSB.append(rs.getString("ruler_manager").trim()).append(",").append(rs.getString("ruler_word").trim()).append(",Y,Y;");
    		}
    		
//    		关闭可用资源
    		close(rs,pstm,false,null,false,null);
//    		获得未绑定的角色权限
    		String sql = "select a.ruler_code,b.ruler_name,ruler_level,ruler_manager " +
			" from t_s_ruler a, t_s_rulervalue b where a.ruler_code=b.ruler_code and b.language=? and ruler_echo=0 and a.ruler_code not in(select ruler_code from t_s_rolevalue where role_code=? and status=1) and a.status=1 " +
			" order by ruler_level asc";
    		System.out.println(sql);
    		pstm=con.prepareStatement(sql);
    		pstm.setString(1, bform.language);
    		pstm.setString(2,role_code);
    		rs=pstm.executeQuery();
    		while(rs!=null && rs.next()){
    			
    			infoSB.append(rs.getString("ruler_code").trim()).append(",");
    			infoSB.append(basePublic.out(rs.getString("ruler_name").trim())).append(",");
    			infoSB.append(rs.getInt("ruler_level")).append(",");
    			infoSB.append(rs.getString("ruler_manager").trim()).append(",QUID,N,N;");
    		}
    		LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"查看角色管理详细信息成功！",roleBean.class.getName());
    	}
    	catch (SQLException e)
        {
            e.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.queryRulerTree出现数据库连接错误，操作为：查看角色管理详细信息失败！"+e.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.queryRulerTree出现转化字符集错误，操作为：查看角色管理详细信息失败！"+ue.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.queryRulerTree出现错误，操作为：查看角色管理详细信息失败！"+ce.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally{
        	//关闭所有可用资源
        	close(rs,pstm,false,null,false,con);
        }
    	
    	
    	return infoSB.toString();
    }
    
    /*
     * 删除角色信息AJAX
     */
    public String deleteTSRole(String value,ServletContext sc,HttpSession session)
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
        
        if(value==null || value.length()==0)

        	throw new CustomException("出现非法操作，退出系统。");
        
        
        
        Connection con=null;//保存数据库连接
        Statement stm=null;
        DataSource ds=null;
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {	
            	
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }
            
            con.setAutoCommit(false);
            
            stm=con.createStatement();

            
            stm.addBatch("update t_s_rolevalue set status=0 where role_code=(select role_code from t_s_role where id="+value+" and status=1)");
            
            stm.addBatch("update t_s_role set status=0 where id="+value);
           
            stm.executeBatch();
            
            con.commit();
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"删除角色成功！",roleBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();

            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	sqlRollBack.printStackTrace();
            	
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.deleteTSRole出现数据库连接错误，操作为：删除角色失败！"+sql.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
           
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	sqlRollBack.printStackTrace();
            	
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.deleteTSRole出现连接错误，操作为：删除角色失败！"+ce.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(null,null,false,stm,true,con);
        }
        
        return "1</C></R>";
    }

    /*
     * 添加角色信息AJAX
     */
    public String addTSRole(String role_code,String role_name,String dept_level,String rulervalues,ServletContext sc,HttpSession session)
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

        Connection con=null;//保存数据库连接
        PreparedStatement pstm = null;
        DataSource ds=null;
        
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
            	
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }
            
            con.setAutoCommit(false);
            
          
            
            String sfld = dept_level.split("</C>")[0];
            String sftq = dept_level.split("</C>")[1];

            
            pstm = con.prepareStatement("insert into t_s_role (role_code,role_name,dept_level,sfld,sftq) values(?,?,?,?,?)");
            
            pstm.setString(1, role_code);
            pstm.setString(2, basePublic.in(role_name));
            pstm.setInt(3, 10);
            pstm.setString(4, basePublic.in(sfld));
            pstm.setString(5, basePublic.in(sftq));
            
            if(pstm.executeUpdate() == 1){
            
            	
            	if(rulervalues!=null && rulervalues.length()>0){
            		
            		pstm.close();
            		
            		pstm = null;
            		
            		
            		pstm = con.prepareStatement("insert into t_s_rolevalue(role_code,ruler_code,ruler_word) values(?,?,?)");
            		
            		
            		String[] rulers=rulervalues.split(";");
                    
                    int length=rulers.length;
                    
                    
                    for(int i=0;i<length;i++){
                    	
                    	String[] sub_rulers=rulers[i].split(",");
                    
                    	pstm.setString(1, role_code);
                    	pstm.setString(2, sub_rulers[0]);
                    	pstm.setString(3, sub_rulers[1]);
                    	
                    	pstm.executeUpdate();
                    }
            	}
            	
            	con.commit();
            	
            	LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"添加角色成功！",roleBean.class.getName());
            	
            	return "1</C></R>";
            }
            else{
            	
            	con.rollback();
            	
            	return "0</C></R>";
            }
            	
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.addTSRole出现数据库连接错误，操作为：添加角色失败！"+sql.getMessage(),roleBean.class.getName());
            
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	 //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|roleBean.java--addTSRole():增加角色信息(t_s_role,t_s_rolevalue)出现数据连接方面的错误，错误代码："+sql.getErrorCode()+"错误信息:"+sqlRollBack.getMessage());
            	basePublic.error("添加角色权限时出现异常，操作已回滚。");
            }
            
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch(NumberFormatException nf){
        	
        	nf.printStackTrace();
        	LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.addTSRole出现数字转化错误，操作为：添加角色失败！"+nf.getMessage(),roleBean.class.getName());
        	try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	basePublic.error("添加角色权限时出现异常，操作已回滚。");
            }
            
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.addTSRole出现转化字符集错误，操作为：添加角色失败！"+ue.getMessage(),roleBean.class.getName());
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	basePublic.error("添加角色权限时出现异常，操作已回滚。");
            }
            
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.addTSRole出现错误，操作为：添加角色失败！"+ce.getMessage(),roleBean.class.getName());
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	basePublic.error("添加角色权限时出现异常，操作已回滚。");
            }
            
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(null,pstm,false,null,false,con);
        }
    }

    /*
     * 修改角色信息AJAX
     */
    public String updateTSRole(String id,String values,String role_code,String rulervalues,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
//    	System.out.println(id);
//    	System.out.println("values="+values);
//    	System.out.println("role_code="+role_code);
//    	System.out.println("rulervalues="+rulervalues);
        if (sc == null)
        {
        	basePublic.error("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }
        if (session==null)
        {
        	basePublic.error("HttpSession 为空，返回。");
            throw new CustomException("HttpSession 为空，返回");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
        }
        //保存SQL语句
        StringBuffer sqlSB = null;
        Connection con=null;//保存数据库连接
        Statement stm=null;
        DataSource ds=null;
        try
        {
        	if(role_code==null || role_code.length()==0 || rulervalues==null || rulervalues.length()==0)
            	throw new CustomException("出现非法操作，退出系统。");

        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }
            //设置为手动提交
            con.setAutoCommit(false);
            //实例化stm
            stm=con.createStatement();
            sqlSB=new StringBuffer();
            sqlSB.append("update t_s_role set ").append(values).append(" where id=").append(id);
            stm.addBatch(basePublic.in(sqlSB.toString()));
            String[] rulerArrays=rulervalues.split(";");
            int length=rulerArrays.length;
            for(int i=0;i<length;i++){
            	
            	String[] subRulerArrays=rulerArrays[i].split(",");
            	
            	sqlSB.delete(0,sqlSB.length());
            	
            	
            	if(subRulerArrays[2].toUpperCase().equals("N") && subRulerArrays[3].toUpperCase().equals("Y")){//用户新填加的角色权限
            		
            		
            		sqlSB.append("insert into t_s_rolevalue (role_code,ruler_code,ruler_word) values ('").append(role_code.trim());
            		sqlSB.append("','").append(subRulerArrays[0].trim()).append("','").append(subRulerArrays[1].trim()).append("')");
            		
            		stm.addBatch(sqlSB.toString());
            	}
            	else if(subRulerArrays[2].toUpperCase().equals("Y") && subRulerArrays[3].toUpperCase().equals("Y")){//用户可能对原来角色权限的操作权限已修改
            		
            		sqlSB.append("update t_s_rolevalue set ruler_word='").append(subRulerArrays[1].trim()).append("' where role_code='");
            		sqlSB.append(role_code).append("' and ruler_code='").append(subRulerArrays[0].trim()).append("'");
            		
            		stm.addBatch(sqlSB.toString());
            	}
            	else if(subRulerArrays[2].toUpperCase().equals("Y") && subRulerArrays[3].toUpperCase().equals("N")){//用户将原来的角色权限删除
            		
            		sqlSB.append("update t_s_rolevalue set status=0 where role_code='").append(role_code.trim()).append("' and ruler_code='");
            		sqlSB.append(subRulerArrays[0].trim()).append("'");
            		
            		stm.addBatch(sqlSB.toString());
            	}
            }
            
            
            //提交SQL语句到数据库
            stm.executeBatch();
            
            //执行SQL语句
            con.commit();
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"修改角色成功！",roleBean.class.getName());
            
            return "1</C></R>";
            
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
           
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	 
            	sqlRollBack.printStackTrace();
            	
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.updateTSRole出现数据库连接错误，操作为：修改角色失败！"+sql.getMessage(),roleBean.class.getName());
            throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	sqlRollBack.printStackTrace();
            	
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.updateTSRole出现转化字符集错误，操作为：修改角色失败！"+ue.getMessage(),roleBean.class.getName());
            throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	sqlRollBack.printStackTrace();
            	
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.updateTSRole出现错误，操作为：修改角色失败！"+ce.getMessage(),roleBean.class.getName());
            throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(null,null,false,stm,true,con);
        }
    }
    
    /*
     * 根据条件语句查询角色信息AJAX
     */
    public String queryTSRole(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        if (sc == null)
        {
        	basePublic.error("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }
        if (session==null)
        {
        	basePublic.error("HttpSession 为空，返回。");
            throw new CustomException("HttpSession 为空，返回");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
        }
        
        StringBuffer infoSB=null;
        StringBuffer sqlSB = null;
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
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }
            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            countSB=new StringBuffer();
            
            sqlSB.append("select ");
            sqlSB.append("id");
            sqlSB.append(",");
            sqlSB.append("role_code");
            sqlSB.append(",");
            sqlSB.append("role_name");
            
            sqlSB.append(" from t_s_role ");
            countSB.append("select count(1) from t_s_role "); 
            if (s != null && s.length()>0)
            {
                sqlSB.append(s).append(" and status = 1");
                countSB.append(s).append(" and status = 1");
            }
            else{
            	
            	sqlSB.append(" where status = 1");
            	countSB.append(" where status = 1");
            }
            sqlSB.append(" order by id desc");
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
                    infoSB.append(basePublic.out(rs.getString(i))).append("</C>");
                }

                infoSB.append("</R>");
            }
            
            infoSB.append("|");
            
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"根据条件查询角色成功！",roleBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.queryTSRole出现数据库连接错误，操作为：根据条件查询角色失败！"+sql.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.queryTSRole出现转化字符集错误，操作为：根据条件查询角色失败！"+ue.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.queryTSRole出现错误，操作为：根据条件查询角色失败！"+ce.getMessage(),roleBean.class.getName());
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
}