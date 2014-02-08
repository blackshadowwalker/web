package modules.ajgl.ajxxgl.casemanage;

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

public class casemanageBean  extends ResourceClose
{
	public casemanageBean()
    {
		
    }
	/*
     * ������������ѯ������ϢAJAX
     */
	 public String queryCase(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
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
	        	sqlSB.append("SELECT c.id,c.caseName,t.name,c.caseNo,c.receiptNo,auser,department,caseTime,(CASE WHEN caseStatus=0 THEN 'δ����' WHEN caseStatus=1 THEN '������' END),area,location ");
	        	sqlSB.append("FROM t_m_case c,t_m_caseType t WHERE c.status=1 AND c.caseType=t.id ");
	            countSB.append("SELECT COUNT(c.id)  FROM t_m_case c,t_m_caseType t WHERE c.status=1 AND c.caseType=t.id ");
	            if(s!=null&&!s.equals("")){
	            	sqlSB.append(s);
	            	countSB.append(s);
	            }
	            sqlSB.append("order by c.id desc ");
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
	            
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"��ѯ������Ϣ�ɹ���",casemanageBean.class.getName());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.queryCase�������ݿ���󣬲���Ϊ����ѯ������Ϣʧ�ܣ�"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.queryCase�������ݿ���󣬲���Ϊ����ѯ������Ϣʧ�ܣ�"+ue.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.queryCase�������ݿ���󣬲���Ϊ����ѯ������Ϣʧ�ܣ�"+ce.getMessage(),casemanageBean.class.getName());
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
		public String detailCase(long id, ServletContext sc,HttpSession session) throws CustomException, Exception
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
	        
	        StringBuffer tsb = null;
	        
