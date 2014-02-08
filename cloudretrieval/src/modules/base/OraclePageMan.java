package modules.base;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

public class OraclePageMan implements PageMan{

	private long curPage;
	private long totalPage;
	private long totalRow;

	private Connection con;
	
	private Statement stm;
	
	private ResultSet rs;
	
	public long getTotalPage() {
		// TODO 自动生成方法存根
		return this.totalPage;
	}

	public long getTotalRow() {
		// TODO 自动生成方法存根
		
		return this.totalRow;
	}
	
	public long getCurPage(){
		
		return this.curPage;
	}

	public ResultSet list(Connection con,int perPage, int curPage,
			String countSQL, String sqls) throws SQLException {
		// TODO 自动生成方法存根
		
		if(con==null || con.isClosed()) return null;
		
		this.con=con;
		
		
		//获得总行数
		try{
			stm=con.createStatement();
			//System.out.println("语句："+countSQL);
			rs=stm.executeQuery(countSQL);
			
			if(rs!=null && rs.next()){
				
				this.totalRow=rs.getLong(1);
				
				rs.close();
				rs=null;
			}
			else{
				
				return null;
			}
			
			if(this.totalRow==0){
				
				return null;
			}
			
			//每页行数
			if(perPage<=0) perPage=10;
			
			
			if(this.totalRow%perPage==0){
				
				this.totalPage=this.totalRow/perPage;
			}
			else{
				
				this.totalPage=this.totalRow/perPage+1;
			}
			
//			当前页数
			if(curPage<=0){
				
				 this.curPage=1;
			}
			else if(curPage>this.totalPage){
				
				this.curPage=this.totalPage;
			}
			else{
				
				this.curPage=curPage;
			}
			
			
			StringBuffer sqlSB=new StringBuffer(100);
			
			//sqlSB.append("select * from (select a.*,rownum as num from ( select * from (");
			//sqlSB.append(sqls).append(")) a  where rownum<=").append(this.curPage*perPage);
			//sqlSB.append(")b where b.num>=").append((this.curPage-1)*perPage+1);
			
			sqlSB.append(sqls).append(" limit ").append((this.curPage-1)*perPage).append(",").append(perPage);
			//System.out.println(sqlSB.toString());
			rs=stm.executeQuery(sqlSB.toString());
		}
		catch(SQLException sql){
			
			throw sql;
		}
		
		return rs;
	}
	
	public void close(boolean closeCon){
		
		if(rs!=null){
			
			try{
				rs.close();
				rs=null;
			}
			catch(SQLException sqlrs){
			}
		}
		if(stm!=null){
			
			try{
				stm.close();
				stm=null;
			}
			catch(SQLException sqlstm){
			}
		}
		/**if(con!=null && closeCon){
			
			try{
				con.close();
				con=null;
			}
			catch(SQLException sqlcon){
			}
		}**/
	}
}
