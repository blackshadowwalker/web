package modules.base;

import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class DeptTree
{
	public static String tree_str=null;

	public DeptTree(){
	}

	
	public static String queryDeptCode(String dept_code,ServletContext sc,HttpSession session) throws CustomException,Exception{
		
		
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
        	
        	pstm=conn.prepareStatement("select id,dept_code,dept_name,dept_manager,dept_level,dept_lx from t_s_dept where dept_code=? and status=1");
        	
        	pstm.setString(1,dept_code);
        	
        	rs=pstm.executeQuery();
        	
        	if(rs!=null && rs.next()){
        		
        		infoSB = new StringBuffer(120);
        		
        		infoSB.append(rs.getLong("id")).append("</C>");
        		infoSB.append(rs.getString("dept_code")).append("</C>");
        		infoSB.append(basePublic.out(rs.getString("dept_name"))).append("</C>");
        		infoSB.append(rs.getString("dept_manager")).append("</C>");
        		infoSB.append(rs.getInt("dept_level")).append("</C>");
        		infoSB.append(rs.getInt("dept_lx"));
        		
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

        PreparedStatement pstm=null,pstm2=null;
        
        ResultSet rs=null,rs2=null;
        
        Connection conn = null;
        
        try
		{
			conn = ((DataSource)sc.getAttribute("basedb")).getConnection();
			
			StringBuffer res_str=new StringBuffer();
		
			
			pstm=conn.prepareStatement("select id,dept_code,dept_name,dept_manager,dept_level,dept_lx from t_s_dept where dept_manager=? and dept_code!=dept_manager and status=1 order by id");
			
			pstm.setString(1, dept_manager);
			
			rs=pstm.executeQuery();
			
			pstm2=conn.prepareStatement("select id from t_s_dept where dept_manager=? and status=1");
			
			
			while(rs!=null && rs.next()){
				
				res_str.append(rs.getLong("id")).append("</C>");
				res_str.append(rs.getString("dept_code")).append("</C>");
				res_str.append(basePublic.out(rs.getString("dept_name"))).append("</C>");
				res_str.append(rs.getString("dept_manager")).append("</C>");
				res_str.append(rs.getInt("dept_level")).append("</C>");
				res_str.append(rs.getInt("dept_lx")).append("|");
				
				pstm2.setString(1,rs.getString("dept_code"));
				
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

	/*
	public static String InitTreeBak(String manager,String status,String jczbm,ServletContext sc,HttpSession session) throws CustomException,Exception{
		
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

        Statement stm=null,stm1=null,stm2=null;
        ResultSet rs=null,rs1=null,rs2=null;
        Connection conn = null;
        
        try
		{
			conn = ((DataSource)sc.getAttribute("basedb")).getConnection();
			
			StringBuffer res_str=new StringBuffer();
			stm=conn.createStatement();
			stm1=conn.createStatement();
			stm2=conn.createStatement();

			if ((status!=null&&status.equals("2"))||status.equals("4")||status.equals("5")||status.equals("7"))
			{
				 if (status.equals("4"))
				{
					rs = stm.executeQuery("select per_name,id,per_card from t_b_jcxx_ryxx where dep_id='"+manager+"' and status=1");
					
					while (rs.next())
					{
						String personInfo = rs.getString("id")+"<A>"+basePublic.out(rs.getString("per_name"))+"<A>"+rs.getString("per_card").trim();
						res_str.append(personInfo+"<P>");
					}
				}
				else if(status.equals("5")){
					
					rs = stm.executeQuery("select per_card,per_name,per_code from t_b_jcxx_ryxx where dep_id='"+manager+"' and status=1");
					
					while (rs.next())
					{
						String personInfo = rs.getString("per_code").trim()+"<A>"+basePublic.out(rs.getString("per_name")).trim()+"<A>"+basePublic.out(rs.getString("per_card"));
						res_str.append(personInfo+"<P>");
					}
					
				}
				else if(status.equals("7")){
					
					rs = stm.executeQuery("select per_card,per_name,per_code from t_b_jcxx_ryxx where dep_id='"+manager+"' and status=1");
					
					while (rs.next())
					{
						String personInfo = rs.getString("per_code").trim()+"<A>"+basePublic.out(rs.getString("per_name")).trim()+"<A>"+basePublic.out(rs.getString("per_card"));
						res_str.append(personInfo+"<P>");
					}
					
				}
				else
				{
					
					rs = stm.executeQuery("select per_name,id,per_card from t_b_jcxx_ryxx where dep_id='"+manager+"' and status=1");
					
					while (rs.next())
					{
						String personInfo = rs.getString("id")+"<A>"+basePublic.out(rs.getString("per_name"))+"<A>"+rs.getString("per_card").trim();
					    res_str.append(personInfo+"<P>");
					}
				}
				
				if (rs != null)
				{	
				    rs.close();
				    rs = null;
				}    
			}
			
			String strSql = "select dept_level,dept_code,dept_name,dept_manager from t_s_dept where dept_manager='"+
		            manager+"' and dept_code!='370610000' and status=1 order by dept_code";
			
			//System.out.println(strSql);
			
			rs=stm.executeQuery(strSql);
			
			String flag = "0";
			
			String grade="0";
			
			while(rs.next())
			{
				if ( !status.equals("8")){
					
					strSql = "select id from t_s_dept where dept_manager='"+rs.getString("dept_code").trim()+"' and status=1 ";
					
					//System.out.println(strSql);
					
					
				}
				    
				else{
					
					strSql = "select grade from t_s_dept_grade where dept_code='"+rs.getString("dept_code").trim()+"'";
					
				}
				
				rs1=stm1.executeQuery(strSql);
				
				flag = "0";
				
				//判断出机构在检查组被检查机构中
				if (rs1.next())
				{
					flag = "1";
					
					if(status.equals("8")){
						
						grade=rs1.getString("grade");
					}
					
				}
				
				if (rs1 != null)
				{
				    rs1.close();
				    rs1 = null;
				}
				
				String deptInfo = null;
				
				if ( !status.equals("8") )
				{
						deptInfo = "<R>0"+flag+rs.getString("dept_manager").trim()+"&"+rs.getString("dept_code").trim()+"-"+basePublic.out(rs.getString("dept_name"));
					
				}
				else
				{

					    deptInfo = "<R>0"+grade.trim()+rs.getString("dept_manager").trim()+"&"+rs.getString("dept_code").trim()+"-"+basePublic.out(rs.getString("dept_name"));
					
				}
				
				res_str.append(deptInfo);

				if (rs1 != null)
				{
				    rs1.close();
				    rs1 = null;   
				}
			}
			
			return res_str.append("<R>").toString();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "";
		}
		finally
		{
            if (rs != null)
            {
			    rs.close();
			    rs = null;   
            }
            if (stm != null)
            {
            	stm.close();
                stm = null;            	
            }
			if (stm1 != null)
			{
			    stm1.close();
			    stm1 = null;   
			}
			if (stm2 != null)
			{
				stm2.close();
				stm2 = null;
			}
			if (conn != null)
			{
			    conn.close();
			    conn = null;   
			}    
			
		}
	}
	*/
}