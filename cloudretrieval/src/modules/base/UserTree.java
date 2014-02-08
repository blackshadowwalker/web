package modules.base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class UserTree {


	public static String queryUserCard(String per_card,ServletContext sc,HttpSession session) throws CustomException,Exception{
		
		
//		判断环境实例是否为空
        if (sc == null)
        {
            
            System.out.println("ServletContext 为空，返回。");
            
            throw new CustomException("ServletContext 为空，返回");
        }
        
            
        //判断会话实例是否为空
        if(session==null)
        {
            
            System.out.println("HttpSession 为空，返回。");
            
            throw new CustomException("HttpSession 为空，返回");
        }

        PreparedStatement pstm=null;
        
        ResultSet rs=null;
        
        Connection conn = null;
        
        StringBuffer infoSB = null;
        
        try{
        	conn = ((DataSource)sc.getAttribute("basedb")).getConnection();
        	
        	pstm=conn.prepareStatement("select a.id,a.per_card,a.per_name,a.per_code,a.dep_id,b.dept_name from t_b_jcxx_ryxx a,t_s_dept b where a.per_card=? and a.status=1 and a.dep_id=b.dept_code and b.status=1");
        	
        	pstm.setString(1,per_card);
        	
        	rs=pstm.executeQuery();
        	
        	if(rs!=null && rs.next()){
        		
        		infoSB = new StringBuffer(120);
        		
        		infoSB.append(rs.getLong("id")).append("</C>");
        		infoSB.append(rs.getString("per_card")).append("</C>");
        		infoSB.append(basePublic.out(rs.getString("per_name"))).append("</C>");
        		infoSB.append(rs.getString("per_code")).append("</C>");
        		infoSB.append(rs.getString("dep_id")).append("</C>");
        		infoSB.append(basePublic.out(rs.getString("dept_name")));
        		
        		return infoSB.toString();
        	}
        	else{
        		
        		return "";
        	}
        }
		catch(SQLException sql){
			
			throw sql;
		}
		finally{
			
			if(rs!=null){
				
				rs.close();
				rs=null;
			}
			
			if(pstm!=null){
				
				pstm.close();
				pstm=null;
			}
			
			if(conn!=null){
				
				conn.close();
				conn=null;
			}
		}
	}
	
	public static String queryTree(String dept_manager,ServletContext sc,HttpSession session) throws CustomException,Exception{
		
        //判断环境实例是否为空
        if (sc == null)
        {
            
            System.out.println("ServletContext 为空，返回。");
            
            throw new CustomException("ServletContext 为空，返回");
        }
        
          
        //判断会话实例是否为空
        if(session==null)
        {
            
            System.out.println("HttpSession 为空，返回。");
            
            throw new CustomException("HttpSession 为空，返回");
        }

        PreparedStatement pstm=null;
        
        ResultSet rs=null;
        
        Connection conn = null;
        
        try
		{
			conn = ((DataSource)sc.getAttribute("basedb")).getConnection();
			
			StringBuffer res_str=new StringBuffer(30);
		
			
//			获得机构人员信息
			pstm=conn.prepareStatement("select b.id,b.user_code,b.user_name,b.dept_code,a.dept_name,c.sfld from t_s_dept a,t_u_person b,t_s_role c  where a.dept_code=? and b.role_code = c.role_code and  a.status=1 and a.dept_code=b.dept_code and b.status=1 ");
			
			pstm.setString(1,dept_manager);
			
			rs=pstm.executeQuery();
			
			while(rs!=null && rs.next()){
				
				
				res_str.append(rs.getLong("id")).append("</C>");
				res_str.append(rs.getString("user_code")).append("</C>");
				res_str.append(basePublic.out(rs.getString("user_name"))).append("</C>");
				res_str.append(rs.getString("user_code")).append("</C>");
				res_str.append(rs.getString("dept_code")).append("</C>");
				res_str.append(basePublic.out(rs.getString("dept_name"))).append("</C>");
				res_str.append(basePublic.out(rs.getString("sfld"))).append("|P</R>");
			}
			
			
			rs.close();
			rs=null;
			
			pstm.close();
			pstm=null;
			
			//获得机构信息
			pstm=conn.prepareStatement("select id,dept_code,dept_name,dept_manager,dept_level,dept_lx from t_s_dept where dept_manager=? and dept_code!=dept_manager and status=1 order by id");
			
			pstm.setString(1, dept_manager);
			
			//pstm2=conn.prepareStatement("select id from t_b_jcxx_ryxx where dep_id=? and status=1");
			
			rs=pstm.executeQuery();
			
			while(rs!=null && rs.next()){
				
				res_str.append(rs.getLong("id")).append("</C>");
				res_str.append(rs.getString("dept_code")).append("</C>");
				res_str.append(basePublic.out(rs.getString("dept_name"))).append("</C>");
				res_str.append(rs.getString("dept_manager")).append("</C>");
				res_str.append(rs.getInt("dept_level")).append("</C>");
				res_str.append(rs.getInt("dept_lx")).append("|D");
				
				/*
				pstm2.setString(1,rs.getString("dept_code"));
				
				rs2=pstm2.executeQuery();
				
				if(rs2!=null && rs2.next()){//有下级机构
					
					res_str.append("|y");
				}
				else{//无下级机构
					
					res_str.append("|y");
				}
				*/
				res_str.append("|y</R>");
				
				//rs2.close();
				//rs2=null;
			}
			
			return res_str.toString();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "";
		}
		finally
		{
            if(rs!=null){
            	
			    rs.close();
			    rs = null;   
            }
            
            if(pstm!=null){
            	
            	pstm.close();
            	pstm=null;
            }
            /*
            if(rs2!=null){
            	
			    rs2.close();
			    rs2=null;   
            }
            
            if(pstm2!=null){
            	
            	pstm2.close();
            	pstm2=null;
            }
            */
            
			if(conn!= null){
				
			    conn.close();
			    conn = null;   
			}
		}
	}
}
