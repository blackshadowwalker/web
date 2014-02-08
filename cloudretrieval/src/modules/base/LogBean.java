package modules.base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;

public class LogBean{

	/*
	*  ����˵����
	*  
	*  con--���ݿ����Ӷ���
	*  optName--��������
	*  rulerCode--Ȩ�޴���--ȥ��
	*  rulerName--Ȩ������--ȥ��
	*  ip--�ͻ��˷���IP
	*  per_card--�û����֤��
	*  description--��������
	*  logFlag--��־����(0:������־   1:������־)
	*/
	public static void addLog(Connection con,String optName,String ip,String per_card,String description,String logFlag){

		PreparedStatement pstm = null;

		try{
			if(con==null){

				throw new Exception("���ݿ�����(con)Ϊ�գ����ܼ�¼��־��Ϣ��");
			}

			pstm=con.prepareStatement("insert into sec_log(name,user_ip,user_id,opration,log_flag) values(?,?,?,?,?)");

			pstm.setString(1,optName);
			pstm.setString(2,ip);
			pstm.setString(3,per_card);
			pstm.setString(4,description);
			pstm.setString(5,logFlag);

			if(pstm.executeUpdate()<1){

				throw new Exception("LogBean�����û�������־����");
			}			
		}
		catch(SQLException sql){

			sql.printStackTrace();
		}
		catch(Exception e){

			e.printStackTrace();
		}
		finally{

			if(pstm!=null){

				try{
					pstm.close();
					pstm=null;
				}
				catch(SQLException sqlPstm){
					sqlPstm.printStackTrace();
				}
			}
			if(con!=null){

				try{
					con.close();
					con=null;
				}
				catch(SQLException sqlCon){
					sqlCon.printStackTrace();
				}
			}
		}
	}
	
	public static void wirte_log(Connection con,String table_name,String log_xx,String className){

		PreparedStatement pstm = null;
		Logger logger = Logger.getLogger(className);
		try{
			if(con==null){

				throw new Exception("���ݿ�����(con)Ϊ�գ����ܼ�¼��־��Ϣ��");
			}

			String[] log_xxs = log_xx.split("</C>");
			String user_code= log_xxs[0];
			String user_name = log_xxs[1];
			String user_ip = log_xxs[2];
			String user_nr = log_xxs[3];
			
			
			pstm=con.prepareStatement("insert into "+table_name+" (user_code,user_name,user_ip,user_nr) values(?,?,?,?)");

			pstm.setString(1,user_code);
			pstm.setString(2,user_name);
			pstm.setString(3,user_ip);
			pstm.setString(4,user_nr);
			logger.info("�û���"+user_code+ "  ip��"+user_ip+"  information��"+user_nr);

			pstm.execute();		
		}
		catch(SQLException sql){

			sql.printStackTrace();
		}
		catch(Exception e){

			e.printStackTrace();
		}
		finally{

			if(pstm!=null){

				try{
					pstm.close();
					pstm=null;
				}
				catch(SQLException sqlPstm){
					sqlPstm.printStackTrace();
				}
			}
			if(con!=null){

				try{
					con.close();
					con=null;
				}
				catch(SQLException sqlCon){
					sqlCon.printStackTrace();
				}
			}
		}
	}
}