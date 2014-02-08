package modules.base;

import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class KmbTree
{
	public static String tree_str=null;

	public KmbTree(){
	}

	
	public static String queryAccCode(String acc_code,ServletContext sc,HttpSession session) throws CustomException,Exception{
		
		
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
        	
        	pstm=conn.prepareStatement("select acc_code,account_name,parent_acc_id,tree_level,balance_direction from t_o_kmb where acc_code=?");
        	
        	pstm.setString(1,acc_code);
        	
        	rs=pstm.executeQuery();
        	
        	if(rs!=null && rs.next()){
        		
        		infoSB = new StringBuffer(120);
        		
        		infoSB.append(rs.getString("acc_code")).append("</C>");
        		infoSB.append(basePublic.out(rs.getString("account_name"))).append("</C>");
        		infoSB.append(rs.getString("parent_acc_id")).append("</C>");
        		infoSB.append(rs.getInt("tree_level")).append("</C>");
        		infoSB.append(rs.getInt("balance_direction"));
        		
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
	
	public static String queryKmb(String parent_acc_id,ServletContext sc,HttpSession session) throws CustomException,Exception{
		
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

        PreparedStatement pstm=null,pstm2=null;
        
        ResultSet rs=null,rs2=null;
        
        Connection conn = null;
        
        try
		{
			conn = ((DataSource)sc.getAttribute("basedb")).getConnection();
			
			StringBuffer res_str=new StringBuffer();
		
			
			pstm=conn.prepareStatement("select acc_code,account_name,parent_acc_id,tree_level,balance_direction from t_o_kmb where parent_acc_id=? and acc_code!=parent_acc_id order by acc_code");
			
			pstm.setString(1, parent_acc_id);
			
			rs=pstm.executeQuery();
			
			pstm2=conn.prepareStatement("select acc_code from t_o_kmb where parent_acc_id=?");
			
			
			while(rs!=null && rs.next()){
				
				res_str.append(rs.getString("acc_code")).append("</C>");
				res_str.append(basePublic.out(rs.getString("account_name"))).append("</C>");
				res_str.append(rs.getString("parent_acc_id")).append("</C>");
				res_str.append(rs.getInt("tree_level")).append("</C>");
				res_str.append(rs.getInt("balance_direction")).append("|");
				
				pstm2.setString(1,rs.getString("acc_code"));
				
				rs2=pstm2.executeQuery();
				
				if(rs2!=null && rs2.next()){//有下级机构
					
					res_str.append("y");
				}
				else{//无下级机构
					
					res_str.append("n");
				}
				
				res_str.append("</R>");
				
				rs2.close();
				rs2=null;
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
            
            if(rs2!=null){
            	
			    rs2.close();
			    rs2=null;   
            }
            
            if(pstm2!=null){
            	
            	pstm2.close();
            	pstm2=null;
            }
            
			if(conn!= null){
				
			    conn.close();
			    conn = null;   
			}
		}
	}

}