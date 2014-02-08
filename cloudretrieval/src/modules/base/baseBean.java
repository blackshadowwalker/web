package modules.base;

import java.sql.*;
import java.util.*;
import java.util.Date;
import java.text.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.sql.DataSource;
import cryptix.CryptixException;
import cryptix.provider.md.SHA1;
import cryptix.util.core.Hex;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class baseBean extends ResourceClose{

	private DataSource dataSource;
	private SmartUpload su_2;

	public baseBean(){
	}
	/*
	 * 构造函数
	 */
	public baseBean(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	/*
	 * SHA加密函数
	 */
	public static String digest(String strBlock)
	throws CryptixException
	{
		if (strBlock == null)
			return null;

		try
		{
			SHA1 sha1 = new SHA1();
			return Hex.toString(sha1.digest(strBlock.getBytes()));
		}
		catch(CryptixException t)
		{
			return null;
		}
	}

	/*
	 * 判断是否在初始化状态
	 */
	/*
	public static boolean inBase(baseForm theForm)
		throws SQLException, Exception
	{
		return (theForm.user_code.equals("baseman") && theForm.user_passwd.equals("baseman"));
	}
	 */
	public boolean checkDept(String code,String role_dept,ServletContext sc,HttpSession session)
	throws CustomException,Exception{

		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;


		if (code == null)

			throw new CustomException("请按流程正常登录。");

		if(sc==null)

			throw new CustomException("ServletContext无法获得。");

		baseForm user = null;
		try
		{
			user = (baseForm)session.getAttribute("baseuser");
		} catch (Exception e) {
			throw new CustomException("获得Session信息失败!");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		try{
			con = ((DataSource)sc.getAttribute("basedb")).getConnection();

			if (con == null){

				//////////System.out.println("数据库连接失败，请检查连接池是否建立成功或正常运行。");
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}

			if (role_dept == null || role_dept.length()<=0)
			{
				role_dept=user.dept_code;
			}

			pstm=con.prepareStatement("select id from t_s_deptmgr where dept_manager=? and dept_code=?");

			pstm.setString(1,role_dept);
			pstm.setString(2,code.trim());

			//System.out.println("select id from t_s_deptmgr where dept_manager='"+role_dept+"' and dept_code='"+code.trim()+"'");

			rs=pstm.executeQuery();

			if(rs!=null && rs.next()){


				return true;

			}
			else{

				return false;
			}

			//throw new CustomException(prompt+"不存在或您没有权限，请检查后重新输入");

		}
		catch(SQLException sql){

			sql.printStackTrace();
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}

		catch(Exception ce){

			ce.printStackTrace();
			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,false,null,false,con);
		}
	}

	public int updateLoginTime(String user_code) throws CustomException,Exception{

		Connection con=null;
		PreparedStatement pstm=null;

		try{
			con=dataSource.getConnection();

			if (con == null){

				//////////System.out.println("数据库连接失败，请检查连接池是否建立成功或正常运行。");

				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}

			pstm=con.prepareStatement("update t_s_user set last_login=getdate(), login_times=login_times+1 where user_code=?");

			pstm.setString(1,user_code);

			int num=pstm.executeUpdate();

			return num;
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw ce;
		}
		finally{
			//关闭所有可用资源
			close(null,pstm,false,null,false,con);
		}
	}

	/*
	 * 
	 * 获取事件类型和webshow的显示
	 * 
	 */
	public String getEventAndWebshowCodeList(List EventListCode, List EventListName, 
			List webshowCodeListValue, List webshowCodeListName  ) 
		throws CustomException
	   {
	       StringBuffer sqlSB = null; //保存SQL语句
	       Connection con=null;//保存数据库连接
	       ResultSet rs=null;//保存查询的结果集
	       PreparedStatement pstm=null;//保存预处理语句
	       try
	       {
	    	   
	           con = dataSource.getConnection();
	           if (con==null)
	           {
	           	throw new CustomException("数据库连接Connection为空，连接失败。");
	           }
	           // get Event List
	           pstm=con.prepareStatement("select event_code,event_name  from t_s_eventtype");
	           rs=pstm.executeQuery();
	           while (rs!=null && rs.next())
	           {
	        	   EventListCode.add(rs.getString("event_code"));
	        	   EventListName.add(rs.getString("event_name"));
	           }
	           
	           // get webshow code list
	           pstm=con.prepareStatement("select value,name  from t_s_webshow");
	           rs=pstm.executeQuery();
	           while (rs!=null && rs.next())
	           {
	        	   webshowCodeListValue.add(rs.getString("value"));
	        	   webshowCodeListName.add(rs.getString("name"));
	           }
	           
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           throw new CustomException("出现数据库连接方面的错误...");
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           throw new CustomException("出现未知异常错误。");
	       }
	       finally
	       {
	           //关闭所有可用资源
	           close(rs,pstm,null,con);
	       }

		   return "";
	   }
	/*
	 *	获得medianate videos list
	 */
	public boolean getVideoList(String codeType, List videoID,List videoName, List videoUrl, String user_code) throws CustomException,Exception{

		Connection con=null;

		PreparedStatement pstm=null;

		ResultSet rs=null;

		try{
			con=dataSource.getConnection();
			if(con==null){

				//////////System.out.println("数据库连接失败，请检查连接池是否建立成功或正常运行。");
				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}				
			//			pstm=con.prepareStatement("select id,name,url,type from t_m_videos where status=1  order by ctTime desc");
			pstm=con.prepareStatement("select id,name,url,type from t_m_videos where status=1 and uploader='"+user_code+"'  order by ctTime desc");
			//	pstm.setString(1,codeType);
			rs=pstm.executeQuery();
			while(rs!=null && rs.next()){
				videoID.add(basePublic.out(rs.getString("id").trim()));
				videoName.add(basePublic.out(rs.getString("name").trim()));
				videoUrl.add(basePublic.out(rs.getString("url").trim()));
			}

			return true;
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("转化字符集时出现错误。");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现未知异常错误。");
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,null,con);
		}
	}

	/*
	 * 获得 ruler_code的路径：一级菜单/二级菜单/ruler_code
	 * */
	public boolean getRulers(String rulerCode, List rulerCodeList, List rulerNameList) throws CustomException,Exception{
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String sql="";
		String ruler_manager="";
		boolean ret = false;
		try{
			con=dataSource.getConnection();
			if(con==null){
				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}
			
			sql = "SELECT ruler_code,ruler_name,ruler_manager from t_s_ruler WHERE	ruler_code='"+rulerCode+"' ";
			pstm=con.prepareStatement(sql);
			System.out.println(sql);
			rs=pstm.executeQuery();
			if(rs!=null && rs.next()){
				rulerCodeList.add(rs.getString("ruler_code").trim());
				rulerNameList.add(rs.getString("ruler_name").trim());
				ruler_manager = rs.getString("ruler_manager").trim();
				sql = "SELECT ruler_code,ruler_name,ruler_manager from t_s_ruler where ruler_code ='"+ruler_manager+"'";
				pstm=con.prepareStatement(sql);
				System.out.println(sql);
				rs=pstm.executeQuery();
				if(rs!=null && rs.next()){
					rulerCodeList.add(rs.getString("ruler_code").trim());
					rulerNameList.add(rs.getString("ruler_name").trim());
					ruler_manager = rs.getString("ruler_manager").trim();
					sql = "SELECT ruler_code,ruler_name,ruler_manager from t_s_ruler where ruler_code ='"+ruler_manager+"'";
					pstm=con.prepareStatement(sql);
					System.out.println(sql);
					rs=pstm.executeQuery();
					if(rs!=null && rs.next()){
						rulerCodeList.add(rs.getString("ruler_code").trim());
						rulerNameList.add(rs.getString("ruler_name").trim());
						ruler_manager = rs.getString("ruler_manager").trim();
						ret = true;
					}
				}
			}
		}
		catch(SQLException e){
			e.printStackTrace();
			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(Exception ce){
			ce.printStackTrace();
			throw new CustomException("出现未知异常错误。");
		}
		finally{
			close(rs,pstm,null,con);
		}
		return ret;
		
	}
	
	public boolean getLanguages(List languagesKeys, List languagesNames) throws CustomException,Exception{
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=dataSource.getConnection();
			if(con==null){
				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}
			pstm=con.prepareStatement("select * from t_s_language where enable=1 and status=1  order by languagekey asc");
			rs=pstm.executeQuery();
			while(rs!=null && rs.next()){
				languagesKeys.add(basePublic.out(rs.getString("languagekey").trim()));
				languagesNames.add(basePublic.out(rs.getString("localeName").trim()));
			}
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("转化字符集时出现错误。");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现未知异常错误。");
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,null,con);
		}
		return true;
	}
	public boolean getLevelInfos(String codeType, List deptLevelID,List deptLevelName) throws CustomException,Exception{

		Connection con=null;

		PreparedStatement pstm=null;

		ResultSet rs=null;

		try{
			con=dataSource.getConnection();
			if(con==null){
				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}
			pstm=con.prepareStatement("select code,value from t_s_code where type=? and status=1  order by code asc");
			pstm.setString(1,codeType);
			rs=pstm.executeQuery();
			while(rs!=null && rs.next()){
				deptLevelID.add(basePublic.out(rs.getString("code").trim()));
				deptLevelName.add(basePublic.out(rs.getString("value").trim()));
			}

			return true;
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("转化字符集时出现错误。");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现未知异常错误。");
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,null,con);
		}
	}


	public boolean getldjy(String dept_code,List deptLevelID,List deptLevelName,String user_code) throws CustomException,Exception{

		Connection con=null;

		PreparedStatement pstm=null;

		ResultSet rs=null;



		try{
			con=dataSource.getConnection();

			if(con==null){

				//////////System.out.println("数据库连接失败，请检查连接池是否建立成功或正常运行。");

				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}

			//审批权限的角色列表

			pstm=con.prepareStatement("select user_code,user_name,jh from t_u_person a,t_s_role b  where a.dept_code ='"+dept_code+"' and a.role_code=b.role_code and b.sfld = 1 and a.user_code !='"+user_code+"' and a.user_code !='admin'");



			rs=pstm.executeQuery();

			while(rs!=null && rs.next()){

				deptLevelID.add(basePublic.out(rs.getString("user_code").trim()));
				deptLevelName.add(basePublic.out(rs.getString("user_name").trim()+"("+rs.getString("jh")+")"));
			}





			return true;
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("转化字符集时出现错误。");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现未知异常错误。");
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,null,con);
		}
	}
	//获得政工科科长
	public boolean getzgk(List deptLevelID,List deptLevelName,String role_code) throws CustomException,Exception{

		Connection con=null;

		PreparedStatement pstm=null;

		ResultSet rs=null;



		try{
			con=dataSource.getConnection();

			if(con==null){

				//////////System.out.println("数据库连接失败，请检查连接池是否建立成功或正常运行。");

				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}

			//审批权限的角色列表


			pstm=con.prepareStatement("select user_code,user_name,jh from t_u_person  where  role_code='"+role_code+"'");



			rs=pstm.executeQuery();

			while(rs!=null && rs.next()){

				deptLevelID.add(basePublic.out(rs.getString("user_code").trim()));
				deptLevelName.add(basePublic.out(rs.getString("user_name").trim()+"("+rs.getString("jh")+")"));
			}

			return true;
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("转化字符集时出现错误。");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现未知异常错误。");
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,null,con);
		}
	}

	//获得自己维护的标准类型
	public boolean getbzsj(List deptLevelID,List deptLevelName,String table_name) throws CustomException,Exception{

		Connection con=null;

		PreparedStatement pstm=null;

		ResultSet rs=null;



		try{
			con=dataSource.getConnection();

			if(con==null){

				//////////System.out.println("数据库连接失败，请检查连接池是否建立成功或正常运行。");

				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}

			//审批权限的角色列表


			pstm=con.prepareStatement("select code,type from "+table_name);



			rs=pstm.executeQuery();

			while(rs!=null && rs.next()){

				deptLevelID.add(basePublic.out(rs.getString("code").trim()));
				deptLevelName.add(basePublic.out(rs.getString("type").trim()));
			}

			return true;
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("转化字符集时出现错误。");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现未知异常错误。");
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,null,con);
		}
	}

	//获得机构下的所有的 
	public boolean get_person(List deptLevelID,List deptLevelName,String dept_code) throws CustomException,Exception{

		Connection con=null;

		PreparedStatement pstm=null;

		ResultSet rs=null;



		try{
			con=dataSource.getConnection();

			if(con==null){

				//////////System.out.println("数据库连接失败，请检查连接池是否建立成功或正常运行。");

				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}

			//审批权限的角色列表


			pstm=con.prepareStatement("select user_code,user_name,jh from t_u_person  where dept_code='"+dept_code+"' and status = 1");



			rs=pstm.executeQuery();

			while(rs!=null && rs.next()){

				deptLevelID.add(basePublic.out(rs.getString("user_code")+"</C>"+rs.getString("user_name")+"</C>"+rs.getString("jh").trim()));
				deptLevelName.add(basePublic.out(rs.getString("user_name").trim()+"("+rs.getString("jh")+")"));
			}

			return true;
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("转化字符集时出现错误。");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现未知异常错误。");
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,null,con);
		}
	}



	public boolean getrole( List deptLevelID,List deptLevelName) throws CustomException,Exception{

		Connection con=null;

		PreparedStatement pstm=null;

		ResultSet rs=null;

		try{
			con=dataSource.getConnection();

			if(con==null){

				//////////System.out.println("数据库连接失败，请检查连接池是否建立成功或正常运行。");

				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}


			pstm=con.prepareStatement("select role_code,role_name from t_s_role where role_code !='admin' and status =1  order by role_code");



			rs=pstm.executeQuery();

			while(rs!=null && rs.next()){

				deptLevelID.add(basePublic.out(rs.getString("role_code").trim()));
				deptLevelName.add(basePublic.out(rs.getString("role_name").trim()));
			}

			return true;
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("转化字符集时出现错误。");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现未知异常错误。");
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,null,con);
		}
	}
	/*
	 *查询信息类别 
	 */
	/* 武刚屏蔽
	public boolean getLevelInfos(String codeType, String condi, List deptLevelID,List deptLevelName) throws CustomException,Exception{

		Connection con=null;

		PreparedStatement pstm=null;

		ResultSet rs=null;


		try{
			con=dataSource.getConnection();

			if(con==null){

				//////////System.out.println("数据库连接失败，请检查连接池是否建立成功或正常运行。");

				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}


			pstm=con.prepareStatement("select code,value from t_s_code where type=? and status=1 and "+condi+" order by code asc");

			pstm.setString(1, codeType);

			rs=pstm.executeQuery();

			while(rs!=null && rs.next()){

				deptLevelID.add(basePublic.out(rs.getString("code").trim()));
				deptLevelName.add(basePublic.out(rs.getString("value").trim()));
			}

			return true;
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("转化字符集时出现错误。");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现未知异常错误。");
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,null,con);
		}
	}
	 */
	/*
	 * 武刚修改
	 */
	public static String getAllRole(String role_code)
	{
		StringBuffer roles = new StringBuffer(25);;

		if(roles!=null)
			roles.append("'").append(role_code).append("'");

		return roles.toString();
	}

	/*
	 * 根据角色值和权限代码获得ruler_word
	 */
	public String getRulerWord(String role_code, String ruler_code)throws SQLException, Exception
	{
		String ruler_word = null;
		ResultSet rs = null;
		Connection connect = null;
		PreparedStatement pstmt = null;

		try{

			connect = dataSource.getConnection();
			if (connect == null)
				return null;
			connect.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);



			pstmt = connect.prepareStatement("select ruler_word from t_s_rolevalue where role_code=? and ruler_code=?");
			pstmt.setString(1, role_code);
			pstmt.setString(2, ruler_code);

			rs = pstmt.executeQuery();

			if (rs!=null && rs.next()){

				ruler_word = rs.getString("ruler_word");
			}
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw sql;
		}
		catch(Exception e){

			e.printStackTrace();

			throw e;
		}
		finally{

			close(rs,pstmt,null,connect);
		}

		return ruler_word;
	}

	/*
	 * 根据角色值和权限代码获得ruler_word (注：AJAX调用)
	 */
	public String getRW(String ruler_code,ServletContext sc,HttpSession session) throws CustomException,Exception{

		//判断环境实例是否为空
		if (sc == null){

			////////////System.out.println("ServletContext 为空，返回。");

			throw new CustomException("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if(session==null){

			////////////System.out.println("HttpSession 为空，返回。");

			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		//判断用户是否登录

		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if(bform==null){

			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}

		ResultSet rs = null;//结果集
		Connection con = null;//数据库连接
		PreparedStatement pstm = null;//预处理语句

		try{
			con= ((DataSource)sc.getAttribute("basedb")).getConnection();


			//判断数据库连接是否连接成功
			if (con == null){

				//////////System.out.println("数据库库连接Connection为空，连接失败，返回。");

				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}


			if(bform.role_code==null){

				return "";
			}


			StringBuffer sqlSB=new StringBuffer();

			sqlSB.append("select ruler_word from t_s_rolevalue where ruler_code=? and role_code in (");
			sqlSB.append("'").append(bform.role_code).append("'");
			sqlSB.append(")");

		//	System.out.println(sqlSB.toString());
			//System.out.println("ruler_code=="+ruler_code);

			pstm=con.prepareStatement(sqlSB.toString());

			pstm.setString(1,ruler_code);

			rs=pstm.executeQuery();

			StringBuffer infoSB = new StringBuffer();

			while (rs!=null && rs.next()){

				infoSB.append(rs.getString("ruler_word"));
			}


			return infoSB.toString();
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally{

			//关闭已打开的资源
			close(rs,pstm,null,con);
		}
	}

	public static String getRulerWord(Connection connect, String role_code, String ruler_code)
	throws SQLException, Exception
	{
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		String ruler_word = null;

		try{
			pstmt = connect.prepareStatement("select ruler_word from t_s_rolevalue where role_code=? and ruler_code=?");

			pstmt.setString(1, role_code);
			pstmt.setString(2, ruler_code);

			rs = pstmt.executeQuery();

			if (rs!=null && rs.next()){

				ruler_word = rs.getString("ruler_word");
			}
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw sql;
		}
		catch(Exception e){

			e.printStackTrace();

			throw e;
		}
		finally{

			if(rs!=null){

				try{
					rs.close();
					rs=null;
				}
				catch(SQLException sqlRs){

					throw sqlRs;
				}
			}

			if(pstmt!=null){

				try{
					pstmt.close();
					pstmt=null;
				}
				catch(SQLException sqlPstm){

					throw sqlPstm;
				}
			}
		}

		return ruler_word;
	}	

	//查询机构里的所有人员
	/*
	public boolean getDeptper(String codeType,List per_code,List per_name) throws CustomException,Exception{

		Connection con=null;

		PreparedStatement pstm=null;

		ResultSet rs=null;


		try{
			con=dataSource.getConnection();

			if(con==null){

				//////////System.out.println("数据库连接失败，请检查连接池是否建立成功或正常运行。");

				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}



			pstm=con.prepareStatement("select id,per_name from t_b_jcxx_ryxx where dep_id=? and status = 0 order by per_code asc");

			pstm.setString(1,codeType);

			rs=pstm.executeQuery();

			while(rs!=null && rs.next()){

				per_code.add(basePublic.out(rs.getString("id").trim()));
				per_name.add(basePublic.out(rs.getString("per_name").trim()));
			}

			return true;
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("转化字符集时出现错误。");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现未知异常错误。");
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,null,con);
		}
	}
	 */


	/*
	 * 根据机构获得柜员信息
	 */
	/*
	public String getGY(String dept_code,String type,String id,ServletContext sc,HttpSession session) throws CustomException,Exception{

		StringBuffer infoSB=null;



		//判断环境实例是否为空

		if (sc == null){

			//////////////System.out.println("ServletContext 为空，返回。");

			throw new CustomException("ServletContext 为空，返回");
		}


		//判断会话实例是否为空
		if(session==null){

			//////////////System.out.println("HttpSession 为空，返回。");

			throw new CustomException("HttpSession 为空，返回");
		}

		//////////////System.out.println("dept_code===="+dept_code);

		//判断用户是否登录

		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if(bform==null){

			throw new CustomException("连接失效，请重新登录系统。");
		}


		ResultSet rs = null;//结果集
		Connection con = null;//数据库连接
		PreparedStatement pstm = null;//预处理语句

		try{
			con= ((DataSource)sc.getAttribute("basedb")).getConnection();


			//判断数据库连接是否连接成功
			if (con == null){

				////////////System.out.println("数据库库连接Connection为空，连接失败，返回。");

				throw new CustomException("数据库连接Connection为空，连接失败。");
			}


			infoSB=new StringBuffer();

			if(type!=null && type.equals("all")){

				pstm=con.prepareStatement("select id,per_name,per_code from t_b_jcxx_ryxx where dep_id=? and per_status!=4 and per_status!=3");

				pstm.setString(1,dept_code);

				rs=pstm.executeQuery();

				while(rs!=null && rs.next()){

					infoSB.append(rs.getLong("id")).append(",");
					infoSB.append(basePublic.out(rs.getString("per_name")).trim()).append(",");
					infoSB.append(rs.getString("per_code")).append(";");
				}
			}
			else if(type!=null && type.equals("ys")){

				pstm=con.prepareStatement("select id,per_name,per_code,per_status from t_b_jcxx_ryxx where dep_id=? and per_status!=4 and per_status!=3");

				pstm.setString(1,dept_code);


				//////////////System.out.println("select id,per_name,per_code from t_b_jcxx_ryxx where dep_id=? and per_code not in(select a.dygyr from t_d_czkz_ysdj_ys a,t_d_czkz_ysdj b where a.ysdj_id=b.id and b.depcode=?) and per_code not in(select a.degyr from t_d_czkz_ysdj_ys a,t_d_czkz_ysdj b where a.ysdj_id=b.id and b.depcode=?) and per_code not in(select a.dsgyr from t_d_czkz_ysdj_ys a,t_d_czkz_ysdj b where a.ysdj_id=b.id and b.depcode=ys)");

				rs=pstm.executeQuery();

				while(rs!=null && rs.next()){

					infoSB.append(rs.getLong("id")).append(",");
					infoSB.append(basePublic.out(rs.getString("per_name")).trim()).append(",");
					infoSB.append(rs.getString("per_code")).append(",");
					infoSB.append(rs.getInt("per_status")).append(";");
				}
			}
			else if((type!=null && type.equals("mm")) || (type!=null && type.equals("ys_mod"))){

				pstm=con.prepareStatement("select id,per_name,per_code from t_b_jcxx_ryxx where dep_id=? and per_status!=4 and per_status!=3");

				pstm.setString(1,dept_code);

				//////////////System.out.println("select id,per_name,per_code from t_b_jcxx_ryxx where dep_id=? and per_code not in(select a.gmr from t_d_czkz_ysdj_mm a,t_d_czkz_ysdj b where a.ysdj_id=b.id and b.depcode=mm)");


				rs=pstm.executeQuery();

				while(rs!=null && rs.next()){

					infoSB.append(rs.getLong("id")).append(",");
					infoSB.append(basePublic.out(rs.getString("per_name")).trim()).append(",");
					infoSB.append(rs.getString("per_code")).append(";");
				}
			}

		//////////////System.out.println(infoSB.toString());
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("转化字符集时出现错误。");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现未知异常错误。");
		}
		finally{

			//关闭已打开的资源
			close(rs,pstm,null,con);
		}

		return infoSB.toString();
	}
	 */
	/*
	 * 根据身份证号获得姓名
	 */
	public static String getName(String sfzh,ServletContext sc,HttpSession session) throws CustomException,Exception{

		//判断环境实例是否为空
		if (sc == null){

			//System.out.println("ServletContext 为空，返回。");

			throw new CustomException("ServletContext 为空，返回");
		}


		//判断会话实例是否为空
		if(session==null){

			//System.out.println("HttpSession 为空，返回。");

			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");


		//判断用户是否登录

		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if(bform==null){

			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}


		ResultSet rs = null;//结果集
		Connection con = null;//数据库连接
		PreparedStatement pstm = null;//预处理语句
		String ryname=null;//保存获得的人员姓名

		try{
			con= ((DataSource)sc.getAttribute("basedb")).getConnection();


			//判断数据库连接是否连接成功
			if (con == null){

			//	System.out.println("数据库库连接Connection为空，连接失败，返回。");

				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}



			pstm=con.prepareStatement("select per_name from t_b_jcxx_ryxx where per_card=?");

			pstm.setString(1,sfzh);

			rs=pstm.executeQuery();

			if(rs!=null && rs.next()){

				ryname=basePublic.out(rs.getString("per_name"));		
			}
		}
		catch(SQLException sql){

			sql.printStackTrace();
			//Log.logger.log(Level.INFO, "根据身份证号获得姓名时，出现数据连接方面错误。");
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}

		catch(Exception ce){

			ce.printStackTrace();
			//Log.logger.log(Level.INFO, "根据身份证号获得姓名时，出现未知异常错误。");
			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally{

			//关闭已打开的资源
			//close(rs,pstm,null,con);
			if(rs!=null){

				try{

					rs.close();
					rs=null;
				}
				catch(SQLException sql){

					System.out.println("baseBean--getName()关闭rs出错："+sql.getMessage());
				}
			}

			if(pstm!=null){

				try{
					pstm.close();
					pstm=null;
				}
				catch(SQLException sql){

					System.out.println("baseBean--getName()关闭pstm出错："+sql.getMessage());
				}
			}

			if(con!=null){

				try{
					con.close();
					con=null;
				}
				catch(SQLException sql){

					System.out.println("baseBean--getName()关闭con出错："+sql.getMessage());
				}
			}
		}
		return ryname;
	}
	/*
	 * 根据岗位id获得岗位描述信息
	 */
	public static  String getGwname(String rygw,ServletContext sc,HttpSession session) throws CustomException,Exception{

		//判断环境实例是否为空
		if (sc == null){

			//System.out.println("ServletContext 为空，返回。");

			throw new CustomException("ServletContext 为空，返回");
		}


		//判断会话实例是否为空
		if(session==null){

			//System.out.println("HttpSession 为空，返回。");

			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");


		//判断用户是否登录

		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if(bform==null){

			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}


		ResultSet rs = null;//结果集
		Connection con = null;//数据库连接
		PreparedStatement pstm = null;//预处理语句
		String ryname=null;//保存获得的人员姓名

		try{
			con= ((DataSource)sc.getAttribute("basedb")).getConnection();


			//判断数据库连接是否连接成功
			if (con == null){

//				System.out.println("数据库库连接Connection为空，连接失败，返回。");

				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}



			pstm=con.prepareStatement("select value from t_s_code where type='t_b_jcxx_ryxg.gwzcdm' and code=?");

			pstm.setString(1,rygw);


			rs=pstm.executeQuery();

			if(rs!=null && rs.next()){

				ryname=basePublic.out(rs.getString("value"));		
			}
		}
		catch(SQLException sql){

			sql.printStackTrace();
			//Log.logger.log(Level.INFO, "根据岗位id获得岗位描述信息(t_s_code)时，出现数据连接方面错误。");
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}

		catch(Exception ce){

			ce.printStackTrace();
			//Log.logger.log(Level.INFO, "根据岗位id获得岗位描述信息(t_s_code)时，出现未知异常错误。");
			throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ce.getMessage()+")");//转化字符集时出现错误
		}
		finally{

			//关闭已打开的资源
			//close(rs,pstm,null,con);
			if(rs!=null){

				try{

					rs.close();
					rs=null;
				}
				catch(SQLException sql){

					System.out.println("baseBean--getGwname()关闭rs出错："+sql.getMessage());
				}
			}

			if(pstm!=null){

				try{
					pstm.close();
					pstm=null;
				}
				catch(SQLException sql){

					System.out.println("baseBean--getGwname()关闭pstm出错："+sql.getMessage());
				}
			}

			if(con!=null){

				try{
					con.close();
					con=null;
				}
				catch(SQLException sql){

					System.out.println("baseBean--getGwname()关闭con出错："+sql.getMessage());
				}
			}
		}
		return ryname;
	}

	/*武刚屏蔽
public String getGY2(String gy_code,String dept_code,ServletContext sc,HttpSession session) throws CustomException,Exception{

	StringBuffer infoSB=null;

//判断环境实例是否为空

	if (sc == null){

		//////////////System.out.println("ServletContext 为空，返回。");

		throw new CustomException("ServletContext 为空，返回");
	}


	//判断会话实例是否为空
	if(session==null){

		//////////////System.out.println("HttpSession 为空，返回。");

		throw new CustomException("HttpSession 为空，返回");
	}

	//////////////System.out.println("dept_code===="+dept_code);

	//判断用户是否登录

	baseForm bform=(baseForm)session.getAttribute("baseuser");

	if(bform==null){

		throw new CustomException("连接失效，请重新登录系统。");
	}


	ResultSet rs = null;//结果集
	Connection con = null;//数据库连接
	PreparedStatement pstm = null;//预处理语句

	try{
		con= ((DataSource)sc.getAttribute("basedb")).getConnection();


		//判断数据库连接是否连接成功
		if (con == null){

			////////////System.out.println("数据库库连接Connection为空，连接失败，返回。");

			throw new CustomException("数据库连接Connection为空，连接失败。");
		}


		infoSB=new StringBuffer();



		pstm=con.prepareStatement("select per_name from t_b_jcxx_ryxx where dep_id in (select dept_code from t_s_deptmgr where dept_manager=?)  and per_code =? and per_status!=4");

		pstm.setString(1,dept_code);
		pstm.setString(2,gy_code);


		rs=pstm.executeQuery();

		if(rs!=null && rs.next()){

			infoSB.append(basePublic.out(rs.getString("per_name")).trim());
		} else 
		{

	infoSB.append("机构不存在此柜员!");
	}
	}
	catch(SQLException sql){

		sql.printStackTrace();

		throw new CustomException("出现数据库连接方面的错误...");
	}
	catch(UnsupportedEncodingException ue){

		ue.printStackTrace();

		throw new CustomException("转化字符集时出现错误。");
	}
	catch(Exception ce){

		ce.printStackTrace();

		throw new CustomException("出现未知异常错误。");
	}
	finally{

		//关闭已打开的资源
		close(rs,pstm,null,con);
	}

	return infoSB.toString();
	}
	 */

	/*
	 * 判断输入的机构号是否合法
	 */

	public String sureDept(String dept_code,String dl_dept,ServletContext sc,HttpSession session) throws CustomException,Exception{

		//判断环境实例是否为空

		if (sc == null){

			//////////////System.out.println("ServletContext 为空，返回。");

			throw new CustomException("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if(session==null){

			//////////////System.out.println("HttpSession 为空，返回。");

			throw new CustomException("HttpSession 为空，返回");
		}

		//////////////System.out.println("dept_code===="+dept_code);
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		//判断用户是否登录

		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if(bform==null){

			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}

		ResultSet rs = null;//结果集
		Connection con = null;//数据库连接
		PreparedStatement pstm = null;//预处理语句

		try{
			con= ((DataSource)sc.getAttribute("basedb")).getConnection();


			//判断数据库连接是否连接成功
			if (con == null){

				////////////System.out.println("数据库库连接Connection为空，连接失败，返回。");

				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}

			pstm=con.prepareStatement("select id from t_s_deptmgr where dept_manager=?  and dept_code=?");

			//System.out.println("select id from t_s_deptmgr where dept_manager=?  and dept_code=?");

			pstm.setString(1,dl_dept);
			pstm.setString(2,dept_code);

			rs=pstm.executeQuery();

			if(rs!=null && rs.next()){

				return "true";
			}
			else{

				return "false";
			}

			//////////////System.out.println(infoSB.toString());
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally{

			//关闭已打开的资源
			close(rs,pstm,null,con);
		}

		//return infoSB.toString();
	}

	public String validNKTime(String nk_time,int opt_type,ServletContext sc,HttpSession session) throws Exception{

		//判断环境实例是否为空

		if (sc == null){

			//////////////System.out.println("ServletContext 为空，返回。");

			throw new Exception("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if(session==null){

			//////////////System.out.println("HttpSession 为空，返回。");

			throw new Exception("HttpSession 为空，返回");
		}

		//////////////System.out.println("dept_code===="+dept_code);
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		//判断用户是否登录

		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if(bform==null){

			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}

		if(nk_time==null || nk_time.equals("")){

			return "请输入有效时间。";
		}

		SimpleDateFormat sdf=null;

		try{

			sdf=new SimpleDateFormat("yyyyMMdd");

			if(opt_type==0){

				String selTime=nk_time.trim();

				String nkTime=sdf.format(new Date());

				if(selTime.compareTo(nkTime)>=0){

					return "";
				}
				else{

					return TimeBean.transTime5(nkTime);
				}
			}
			else if(opt_type==1){

				StringBuffer infoSB=null;

				String selTime=nk_time.trim();

				String nkTime=sdf.format(new Date());

				if(selTime.equals(nkTime)){

					return "0";
				}

				/*if(selTime.equals(new Date().)){

	    			return "1";
	    		}*/

				infoSB=new StringBuffer();

				infoSB.append("请选择<").append(TimeBean.transTime5(nkTime)).append(">");

				return infoSB.toString();
			}
			else{

				return "请检查控件参数设置是否正确。";
			}
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new Exception(ce.getMessage());
		}
		finally{

			sdf = null;
		}
	}


	public String xtTime(String format,int type,ServletContext sc,HttpSession session) throws Exception{

		//判断环境实例是否为空

		if (sc == null){

			//////////////System.out.println("ServletContext 为空，返回。");

			throw new Exception("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if(session==null){

			//////////////System.out.println("HttpSession 为空，返回。");

			throw new Exception("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		//判断用户是否登录

		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if(bform==null){

			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}

		SimpleDateFormat sdf=null;

		try{
			if(format==null || format.trim().equals("")){

				sdf=new SimpleDateFormat("yyyyMMdd");
			}
			else{

				sdf=new SimpleDateFormat(format);
			}	

			Date date=new Date();


			return sdf.format(date);
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new Exception(ce.getMessage());
		}
	}

	//获得ID
	public static String getRandom(int num){

		StringBuffer numSB=new StringBuffer(14+num);

		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");

		try{
			Thread.sleep(10);
		}
		catch(Exception e){

		}

		numSB.append(sdf.format(new Date()));


		Random random=new Random();


		for(int i=0;i<num;i++){

			numSB.append(random.nextInt(9));
		}

		return numSB.toString();
	}
	/*
	public String upLoadFile2(PageContext pageContext,JspWriter out,String path,boolean isUpload) throws ServletException, IOException, SmartUploadException
	{
		su_2 = new SmartUpload();

		su_2.initialize(pageContext);

		if(!isUpload){

			return "";
		}

		StringBuffer file_name=new StringBuffer();

		su_2.setAllowedFilesList("tar,zip,tgz,rar,doc,xls,wps");

		su_2.upload();


		// Retreive the current file
		com.jspsmart.upload.File myFile = su_2.getFiles().getFile(0);

		// Save it only if this file exists
		if (!myFile.isMissing()) {

		file_name.append(parseFileName(myFile.getFileName())).append(TimeBean.getCurrentTime()).append(".").append(myFile.getFileExt());

		// Save the files with its original names in a virtual path of the web server

		//System.out.println(path+file_name.toString());

		myFile.saveAs(path + file_name.toString());
		// myFile.saveAs("/upload/" + myFile.getFileName(), mySmartUpload.SAVE_VIRTUAL);

		// sample with a physical path
		// myFile.saveAs("c:\\temp\\" + myFile.getFileName(), mySmartUpload.SAVE_PHYSICAL);

		//  Display the properties of the current file
		}
		return file_name.toString();
	}
	 */
	public String upLoadFile_per(PageContext pageContext,JspWriter out,String path,String name,boolean isUpload) throws ServletException, IOException, SmartUploadException
	{
		su_2 = new SmartUpload();

		su_2.initialize(pageContext);

		if(!isUpload){

			return "";
		}

		StringBuffer file_name=new StringBuffer();

		su_2.setAllowedFilesList("jpg,gif,png,jpeg");

		su_2.upload();


		// Retreive the current file
		com.jspsmart.upload.File myFile = su_2.getFiles().getFile(0);

		// Save it only if this file exists
		if (!myFile.isMissing()) {

			file_name.append(su_2.getRequest().getParameter("hidden_per_card")).append(".").append(myFile.getFileExt());

			// Save the files with its original names in a virtual path of the web server

			//System.out.println(path+file_name.toString());

			myFile.saveAs(path + file_name.toString());
			// myFile.saveAs("/upload/" + myFile.getFileName(), mySmartUpload.SAVE_VIRTUAL);

			// sample with a physical path
			// myFile.saveAs("c:\\temp\\" + myFile.getFileName(), mySmartUpload.SAVE_PHYSICAL);

			//  Display the properties of the current file
			/*
		out.println("file==="+myFile.getFieldName());
		out.println("文件名称 = " + myFile.getFileName() + "<BR>");
		out.println("文件大小 = " + myFile.getSize() + "<BR>");
		out.println("文件类型 = " + myFile.getFileExt() + "<BR>");
		out.println("上传文件路径 = " + myFile.getFilePathName() + "<BR>");
			 */
		}
		//su=null;
		return file_name.toString();
	}



	public SmartUpload getSmartUpload2(){

		return su_2;
	}

	public String queryDeptLevel(String dept,int flag,ServletContext sc,HttpSession session)
	throws CustomException,Exception
	{

		//判断环境实例是否为空
		if (sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if (session==null)
		{
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		//判断用户是否登录
		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if (bform==null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}

		//保存查询结果信息
		StringBuffer infoSB=null;

		Connection con=null;//保存数据库连接
		PreparedStatement pstm=null;//保存预处理语句
		ResultSet rs=null;//保存查询的结果集

		try
		{
			con=((DataSource)sc.getAttribute("basedb")).getConnection();

			if (con==null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}

			infoSB=new StringBuffer();

			if(flag==1){  //全部

				pstm=con.prepareStatement("select code,value from t_s_code where type='t_s_dept.dept_level' and code>=(select dept_level from t_s_dept where dept_code=?)");

				pstm.setString(1, dept);
			}
			else if(flag==2){  //没有网点

				pstm=con.prepareStatement("select code,value from t_s_code where type='t_s_dept.dept_level' and code>0 and code<4");
			}
			else if(flag==3){  //没有网点 并且是角色机构层级辖属

				pstm=con.prepareStatement("select code,value from t_s_code where type='t_s_dept.dept_level' and code>=(select dept_level from t_s_dept where dept_code=?) and code<4");

				pstm.setString(1, dept);
			}

			rs=pstm.executeQuery();

			while(rs!=null && rs.next()){

				infoSB.append(rs.getString(1)).append("</C>");

				infoSB.append(basePublic.out(rs.getString(2))).append("</C></R>");

			}

		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally
		{

			close(rs,pstm,null,con);
		}

		return infoSB.toString();
	}

	public String getperson(String xx,ServletContext sc,HttpSession session) throws CustomException,Exception{

		//判断环境实例是否为空
		if (sc == null){


			throw new CustomException("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if(session==null){


			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		//判断用户是否登录

		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if(bform==null){

			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}

		ResultSet rs = null;//结果集
		Connection con = null;//数据库连接
		PreparedStatement pstm = null;//预处理语句

		try{
			con= ((DataSource)sc.getAttribute("basedb")).getConnection();


			//判断数据库连接是否连接成功
			if (con == null){

				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}


			StringBuffer infoSB = new StringBuffer();

			StringBuffer sqlSB = new StringBuffer();

			sqlSB.append("select user_code,jh,user_name from t_u_person where user_code not in (select hy_code from t_s_qqhy");
			sqlSB.append(" where user_code='"+bform.user_code+"' ) and user_code!='"+bform.user_code+"'  "+xx);

			////System.out.println(sqlSB.toString());

			pstm = con.prepareStatement(sqlSB.toString());

			rs = pstm.executeQuery();

			while(rs!=null && rs.next())
			{
				infoSB.append(rs.getString("user_code")).append("</C></T>");
				infoSB.append(rs.getString("user_name")).append("(");
				infoSB.append(rs.getString("jh")).append(")</R>");

			}

			return infoSB.toString();
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally{

			//关闭已打开的资源
			close(rs,pstm,null,con);
		}
	}


	public String getpz(String xx,ServletContext sc,HttpSession session) throws CustomException,Exception{

		//判断环境实例是否为空
		if (sc == null){


			throw new CustomException("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if(session==null){


			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		//判断用户是否登录

		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if(bform==null){

			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}

		ResultSet rs = null;//结果集
		Connection con = null;//数据库连接
		PreparedStatement pstm = null;//预处理语句

		try{
			con= ((DataSource)sc.getAttribute("basedb")).getConnection();


			//判断数据库连接是否连接成功
			if (con == null){

				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}


			StringBuffer infoSB = new StringBuffer();

			StringBuffer sqlSB = new StringBuffer();

			sqlSB.append("select q_code,q_name from t_s_qzsz where q_code not in (select q_code from t_s_qzhy");
			sqlSB.append(" where user_code='"+bform.user_code+"' ) "+xx);



			pstm = con.prepareStatement(sqlSB.toString());

			rs = pstm.executeQuery();

			while(rs!=null && rs.next())
			{
				infoSB.append(rs.getString("q_code")).append("</C></T>");

				infoSB.append(rs.getString("q_name")).append("</R>");

			}

			return infoSB.toString();
		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally{

			//关闭已打开的资源
			close(rs,pstm,null,con);
		}
	}

	public static String parseFileName(String file_name){

		if(file_name==null){

			return "";
		}

		int num=file_name.indexOf(".");

		if(num<0){

			return file_name;
		}

		return file_name.substring(0,file_name.indexOf("."));
	}

	//判断表中的某一自动是否是唯一的
	public String pd_only(String code,String value,String table_name,ServletContext sc,HttpSession session) throws CustomException,Exception{

		//判断环境实例是否为空
		if (sc == null){


			throw new CustomException("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if(session==null){


			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		//判断用户是否登录

		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if(bform==null){

			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}

		ResultSet rs = null;//结果集
		Connection con = null;//数据库连接
		PreparedStatement pstm = null;//预处理语句

		try{
			con= ((DataSource)sc.getAttribute("basedb")).getConnection();


			//判断数据库连接是否连接成功
			if (con == null){

				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}



			StringBuffer sqlSB = new StringBuffer();

			sqlSB.append("select id from "+table_name+" where "+code+"='"+value+"'");


			pstm = con.prepareStatement(sqlSB.toString());

			rs = pstm.executeQuery();

			if(rs!=null && rs.next())
			{
				return "0";

			}
			else
			{
				return "1";
			}



		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally{

			//关闭已打开的资源
			close(rs,pstm,null,con);
		}
	}


	//判断表中的某一字段是否是本部门的管理范围
	public String check_stu_code(String code,String value,String table_name, String code_dept, ServletContext sc,HttpSession session) throws CustomException,Exception{

		//判断环境实例是否为空
		if (sc == null){
			throw new CustomException("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if(session==null){
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		//判断用户是否登录

		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if(bform==null){

			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}

		ResultSet rs = null;//结果集
		Connection con = null;//数据库连接
		PreparedStatement pstm = null;//预处理语句

		try{
			con= ((DataSource)sc.getAttribute("basedb")).getConnection();


			//判断数据库连接是否连接成功
			if (con == null){
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}



			StringBuffer sqlSB = new StringBuffer();
			/*
			  select id from stu_info where stu_code='220091221152' and status=1 and stu_code in(
				SELECT stu_code from stu_dept_info where dept_code in (
					select dept_code  from t_s_deptmgr where dept_manager='bm0001') 
				)
			 */
			sqlSB.append("select id from "+table_name+" where "+code+"='"+value+"' and status=1 and "+code+
					" in ( select "+code+" from " + code_dept+
					" where dept_code in (select dept_code  from t_s_deptmgr where dept_manager='"+bform.dept_code+"')"+
			")");

			System.out.println(sqlSB.toString());

			pstm = con.prepareStatement(sqlSB.toString());

			rs = pstm.executeQuery();

			if(rs!=null && rs.next())
			{
				return "1";

			}
			else
			{
				return "-1";
			}



		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally{

			//关闭已打开的资源
			close(rs,pstm,null,con);
		}
	}


}