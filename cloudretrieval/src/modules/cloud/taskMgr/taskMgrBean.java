package modules.cloud.taskMgr;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
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

public class taskMgrBean  extends ResourceClose
{ 
	private DataSource dataSource;
	public taskMgrBean()
	{

	}
	public taskMgrBean(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
    /*
	 * ������������ѯ������ϢAJAX
	 */
	public String queryTask(int perPage, int curPage, String s,
			ServletContext sc, HttpSession session) throws CustomException,
			Exception
	{
		
		// �жϻ���ʵ���Ƿ�Ϊ��
		if(sc == null)
		{
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		// �жϻỰʵ���Ƿ�Ϊ��
		if(session == null)
		{
			throw new CustomException("HttpSession Ϊ�գ�����");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		
		// �ж��û��Ƿ��¼
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
		}
		// �����ѯ�����Ϣ
		StringBuffer infoSB = null;
		// ����SQL���
		StringBuffer sqlSB = null;
		StringBuffer countSB = null;

		Connection con = null;// �������ݿ�����
		ResultSet rs = null;// �����ѯ�Ľ����

		PageMan pm = PageManFactory.getInstance();
		
		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();

			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
			}
			infoSB = new StringBuffer();
			sqlSB = new StringBuffer();
			countSB = new StringBuffer();

			sqlSB.append("select t.id,t.taskID,t.taskName,t.state,l.locationName,v.name,t.outputVideoId,t.creator,t.ctTime,t.lastUpdateTime from  t_m_tasks t ,t_s_location l,t_m_videos v   ");
            countSB.append("select count(*)  from  t_m_tasks t " );
            if(s!=null&&!s.equals("")){
            	sqlSB.append(s);
            	countSB.append(s);
            }
            sqlSB.append(" AND v.locationId = l.locationId  AND t.inputVideoId=v.id AND t.status=1 order by t.id desc");
            countSB.append(" AND t.status=1 order by t.id desc");
         //    System.out.println(sqlSB.toString());
         //  System.out.println(countSB.toString());
			rs = pm.list(con, perPage, curPage, countSB.toString(), sqlSB
					.toString());
			
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
					if(i==2){
						infoSB.append("<input type='checkbox' id='check_"+basePublic.out(rs.getString(i))+"'  name='checkList' onclick='forGet(this)'>").append("</C>");
						
						}
					infoSB.append(basePublic.out(rs.getString(i))).append("</C>");

				}
			//  System.out.println(basePublic.out(rs.getString(2)));
				infoSB.append("</R>");
			}

			infoSB.append("|");

			infoSB.append(pm.getTotalPage()).append("</C>").append(
					pm.getTotalRow()).append("</C>").append(pm.getCurPage())
					.append("</C>");
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "��ѯ���������Ϣ�ɹ���",taskMgrBean.class.getName());
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.queryTask�������ݿ����Ӵ���,����Ϊ����ѯ���������Ϣ��Ϣʧ��!" + sql.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.queryTask����ת���ַ�����,����Ϊ����ѯ���������Ϣʧ��!" + ue.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.queryTask���ִ���,����Ϊ����ѯ���������Ϣʧ��!" + ce.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
		finally
		{
			pm.close(true);

			close(rs, null, null, con);
			// �ر����п�����Դ
			// close(rs,pstm,null,con);
		}

		return infoSB.toString();
	}
	/*
	 * ����IDֵֹͣ����AJAX
	 */
	public int stopTask(String id,ServletContext sc,HttpSession session)
	   throws CustomException,Exception
	   {
		

		int flag = 0;
		// �жϻ���ʵ���Ƿ�Ϊ��
		if(sc == null)
		{
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		// �жϻỰʵ���Ƿ�Ϊ��
		if(session == null)
		{
			throw new CustomException("HttpSession Ϊ�գ�����");
		}

		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		// �ж��û��Ƿ��¼
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ

		}
		long task = 0;
		// ����SQL���
		StringBuffer sqlSB = null;
		Connection con = null;// �������ݿ�����
		PreparedStatement pstm = null;// ����Ԥ�������
		ResultSet rs = null;// �����ѯ�Ľ����
		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();

			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��

			}
			sqlSB = new StringBuffer();
			

			sqlSB.append("select taskID from  t_m_tasks where id=? ");
        