	        Connection con=null;//�������ݿ�����
	        PreparedStatement pstm=null;//����Ԥ�������
	        ResultSet rs=null;//�����ѯ�Ľ����
	        String caseNo=null;
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
	            }
	            tsb=new StringBuffer();
	            infoSB=new StringBuffer();
	            sqlSB=new StringBuffer();
	            sqlSB.append("SELECT c.caseName,t.name,c.caseNo,c.receiptNo,c.auser,c.department,c.caseTime,(CASE WHEN caseStatus=0 THEN 'δ����' WHEN caseStatus=1 THEN '������' END),area,location ");
	        	sqlSB.append("FROM t_m_case c,t_m_caseType t WHERE c.id=? ");
	        	pstm=con.prepareStatement(sqlSB.toString());
	        	pstm.setLong(1, id);
	        	rs=pstm.executeQuery();
				ResultSetMetaData rsmd = rs.getMetaData();
				int numberOfColumns = rsmd.getColumnCount();

				if (rs != null && rs.next())
				{
					caseNo=rs.getString("caseNo");
					for (int i = 1; i <= numberOfColumns; i++)
					{
						infoSB.append(basePublic.out(rs.getString(i))).append("</C>");
					}
					infoSB.append("</R>");
	            }
				infoSB.append("|");
				pstm=con.prepareStatement("SELECT GROUP_CONCAT(v.name),GROUP_CONCAT(v.value),GROUP_CONCAT(v.url),GROUP_CONCAT(v.path),GROUP_CONCAT(v.id) FROM t_m_casevideos c,t_m_videos v WHERE " +
						"c.video_code=v.id AND c.status=1 AND  c.case_code=? ");
				pstm.setString(1, caseNo);
				rs=pstm.executeQuery();
				if(rs!=null && rs.next()){
					infoSB.append(rs.getString(1)).append("</C>");
					infoSB.append(rs.getString(2)).append("</C>");
					infoSB.append(rs.getString(3)).append("</C>");
					infoSB.append(rs.getString(4)).append("</C>");
					infoSB.append(rs.getString(5)).append("</C>");
				}
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�鿴������ϸ��Ϣ�ɹ���",casemanageBean.class.getName());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder�������ݿ���󣬲���Ϊ���鿴������ϸ��Ϣʧ�ܣ�"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder����ת���ַ������󣬲���Ϊ���鿴������ϸ��Ϣʧ�ܣ�"+ue.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder���ִ��󣬲���Ϊ���鿴������ϸ��Ϣʧ�ܣ�"+ce.getMessage(),casemanageBean.class.getName());
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
		public String beforUpdateCase(long id, ServletContext sc,HttpSession session) throws CustomException, Exception
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
	            sqlSB.append("SELECT c.caseName,c.caseType,c.caseNo,c.receiptNo,c.auser,c.department,c.caseTime,c.caseStatus,c.area,c.location,GROUP_CONCAT(v.video_code) ");
	        	sqlSB.append("FROM t_m_case c,t_m_casevideos v WHERE c.caseNo=v.case_code AND v.status=1 AND c.id=? ");
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
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�鿴������ϸ��Ϣ�ɹ���",casemanageBean.class.getName());
	            //System.out.println(infoSB.toString());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder�������ݿ���󣬲���Ϊ���鿴������ϸ��Ϣʧ�ܣ�"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder����ת���ַ������󣬲���Ϊ���鿴������ϸ��Ϣʧ�ܣ�"+ue.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder���ִ��󣬲���Ϊ���鿴������ϸ��Ϣʧ�ܣ�"+ce.getMessage(),casemanageBean.class.getName());
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
		public int updateCase(long id,String sqlString,String v_str,String caseCode, ServletContext sc,HttpSession session) throws CustomException, Exception
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
	            sqlSB.append("UPDATE t_m_case SET ");
	            sqlSB.append(sqlString);
	            sqlSB.append(" WHERE id=?");
	            con.setAutoCommit(false);
		        	pstm=con.prepareStatement(sqlSB.toString());
		        	pstm.setLong(1, id);
		        	num=pstm.executeUpdate();
		        	pstm=con.prepareStatement("UPDATE t_m_casevideos SET status=0 WHERE case_code='"+caseCode+"'");
		        	pstm.executeUpdate();
		        	if(v_str!=null && !v_str.equals("")){
		        		String[] v_array=v_str.split(",");
		        		for(int i=0;i<v_array.length;i++){
		        			pstm=con.prepareStatement("INSERT INTO t_m_casevideos (case_code,video_code) VALUES ('"+caseCode+"','"+v_array[i]+"')");
		        			pstm.executeUpdate();
		        		}
		        	}
				con.commit();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�޸İ�����Ϣ�ɹ���",casemanageBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.updateCase�������ݿ���󣬲���Ϊ���޸İ�����Ϣʧ�ܣ�"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.updateCase���ִ��󣬲���Ϊ���޸İ�����Ϣʧ�ܣ�"+ce.getMessage(),casemanageBean.class.getName());
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
		public int insertCase(String sqlString1,String sqlString2,String sqlString3,String caseNo, ServletContext sc,HttpSession session) throws CustomException, Exception
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
	            String[] v_array=sqlString3.split(",");
	            sqlSB=new StringBuffer();
	            sqlSB.append("INSERT t_m_case (");
	            sqlSB.append(sqlString1);
	            sqlSB.append(") VALUES (");
	            sqlSB.append(sqlString2);
	            sqlSB.append(")");
	            con.setAutoCommit(false);
		        	pstm=con.prepareStatement(sqlSB.toString());
		        	num=pstm.executeUpdate();
		        	pstm.addBatch();
		        	if(v_array.length>0 && !sqlString3.equals("")){
		        		for(int m=0;m<v_array.length;m++){
			        		pstm=con.prepareStatement("INSERT INTO t_m_casevideos (case_code,video_code) VALUES ('"+caseNo+"','"+v_array[m]+"')");
			        		num=pstm.executeUpdate();
			        		pstm.addBatch();
		        		}
		        	}
		        	
		        //pstm.executeBatch();
		        con.commit();
				
				LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"��Ӱ�����Ϣ�ɹ���",casemanageBean.class.getName());
	            return 1;
	        }
	        catch (SQLException sql)
	        {
	        	con.rollback();
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.insertCase�������ݿ���󣬲���Ϊ����Ӱ�����Ϣʧ�ܣ�"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	        }
	        catch (Exception ce)
	        {
	        	con.rollback();
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.insertCase���ִ��󣬲���Ϊ����Ӱ�����Ϣʧ�ܣ�"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	        	con.setAutoCommit(true);
	            //�ر����п�����Դ
	            pstm.close();
	            con.close();
	        }
		
		}
		
		//�������
	    public String getRandId(ServletContext sc,HttpSession session)
	    throws CustomException,Exception
	    {
	 	   String retString=""; 
	 	   if (sc == null)
	        {
	       //     System.out.println("ServletContext Ϊ�գ����ء�");
	            throw new CustomException("ServletContext Ϊ�գ�����");
	        }
	        if (session==null)
	        {
	        //    System.out.println("HttpSession Ϊ�գ����ء�");
	            throw new CustomException("HttpSession Ϊ�գ�����");
	        }
	        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	        
	        baseForm bform=(baseForm)session.getAttribute("baseuser");
	        if (bform==null)
	        {
	        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
	        }
	        
	        String sqlSB = "";
	        
	        Connection con=null;//�������ݿ�����
	        PreparedStatement pstm=null;//����Ԥ�������
	        ResultSet rs=null;
	        String randIdStr ="";
	        long  randId = 0;
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
	            }
	            sqlSB = ("select count(*) from t_m_case");
	            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
	            rs=pstm.executeQuery();
	            
	            rs=pstm.executeQuery();
	            if(rs!=null && rs.next()){
	         	   randId =  rs.getLong(1);
	            }
	            
	            while(true){
	         	   randId++;
	         	   randIdStr = String.format("case%d", randId);
	         	   sqlSB = "select '"+randIdStr+"' from t_m_case";
	                pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
	                rs=pstm.executeQuery();
	                if(rs.getRow()<1)
	          		  break;
	                if(rs!=null && rs.next())
	             	   ;
	            }
	            
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"��Ӱ���ʱ����������ɳɹ���",casemanageBean.class.getName());
	            
	            retString = randIdStr;
	           
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.getRandId�������ݿ����Ӵ��󣬲���Ϊ����Ӱ���ʱ�����������ʧ��"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.getRandId����ת���ַ������Ӵ��󣬲���Ϊ����Ӱ���ʱ�����������ʧ�ܣ�"+ue.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.getRandId�������Ӵ��󣬲���Ϊ����Ӱ���ʱ�����������ʧ��"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	            //�ر����п�����Դ
	            close(null,pstm,null,con);
	        }
	 	   return retString;
	    }
	    
	    /*
		 * ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
		 */
		public int deleteCase(long id, ServletContext sc,HttpSession session) throws CustomException, Exception
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
	            sqlSB.append("UPDATE t_m_case SET status=0 WHERE id=?");
	        	pstm=con.prepareStatement(sqlSB.toString());
	        	pstm.setLong(1, id);
	        	num=pstm.executeUpdate();
				
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ɾ��������Ϣ�ɹ���",casemanageBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.deleteCase�������ݿ���󣬲���Ϊ��ɾ��������Ϣʧ�ܣ�"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���.
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.deleteCase���ִ��󣬲���Ϊ��ɾ��������Ϣʧ�ܣ�"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	            //�ر����п�����Դ
	            pstm.close();
	            con.close();
	        }
		
		}
		
		public String getVideos(String s,ServletContext sc,HttpSession session)
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
	        	sqlSB.append("SELECT v.id,v.name,v.uploader,l.locationName,v.absTime ");
	        	sqlSB.append("FROM t_m_videos v,t_s_location l  WHERE v.locationId=l.locationId ");
	            if(s!=null&&!s.equals("")){
	            	sqlSB.append(s);
	            }
	            sqlSB.append(" ORDER BY id DESC LIMIT 10000 ");
	            pstm=con.prepareStatement(sqlSB.toString());
	            rs=pstm.executeQuery();
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
	            
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"��ѯ��Ƶ�б���Ϣ�ɹ���",casemanageBean.class.getName());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.getvideos�������ݿ���󣬲���Ϊ����ѯ��Ƶ�б���Ϣʧ�ܣ�"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.getvideos�������ݿ���󣬲���Ϊ����ѯ��Ƶ�б���Ϣʧ�ܣ�"+ue.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.getvideos�������ݿ���󣬲���Ϊ����ѯ��Ƶ�б���Ϣʧ�ܣ�"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	            //�ر����п�����Դ
	            close(rs,pstm,null,con);
	        }
	 }
		public String videoDetail(Long v_id,ServletContext sc,HttpSession session)
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
	            pstm=con.prepareStatement("SELECT v.url,v.path,v.value FROM t_m_videos v WHERE v.id=?");
	            pstm.setLong(1, v_id);
	            rs=pstm.executeQuery();

				if (rs != null && rs.next())
				{
					infoSB.append(rs.getString(1)).append("/").append(rs.getString(2)).append("/").append(rs.getString(3));
	            }
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"��ѯ������Ƶ������Ϣ�ɹ���",casemanageBean.class.getName());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.videoDetail�������ݿ���󣬲���Ϊ����ѯ������Ƶ������Ϣʧ�ܣ�"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.videoDetail�������ݿ���󣬲���Ϊ����ѯ������Ƶ������Ϣʧ�ܣ�"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	            //�ر����п�����Դ
	            close(rs,pstm,null,con);
	        }
	 }
		
		
		public void videoSession(long v_id,long c_id,ServletContext sc,HttpSession session)
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
	        StringBuffer sessionSB=null;
	        //����SQL���
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
	            sessionSB=new StringBuffer();
	            pstm=con.prepareStatement("select id,caseId,videoId,videoTime,content,user,ctTime from t_m_videocomment where caseId=? and videoId=? and status=1 order by id desc");
	            //System.out.println("select id,caseId,videoId,videoTime,content,user,ctTime from t_m_videocomment where caseId='"+c_id+"' and videoId='"+v_id+"'");
	            pstm.setLong(1, c_id);
	            pstm.setLong(2, v_id);
	            rs=pstm.executeQuery();
	            while(rs!=null && rs.next()){
	            	sessionSB.append("<tr id='"+rs.getLong(1)+"'  onclick='jump(this);'>");
	            	sessionSB.append("<td style='ttd'>"+rs.getLong(2)+"</td>");
	            	sessionSB.append("<td style='ttd'>"+rs.getLong(3)+"</td>");
	            	sessionSB.append("<td style='ttd'>"+rs.getString(4)+"</td>");
	            	sessionSB.append("<td style='ttd'>"+rs.getString(6)+"</td>");
	            	sessionSB.append("<td style='ttd'>"+rs.getString(7)+"</td>");
	            	sessionSB.append("<td style='ttd'>"+rs.getString(5)+"</td>");
	            	sessionSB.append("</tr>");
	            }
	            //System.out.println(sessionSB.toString());
	            session.setAttribute("v_content", sessionSB.toString());
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.videoSession�������ݿ���󣬲���Ϊ����ѯ����Ƶ����Ϣʧ�ܣ�"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.videoSession�������ݿ���󣬲���Ϊ����ѯ������Ƶ��Ϣʧ�ܣ�"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	            //�ر����п�����Դ
	            close(rs,pstm,null,con);
	        }
	 }
		
		/*
		 * �����Ƶ��ע
		 */
		public long addVideoComment(String sqlString,String videoTime, ServletContext sc,HttpSession session) throws CustomException, Exception
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
	        
	        Connection con=null;//�������ݿ�����
	        PreparedStatement pstm=null;//����Ԥ�������
	        long info=0;
	        ResultSet rs=null;
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
	            }
	            
	            con.setAutoCommit(false);
		        	pstm=con.prepareStatement(sqlString);
		        	pstm.executeUpdate();
		        	pstm.addBatch();
		        	pstm=con.prepareStatement("select id from t_m_videocomment where user=? and ctTime=?");
		        	pstm.setString(1, bform.user_code);
		        	pstm.setString(2, videoTime);
		        	rs=pstm.executeQuery();
		        	pstm.addBatch();
		        	if(rs!=null && rs.next()){
		        		info=rs.getLong(1);
		        	}
		        con.commit();
				
				LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"��ӱ�ע��Ϣ�ɹ���",casemanageBean.class.getName());
	            return info;
	        }
	        catch (SQLException sql)
	        {
	        	con.rollback();
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.addVideoComment�������ݿ���󣬲���Ϊ����ӱ�ע��Ϣʧ�ܣ�"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	        }
	        catch (Exception ce)
	        {
	        	con.rollback();
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.addVideoComment���ִ��󣬲���Ϊ����ӱ�ע��Ϣʧ�ܣ�"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	        	con.setAutoCommit(true);
	            //�ر����п�����Դ
	            pstm.close();
	            con.close();
	        }
		
		}
		/*
		 * �����Ƶ��ע
		 */
		
		public int updateVideoComment(String sqlString,ServletContext sc,HttpSession session) throws CustomException, Exception
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
	        
	        Connection con=null;//�������ݿ�����
	        PreparedStatement pstm=null;//����Ԥ�������
	        int num=0;
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
	            }
	            
	        	pstm=con.prepareStatement(sqlString);
	        	num=pstm.executeUpdate();
		        	
				LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�޸ı�ע��Ϣ�ɹ���",casemanageBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	        	con.rollback();
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.updateVideoComment�������ݿ���󣬲���Ϊ���޸ı�ע��Ϣʧ�ܣ�"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	        }
	        catch (Exception ce)
	        {
	        	con.rollback();
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.updateVideoComment���ִ��󣬲���Ϊ���޸ı�ע��Ϣʧ�ܣ�"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	        	con.setAutoCommit(true);
	            //�ر����п�����Դ
	            pstm.close();
	            con.close();
	        }
		
		}
		
		public int deleteVideoComment(String sqlString,ServletContext sc,HttpSession session) throws CustomException, Exception
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
	        
	        Connection con=null;//�������ݿ�����
	        PreparedStatement pstm=null;//����Ԥ�������
	        int num=0;
	        try
	        {
	            con=((DataSource)sc.getAttribute("basedb")).getConnection();
	            if (con==null)
	            {
	            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
	            }
	            
	        	pstm=con.prepareStatement(sqlString);
	        	num=pstm.executeUpdate();
		        	
				LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ɾ����ע��Ϣ�ɹ���",casemanageBean.class.getName());
	            return num;
	        }
	        catch (SQLException sql)
	        {
	        	con.rollback();
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.deleteVideoComment�������ݿ���󣬲���Ϊ��ɾ����ע��Ϣʧ�ܣ�"+sql.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	        }
	        catch (Exception ce)
	        {
	        	con.rollback();
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"casemanageBean.deleteVideoComment���ִ��󣬲���Ϊ��ɾ����ע��Ϣʧ�ܣ�"+ce.getMessage(),casemanageBean.class.getName());
	            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	        }
	        finally
	        {
	        	con.setAutoCommit(true);
	            //�ر����п�����Դ
	            pstm.close();
	            con.close();
	        }
		
		}
}
