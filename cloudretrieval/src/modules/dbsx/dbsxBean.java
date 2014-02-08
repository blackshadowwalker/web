/*
 * @(#)dbsxBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.dbsx;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.io.UnsupportedEncodingException;
import javax.sql.DataSource;
import modules.base.CustomException;
import modules.base.LogBean;
import modules.base.PageMan;
import modules.base.PageManFactory;
import modules.base.TimeBean;
import modules.base.baseForm;
import modules.base.basePublic;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import modules.base.*;

import java.util.Date;

/**
 * ����:����Ϊ���������Bean��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: dbsxBean.java,v 1.1 2012/09/30 01:54:21 Administrator Exp $
 */
public class dbsxBean extends ResourceClose
{
    //private DataSource dataSource;

    public dbsxBean()
    {
    }

    /*
     * ���캯��
     */
    /*
    public dbsxBean(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    */
    /*
     * ɾ����������AJAX
     */
    public int deleteTDCzkzDbsx(String value,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        // �жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            //////////System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            //////////System.out.println("HttpSession Ϊ�գ����ء�");
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

        //String curTime=TimeBean.getCurrentTime();
        DataSource ds=null;
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }
            int num = 0;
           
        	
            pstm=con.prepareStatement("update t_d_czkz_dbsx set del_status=0 WHERE id=?");

            pstm.setLong(1,Long.parseLong(value));
            
            num = pstm.executeUpdate();
            
