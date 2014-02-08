package modules.base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;

public class LogBean{

	/*
	*  参数说明：
	*  
	*  con--数据库连接对象
	*  optName--操作名称
	*  rulerCode--权限代码--去除
	*  rulerName--权限名称--去除
	*  ip--客户端访问IP
	*  per_card--用户身份证号
	*  description--操作描述
	*  logFlag--日志类型(0:错误日志   1:正常日志)
	*/
	public static void addLog(Connection con,String optName,String ip,String per_card,String description,String logFlag){

		PreparedStatement pstm = null;

		try{
			if(con==null){

				throw new Exception("数据库连接(con)为空，不能记录日志信息。");
			}

			pstm=con.prepareStatement("insert into sec_log(name,user_ip,user_id,opration,log_flag) values(?,?,?,?,?)");

			pstm.setString(1,optName);
			pstm.setString(2,ip);
			pstm.setString(3,per_card);
			pstm.setString(4,description);
			pstm.setString(5,logFlag);

			if(pstm.executeUpdate()<1){

				throw new Exception("LogBean增加用户操作日志出错。");
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

				throw new Exception("数据库连接(con)为空，不能记录日志信息。");
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
			logger.info("用户名"+user_code+ "  ip："+user_ip+"  information："+user_nr);

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