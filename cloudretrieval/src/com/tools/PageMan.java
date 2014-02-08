package com.tools;

import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;;

public class PageMan{
	
	public static String getResult(DataSource ds,String sql,int everyPageNum,int curPageNum,int tIsolation) throws Exception{
		
	    StringBuffer infoSB=null;
	    
	    Connection con=null;//�������ݿ�����
	    CallableStatement cs=null;
        ResultSet rs=null;//�����ѯ�Ľ����
	    
        
        try{
        	con=ds.getConnection();
            
        	if (con==null){
                throw new Exception("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }
        	
        	cs=con.prepareCall("{?=call sp_proc_pageman(?,?,?,?,?,?)}");
        	
        	cs.registerOutParameter(1,Types.INTEGER);
        	cs.registerOutParameter(5,Types.INTEGER);
        	cs.registerOutParameter(6,Types.INTEGER);
        	
        	cs.setString(2,sql);
        	cs.setInt(3,everyPageNum);
        	cs.setInt(4,curPageNum);
        	cs.setInt(7,tIsolation);
        	
        	
        	cs.executeQuery();
        	
        	rs=cs.getResultSet();
        	
        	infoSB=new StringBuffer();
        	
        	
        	if(rs!=null){
        		
        		ResultSetMetaData rsmd = rs.getMetaData();
                int numberOfColumns = rsmd.getColumnCount();
        
                while (rs!=null && rs.next()){
                	
                    for (int i = 1; i <= numberOfColumns; i ++){
                    	
                        infoSB.append(rs.getString(i)).append("</C>");
                    }

                    infoSB.append("</R>");
                }
        	}
        	
        	
        	if(cs.getInt(1)==1){
        		
        		throw new Exception("���������Ƿ���ȷ���Ƿ������ݡ�");
        	}
        	
        	infoSB.insert(0,"</C></R>").insert(0,cs.getInt(6)).insert(0,"</C>").insert(0,cs.getInt(5));
        }
        catch(SQLException sqlE){
        	
        	sqlE.printStackTrace();
        	
        	throw new Exception("��ѯ������������ʱ���ִ���"+sqlE.getMessage());
        }
        finally{
        	
        	if(rs!=null){
        		
        		try{
        			rs.close();
        			rs=null;
        		}
        		catch(SQLException sqlRs){
        		}
        	}
        	
        	if(cs!=null){
        		
        		try{
        			cs.close();
        			cs=null;
        		}
        		catch(SQLException sqlCs){
        		}
        	}
        	
        	if(con!=null){
        		
        		try{
        			con.close();
        			con=null;
        		}
        		catch(SQLException sqlCon){
        		}
        	}
        }
        
	    return infoSB.toString();
	}
	
	
	public static String getResult(Connection con,String sql,int everyPageNum,int curPageNum,int tIsolation) throws Exception{
		
	    StringBuffer infoSB=null;
	    
	    CallableStatement cs=null;
        ResultSet rs=null;//�����ѯ�Ľ����
	    
        
        try{
        	cs=con.prepareCall("{?=call sp_proc_pageman(?,?,?,?,?,?)}");
        	
        	cs.registerOutParameter(1,Types.INTEGER);
        	cs.registerOutParameter(5,Types.INTEGER);
        	cs.registerOutParameter(6,Types.INTEGER);
        	
        	cs.setString(2,sql);
        	cs.setInt(3,everyPageNum);
        	cs.setInt(4,curPageNum);
        	cs.setInt(7,tIsolation);
        	
        	
        	cs.executeQuery();
        	
        	
        	rs=cs.getResultSet();
        	
        	infoSB=new StringBuffer();
        	
        	
        	if(rs!=null){
        		
        		ResultSetMetaData rsmd = rs.getMetaData();
                int numberOfColumns = rsmd.getColumnCount();
        
                while (rs!=null && rs.next()){
                	
                    for (int i = 1; i <= numberOfColumns; i ++){
                    	
                        infoSB.append(rs.getString(i)).append("</C>");
                    }

                    infoSB.append("</R>");
                }
        	}
        	
        	
        	if(cs.getInt(1)==1){
        		
        		throw new Exception("���������Ƿ���ȷ���Ƿ������ݡ�");
        	}
        	
        	infoSB.insert(0,"</C></R>").insert(0,cs.getInt(6)).insert(0,"</C>").insert(0,cs.getInt(5));
        }
        catch(SQLException sqlE){
        	
        	sqlE.printStackTrace();
        	
        	throw new Exception("��ѯ������������ʱ���ִ���"+sqlE.getMessage());
        }
        finally{
        	
        	if(rs!=null){
        		
        		try{
        			rs.close();
        			rs=null;
        		}
        		catch(SQLException sqlRs){
        		}
        	}
        	
        	if(cs!=null){
        		
        		try{
        			cs.close();
        			cs=null;
        		}
        		catch(SQLException sqlCs){
        		}
        	}
        	
        	if(con!=null){
        		
        		try{
        			con.close();
        			con=null;
        		}
        		catch(SQLException sqlCon){
        		}
        	}
        }
        
	    return infoSB.toString();
	}
}