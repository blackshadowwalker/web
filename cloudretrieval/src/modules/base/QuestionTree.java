package modules.base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class QuestionTree {


	public static String queryQuesCard(String ques_name,ServletContext sc,HttpSession session) throws CustomException,Exception{
		/*
		 * id</C>bh</C>description</C>type</C>first</C>second</C>third</C>wgjf</C>method</C>jftk
		 */
		
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
        	
        	pstm=conn.prepareStatement(basePublic.in("select id,first_type,second_type,third_type,wtbh,wtct,fz,jf_method,jftk,wtlx,(SELECT value FROM t_s_code WHERE type='t_s_wtct.wtlx' and code=t_s_wtct.wtlx) as wtlx_name,jffz from t_s_wtct where wtct like '%"+ques_name+"%' and status=1 "));
        	
        	//System.out.println("select id,first_type,second_type,third_type,wtbh,wtct,fz from t_s_wtct where wtct like '%"+ques_name+"%' and status=1 ");
        	
        	rs=pstm.executeQuery();
        	
        	infoSB = new StringBuffer();
        	
        	while(rs!=null && rs.next()){
        		
        		infoSB.append(rs.getLong("id")).append("</C>");
        		infoSB.append(rs.getString("wtbh")).append("</C>");
        		infoSB.append(basePublic.out(rs.getString("wtct"))).append("</C>");
        		infoSB.append("4</C>");
        		infoSB.append(rs.getString("first_type")).append("</C>");
        		infoSB.append(rs.getString("second_type")).append("</C>");
        		infoSB.append(rs.getString("third_type")).append("</C>");
        		infoSB.append(rs.getFloat("fz")).append("</C>");
        		infoSB.append(basePublic.out(rs.getString("jf_method"))).append("</C>");
        		infoSB.append(basePublic.out(rs.getString("jftk"))).append("</C>");
        		infoSB.append(rs.getString("wtlx")).append("</C>");
        		infoSB.append(basePublic.out(rs.getString("wtlx_name"))).append("</C>");
        		infoSB.append(rs.getInt("jffz")).append("</C></R>");
        		
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
		
		return infoSB.toString();
	}
	
	public static String queryTree(String sj_bh,int level,ServletContext sc,HttpSession session) throws CustomException,Exception{
		
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
			
			StringBuffer res_str=new StringBuffer(30);
		
			//获得机构人员信息
			//pstm=conn.prepareStatement("select b.id,b.per_card,b.per_name,b.per_code,b.dep_id,a.dept_name from t_s_dept a,t_b_jcxx_ryxx b where a.dept_code=? and a.status=1 and a.dept_code=b.dep_id and b.status=1");
			
			//System.out.println("level=="+level);
			
			if(level!=3){
				
				pstm=conn.prepareStatement("select id,bh,description,sj_bh,type from t_s_wtfl where sj_bh=? and status=1 ");
				
				//System.out.println("select id,bh,description,sj_bh,type from t_s_wtfl where sj_bh=? and status=1 "+"\t"+sj_bh);
				
				pstm.setString(1,sj_bh);
				
				rs=pstm.executeQuery();
				
				while(rs!=null && rs.next()){
					
					
					res_str.append(rs.getLong("id")).append("</C>");
					res_str.append(rs.getString("bh")).append("</C>");
					res_str.append(basePublic.out(rs.getString("description"))).append("</C>");
					res_str.append(rs.getString("type")).append("</C>");
					res_str.append(rs.getString("sj_bh")).append("</C></R>");
					
				}
				
				rs.close();
				rs=null;
				
				pstm.close();
				pstm=null;
				
			}
			else{
				
				pstm=conn.prepareStatement("select id,first_type,second_type,third_type,wtbh,wtct,fz,jf_method,jftk,wtlx,(SELECT value FROM t_s_code WHERE type='t_s_wtct.wtlx' and code=t_s_wtct.wtlx) as wtlx_name,jffz from t_s_wtct where third_type=? and status=1 ");
				
				//System.out.println("select id,first_type,second_type,third_type,wtbh,wtct,fz from t_s_wtct where third_type=? and status=1 "+"\t"+sj_bh);
				
				pstm.setString(1,sj_bh);
				
				rs=pstm.executeQuery();
				
				while(rs!=null && rs.next()){
					
					
					res_str.append(rs.getLong("id")).append("</C>");
					res_str.append(rs.getString("wtbh")).append("</C>");
					res_str.append(basePublic.out(rs.getString("wtct"))).append("</C>");
					res_str.append("4</C>");
					res_str.append(rs.getString("first_type")).append("</C>");
					res_str.append(rs.getString("second_type")).append("</C>");
					res_str.append(rs.getString("third_type")).append("</C>");
					res_str.append(rs.getFloat("fz")).append("</C>");
					res_str.append(basePublic.out(rs.getString("jf_method"))).append("</C>");
					res_str.append(basePublic.out(rs.getString("jftk"))).append("</C>");
					res_str.append(rs.getString("wtlx")).append("</C>");
					res_str.append(basePublic.out(rs.getString("wtlx_name"))).append("</C>");
					res_str.append(rs.getFloat("jffz")).append("</C></R>");
					
				}
				
				rs.close();
				rs=null;
				
				pstm.close();
				pstm=null;
				
				
			}
			
			
			//获得机构信息
			/*pstm=conn.prepareStatement("select id,dept_code,dept_name,dept_manager,dept_level,dept_lx from t_s_dept where dept_manager=? and dept_code!=dept_manager and status=1 order by id");
			
			pstm.setString(1, dept_manager);
			
			pstm2=conn.prepareStatement("select id from t_b_jcxx_ryxx where dep_id=? and status=1");
			
			rs=pstm.executeQuery();
			
			while(rs!=null && rs.next()){
				
				res_str.append(rs.getLong("id")).append("</C>");
				res_str.append(rs.getString("dept_code")).append("</C>");
				res_str.append(basePublic.out(rs.getString("dept_name"))).append("</C>");
				res_str.append(rs.getString("dept_manager")).append("</C>");
				res_str.append(rs.getInt("dept_level")).append("</C>");
				res_str.append(rs.getInt("dept_lx")).append("|D");
				
				pstm2.setString(1,rs.getString("dept_code"));
				
				rs2=pstm2.executeQuery();
				
				if(rs2!=null && rs2.next()){//有下级机构
					
					res_str.append("|y");
				}
				else{//无下级机构
					
					res_str.append("|n");
				}
				
				res_str.append("</R>");
				
				rs2.close();
				rs2=null;
			}*/
			
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
