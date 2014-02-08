package modules.cloud.baseInformation;

import java.io.FileReader;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Properties;
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

public class baseInformationBean extends ResourceClose
{
		private DataSource dataSource;
		
		public baseInformationBean()
		{
	
		}
		public baseInformationBean(DataSource dataSource)
		{
			this.dataSource = dataSource;
		}
	    /*
	    * ������Ϣ����ɾ��
	    */        
	   public int deleteTSBaseInfo(String id,ServletContext sc,HttpSession session)
	   throws CustomException,Exception
	   {
		  
	       // �жϻ���ʵ���Ƿ�Ϊ��
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
	       
	       //	     ����SQL���
	       StringBuffer sqlSB = null;
	       
	       Connection con=null;//�������ݿ�����
	       PreparedStatement pstm=null;//����Ԥ�������

	       try
	       {
	           con=((DataSource)sc.getAttribute("basedb")).getConnection();
	           
	           if (con==null)
	           {
	        	   throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
	           }

	           int num=0;
	           sqlSB=new StringBuffer();
	           sqlSB.append("UPDATE t_m_baseinfo SET ").append("status=0").append(" WHERE id=").append(Integer.parseInt(id));          
	           pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
	           num=pstm.executeUpdate();
	           
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "ɾ��������Ϣ�ɹ���",baseInformationBean.class.getName());
	           return num;
	          
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.deleteTSEventType�������ݿ���󣬲���Ϊ��" 
						+"ɾ��������Ϣʧ��" + sql.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.deleteTSEventType����ת���ַ������󣬲���Ϊ��" 
						+"ɾ��������Ϣʧ��" + ue.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.deleteTSEventType���ִ��󣬲���Ϊ��" 
						+"ɾ��������Ϣʧ��" + ce.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	       }
	       finally
	       {
	           //�ر����п�����Դ
	           close(null,pstm,null,con);
	       }
	   }
	   /*
	    * ������������ѯ������ϢAJAX
	    */
	   public String queryTSBaseInfo(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
	       throws CustomException,Exception
	   { 
	       //�жϻ���ʵ���Ƿ�Ϊ��
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
	       StringBuffer countSB = null;
	       
	       Connection con=null;//�������ݿ�����
	       //PreparedStatement pstm=null;//����Ԥ�������
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
	           countSB=new StringBuffer();
	           
	           sqlSB.append("select * from t_m_baseinfo ");
	           countSB.append("select count(*) from t_m_baseinfo");
	           
	           
	           if (s != null && s.length()>0)
	           {
	               sqlSB.append(s);
	               countSB.append(s);
	           }
	           
	           sqlSB.append(" and status=1 order by id desc");
	           countSB.append(" and status=1 order by id desc");
	           
	           
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
	        //       System.out.println(basePublic.out(rs.getString(2)));
	               infoSB.append("</R>");
	           }
	           
	           infoSB.append("|");
	           
	           infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "����������ѯ������Ϣ�ɹ���",baseInformationBean.class.getName());
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.queryTSEventTypee�������ݿ���󣬲���Ϊ��" 
						+"����������ѯ������Ϣʧ��" + sql.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.queryTSEventTypee���ִ��󣬲���Ϊ��" 
						+"����������ѯ������Ϣʧ��" + ue.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.queryTSEventTypee���ִ��󣬲���Ϊ��" 
						+"����������ѯ������Ϣʧ��" + ce.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	       }
	       finally
	       {
	       	pm.close(true);
	       	
	       	close(rs,null,null,con);
	           //�ر����п�����Դ
	          // close(rs,pstm,null,con);
	       }

	       return infoSB.toString();
	   }
	   /*
	    * ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
	    */
	   public String detailTSBaseInfo(long id,ServletContext sc,HttpSession session)
	       throws CustomException,Exception
	   {
		  
	       //�жϻ���ʵ���Ƿ�Ϊ��
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
	           
	           pstm=con.prepareStatement("select defaultAuthName, defaultAuthPwd,defaultSoapUrl,defaultTaskpriority,uploadurl,uploadflash,uploadServer,uploadroot,defaultuploadpath,work from t_m_baseinfo where id=?");
	           pstm.setLong(1, id);
	           
	           rs=pstm.executeQuery();
	           if (rs!=null && rs.next())
	           {
	               infoSB.append(id).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultAuthName"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultAuthPwd"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultSoapUrl"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultTaskpriority"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadurl"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadflash"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadServer"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadroot"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultuploadpath"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("work"))).append("</C></R>");
	               
	           }
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "�鿴������Ϣ��ϸ��Ϣ�ɹ���",baseInformationBean.class.getName());
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.detailTSEventType�������ݿ���󣬲���Ϊ��" 
						+"�鿴������Ϣ��ϸ��Ϣʧ��" + sql.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.detailTSEventType����ת���ַ������󣬲���Ϊ��" 
						+"�鿴�¼�������ϸ��Ϣʧ��" + ue.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.detailTSEventType���ִ��󣬲���Ϊ��" 
						+"�鿴������Ϣ��ϸ��Ϣʧ��" + ce.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	       }
	       finally
	       {
	           //�ر����п�����Դ
	           close(rs,pstm,null,con);
	       }

	       return infoSB.toString();
	   }
	   /*
	    * �޸�ǰ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
	    */
	   public String beforeUpdateTSBaseInfo(long id,ServletContext sc,HttpSession session)
	       throws CustomException,Exception
	   {
	       
	       //�жϻ���ʵ���Ƿ�Ϊ��
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
	           
	           pstm=con.prepareStatement("select defaultAuthName, defaultAuthPwd,defaultSoapUrl,defaultTaskpriority,uploadurl,uploadflash,uploadServer,uploadroot,defaultuploadpath,work from t_m_baseinfo where id=?");
	         
	           pstm.setLong(1, id);
	           
	           rs=pstm.executeQuery();
	           if (rs!=null && rs.next())
	           {
	        	   infoSB.append(id).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultAuthName"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultAuthPwd"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultSoapUrl"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultTaskpriority"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadurl"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadflash"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadServer"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadroot"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultuploadpath"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("work"))).append("</C></R>");
	           }
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "�޸�ǰ��ѯ������Ϣ�ɹ���",baseInformationBean.class.getName());
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.beforeUpdateTSEventType�������ݿ���󣬲���Ϊ��" 
						+"�޸�ǰ��ѯ������Ϣʧ��" + sql.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//�������ݿ����ӷ���Ĵ���
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.beforeUpdateTSEventType����ת���ַ������󣬲���Ϊ��" 
						+"�޸�ǰ��ѯ������Ϣʧ��" + ue.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//ת���ַ���ʱ���ִ���
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.beforeUpdateTSEventType���ִ��󣬲���Ϊ��" 
						+"�޸�ǰ��ѯ������Ϣʧ��" + ce.getMessage(),baseInformationBean.class.getName());
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
	    * �޸Ĵ�����ϢAJAX
	    */
	   public int updateTSBaseInfo(String id,String values,
	       ServletContext sc,HttpSession session) throws CustomException,Exception
	   {
		   
	       //�жϻ���ʵ���Ƿ�Ϊ��
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
	           
	           sqlSB.append("update t_m_baseinfo set ").append(values).append(" where id=").append(id);
	           pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

	           int num=pstm.executeUpdate();

	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "�޸Ļ�����Ϣ�ɹ���",baseInformationBean.class.getName());
	          
	          return num;
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.updateTSEventType�������ݿ���󣬲���Ϊ��" 
						+"�޸Ļ�����Ϣʧ��" + sql.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//�������ݿ����ӷ���Ĵ���
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.updateTSEventType����ת���ַ������󣬲���Ϊ��" 
						+"�޸Ļ�����Ϣʧ��" + ue.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//ת���ַ���ʱ���ִ���
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.updateTSEventType���ִ��󣬲���Ϊ��" 
						+"�޸Ļ�����Ϣʧ��" + ce.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//����δ֪�쳣����
	       }
	       finally
	       {
	           //�ر����п�����Դ
	           close(null,pstm,null,con);
	       }
	   }
	   /*
	    * ��Ӵ�����ϢAJAX
	    */
	   public int addTSBaseInfo(String labels,String values,ServletContext sc,HttpSession session)
	       throws CustomException,Exception
	   {
	       //�жϻ���ʵ���Ƿ�Ϊ��
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
	           
	           sqlSB.append("insert into t_m_baseinfo(").append(labels).append(") values (").append(values).append(")");
	           
	           pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
	           
	           int num=pstm.executeUpdate();
	           
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "��ӻ�����Ϣ�ɹ���",baseInformationBean.class.getName());
	           return num;
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.addTSEventType�������ݿ���󣬲���Ϊ��" 
						+"��ӻ�����Ϣʧ��" + sql.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//�������ݿ����ӷ���Ĵ���
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.addTSEventType����ת���ַ������󣬲���Ϊ��" 
						+"��ӻ�����Ϣʧ��" + ue.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//ת���ַ���ʱ���ִ���
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.addTSEventType���ִ��󣬲���Ϊ��" 
						+"��ӻ�����Ϣʧ��" + ce.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//����δ֪�쳣����
	       }
	       finally
	       {
	           //�ر����п�����Դ
	           close(null,pstm,null,con);
	       }
	   }
}