//			System.out.println(sqlSB.toString());
			pstm=con.prepareStatement(sqlSB.toString());
			
			pstm.setString(1, id);
			
 	        rs=pstm.executeQuery();
	        
		    if (rs!=null && rs.next())
	        {
		    	task = Long.parseLong(rs.getString("taskID"));
	        }
		    
		    System.out.println(task);
		//    medi.cancelTask(task, sc, session);
		    flag = 1;
	        LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "ֹͣ���������Ϣ�ɹ���",taskMgrBean.class.getName());
	    }
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.stopTask�������ݿ����Ӵ���,����Ϊ��ֹͣ���������Ϣʧ��!" + sql.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.stopTask���ִ���,����Ϊ��ֹͣ���������Ϣʧ��!" + ce.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
		finally
		{
			// �ر����п�����Դ
			close(rs, pstm, null, con);
		}
		 
		  return flag ;
		
	   }
	
	
	/*
	    * �޸�ǰ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
	    */
	   public String beforeUpdateTask(long id,ServletContext sc,HttpSession session)
	       throws CustomException,Exception
	   {

		// �жϻ���ʵ���Ƿ�Ϊ��
			if(sc == null)
			{
				throw new CustomException("ServletContext Ϊ�գ�����");
			}

			// �жϻỰʵ���Ƿ�Ϊ��
			if(session == null)
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
	       
	       Connection con=null;//�������ݿ�����
	       PreparedStatement pstm=null;//����Ԥ�������
	       ResultSet rs=null;//�����ѯ�Ľ����
	       DataSource ds=null;
	       try
	       {
	       	ds=(DataSource)sc.getAttribute("basedb");
	           con=ds.getConnection();
	           if (con==null)
	           {
	        	   throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��

	           }
	           
	           infoSB=new StringBuffer();
	           
	           pstm=con.prepareStatement("select t.taskID,t.taskName,t.state,l.locationName,v.name,t.creator,t.ctTime,t.lastUpdateTime,t.locationId,t.inputVideoId from  t_m_tasks t ,t_s_location l,t_m_videos v  WHERE  t.id=? AND v.locationId = l.locationId AND t.inputVideoId=v.id");
	         
	           pstm.setLong(1, id);
	           
	           rs=pstm.executeQuery();
	           if (rs!=null && rs.next())
	           {
	               infoSB.append(id).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("taskID"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("taskName"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("state"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("locationName"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("name"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("creator"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("ctTime"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("lastUpdateTime"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("locationId"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("inputVideoId"))).append("</C></R>");
	           }
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "�޸�ǰ��ѯ���������ϸ��Ϣ�ɹ���",taskMgrBean.class.getName());
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "taskMgrBean.beforeUpdateTask�������ݿ���󣬲���Ϊ��" 
						+"�޸�ǰ��ѯ���������ϸ��Ϣʧ��" + sql.getMessage(),taskMgrBean.class.getName());
	           throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//�������ݿ����ӷ���Ĵ���
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "taskMgrBean.beforeUpdateTask����ת���ַ������󣬲���Ϊ��" 
						+"�޸�ǰ��ѯ���������ϸ��Ϣʧ��" + ue.getMessage(),taskMgrBean.class.getName());
	           throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//ת���ַ���ʱ���ִ���
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "taskMgrBean.beforeUpdateTask���ִ��󣬲���Ϊ��" 
						+"�޸�ǰ��ѯ���������ϸ��Ϣʧ��" + ce.getMessage(),taskMgrBean.class.getName());
	           throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//����δ֪�쳣����
	       }
	       finally
	       {
	           //�ر����п�����Դ
	           close(rs,pstm,null,con);
	       }

	       return infoSB.toString();
	   }
	
	/*
	 * ����IDֵ��ѯ������ϢAJAX
	 */
	public String taskReport(String[] taskIds,ServletContext sc,HttpSession session)
	   throws CustomException,Exception
	   {

		// �жϻ���ʵ���Ƿ�Ϊ��
		if(sc == null)
		{
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		// �жϻỰʵ���Ƿ�Ϊ��
		if(session == null)
		{
			throw new CustomException("HttpSession Ϊ�գ�����");
		}

		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		// �ж��û��Ƿ��¼
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null) 
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ

		}
		int task = 0;
		String local = "";
		//�����ѯ�����Ϣ
        StringBuffer infoSB=null;
		// ����SQL���
		StringBuffer sqlSB = null;
		StringBuffer sqlSB1 = null;
		StringBuffer sqlSB2 = null;
		Connection con = null;// �������ݿ�����
		PreparedStatement pstm = null;// ����Ԥ�������
		PreparedStatement pstm1 = null;// ����Ԥ�������
		PreparedStatement pstm2 = null;// ����Ԥ�������
		ResultSet rs = null;// �����ѯ�Ľ����
		ResultSet rs1 = null;// �����ѯ�Ľ����
		ResultSet rs2 = null;// �����ѯ�Ľ����
		
		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();

			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��

			}
			infoSB = new StringBuffer();
			sqlSB = new StringBuffer();
			sqlSB1 = new StringBuffer();
			sqlSB2 = new StringBuffer();
			con.setAutoCommit(false);
			sqlSB.append("select t.taskID,v.locationId from  t_m_tasks t, t_m_videos v where t.taskID=? and t.inputVideoId = v.id ");
			for(int t=0;t<taskIds.length;t++){
				
				pstm=con.prepareStatement(sqlSB.toString());
				pstm.setString(1, taskIds[t]);				
			//	System.out.println(taskIds[t]);
				rs=pstm.executeQuery();
				pstm.addBatch();
				if(rs!=null && rs.next())
				{
					task = Integer.parseInt(rs.getString("taskID"));
					local = rs.getString("locationId");
				//	System.out.println(local);
					
				}
				sqlSB1.append("SELECT LPNumber,absTime FROM t_m_report  WHERE taskId='"+task+"' ");
				pstm2=con.prepareStatement(sqlSB1.toString());
			//	System.out.println(sqlSB1.toString());
				rs1=pstm2.executeQuery();
				sqlSB2.append("SELECT locationName FROM t_s_location WHERE ( ");
				// System.out.println(local);
				
				for(int i=1;i<=local.length()/2;i++){
					if(i==1){
						sqlSB2.append("  locationId='"+local.substring(0, i*2)+"' ");
					}else{
						sqlSB2.append(" or locationId='"+local.substring(0, i*2)+"' ");
					}
				}
				sqlSB2.append(" )");
				//  System.out.println(sqlSB1.toString());
				while(rs1!=null&&rs1.next()){
					int rowCount = rs1.getRow();
					infoSB.append(rowCount).append("</C>");
					infoSB.append(rs1.getString(1)).append("</C>");
					infoSB.append(rs1.getString(2)).append("</C>");
					
					pstm1=con.prepareStatement(sqlSB2.toString());
					rs2=pstm1.executeQuery();
					
					while(rs2!=null && rs2.next()){
						infoSB.append(rs2.getString(1));
					//	System.out.println(rs1.getString(1));
					}
					infoSB.append("</C>");
					infoSB.append("</R>");
				}
				sqlSB1 = new StringBuffer();
				sqlSB2 = new StringBuffer();
			}
		    con.commit();
		 // System.out.println(infoSB.toString());
	        LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "��ȡ������Ϣ�ɹ���",taskMgrBean.class.getName());
	    }
		catch (SQLException sql)
		{
			con.rollback();
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.taskReport�������ݿ����Ӵ���,����Ϊ����ȡ������Ϣʧ��!" + sql.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.taskReport���ִ���,����Ϊ����ȡ������Ϣʧ��!" + ce.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
		finally
		{
			// �ر����п�����Դ
			close(rs, pstm, null, con);
		}
		
		return infoSB.toString();
		
	   }
	
	
	
	/*
	    * �޸Ĵ�����ϢAJAX
	    */
	   public int updateTSTask(String id,String values,
	       ServletContext sc,HttpSession session) throws CustomException,Exception
	   {

		// �жϻ���ʵ���Ƿ�Ϊ��
			if(sc == null)
			{
				throw new CustomException("ServletContext Ϊ�գ�����");
			}

			// �жϻỰʵ���Ƿ�Ϊ��
			if(session == null)
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
	       DataSource ds=null;
	       try
	       {
	       	ds=(DataSource)sc.getAttribute("basedb");
	           con=ds.getConnection();
	           if (con==null)
	           {
	        	   throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��

	           }

	           sqlSB=new StringBuffer();

	           sqlSB.append("update t_m_tasks set ").append(values).append(" where id=").append(id);
	           pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

	           int num=pstm.executeUpdate();

	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "�޸����������Ϣ�ɹ���",taskMgrBean.class.getName());
	          
	          return num;
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "taskMgrBean.updateTSTask�������ݿ���󣬲���Ϊ��" 
						+"�޸����������Ϣʧ��" + sql.getMessage(),taskMgrBean.class.getName());
	           throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//�������ݿ����ӷ���Ĵ���
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "taskMgrBean.updateTSTask����ת���ַ������󣬲���Ϊ��" 
						+"�޸����������Ϣʧ��" + ue.getMessage(),taskMgrBean.class.getName());
	           throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//�������ݿ����ӷ���Ĵ���
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "taskMgrBean.updateTSTask���ִ��󣬲���Ϊ��" 
						+"�޸����������Ϣʧ��" + ce.getMessage(),taskMgrBean.class.getName());
	           throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//����δ֪�쳣����
	       }
	       finally
	       {
	           //�ر����п�����Դ
	           close(null,pstm,null,con);
	       }
	   }
	
	
	/*
	 * ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
	 */
	public String detailTask(String id, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{
		// �жϻ���ʵ���Ƿ�Ϊ��
		if(sc == null)
		{
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		// �жϻỰʵ���Ƿ�Ϊ��
		if(session == null)
		{
			throw new CustomException("HttpSession Ϊ�գ�����");
		}

		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		// �ж��û��Ƿ��¼
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ

		}
		// �����ѯ�����Ϣ
		StringBuffer infoSB = null;
		// ����SQL���
		StringBuffer sqlSB = null;
		Connection con = null;// �������ݿ�����
		PreparedStatement pstm = null;// ����Ԥ�������
		ResultSet rs = null;// �����ѯ�Ľ����

		
		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();

			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
				
			}
			infoSB = new StringBuffer();
			sqlSB = new StringBuffer();

			sqlSB.append("select t.taskID,t.taskName,t.state,l.locationName,v.name,t.creator,t.ctTime,t.lastUpdateTime from  t_m_tasks t ,t_s_location l,t_m_videos v  WHERE  t.id=? AND v.locationId = l.locationId AND t.inputVideoId=v.id ");
			pstm=con.prepareStatement(sqlSB.toString());
			pstm.setString(1, id);
		    rs=pstm.executeQuery();
		    while (rs!=null && rs.next())
	        {
		    	 infoSB.append(basePublic.out(rs.getString(1))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(2))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(3))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(4))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(5))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(6))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(7))).append("</C>");
		    	 infoSB.append(basePublic.out(rs.getString(8))).append("</C>");
	             infoSB.append("</R>");
	        }
	        LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "���������ϸ��Ϣ��ѯ�ɹ���",taskMgrBean.class.getName());
	    }
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.detailTask�������ݿ����Ӵ���,����Ϊ�����������ϸ��Ϣ��ѯʧ��!" + sql.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "taskMgrBean.detailTask���ִ���,����Ϊ�����������ϸ��Ϣ��ѯʧ��!" + ce.getMessage(),taskMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
		finally
		{
			// �ر����п�����Դ
			close(rs, pstm, null, con);
		}

		return infoSB.toString();
	}

}