            return num;

        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            throw new CustomException("�������ݿ����ӷ���Ĵ���..."+sql.getMessage());
        }
        catch (NumberFormatException nfe)
        {
            nfe.printStackTrace();
            throw new CustomException("���ָ�ʽ���ִ���:"+nfe.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            throw new CustomException("����δ֪�쳣����:"+ce.getMessage());
        }
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }
       // return infoSB.toString();
    }

    /*
     * ��Ӵ�������AJAX
     */
    public int addTDCzkzDbsx(String labels,String values,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            //////////System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            //////////System.out.println("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }

        //�ж��û��Ƿ��¼
        
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
        }

        //�����ѯ�����Ϣ
        //StringBuffer infoSB=null;
        //����SQL���
        StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        //ResultSet rs=null;//�����ѯ�Ľ����

        //String curTime=TimeBean.getCurrentTime();
        DataSource ds=null;

        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }

            //infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            int num = 0;



            sqlSB.append("INSERT INTO t_d_czkz_dbsx(id,").append(labels).append(") VALUES (t_d_czkz_dbsx_seq.nextval,").append(values).append(")");

            ////System.out.println(sqlSB.toString());
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

            num = pstm.executeUpdate();
            
            
            
            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();            
            
            throw new CustomException("�������ݿ����ӷ���Ĵ���..."+sql.getMessage());
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            
            throw new CustomException("ת���ַ���ʱ���ִ���:"+ue.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            
            throw new CustomException("����δ֪�쳣����:"+ce.getMessage());
        }
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }
        
        //return infoSB.toString();
    }
    
    /*
     * �޸�ǰ����idֵ��ѯ��ϸ�Ĵ�������AJAX
     */
    public String beforeUpdateTDCzkzDbsx(long id,int lx,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            //////////System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            //////////System.out.println("HttpSession Ϊ�գ����ء�");
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
        	con = ((DataSource)sc.getAttribute("basedb")).getConnection();
            
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            //sqlSB.append(bform.login_id).append("|").append(curTime).append("|����id(").append(s).append(")��ѯ����������ϸ��Ϣ");
            
            //sqlSB.delete(0,sqlSB.length());
            
            if(lx == 0){ //����
            	
            	sqlSB.append("SELECT a.fqry_id");
                sqlSB.append(",");
                sqlSB.append("(case a.type ");
                sqlSB.append("when 0 then '����' when 1 then '��Ա' end) as type_name");
                sqlSB.append(",");
                sqlSB.append("a.js_id,");
                sqlSB.append("b.dept_code as js");
                sqlSB.append(",");
                sqlSB.append("a.content");
                sqlSB.append(",");
                sqlSB.append("a.link");
                sqlSB.append(",");
                sqlSB.append("to_char(a.start_time,'YYYYMMDD') as start_time");
                sqlSB.append(",");
                sqlSB.append("to_char(a.end_time,'YYYYMMDD') as end_time");
                //sqlSB.append(",");
                //sqlSB.append("a.tstamp");

                sqlSB.append(" FROM t_d_czkz_dbsx a,t_s_dept b ");
                sqlSB.append("WHERE a.id=? and a.js_id=b.id and a.del_status=1 and b.status=1");
            }
            else{//��Ա
            	
            	sqlSB.append("SELECT a.fqry_id");
                sqlSB.append(",");
                sqlSB.append("(case a.type ");
                sqlSB.append("when 0 then '����' when 1 then '��Ա' end) as type_name");
                sqlSB.append(",");
                sqlSB.append("a.js_id,");
                sqlSB.append("b.per_name as js");
                sqlSB.append(",");
                sqlSB.append("a.content");
                sqlSB.append(",");
                sqlSB.append("a.link");
                sqlSB.append(",");
                sqlSB.append("to_char(a.start_time,'YYYYMMDD') as start_time");
                sqlSB.append(",");
                sqlSB.append("to_char(a.end_time,'YYYYMMDD') as end_time");
                //sqlSB.append(",");
                //sqlSB.append("a.tstamp ");
                sqlSB.append(" FROM t_d_czkz_dbsx a,t_b_jcxx_ryxx b ");
                sqlSB.append("WHERE a.id=? and a.js_id=b.id and a.del_status=1 and b.status=1");
            }
 
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, id);
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                //infoSB.append(rs.getString("id")).append("</C>");
                infoSB.append(rs.getString("fqry_id")).append("</C>");
                infoSB.append(basePublic.out(rs.getString("type_name"))).append("</C>");
                infoSB.append(rs.getString("js_id")).append("</C>");
                infoSB.append(rs.getString("js")).append("</C>");
                infoSB.append(basePublic.out(rs.getString("content"))).append("</C>");
                infoSB.append(rs.getString("start_time")).append("</C>");
                infoSB.append(rs.getString("end_time")).append("</C></R>");
                //infoSB.append(rs.getString("tstamp")).append("</C></R>");
            }
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();

            throw new CustomException("�������ݿ����ӷ���Ĵ���..."+sql.getMessage());
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();

            throw new CustomException("ת���ַ���ʱ���ִ���:"+ue.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();

            throw new CustomException("����δ֪�쳣����:"+ce.getMessage());
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /*
     * �޸Ĵ�������AJAX
     */
    public int updateTDCzkzDbsx(long id,String values,
        ServletContext sc,HttpSession session) throws CustomException,Exception
    {
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            //////////System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            //////////System.out.println("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }

        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if (bform==null)
        {
            throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
        }

        //�����ѯ�����Ϣ
        //StringBuffer infoSB=null;

        //����SQL���
        StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������

        
        //long js=0l;
        DataSource ds=null;
        
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }


            sqlSB=new StringBuffer();
                        
        	sqlSB.append("UPDATE t_d_czkz_dbsx SET ").append(values).append("  WHERE id=?");
        	
        	
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1,id);
            
            int num =  pstm.executeUpdate();

            
            return num;
            //infoSB.append("</C></R>");
            
            //sqlSB.delete(0,sqlSB.length());
            //sqlSB.append(bform.login_id).append("|").append(curTime).append("|����������Ϣ�޸����");
        	//Log.logger.log(Level.INFO,sqlSB.toString());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            throw new CustomException("�������ݿ����ӷ���Ĵ���..."+sql.getMessage());
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            throw new CustomException("ת���ַ���ʱ���ִ���:"+ue.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            throw new CustomException("����δ֪�쳣����:"+ce.getMessage());
        }
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }

        //return infoSB.toString();
    }
    
    /*
     * ������������ѯ��������AJAX
     */
    public String queryTDCzkzDbsx(int perPage,int curPage,int type,String dept,String person,String fqr,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            //////////System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            //////////System.out.println("HttpSession Ϊ�գ����ء�");
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
        
        StringBuffer countSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        ResultSetMetaData rsmd = null;
        int numberOfColumns = 0;
        
        //String curTime=TimeBean.getCurrentTime();
        
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
        	
            
            //������Ϊ��ʱ
            
            if(type == 0){
            	
            	sqlSB.append("SELECT ");
                sqlSB.append("id");
                sqlSB.append(",");
                sqlSB.append("fqry_id,(select per_name from t_b_jcxx_ryxx where id=t_d_czkz_dbsx.fqry_id and status=1) as fqry_name,");
                 
                 sqlSB.append("type,(select dept_name from t_s_dept where id=t_d_czkz_dbsx.js_id and status=1 ) as dept_name,");
                
                sqlSB.append("content");
                
                sqlSB.append(",");
                sqlSB.append("to_char(start_time,'YYYYMMDD')");
                sqlSB.append(",");
                sqlSB.append("to_char(end_time,'YYYYMMDD')");
                sqlSB.append(",");

                sqlSB.append("to_char(tstamp,'YYYYMMDD')");
                sqlSB.append(" FROM t_d_czkz_dbsx where 1=1");
                
                countSB.append("select count(1) from t_d_czkz_dbsx  where 1=1");
                
                sqlSB.append(" and type=0 and del_status=1");
                
                countSB.append(" and type=0 and del_status=1");
                
                if(!fqr.equals("")){
                	
                  	 sqlSB.append(" and fqry_id=").append(fqr);
                  	 
                  	 countSB.append(" and fqry_id=").append(fqr);
                  }
                
                if(!dept.equals("")){
                	
                	 sqlSB.append(" and js_id=").append(dept);
                	 
                	 countSB.append(" and js_id=").append(dept);
                }
                
                sqlSB.append(" ORDER BY id desc ");
                
               // System.out.println("query==="+sqlSB.toString());
                
                rs=pm.list(con, perPage, curPage, countSB.toString(), basePublic.in(sqlSB.toString()));
                
                if(rs==null){
                	
                	return "no";
                }
                 
               rsmd = rs.getMetaData();
               numberOfColumns = rsmd.getColumnCount();
               
               String dept_name="";
               
               String fqry_name="";

                while (rs!=null && rs.next())
                {
                	dept_name =rs.getString("dept_name");
                	
                	fqry_name =rs.getString("fqry_name");
                	
                	if((dept_name==null || dept_name.trim().equals("")) || (( fqry_name==null || fqry_name.trim().equals("")) && rs.getLong(2)!=0)){
                		
                		continue;
                	}
                	
                    for (int i = 1; i <= numberOfColumns; i ++)
                    {
                        if(i==2 ){
                        	
                        	if(rs.getString(2).equals("0")){
                        		
                        		infoSB.append("0</C>ϵͳ</C>");
                        	}
                        	else{
                        		
                        		infoSB.append(rs.getString(2)).append("</C>").append(basePublic.out(rs.getString(3))).append( "</C>");
                        	}
                        }
                        else if(i!=3){
                        	
                        	infoSB.append(basePublic.out(rs.getString(i))).append( "</C>");
                        }
                    }

                    infoSB.append("</R>");
                }
                
                infoSB.append("|");
                
                infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
            }
            
        	//��Ա��Ϊ��ʱ
            else if(type == 1){
            	
                //close(rs,pstm,null,null);
                //sqlSB.delete(0,sqlSB.length());
               
                sqlSB.append("SELECT ");
                sqlSB.append("id");
                sqlSB.append(",");
                sqlSB.append("fqry_id,(select per_name from t_b_jcxx_ryxx where id=t_d_czkz_dbsx.fqry_id and status=1) as fqry_name,");
                 
                 sqlSB.append("type,(select per_name from t_b_jcxx_ryxx where id=t_d_czkz_dbsx.js_id and status=1 ) as js_name,");

                sqlSB.append("content");
                sqlSB.append(",");

                sqlSB.append("to_char(start_time,'YYYYMMDD')");
                sqlSB.append(",");
                sqlSB.append("to_char(end_time,'YYYYMMDD')");
                sqlSB.append(",");

                sqlSB.append("to_char(tstamp,'YYYYMMDD') ");
                sqlSB.append(" FROM t_d_czkz_dbsx where 1=1 ");
                
                countSB.append("select count(1) from t_d_czkz_dbsx where 1=1");

                
                sqlSB.append(" and type=1 and del_status=1 ");
                
                countSB.append(" and type=1 and del_status=1 ");
                
                if(!fqr.equals("")){
                	
               	 sqlSB.append(" and fqry_id=").append(fqr);
               	 
               	 countSB.append(" and fqry_id=").append(fqr);
               }
                
                if(!person.equals("")){
                	
               	 sqlSB.append(" and js_id=").append(person);
               	 
               	 countSB.append(" and js_id=").append(person);
               }
                
                sqlSB.append(" ORDER BY id desc");

                rs=pm.list(con, perPage, curPage, countSB.toString(), basePublic.in(sqlSB.toString()));

                // pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
                 
                 //rs=pstm.executeQuery();
                
                if(rs==null){
                	
                	return "no";
                }
                 
                 rsmd = rs.getMetaData();
                 numberOfColumns = rsmd.getColumnCount();
                 
                 String per_name="";
                 
                 String fqry_name="";

                while (rs!=null && rs.next())
                {
                	per_name =rs.getString("js_name");
                	
                	fqry_name =rs.getString("fqry_name");
                	
                	if( (per_name==null || per_name.equals("")) || ((fqry_name==null || fqry_name.trim().equals("")) && rs.getLong(2)!=0)){
                		
                		continue;
                	}
                	
                    for (int i = 1; i <= numberOfColumns; i ++)
                    {
                        	if(i==2){
                        		
                        			if(rs.getLong(2)==0){
                        				
                        				infoSB.append("0</C>ϵͳ</C>");
                        			}
                        			else{
                        				
                        				infoSB.append(rs.getString(2)).append("</C>").append(basePublic.out(rs.getString(3)) + "</C>");
                        			}
                        	}
                        	else if(i!=3){
                        		
                        		infoSB.append(basePublic.out(rs.getString(i)) + "</C>");
                        	}
                    }

                    infoSB.append("</R>");
                }
                
                infoSB.append("|");
                
                infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
              
            }
           
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();        	
        	throw new CustomException("���ִ���"+sql.getMessage());
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();        	
        	throw new CustomException("���ִ���"+ue.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
        	throw new CustomException("���ִ���"+ce.getMessage());
        }
        finally
        {
        	pm.close(true);
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /*
     * ����idֵ��ѯ��ϸ�Ĵ�������AJAX
     */
    public String detailTDCzkzDbsx(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            //////////System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            //////////System.out.println("HttpSession Ϊ�գ����ء�");
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
        int type=1;
        
        
        //String curTime=TimeBean.getCurrentTime();
        
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            
            
            pstm=con.prepareStatement("select type from t_d_czkz_dbsx where id=?");
            pstm.setLong(1, id);
            
            rs=pstm.executeQuery();
            
            if(rs!=null && rs.next())
            {
            	type=rs.getInt("type");
            	
            }
            
            //////////System.out.println("�鿴type===="+type);
            
            close(rs,pstm,null,null);
            
            sqlSB.append("SELECT ");
            sqlSB.append("id,");
            sqlSB.append("fqry_id,(select per_name from t_b_jcxx_ryxx where id=t_d_czkz_dbsx.fqry_id) as fqry_name,");
            
            if(type==0)  //���շ��ǻ���
            {
            	sqlSB.append("(select dept_name from t_s_dept where id=t_d_czkz_dbsx.js_id) as js_name,");            	
            }
            else if(type==1)  //���շ��ǹ�Ա
            {
            	sqlSB.append("(select per_name from t_b_jcxx_ryxx where id=t_d_czkz_dbsx.js_id) as js_name,");
            }
            
            sqlSB.append("content");
            sqlSB.append(",");
           
            //sqlSB.append("link");
            //sqlSB.append("ruler_name");
            //sqlSB.append(",");
           /* sqlSB.append(" ( case status ");
            sqlSB.append("when 0 then '����' when 1 then '�鿴' when 2 then '����' when 3 then '�ر�(����)' when 4 then '�ر�(������Ϣ��ʾʱ��)' end) as status_name");
            
            sqlSB.append(",");
            sqlSB.append(" (case db_level when 0 then '�޼���' when 1 then 'һ��' when 2 then '����' when 3 then '����' when 4 then '�ļ�' end) as level_name");
            sqlSB.append(",");*/
            sqlSB.append("to_char(start_time,'YYYYMMDD') as start_time");
            sqlSB.append(",");
            sqlSB.append("to_char(end_time,'YYYYMMDD') as end_time");
            sqlSB.append(",");
            
            /*sqlSB.append(" ( CASE isSend");
            sqlSB.append(" WHEN 0 THEN '��' WHEN 1 THEN '��' END) as send_name" );
            sqlSB.append(",");
            sqlSB.append("send_time");
            sqlSB.append(",");
         
            sqlSB.append(" ( CASE isCircle");
            sqlSB.append(" WHEN 0 THEN '��' WHEN 1 THEN '��' END ) as circle_name" );
            sqlSB.append(",");
            sqlSB.append("circle_week");
            sqlSB.append(",");*/
            
            sqlSB.append("to_char(tstamp,'YYYYMMDD') as tstamp ");
            sqlSB.append(" FROM t_d_czkz_dbsx ");
            sqlSB.append("WHERE id=?" );
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, id);

            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(rs.getString("id")).append( "</C>");
                ///infoSB.append(basePublic.out(rs.getString("fqjg_name")) + "</C>");
                if(rs.getLong("fqry_id")==0){
                	
                	infoSB.append("ϵͳ</C>");
                }
                else{
                	
                	infoSB.append(basePublic.out(rs.getString("fqry_name"))).append( "</C>");
                }
                
                //infoSB.append(basePublic.out(rs.getString("jsjg_name")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("js_name"))).append( "</C>");
                infoSB.append(basePublic.out(rs.getString("content"))).append( "</C>");
                //infoSB.append(rs.getString("link")).append( "</C>");
               // infoSB.append(basePublic.out(rs.getString("status_name"))).append( "</C>");
                //infoSB.append(basePublic.out(rs.getString("level_name"))).append( "</C>");
                infoSB.append(basePublic.out(rs.getString("start_time"))).append( "</C>");
                infoSB.append(rs.getString("end_time")).append( "</C>");
                //infoSB.append(basePublic.out(rs.getString("send_name"))).append( "</C>");
                //infoSB.append(rs.getString("send_time")).append( "</C>");
               // infoSB.append(basePublic.out(rs.getString("circle_name"))).append( "</C>");
               // infoSB.append(basePublic.out(rs.getString("circle_week"))).append( "</C>");
                infoSB.append(rs.getString("tstamp")).append( "</C>");
                infoSB.append("</R>");
            }
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
        	//sqlSB.delete(0,sqlSB.length());
            //sqlSB.append(bform.login_id).append("|").append(curTime).append("|dbsxBean.java--detailTDCzkzDbsx():����id(").append(s).append(")��ѯ����������ϸ��Ϣ���ִ��� ������룺").append(sql.getErrorCode()).append(" ������Ϣ��").append(sql.getMessage());
        	//Log.logger.log(Level.INFO,sqlSB.toString());
        	
        	throw new CustomException("���ִ���"+sql.getMessage());
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
        	//sqlSB.delete(0,sqlSB.length());
            //sqlSB.append(bform.login_id).append("|").append(curTime).append("|dbsxBean.java--detailTDCzkzDbsx():����id(").append(s).append(")��ѯ����������ϸ��Ϣ���ִ��� ������Ϣ��").append(ue.getMessage());
        	//Log.logger.log(Level.INFO,sqlSB.toString());
        	
        	throw new CustomException("���ִ���"+ue.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
        	//sqlSB.delete(0,sqlSB.length());
            //sqlSB.append(bform.login_id).append("|").append(curTime).append("|dbsxBean.java--detailTDCzkzDbsx():����id(").append(s).append(")��ѯ����������ϸ��Ϣ���ִ��� ������Ϣ��").append(ce.getMessage());
        	//Log.logger.log(Level.INFO,sqlSB.toString());
        	
        	throw new CustomException("���ִ���"+ce.getMessage());
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    
    /*
     * ����idֵ��ѯ��ϸ�Ĵ�������AJAX
     */
    public String queryLink(ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            //////////System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            //////////System.out.println("HttpSession Ϊ�գ����ء�");
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
        //StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        //int type=1;
        
        
        //String curTime=TimeBean.getCurrentTime();
        
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }

            infoSB=new StringBuffer();
            //sqlSB=new StringBuffer();
            
            
            //sqlSB.append(bform.login_id).append("|").append(curTime).append(")��ѯ���ӵ�ַ");
        	//Log.logger.log(Level.INFO,sqlSB.toString());
        	
            //sqlSB.delete(0,sqlSB.length());
            
            pstm=con.prepareStatement("select ruler_code,ruler_name,ruler_page,ruler_level from t_s_ruler where ruler_level!=0 and ruler_page is not null and status=1 ");
            
            //System.out.println("select ruler_code,ruler_name,ruler_page,ruler_level from t_s_ruler where ruler_level!=0 and ruler_page<>'' and status=1 ");
            
            rs=pstm.executeQuery();
            
            while(rs!=null && rs.next()){
            	
            	if(rs.getInt("ruler_level")==1){
            		
            		infoSB.append(basePublic.out(rs.getString("ruler_name")).trim()).append("</C>");
                	infoSB.append(rs.getString("ruler_page").trim());
                	infoSB.append("</R>");
            	}
            	
            	else{
            		
            		infoSB.append(basePublic.out(rs.getString("ruler_name")).trim()).append("</C>");
                	infoSB.append(rs.getString("ruler_page").trim()).append("?").append(rs.getString("ruler_code").trim());
                	infoSB.append("</R>");
            	}
            	
            	
            }
            
            
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();       	
        	throw new CustomException("���ִ���"+sql.getMessage());
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();        	
        	throw new CustomException("���ִ���"+ue.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();       	
        	throw new CustomException("���ִ���"+ce.getMessage());
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
public String getInfo(ServletContext sc,HttpSession session) throws CustomException,Exception{
		
	StringBuffer infoSB=null;
	StringBuffer childSB = null;
		
		//���桮������Ϣ
		StringBuffer sb0=null;
		//���桮�鿴����Ϣ
		StringBuffer sb1=null;
		//���桮������Ϣ
		StringBuffer sb2=null;
		//���桮�رգ���������Ϣ
		//StringBuffer sb3=null;
		//���桮�رգ����ڣ���Ϣ
		//StringBuffer sb4=null;
		
		int num0=0,num1=0,num2=0,num3=0,num4=0;
		
		
//		�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            //////////////System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }
        
        

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            //////////////System.out.println("HttpSession Ϊ�գ����ء�");
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
        ResultSet rs=null;//�����ѯ�Ľ����
        
        PreparedStatement pstm2=null;//����Ԥ�������
        ResultSet rs2=null;//�����ѯ�Ľ����
        //String curTime=TimeBean.getCurrentTime();
        
        try
        {
        	 con=((DataSource)sc.getAttribute("basedb")).getConnection();
             if (con==null)
             {
                 throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
             }
            
             con.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
  
             infoSB=new StringBuffer();
             childSB = new StringBuffer();
            
            
         	 //��������Ҫ��ɵ�����
         	
         	int num = 0;
         	
         	StringBuffer sqlSB = new StringBuffer();
         	 /**
            if(bform.sfld.equals("1"))
            {
            	
            	
    	        sqlSB = new StringBuffer();
    	        
    	        //��ѯ����Ϊδ���κεķ�����ͬʱ����δ���йر�
    	        
    	        SimpleDateFormat sdf1=new SimpleDateFormat("yyyyMMddHHmm");
    	        
    	        String sj = sdf1.format(new Date());
    	        
    	        sqlSB.append("select count(*) as sl from t_s_rwgl where bz in(1,3) and zxbm like '%"+bform.dept_code+"%' and id not in(select zb_id from t_s_rwzx where dept_code='"+bform.dept_code+"') and sfgb = 1 and rwjssj>'"+sj+"'");
    	        
    	      
    	        //System.out.println(sqlSB.toString());
    	        pstm = con.prepareStatement(sqlSB.toString());
    	        
    	        rs = pstm.executeQuery();
    	        int xyzx=0;
    	        if(rs!=null && rs.next())
    	        {
    	        	xyzx =rs.getInt("sl");
    	        	//childSB.append("<font color='#FF0000'>�������ѣ�</font>��<span style=\"cursor:hand;font-size:13px;font-weight:bold;margin-right:4px;\" onclick=\"parent.dd('0')\">"+"��������"+rs.getString("sl")+"��������Ҫִ��,");
    	        }
    	        close(rs,pstm,null,null);
    	        
    	        if(xyzx!=0)
                {num++;
                	childSB.append("<font color='#FF0000'>�������ѣ�</font><span style=\"cursor:hand;font-size:13px;font-weight:bold;margin-right:4px;\" onclick=\"parent.dd('0')\">"+"��������"+xyzx+"��������Ҫִ��").append("</span></C></R>");
                }
    	        
    	        //��ѯ��ص�����
    	        
    	        sqlSB = new StringBuffer();
    	        
    	        sqlSB.append("select count(*) as sl from t_s_rwgl where id  in(select zb_id from t_s_rwzx where dept_code='"+bform.dept_code+"' and zxzt = 2)");
    	        //System.out.println(sqlSB.toString());
    	        pstm = con.prepareStatement(sqlSB.toString());
    	        
    	        rs = pstm.executeQuery();
    	        int rwdh=0;
    	        if(rs!=null && rs.next())
    	        {
    	        	rwdh = rs.getInt("sl");
    	        	
    	        }
    	        close(rs,pstm,null,null); 
    	        
    	        if(rwdh!=0)
                {num++;
                	childSB.append("<font color='#FF0000'>�������ѣ�</font><span style=\"cursor:hand;font-size:13px;font-weight:bold;margin-right:4px;\" onclick=\"parent.dd('0')\">"+"��������"+rwdh+"�����񱻴�أ���Ҫ����ִ�С�").append("</span></C></R>");
                }
    	        
    	        //���ٸ�û����ɵ�����ȻҪ������ɵ�����
    	        sqlSB = new StringBuffer();
    	        
    	        sqlSB.append("select count(*) as sl from t_s_rwgl where id  in(select zb_id from t_s_rwzx where dept_code='"+bform.dept_code+"' and zxzt = 0 and wcjs!=1) and  sfjxwc=1");
    	       // System.out.println(sqlSB.toString());
    	        pstm = con.prepareStatement(sqlSB.toString());
    	        
    	        rs = pstm.executeQuery();
    	        
    	        int jxwc = 0;
    	        
    	        if(rs!=null && rs.next())
    	        {
    	        	jxwc = rs.getInt("sl");
    	        	//System.out.println("sdsdfsdfasdfasdfasdf===="+jxwc);
    	        	
    	        }
    	        close(rs,pstm,null,null); 
    	       // System.out.println("sdfsdf=="+jxwc);
    	        if(jxwc!=0)
                {num++;
                	childSB.append("<font color='#FF0000'>�������ѣ�</font><span style=\"cursor:hand;font-size:13px;font-weight:bold;margin-right:4px;\" onclick=\"parent.dd('0')\">"+"��������"+jxwc+"������δ��ʱ��ɣ������Ѿ��رյ����跴����").append("</span></C></R>");
                	//System.out.println(childSB.toString());
                }
    	        
    	        //���ٸ�û����ɵ�����ȻҪ������ɵ�����
    	        sqlSB = new StringBuffer();
    	        
    	        sqlSB.append("select count(*) as sl from t_s_rwgl where id  in(select zb_id from t_s_rwzx where dept_code='"+bform.dept_code+"' and zxzt = 0 and wcjs=1) and sfgb =0");
    	       // System.out.println(sqlSB.toString());
    	        pstm = con.prepareStatement(sqlSB.toString());
    	        
    	        rs = pstm.executeQuery();
    	        
    	        jxwc = 0;
    	        
    	        if(rs!=null && rs.next())
    	        {
    	        	jxwc = rs.getInt("sl");
    	        	//System.out.println("sdsdfsdfasdfasdfasdf===="+jxwc);
    	        	
    	        }
    	        close(rs,pstm,null,null); 
    	       // System.out.println("sdfsdf=="+jxwc);
    	        if(jxwc!=0)
                {num++;
                	childSB.append("<font color='#FF0000'>�������ѣ�</font><span style=\"cursor:hand;font-size:13px;font-weight:bold;margin-right:4px;\" onclick=\"parent.dd('0')\">"+"��������"+jxwc+"�������Ѿ����������Լ�����ɡ�").append("</span></C></R>");
                	//System.out.println(childSB.toString());
                }
    	        
    	        
            }
             
            //�ж��Ƿ��м��ڽ�������
            
            sqlSB = new StringBuffer();
            
            sqlSB.append("select id from t_s_jqgl where spr like '%"+bform.user_code+"%'");
            
            pstm = con.prepareStatement(sqlSB.toString());
            
            rs = pstm.executeQuery();
            int cs =0;
            while(rs!=null&&rs.next())
            {
            	sqlSB = new StringBuffer();
            	sqlSB.append("select id from t_s_jqsp where zb_id="+rs.getString("id")+" and user_code='"+bform.user_code+"'");
            	
            	pstm2 = con.prepareStatement(sqlSB.toString());
            	rs2 = pstm2.executeQuery();
            	
            	if(rs2!=null && rs2.next())
            	{
            		
            	}
            	else
            	{
            		cs++;
            	}
            }
            close(rs,pstm,null,null);
            
            if(cs!=0)
            {num++;
            	childSB.append("<font color='#FF0000'>����������ѣ�</font> <span style=\"cursor:hand;font-size:13px;font-weight:bold;margin-right:4px;\" onclick=\"parent.dd('1')\">����"+cs+"�����������Ҫ������</span>").append("</C></R>");
            }
             //������ת��������
            sqlSB = new StringBuffer();
            
            sqlSB.append("select count(*) as cs from t_s_gwlz where spr ='"+bform.user_code+"'");
            
            pstm = con.prepareStatement(sqlSB.toString());
            
            rs = pstm.executeQuery();
            
            int gwcs =0;
           
            while(rs!=null&&rs.next())
            {
            	gwcs = rs.getInt("cs");
            }
            close(rs,pstm,null,null);
            
            if(gwcs!=0)
            {num++;
            	childSB.append("<font color='#FF0000'>�����������ѣ�</font><span style=\"cursor:hand;font-size:13px;font-weight:bold;margin-right:4px;\" onclick=\"parent.dd('2')\">����"+gwcs+"��������ת��Ҫ������</span>").append("</C></R>");
            }
            
            //�ж��Ƿ���������Ҫǩ��
             
            
         	
         	
         	//�ж���û�в��ŵı���¼
         	
         	sqlSB = new StringBuffer();
         	sqlSB.append("select id,subString(txsx,1,20) as txsx,user_name from t_s_grbw where ((dept_code='"+bform.dept_code+"' and sfgk='��') or user_code='"+bform.user_code+"') and sfgb = 1");
         	pstm = con.prepareStatement(sqlSB.toString());
         	rs = pstm.executeQuery();
         	
         	while(rs!=null && rs.next())
         	{
         		num++;
            	childSB.append("<span style=\"cursor:hand;font-size:13px;font-weight:bold;margin-right:4px;\" onclick=\"parent.dd('"+rs.getString("id")+"')\"><font color='#FF0000'>"+num+":</font>"+rs.getString("txsx")+"--����ˣ�"+rs.getString("user_name")+"</span>").append("</C></R>");
         	}
         	close(rs,pstm,null,null);
         	
         	
            * 
             */
            
             infoSB.append(num).append("��");
             infoSB.append(childSB.toString());
           
            
 ;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();       	
        	throw new CustomException("���ִ���"+sql.getMessage());
        }
        
        catch (Exception ce)
        {
            ce.printStackTrace();        	
        	throw new CustomException("���ִ���"+ce.getMessage());
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }
        
        //System.out.println(infoSB.toString());
        
        return infoSB.toString();
	}
	
	/*private String getInfo(Connection con,ServletContext sc,HttpSession session) throws CustomException,Exception{
		
		StringBuffer infoSB=null;
		StringBuffer sqlSB=null;
		
		
		//���桮������Ϣ
		StringBuffer sb0=null;
		//���桮�鿴����Ϣ
		StringBuffer sb1=null;
		//���桮������Ϣ
		StringBuffer sb2=null;
		//���桮�رգ���������Ϣ
		//StringBuffer sb3=null;
		//���桮�رգ����ڣ���Ϣ
		//StringBuffer sb4=null;
		
		int num0=0,num1=0,num2=0,num3=0,num4=0;
		
		
//		�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            //////////////System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }
        
        

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            //////////////System.out.println("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }

        //�ж��û��Ƿ��¼
        
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
        }
        
        
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����

        String curTime=TimeBean.getCurrentTime();
        
        
        try
        {            
            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            
            sb0=new StringBuffer();
            sb1=new StringBuffer();
            sb2=new StringBuffer();
            //sb3=new StringBuffer();
            //sb4=new StringBuffer();
            
            String nodate="";
            
            pstm=con.prepareStatement("select code from t_s_code where type='t_d_czkz_dbsx.nodate'");
            
            rs=pstm.executeQuery();
            
            if(rs!=null && rs.next()){
            	
            	nodate=rs.getString("code").trim();
            }
            
            
            close(rs,pstm,null,null);
            
            
            sqlSB.append(bform.login_id).append("|").append(curTime).append("|����js_id�����ش���������Ϣ<��ʾ��Ϣ>(t_d_czkz_dbsx)");
        	//Log.logger.log(Level.INFO,sqlSB.toString());
            
        	
        	
        	if(bform.gwdm!=null && (bform.gwdm.equals("-1") || bform.gwdm.equals("-2"))){
        		
        		/*pstm=con.prepareStatement("select a.id,a.content,a.db_level,a.link,a.status,a.start_time,convert(char(8),a.end_time,112) as end_time,b.per_name from t_d_czkz_dbsx a,t_b_jcxx_ryxx b where b.per_status!=4 and b.per_status!=3 and a.js_id=? and a.fqry_id=b.id and (convert(char(8),a.start_time,112)<=convert(char(8),getdate(),112) and convert(char(8),a.end_time,112)>=convert(char(8),getdate(),112)) and (a.status=0 or a.status=1 or a.status=2) and control=? order by a.tstamp desc  at isolation 0");
        	
        		pstm.setLong(1,bform.id);
                
                if(bform.jczbm!=null && bform.jczbm.length()==20){//�����
                	
                	pstm.setString(2,bform.jczbm);
                }
                else{//������λ
                	
                	pstm.setString(2,bform.gwdm);
                }
        	}
        	else{
        		
        		pstm=con.prepareStatement("select a.id,a.content,a.db_level,a.link,a.status,a.start_time,convert(char(8),a.end_time,112) as end_time,b.per_name from t_d_czkz_dbsx a,t_b_jcxx_ryxx b where b.per_status!=4 and b.per_status!=3 and (a.js_id=? or a.js_id=(select id from t_s_dept where dept_code=? and zxbz=1)) and a.fqry_id=b.id and (convert(char(8),a.start_time,112)<=convert(char(8),getdate(),112) and convert(char(8),a.end_time,112)>=convert(char(8),getdate(),112)) and (a.status=0 or a.status=1 or a.status=2) and (control=? or control='all') order by a.tstamp desc  at isolation 0");
        	
        		pstm.setString(1,bform.id);
                pstm.setString(2,bform.dept_code.trim());
                
                if(bform.jczbm!=null && bform.jczbm.length()==20){//�����
                	
                	pstm.setString(3,bform.jczbm);
                }
                else{//������λ
                	
                	pstm.setString(3,bform.gwdm);
                }
        	}
            //pstm=con.prepareStatement("select a.id,a.content,a.link,a.status,a.start_time,a.end_time,b.per_name from t_d_czkz_dbsx a,t_b_jcxx_ryxx b where (a.js_id=? or a.js_id=(select id from t_s_dept where dept_code=?)) and a.fqry_id=b.id order by a.tstamp desc");
            //System.out.println("select a.id,a.content,a.link,a.db_level,a.status,a.start_time,a.end_time,b.per_name from t_d_czkz_dbsx a,t_b_jcxx_ryxx b where b.per_status!=4 and (a.js_id="+bform.id+" or a.js_id=(select id from t_s_dept where zxbz=1 and dept_code='"+bform.dept_code.trim()+"')) and a.fqry_id=b.id and ((a.start_time<=getdate() and a.end_time>=getdate()) or (convert(char(8),a.start_time,112)=(convert(char(8),a.end_time,112)))) order by a.tstamp desc");

            
            rs=pstm.executeQuery();
            
            while(rs!=null && rs.next()){
            	
            	switch(rs.getInt("status")){
            	
            		case 0:{//����
            			
            			if(num0==0){
            				
            				num0+=1;
            			}
            			
            			
            			sb0.append(rs.getLong("id")).append("��");
                    	sb0.append(basePublic.out(rs.getString("content")).trim()).append("��");
                    	sb0.append(rs.getString("link").trim()).append("��");
                    	sb0.append(rs.getInt("db_level")).append("��");
                    	sb0.append(rs.getString("start_time")).append("��");
                    	sb0.append(rs.getString("end_time").equals(nodate)?"nodate":TimeBean.transTime5(rs.getString("end_time"))).append("��");
                    	sb0.append(basePublic.out(rs.getString("per_name")).trim()).append("��");
                    	
                    	break;
            		}
            		case 1:{//�鿴
            			
            			if(num1==0){
            				
            				num1+=1;
            			}
            			
            			sb1.append(rs.getLong("id")).append("��");
                    	sb1.append(basePublic.out(rs.getString("content")).trim()).append("��");
                    	sb1.append(rs.getString("link").trim()).append("��");
                    	sb1.append(rs.getInt("db_level")).append("��");
                    	sb1.append(rs.getString("start_time")).append("��");
                    	sb1.append(rs.getString("end_time").equals(nodate)?"nodate":TimeBean.transTime5(rs.getString("end_time"))).append("��");
                    	sb1.append(basePublic.out(rs.getString("per_name")).trim()).append("��");
                    	
                    	break;
            		}
            		case 2:{//����
            			
            			if(num2==0){
            				
            				num2+=1;
            			}
            			
            			sb2.append(rs.getLong("id")).append("��");
                    	sb2.append(basePublic.out(rs.getString("content")).trim()).append("��");
                    	sb2.append(rs.getString("link").trim()).append("��");
                    	sb2.append(rs.getInt("db_level")).append("��");
                    	sb2.append(rs.getString("start_time")).append("��");
                    	sb2.append(rs.getString("end_time").equals(nodate)?"nodate":TimeBean.transTime5(rs.getString("end_time"))).append("��");
                    	sb2.append(basePublic.out(rs.getString("per_name")).trim()).append("��");
                    	
                    	break;
            		}
            		/*
            		case 3:{//�رգ�������
            			
            			if(num3==0){
            				
            				num3+=1;
            			}
            			
            			sb3.append(rs.getLong("id")).append("��");
                    	sb3.append(basePublic.out(rs.getString("content")).trim()).append("��");
                    	sb3.append(rs.getString("link").trim()).append("��");
                    	sb3.append(rs.getInt("db_level")).append("��");
                    	sb3.append(rs.getString("start_time")).append("��");
                    	sb3.append("end_time").append("��");
                    	sb3.append(basePublic.out(rs.getString("per_name")).trim()).append("��");
                    	
                    	break;
            		}
            		case 4:{//�رգ����ڣ�
            			
            			if(num4==0){
            				
            				num4+=1;
            			}
            			
            			sb4.append(rs.getLong("id")).append("��");
                    	sb4.append(basePublic.out(rs.getString("content")).trim()).append("��");
                    	sb4.append(rs.getString("link").trim()).append("��");
                    	sb4.append(rs.getInt("db_level")).append("��");
                    	sb4.append(rs.getString("start_time")).append("��");
                    	sb4.append("end_time").append("��");
                    	sb4.append(basePublic.out(rs.getString("per_name")).trim()).append("��");
                    	
                    	break;
            		}
            		
            	}
            }
            
            
            
            close(rs,pstm,null,null);
            
            
            
            if(bform.gwdm!=null && (bform.gwdm.equals("-1") || bform.gwdm.equals("-2"))){
            	
            	pstm=con.prepareStatement("select id,content,db_level,link,status,start_time,convert(char(8),end_time,112) as end_time from t_d_czkz_dbsx where (convert(char(8),start_time,112)<=convert(char(8),getdate(),112) and convert(char(8),end_time,112)>=convert(char(8),getdate(),112)) and js_id=? and fqry_id=0 and (status=0 or status=1 or status=2) and control=? order by tstamp desc at isolation 0");
            
            	pstm.setString(1,bform.id);
                
                if(bform.jczbm!=null && bform.jczbm.length()==20){//�����
                	
                	pstm.setString(2,bform.jczbm);
                }
                else{//������λ
                	
                	pstm.setString(2,bform.gwdm);
                }
            }
            else{
            	
            	pstm=con.prepareStatement("select id,content,db_level,link,status,start_time,convert(char(8),end_time,112) as end_time from t_d_czkz_dbsx where (convert(char(8),start_time,112)<=convert(char(8),getdate(),112) and convert(char(8),end_time,112)>=convert(char(8),getdate(),112)) and (js_id=? or js_id=(select id from t_s_dept where dept_code=? and zxbz=1)) and fqry_id=0 and (status=0 or status=1 or status=2) and (control=? or control='all') order by tstamp desc at isolation 0");
            	
            	pstm.setString(1,bform.id);
                pstm.setString(2,bform.dept_code.trim());
                
                if(bform.jczbm!=null && bform.jczbm.length()==20){//�����
                	
                	pstm.setString(3,bform.jczbm);
                }
                else{//������λ
                	
                	pstm.setString(3,bform.gwdm);
                }
            }
            //pstm=con.prepareStatement("select a.id,a.content,a.link,a.status,a.start_time,a.end_time,b.per_name from t_d_czkz_dbsx a,t_b_jcxx_ryxx b where (a.js_id=? or a.js_id=(select id from t_s_dept where dept_code=?)) and a.fqry_id=b.id order by a.tstamp desc");
            //System.out.println("select a.id,a.content,a.link,a.status,a.start_time,a.end_time,b.per_name from t_d_czkz_dbsx a,t_b_jcxx_ryxx b where a.start_time<=getdate() and a.end_time>=getdate() and (a.js_id="+bform.id+" or a.js_id=(select id from t_s_dept where dept_code='"+bform.dept_code.trim()+"')) and a.fqry_id=b.id order by a.tstamp desc");
            
            
            
            rs=pstm.executeQuery();
            
            while(rs!=null && rs.next()){
            	
            	switch(rs.getInt("status")){
            	
            		case 0:{//����
            			
            			if(num0==0){
            				
            				num0+=1;
            			}
            			
            			sb0.append(rs.getLong("id")).append("��");
                    	sb0.append(basePublic.out(rs.getString("content")).trim()).append("��");
                    	sb0.append(rs.getString("link").trim()).append("��");
                    	sb0.append(rs.getInt("db_level")).append("��");
                    	sb0.append(rs.getString("end_time").equals(nodate)?"nodate":TimeBean.transTime5(rs.getString("end_time"))).append("��");
                    	sb0.append(TimeBean.transTime5(rs.getString("end_time"))).append("��");
                    	sb0.append("ϵͳ��");
                    	
                    	break;
            		}
            		case 1:{//�鿴
            			
            			if(num1==0){
            				
            				num1+=1;
            			}
            			
            			sb1.append(rs.getLong("id")).append("��");
                    	sb1.append(basePublic.out(rs.getString("content")).trim()).append("��");
                    	sb1.append(rs.getString("link").trim()).append("��");
                    	sb1.append(rs.getInt("db_level")).append("��");
                    	sb1.append(rs.getString("start_time")).append("��");
                    	sb1.append(rs.getString("end_time").equals(nodate)?"nodate":TimeBean.transTime5(rs.getString("end_time"))).append("��");
                    	sb1.append("ϵͳ��");
                    	
                    	break;
            		}
            		case 2:{//����
            			
            			if(num2==0){
            				
            				num2+=1;
            			}
            			
            			sb2.append(rs.getLong("id")).append("��");
                    	sb2.append(basePublic.out(rs.getString("content")).trim()).append("��");
                    	sb2.append(rs.getString("link").trim()).append("��");
                    	sb2.append(rs.getInt("db_level")).append("��");
                    	sb2.append(rs.getString("start_time")).append("��");
                    	sb2.append(rs.getString("end_time").equals(nodate)?"nodate":TimeBean.transTime5(rs.getString("end_time"))).append("��");
                    	sb2.append("ϵͳ��");
                    	
                    	break;
            		}
            		
            		case 3:{//�رգ�������
            			
            			if(num3==0){
            				
            				num3+=1;
            			}
            			
            			sb3.append(rs.getLong("id")).append("��");
                    	sb3.append(basePublic.out(rs.getString("content")).trim()).append("��");
                    	sb3.append(rs.getString("link").trim()).append("��");
                    	sb3.append(rs.getInt("db_level")).append("��");
                    	sb3.append(rs.getString("start_time")).append("��");
                    	sb3.append("end_time").append("��");
                    	sb3.append("ϵͳ��");
                    	
                    	break;
            		}
            		case 4:{//�رգ����ڣ�
            			
            			if(num4==0){
            				
            				num4+=1;
            			}
            			
            			sb4.append(rs.getLong("id")).append("��");
                    	sb4.append(basePublic.out(rs.getString("content")).trim()).append("��");
                    	sb4.append(rs.getString("link").trim()).append("��");
                    	sb4.append(rs.getInt("db_level")).append("��");
                    	sb4.append(rs.getString("start_time")).append("��");
                    	sb4.append("end_time").append("��");
                    	sb4.append("ϵͳ��");
                    	
                    	break;
            		}
            		
            	}
            }
            
            
            infoSB.append(num0+num1+num2+num3+num4).append("��");
            
            if(sb0.length()==0){
            	
            	infoSB.append("0��");
            }
            else{
            	
            	infoSB.append(sb0.toString()).append("��");
            }
            
            if(sb1.length()==0){
            	
            	infoSB.append("1��");
            }
            else{
            	
            	infoSB.append(sb1.toString()).append("��");
            }
            
            
            if(sb2.length()==0){
            	
            	infoSB.append("2��");
            }
            else{
            	
            	infoSB.append(sb2.toString()).append("��");
            }
            
            
            infoSB.append("3��4��");
            
            if(sb3.length()==0){
            	
            	infoSB.append("3��");
            }
            else{
            	
            	infoSB.append(sb3.toString()).append("��");
            }
            
            if(sb4.length()==0){
            	
            	infoSB.append("4��");
            }
            else{
            	
            	infoSB.append(sb4.toString()).append("��");
            }
            
            
            
            sqlSB.delete(0,sqlSB.length());
            sqlSB.append(bform.login_id).append("|").append(curTime).append("|����js_id��ѯ��ش���������Ϣ���");
        	//Log.logger.log(Level.INFO,sqlSB.toString());
            /*
            //////////System.out.println("*********************���������Ϣ("+bform.id+")**************************");
            //////////System.out.println(infoSB.toString());
            //////////System.out.println("*****************************end*****************************************");
            
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            
        	sqlSB.delete(0,sqlSB.length());
            sqlSB.append(bform.login_id).append("|").append(curTime).append("|dbsxBean.java--private:getInfo():����js_id�����ش���������Ϣ<��ʾ��Ϣ>(t_d_czkz_dbsx)���ִ��� ������룺").append(sql.getErrorCode()).append(" ������Ϣ��").append(sql.getMessage());
        	//Log.logger.log(Level.INFO,sqlSB.toString());
        	
        	throw new CustomException("���ִ��󣺲���ԱID("+bform.login_id+")");
        }
        catch (UnsupportedEncodingException ue)
        {
            //ue.printStackTrace();
            
        	sqlSB.delete(0,sqlSB.length());
            sqlSB.append(bform.login_id).append("|").append(curTime).append("|dbsxBean.java--private:getInfo():����js_id�����ش���������Ϣ<��ʾ��Ϣ>(t_d_czkz_dbsx)���ִ��� ������Ϣ��").append(ue.getMessage());
        	//Log.logger.log(Level.INFO,sqlSB.toString());
        	
        	throw new CustomException("���ִ��󣺲���ԱID("+bform.login_id+")");
        }
        catch (Exception ce)
        {
            //ce.printStackTrace();
            
        	sqlSB.delete(0,sqlSB.length());
            sqlSB.append(bform.login_id).append("|").append(curTime).append("|dbsxBean.java--private:getInfo():����js_id�����ش���������Ϣ<��ʾ��Ϣ>(t_d_czkz_dbsx)���ִ��� ������Ϣ��").append(ce.getMessage());
        	//Log.logger.log(Level.INFO,sqlSB.toString());
        	
        	throw new CustomException("���ִ��󣺲���ԱID("+bform.login_id+")");
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,null);
        }
        
        return infoSB.toString();
	}*/
	
	public static String substr(String s,String b)throws Exception {
		
		return s.substring(0,s.indexOf(b)+b.length());
	}
}