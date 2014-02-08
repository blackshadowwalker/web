package modules.ajgl.ajxxgl.casetype;

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

public class casetypeBean  extends ResourceClose
{
	public casetypeBean()
    {
		
    }
	/*
     * ������������ѯ������ϢAJAX
     */
	 public String queryCasetype(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
	    throws CustomException,Exception
	    {
		 
		 if (sc == null)
	        {
	            throw new CustomException("ServletContext Ϊ�գ�����");
	        }

	        //�жϻỰʵ���Ƿ�Ϊ��
	        if (session==null)
	        {
	            throw new CustomException("HttpSession Ϊ�գ�����");
	        }
	        
	        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	        
	        //�ж��û��Ƿ��¼
	        baseForm bform=(baseForm)session.getAttribute("baseuser");
	        if (bform==null)
	        {
	        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
	        }
		 
	        //�����ѯ�����Ϣ
	        StringBuffer infoSB=null;
	        //����SQL���
	        StringBuffer sqlSB = null;
	        Connection con=null;//�������ݿ�����
	        PreparedStatement pstm=null;//����Ԥ�������
	        ResultSet rs=null;//�����ѯ�Ľ����
	        
	        StringBuffer countSB = null;
	        PageMan pm=PageManFactory.getInstance();
	        
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
	            }
	            infoSB=new StringBuffer();
	            sqlSB=new StringBuffer();
	            countSB=new StringBuffer();
	        	sqlSB.append("SELECT id,name ");
	        	sqlSB.append("FROM t_m_caseType  WHERE status=1 ");
	            countSB.append("SELECT COUNT(id)  FROM t_m_caseType WHERE status=1 ");
	            if(s!=null&&!s.equals("")){
	            	sqlSB.append(s);
	            	countSB.append(s);
	            }
	            sqlSB.append("order by id desc ");
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
	            
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"��ѯ������Ϣ�ɹ���",casetypeBean.class.getName());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.queryCase�������ݿ���󣬲���Ϊ����ѯ������Ϣʧ�ܣ�"+sql.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.queryCase�������ݿ���󣬲���Ϊ����ѯ������Ϣʧ�ܣ�"+ue.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.queryCase�������ݿ���󣬲���Ϊ����ѯ������Ϣʧ�ܣ�"+ce.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	            //�ر����п�����Դ
	            close(rs,pstm,null,con);
	        }
	 }
	 	
	 
		/*
		 * ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
		 */
		public String beforUpdateCasetype(long id, ServletContext sc,HttpSession session) throws CustomException, Exception
		{
			if (sc == null)
	        {
	            throw new CustomException("ServletContext Ϊ�գ�����");
	        }

	        //�жϻỰʵ���Ƿ�Ϊ��
	        if (session==null)
	        {
	            throw new CustomException("HttpSession Ϊ�գ�����");
	        }
	        
	        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	        
	        //�ж��û��Ƿ��¼
	        baseForm bform=(baseForm)session.getAttribute("baseuser");
	        if (bform==null)
	        {
	        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
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
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
	            }

	            infoSB=new StringBuffer();
	            sqlSB=new StringBuffer();
	            sqlSB.append("SELECT name ");
	        	sqlSB.append("FROM t_m_caseType WHERE id=? ");
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
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�鿴������ϸ��Ϣ�ɹ���",casetypeBean.class.getName());
	            //System.out.println(infoSB.toString());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder�������ݿ���󣬲���Ϊ���鿴������ϸ��Ϣʧ�ܣ�"+sql.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder����ת���ַ������󣬲���Ϊ���鿴������ϸ��Ϣʧ�ܣ�"+ue.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder���ִ��󣬲���Ϊ���鿴������ϸ��Ϣʧ�ܣ�"+ce.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	            //�ر����п�����Դ
	            close(rs,pstm,null,con);
	        }
		
		}
		
		/*
		 * ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
		 */
		public int updateCasetype(long id,String sqlString, ServletContext sc,HttpSession session) throws CustomException, Exception
		{
			if (sc == null)
	        {
	            throw new CustomException("ServletContext Ϊ�գ�����");
	        }

	        //�жϻỰʵ���Ƿ�Ϊ��
	        if (session==null)
	        {
	            throw new CustomException("HttpSession Ϊ�գ�����");
	        }
	        
	        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	        
	        //�ж��û��Ƿ��¼
	        baseForm bform=(baseForm)session.getAttribute("baseuser");
	        if (bform==null)
	        {
	        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
	        }
	        
	        //����SQL���
	        StringBuffer sqlSB = null;
	        
	        Connection con=null;//�������ݿ�����
	        PreparedStatement pstm=null;//����Ԥ�������
	        int num=0;//�����ѯ�Ľ����
	        
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
	            }

	            sqlSB=new StringBuffer();
	            sqlSB.append("UPDATE t_m_caseType SET ");
	            sqlSB.append(sqlString);
	            sqlSB.append(" WHERE id=?");
	            
	        	pstm=con.prepareStatement(sqlSB.toString());
	        	pstm.setLong(1, id);
	        	num=pstm.executeUpdate();
				
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�޸İ�����Ϣ�ɹ���",casetypeBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.updateCase�������ݿ���󣬲���Ϊ���޸İ�����Ϣʧ�ܣ�"+sql.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.updateCase���ִ��󣬲���Ϊ���޸İ�����Ϣʧ�ܣ�"+ce.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	            //�ر����п�����Դ
	            pstm.close();
	            con.close();
	        }
		
		}
		
		
		/*
		 * ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
		 */
		public int insertCasetype(String sqlString1,String sqlString2, ServletContext sc,HttpSession session) throws CustomException, Exception
		{
			if (sc == null)
	        {
	            throw new CustomException("ServletContext Ϊ�գ�����");
	        }

	        //�жϻỰʵ���Ƿ�Ϊ��
	        if (session==null)
	        {
	            throw new CustomException("HttpSession Ϊ�գ�����");
	        }
	        
	        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	        
	        //�ж��û��Ƿ��¼
	        baseForm bform=(baseForm)session.getAttribute("baseuser");
	        if (bform==null)
	        {
	        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
	        }
	        
	        //����SQL���
	        StringBuffer sqlSB = null;
	        
	        Connection con=null;//�������ݿ�����
	        PreparedStatement pstm=null;//����Ԥ�������
	        int num=0;//�����ѯ�Ľ����
	        
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
	            }

	            sqlSB=new StringBuffer();
	            sqlSB.append("INSERT t_m_caseType (");
	            sqlSB.append(sqlString1);
	            sqlSB.append(") VALUES (");
	            sqlSB.append(sqlString2);
	            sqlSB.append(")");
	            
	        	pstm=con.prepareStatement(sqlSB.toString());
	        	num=pstm.executeUpdate();
				
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"��Ӱ�����Ϣ�ɹ���",casetypeBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.insertCase�������ݿ���󣬲���Ϊ����Ӱ�����Ϣʧ�ܣ�"+sql.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.insertCase���ִ��󣬲���Ϊ����Ӱ�����Ϣʧ�ܣ�"+ce.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	            //�ر����п�����Դ
	            pstm.close();
	            con.close();
	        }
		
		}
		
		
	    /*
		 * ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
		 */
		public int deleteCasetype(long id, ServletContext sc,HttpSession session) throws CustomException, Exception
		{
			if (sc == null)
	        {
	            throw new CustomException("ServletContext Ϊ�գ�����");
	        }

	        //�жϻỰʵ���Ƿ�Ϊ��
	        if (session==null)
	        {
	            throw new CustomException("HttpSession Ϊ�գ�����");
	        }
	        
	        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	        
	        //�ж��û��Ƿ��¼
	        baseForm bform=(baseForm)session.getAttribute("baseuser");
	        if (bform==null)
	        {
	        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
	        }
	        
	        //����SQL���
	        StringBuffer sqlSB = null;
	        
	        Connection con=null;//�������ݿ�����
	        PreparedStatement pstm=null;//����Ԥ�������
	        int num=0;//�����ѯ�Ľ����
	        
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
	            }

	            sqlSB=new StringBuffer();
	            sqlSB.append("UPDATE t_m_caseType SET status=0 WHERE id=?");
	        	pstm=con.prepareStatement(sqlSB.toString());
	        	pstm.setLong(1, id);
	        	num=pstm.executeUpdate();
				
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"��Ӱ�����Ϣ�ɹ���",casetypeBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.insertCase�������ݿ���󣬲���Ϊ����Ӱ�����Ϣʧ�ܣ�"+sql.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casetypeBean.insertCase���ִ��󣬲���Ϊ����Ӱ�����Ϣʧ�ܣ�"+ce.getMessage(),casetypeBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	            //�ر����п�����Դ
	            pstm.close();
	            con.close();
	        }
		
		}
}
