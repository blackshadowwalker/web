package modules.base;

import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class LocationTree
{
	public static String tree_str=null;

	public LocationTree(){
	}

	
	public static String queryLocationCode(String locationId,ServletContext sc,HttpSession session) throws CustomException,Exception{
		
		
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
        	
        	pstm=conn.prepareStatement("select id,locationId,locationName,longitude,latiTude,mapScaling from t_s_location where locationId=? and status=1");
        	
        	pstm.setString(1,locationId);
        	
        	rs=pstm.executeQuery();
        	
        	if(rs!=null && rs.next()){
        		
        		infoSB = new StringBuffer(120);
        		
        		infoSB.append(rs.getInt("id")).append("</C>");
        		infoSB.append(rs.getString("locationId")).append("</C>");
        		infoSB.append(basePublic.out(rs.getString("locationName"))).append("</C>");
        		infoSB.append(rs.getFloat("longitude")).append("</C>");
        		infoSB.append(rs.getFloat("latiTude")).append("</C>");
        		infoSB.append(rs.getInt("mapScaling"));
        		
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
	
	public static String queryTree(String parentLocationId,ServletContext sc,HttpSession session) throws CustomException,Exception{
		
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
		
			
			pstm=conn.prepareStatement("select id,locationId,locationName,longitude,latiTude,mapScaling from t_s_location where parentLocationId=? and locationId!=parentLocationId and status=1 order by id");
			
			pstm.setString(1, parentLocationId);
			
			rs=pstm.executeQuery();
			
			pstm2=conn.prepareStatement("select id from t_s_location where parentLocationId=? and status=1");
			
			
			while(rs!=null && rs.next()){
				
				res_str.append(rs.getInt("id")).append("</C>");
				res_str.append(rs.getString("locationId")).append("</C>");
				res_str.append(basePublic.out(rs.getString("locationName"))).append("</C>");
				res_str.append(rs.getFloat("longitude")).append("</C>");
				res_str.append(rs.getFloat("latiTude")).append("</C>");
				res_str.append(rs.getInt("mapScaling")).append("|");
				
				pstm2.setString(1,rs.getString("locationId"));
				
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