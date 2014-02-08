package modules.base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.CallableStatement;


public abstract class ResourceClose {


	protected void close(ResultSet rs,PreparedStatement pstm,boolean clearPreparedStatementBatch,Statement stm,boolean clearStatementBatch,Connection con) {

		try{
			try{//关闭con
				try{//关闭stm
					try{//关闭pstm
						try{//关闭rs
						}
						finally{

							if(rs!=null){

								rs.close();
								rs=null;
								//////////////System.out.println("关闭rs。");
							}
						}
					}
					finally{

						if(pstm!=null){

							if(clearPreparedStatementBatch){

								pstm.clearBatch();
							}

							pstm.close();
							pstm=null;
							//////////////System.out.println("关闭pstm。");
						}
					}
				}
				finally{

					if(stm!=null){

						if(clearStatementBatch){

							stm.clearBatch();
						}

						stm.close();
						stm=null;
						//////////////System.out.println("关闭stm。");
					}
				}
			}
			finally{

				if(con!=null){

					if(!con.getAutoCommit()){

						con.setAutoCommit(true);
					}

					con.close();
					con=null;
					//////////////System.out.println("关闭con。");
				}
			}
		}
		catch(SQLException sql){

			//System.out.println(sql.getMessage());
			sql.printStackTrace();
		}
	}

	protected void close(ResultSet rs,PreparedStatement pstm,Statement stm,CallableStatement cs,Connection con) {

		try{                    
			try{//1?±?con   
				try{//关闭cs
					try{//1?±?stm
						try{//1?±?pstm
							try{//1?±?rs
							}
							finally{

								if(rs!=null){

									rs.close();
									rs=null;
									//////////////System.out.println("1?±?rs?￡");
								}
							}
						}
						finally{

							if(pstm!=null){

								pstm.close();
								pstm=null;
								//////////////System.out.println("1?±?pstm?￡");
							}
						}
					}
					finally{

						if(stm!=null){

							stm.clearBatch();
							stm.close();
							stm=null;
							//////////////System.out.println("1?±?stm?￡");
						}
					}
				}
				finally{

					if(cs!=null){

						cs.close();
						cs=null;
						////////////System.out.println("关闭cs...");
					}
				}
			}
			finally{

				if(con!=null){

					con.close();
					con=null;
					//////////////System.out.println("1?±?con?￡");
				}
			}
		}
		catch(SQLException sql){

			//System.out.println(sql.getMessage());
			sql.printStackTrace();
		}
	}


	protected void close(ResultSet rs,PreparedStatement pstm,Statement stm,Connection con) {

		try{                    
			try{//1?±?con   
				try{//1?±?stm
					try{//1?±?pstm
						try{//1?±?rs
						}
						finally{

							if(rs!=null){

								rs.close();
								rs=null;
								//////////////System.out.println("关闭rs...");
							}
						}
					}
					finally{

						if(pstm!=null){

							pstm.close();
							pstm=null;
							//////////////System.out.println("关闭pstm...");
						}
					}
				}
				finally{

					if(stm!=null){

						stm.clearBatch();
						stm.close();
						stm=null;
						//////////////System.out.println("1?±?stm?￡");
					}
				}
			}
			finally{

				if(con!=null){

					con.close();
					con=null;
					//////////////System.out.println("关闭con...");
				}
			}
		}
		catch(SQLException sql){

			//System.out.println(sql.getMessage());
			sql.printStackTrace();
		}
	}

	protected void close(ResultSet[] rs,PreparedStatement[] pstm,Statement[] stm,Connection[] con) {

		try{                    
			try{//关闭con   
				try{//关闭stm
					try{//关闭pstm
						try{//关闭rs
						}
						finally{

							if(rs==null){

							}
							else if(rs.length>1){


							}
						}
					}
					finally{

						if(pstm[0]!=null){

							pstm[0].close();
							pstm[0]=null;
						}
					}
				}
				finally{

					if(stm[0]!=null){

						stm[0].clearBatch();
						stm[0].close();
						stm[0]=null;
					}
				}
			}
			finally{

				if(con[0]!=null){

					con[0].close();
					con[0]=null;
				}
			}
		}
		catch(SQLException sql){

			//System.out.println(sql.getMessage());
			sql.printStackTrace();
		}
	}
}