/*
 * @(#)modules.ggfjBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
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
 * ����:����Ϊ����������Bean��
 *
 * @author  �������д
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
     * ���캯��
     */
    public ggfjBean(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }

    /*
     * ɾ����������AJAX
     */
    public int deleteTSGgfj(String ids,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        // �жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
         //   System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
          //  System.out.println("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }
        
        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
        }
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }

            int num=0;
            String[] id = ids.split("</C>");
            for(int i=0; i<id.length; i++){
//            	pstm=con.prepareStatement(basePublic.in("delete from t_s_ggfj where id=?"));
	            pstm=con.prepareStatement(basePublic.in("update t_s_ggfj set status=-1 where id=?"));
	            pstm.setString(1, id[i]);
	            num = pstm.executeUpdate();
	        }
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ɾ�����������ɹ���",ggfjBean.class.getName());

            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.deleteTSGgfj�������ݿ����Ӵ��󣬲���Ϊ��ɾ������������"+sql.getMessage(),ggfjBean.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.deleteTSGgfj���ִ��󣬲���Ϊ��ɾ������������"+ue.getMessage(),ggfjBean.class.getName());
            throw new CustomException("ת���ַ���ʱ���ִ���");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.deleteTSGgfj���ִ��󣬲���Ϊ��ɾ������������"+ce.getMessage(),ggfjBean.class.getName());
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }
    }

    /*
     * ��ӹ�������AJAX
     */
    public int addTSGgfj(String infos,
    		ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
        //    System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
        //    System.out.println("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }

        //�ж��û��Ƿ��¼
        
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
        }

        //����SQL���
        StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
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
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"���ӹ��������ɹ���",ggfjBean.class.getName());
            
            return sum;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.addTSGgfj���ִ��󣬲���Ϊ�����ӹ���������"+sql.getMessage(),ggfjBean.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.addTSGgfj���ִ��󣬲���Ϊ�����ӹ���������"+ue.getMessage(),ggfjBean.class.getName());
            throw new CustomException("ת���ַ���ʱ���ִ���");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.addTSGgfj���ִ��󣬲���Ϊ�����ӹ���������"+ce.getMessage(),ggfjBean.class.getName());
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }
    }


    /*
     * �޸�ǰ����idֵ��ѯ��ϸ�Ĺ�������AJAX
     */
    public String beforeUpdateTSGgfj(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
        //    System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
         //   System.out.println("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }
        
        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
        }
        
        //�����ѯ�����Ϣ
        StringBuffer infoSB=null;
        //����SQL���
        StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
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
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.beforeUpdateTSGgfj�������ݿ���󣬲���Ϊ���޸�ǰ��ѯ����������"+sql.getMessage(),ggfjBean.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.beforeUpdateTSGgfj���ִ��󣬲���Ϊ���޸�ǰ��ѯ����������"+ue.getMessage(),ggfjBean.class.getName());
            throw new CustomException("ת���ַ���ʱ���ִ���");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.beforeUpdateTSGgfj���ִ��󣬲���Ϊ���޸�ǰ��ѯ����������"+ce.getMessage(),ggfjBean.class.getName());
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /*
     * �޸Ĺ�������AJAX
     */
    public int updateTSGgfj(String id,String values,
        ServletContext sc,HttpSession session) throws CustomException,Exception
    {
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
        //    System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
          //  System.out.println("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }

        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if (bform==null)
        {
            throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
        }

        //����SQL���
        StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }

            sqlSB=new StringBuffer();

            sqlSB.append("UPDATE t_s_ggfj SET ").append(values).append(" WHERE id=").append(id);
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

            int num=pstm.executeUpdate();
 			
 			LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�޸Ĺ��������ɹ�",ggfjBean.class.getName());

            return num;
        }
          catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.updateTSGgfj�������ݿ����Ӵ��󣬲���Ϊ���޸Ĺ���������"+sql.getMessage(),ggfjBean.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.updateTSGgfj���ִ��󣬲���Ϊ���޸Ĺ���������"+ue.getMessage(),ggfjBean.class.getName());
            throw new CustomException("ת���ַ���ʱ���ִ���");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.updateTSGgfj���ִ��󣬲���Ϊ���޸Ĺ���������"+ce.getMessage(),ggfjBean.class.getName());
            throw new CustomException("����δ֪�쳣����");
        }
       
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }
    }
    
    /*
     * ������������ѯ��������AJAX
     */
    public String queryTSGgfj(int perPage,int curPage,String s,String paixu,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
        //    System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
        //    System.out.println("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }
        
        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
        }
        
        //�����ѯ�����Ϣ
        StringBuffer infoSB=null;
        //����SQL���
        StringBuffer sqlSB=null;
        //�����ѯ���������
        StringBuffer countSB=null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        
        PageMan pm=PageManFactory.getInstance();
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
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
            //�ر���Դrs,pstm
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
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.queryTSGgfj�������ݿ����Ӵ��󣬲���Ϊ����ѯ����������"+sql.getMessage(),ggfjBean.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.queryTSGgfj���ִ��󣬲���Ϊ����ѯ����������"+ue.getMessage(),ggfjBean.class.getName());
            throw new CustomException("ת���ַ���ʱ���ִ���");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.queryTSGgfj���ִ��󣬲���Ϊ����ѯ����������"+ce.getMessage(),ggfjBean.class.getName());
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /*
     * ����idֵ��ѯ��ϸ�Ĺ�������AJAX
     */
    public String detailTSGgfj(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
        //    System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
        //    System.out.println("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }
        
        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
        }
        
        //�����ѯ�����Ϣ
        StringBuffer infoSB=null;
        //����SQL���
        StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
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
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.detailTSGgfj�������ݿ����Ӵ��󣬲���Ϊ���鿴����������"+sql.getMessage(),ggfjBean.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.detailTSGgfj���ִ��󣬲���Ϊ���鿴����������"+ue.getMessage(),ggfjBean.class.getName());
            throw new CustomException("ת���ַ���ʱ���ִ���");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ggfjBean.detailTSGgfj���ִ��󣬲���Ϊ���鿴����������"+ce.getMessage(),ggfjBean.class.getName());
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
}
