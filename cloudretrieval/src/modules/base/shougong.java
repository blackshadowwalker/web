package modules.base;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jxl.Sheet;
import jxl.Workbook;

import org.apache.log4j.Level;
import org.directwebremoting.WebContextFactory;



import modules.base.ResourceClose;

public class shougong extends ResourceClose {

	private DataSource dataSource;
	 String tname ="";
	 String nowtime ="";
	 String year = "";
	 String balance_time = "";
	public shougong() {

	}

	public String url = "jdbc:mysql:///sqgl";

	// public Conn conn = new Conn();

	public Connection getCon() {

		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(url, "root", "198501");

			// con = conn.getConn();
		} catch (Exception x) {
			x.printStackTrace();
		}

		return con;
	}

	public static void main(String args[]) throws CustomException, Exception {

		shougong de = new shougong();

		de.ywzb();
		
		
	}

	//日终的执行程序	
	public int ywzb() throws CustomException, Exception {

		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		PreparedStatement pstm2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstm3 = null;
		ResultSet rs3 = null;
		
		PreparedStatement pstm4 = null;
		ResultSet rs4 = null;
		StringBuffer sqlSB = new StringBuffer();
		StringBuffer infoSB = new StringBuffer();
		try {

			
			
			
			con = getCon();
			
			con.setAutoCommit(false);
			
			//添加好友
			sqlSB = new StringBuffer();
			
			sqlSB.append("select user_code,user_name,dept_code from t_u_person where status = 1 and user_code!='admin'");
			pstm = con.prepareStatement(sqlSB.toString());
			rs = pstm.executeQuery();
			
			while(rs!=null && rs.next())
			{
				System.out.println(rs.getString("user_name"));
				//首先建立分组
				
				//找出所有的机构代码
				
				sqlSB  = new StringBuffer();
				sqlSB.append("select dept_code,dept_name from t_s_dept where status = 1");
				pstm4  = con.prepareStatement(sqlSB.toString());
				
				rs4 = pstm4.executeQuery();
				
				while(rs4!=null && rs4.next())
				{
					sqlSB = new StringBuffer();
			        sqlSB.append("insert into t_s_qqfz (user_code,fz_name) values('"+rs.getString("user_code")+"','"+rs4.getString("dept_name")+"')");
			        pstm3 = con.prepareStatement(sqlSB.toString());
			        pstm3.execute();
			        close(null,pstm3,null,null); 
			        
			        //			      获得刚插入的分组id
			        
			        sqlSB = new StringBuffer();
		            
		            sqlSB.append("select LAST_INSERT_ID()");

		            pstm2 = con.prepareStatement(sqlSB.toString());
		            rs2 = pstm2.executeQuery();

		            rs2.next();
		            //获得新插入数据的id
		            int no = rs2.getInt(1);
		            
		            close(rs2,pstm2,null,null);
		            
//		          找出本部门的人
			        
			        sqlSB = new StringBuffer();
			        
			        sqlSB.append("select user_code,user_name from t_u_person where dept_code='"+rs4.getString("dept_code")+"' and user_code !='"+rs.getString("user_code")+"'");
			        
			        pstm2 = con.prepareStatement(sqlSB.toString());
			        
			        rs2 = pstm2.executeQuery();
			        
			        while(rs2!=null && rs2.next())
			        {
			        	//添加好友
			        	
			        	sqlSB = new StringBuffer();
			        	sqlSB.append("insert into t_s_qqhy (user_code,zb_id,hy_code,sfzc) values ('"+rs.getString("user_code")+"',"+no+",'"+rs2.getString("user_code")+"',1)");
			        	
			        	pstm3 = con.prepareStatement(sqlSB.toString());
			        	pstm3.execute();
			        	
			        	close(null,pstm3,null,null);
			        	
			        	//添加map表
			        	
//			        	写入map表
			            pstm3 = con.prepareStatement("select lastChatId from t_s_messageMap where to_user_code='"+rs2.getString("user_code")+"' and from_user_code='"+rs.getString("user_code")+"'");
					    
					    rs3 = pstm3.executeQuery();
					    
					    if(rs3!=null && rs3.next())
					    {
					    	
					    	
					    	close(rs3,pstm3,null,null);
					    }
					    else
					    {
					    	close(rs3,pstm3,null,null);
					    	pstm3 = con.prepareStatement("insert into t_s_messageMap (to_user_code,from_user_code,lastChatId) values('"+ rs2.getString("user_code") + "','"+rs.getString("user_code")+"','-1')");
					    	pstm3.execute();
					    	close(null,pstm3,null,null);
					    }
			        }
			        close(rs2,pstm2,null,null);
		            
				}
				
				close(rs4,pstm4,null,null);
				
			}
			close(rs,pstm,null,null);
			
			/**
			
			//创建分组
			
			sqlSB = new StringBuffer();
			sqlSB.append("select dept_code,dept_name from t_s_dept where status =1");
			pstm = con.prepareStatement(sqlSB.toString());
			rs = pstm.executeQuery();
			
			while(rs!=null && rs.next())
			{System.out.println(rs.getString("dept_name"));
				//建立分组
				sqlSB = new StringBuffer();
				sqlSB.append("insert into t_s_qzsz (q_code,q_name) values('q"+rs.getString("dept_code")+"','"+rs.getString("dept_name")+"')");
				
				pstm2 = con.prepareStatement(sqlSB.toString());
				pstm2.execute();
				
				close(null,pstm2,null,null);
				
				//增加群组好友
				
				sqlSB = new StringBuffer();
				sqlSB.append("select user_code ,user_name from t_u_person where dept_code='"+rs.getString("dept_code")+"'");
				pstm2 = con.prepareStatement(sqlSB.toString());
				rs2 = pstm2.executeQuery();
				
				while(rs2!=null && rs2.next())
				{
					//添加到分组中
					
					sqlSB = new StringBuffer();
					sqlSB.append("insert into t_s_qzhy (user_code,q_code,sfzc) values('"+rs2.getString("user_code")+"','q"+rs.getString("dept_code")+"',1)");
					pstm3= con.prepareStatement(sqlSB.toString());
					pstm3.execute();
					
					close(null,pstm3,null,null);
					
					//添加map
					
					   pstm3 = con.prepareStatement("select lastChatId from t_s_qzmessage_map where to_user_code='"+rs2.getString("user_code")+"' and q_code='q"+rs.getString("dept_code")+"'");
					    
					    rs3 = pstm3.executeQuery();
					    
					    if(rs3!=null && rs3.next())
					    {
					    
					    	
					    	close(rs3,pstm3,null,null);
					    }
					    else
					    {
					    	//如果没有数据的话 就写入1条
					    	
					    	close(rs3,pstm3,null,null);
					    	pstm3 = con.prepareStatement("insert into t_s_qzmessage_map (to_user_code,q_code,lastChatId) values('"+rs2.getString("user_code")+"','q"+ rs.getString("dept_code") + "',-1)");
					    	pstm3.execute();
					    	close(null,pstm3,null,null);
					    }
				}
				close(rs2,pstm2,null,null);
				
				
				
			}**/
			close(rs,pstm,null,null);
			
			con.commit();


		} catch (Exception e) {
			con.rollback();
			e.printStackTrace();
			throw (e);
		}
		catch (Throwable e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally
	        {
	            //关闭所有可用资源
	            close(rs,pstm,null,con);
	        }
		return 0;
	}
	
	
	public int ywzb2() throws CustomException, Exception {

		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		PreparedStatement pstm2 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstm3 = null;
		ResultSet rs3 = null;
		StringBuffer sqlSB = new StringBuffer();
		StringBuffer infoSB = new StringBuffer();
		try {

			
			
			
			con = getCon();
			
			con.setAutoCommit(false);
			
			//添加好友
			
			for(int i=2 ;i<=13;i++)
			{
				sqlSB = new StringBuffer();
				sqlSB.append("select F"+i+" from t_s_zsb ");
				pstm = con.prepareStatement(sqlSB.toString());
				
				rs = pstm.executeQuery();
				
				while(rs!=null && rs.next())
				{
					String name  = rs.getString("F"+i);
					if(name!=null)
					{
						
						String[] names = name.split("、");
						
						for(int n=0;n<names.length;n++)
						{
							System.out.println(names[n]);
							//查询人员
							String yf = "";
							int bz = i-1;
							if(bz<10)
							{
								yf = "0"+bz;
							}
							else
							{
								yf=""+bz;
							}
							
							String user_name =names[n].replaceAll(" ", "");
							user_name =names[n].replaceAll("　", "");
							String user_code ="";
							String jh ="";
							String dept_code="";
							String dept_name = "";
							String lrsj = "2011"+yf;
							
							sqlSB = new StringBuffer();
							sqlSB.append("select user_code,jh,dept_code from t_u_person where user_name='"+user_name+"'");
							pstm2 = con.prepareStatement(sqlSB.toString());
							
							rs2 = pstm2.executeQuery();
							
							if(rs2!=null && rs2.next())
							{
								user_code = rs2.getString("user_code");
								jh = rs2.getString("jh");
								dept_code = rs2.getString("dept_code");
								System.out.println(jh);
							}
							else
							{
								System.out.println(user_name+"没有记录");
							}
							
							sqlSB = new StringBuffer();
							sqlSB.append("select dept_code,dept_name from t_s_dept where dept_code='"+dept_code+"'");
							pstm2 = con.prepareStatement(sqlSB.toString());
							
							rs2 = pstm2.executeQuery();
							
							if(rs2!=null && rs2.next())
							{
							
								dept_name = rs2.getString("dept_name");
								System.out.println(dept_name);
							}
							else
							{
								System.out.println(user_name+"没有记录");
							}
							
							sqlSB = new StringBuffer();
							sqlSB.append("insert into t_s_qjjh(dept_code,dept_name,user_code,user_name,jqlx,kssj)");
							sqlSB.append(" values('"+dept_code+"','"+dept_name+"','"+user_code+"','"+user_name+"("+jh+")','年假','"+lrsj+"')");
							
							System.out.println(sqlSB.toString());
							
							pstm = con.prepareStatement(sqlSB.toString());
							pstm.execute();
							close(null,pstm,null,null);
						}
					}
				}
				close(rs,pstm,null,null);
			}
			
			con.commit();


		} catch (Exception e) {
			con.rollback();
			e.printStackTrace();
			throw (e);
		}
		catch (Throwable e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally
	        {
	            //关闭所有可用资源
	            close(rs,pstm,null,con);
	        }
		return 0;
	}

	
	//判断当前时间是星期几
	public static int dayForWeek(String pTime) throws CustomException, Exception {  
		try{
	       
	    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");   
	       
	    Date tmpDate = format.parse(pTime);   
	       
	    Calendar cal = new GregorianCalendar();   
	       
	    cal.set(tmpDate.getYear(), tmpDate.getMonth(), tmpDate.getDay());   
	       
	    return cal.get(Calendar.DAY_OF_WEEK); 
	} catch (Exception e) {
		
		e.printStackTrace();
		throw (e);
	}
	}  
	





}
