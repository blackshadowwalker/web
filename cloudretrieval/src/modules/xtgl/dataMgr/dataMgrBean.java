package modules.xtgl.dataMgr;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import modules.base.*;

public class dataMgrBean extends ResourceClose
{
	public dataMgrBean()
	{

	}

	String sqlpath = null;
	String dname = "telef";
	
	private String databaseName = "cloudretrieval";
	private String address = "127.0.0.1";
	private String port = "3306";
	
	String username = "root";
	String password = "teleframe20130301";
	
	boolean h_handleUsing = false;
	/*
	 * 根据条件语句查询信息AJAX
	 */
	public String queryTSDataMgr(int perPage, int curPage, String s,
			ServletContext sc, HttpSession session) throws CustomException,
			Exception
	{
		//判断环境实例是否为空
		if(sc == null)
		{
			//////System.out.println("ServletContext 为空，返回。");
			throw new CustomException("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if(session == null)
		{
			//////System.out.println("HttpSession 为空，返回。");
			throw new CustomException("HttpSession 为空，返回");
		}

		//判断用户是否登录
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException("连接失效，请重新登录系统。");
		}

		//保存查询结果信息
		StringBuffer infoSB = null;
		//保存SQL语句
		StringBuffer sqlSB = null;
		StringBuffer countSB = null;

		Connection con = null;//保存数据库连接
		//PreparedStatement pstm=null;//保存预处理语句
		ResultSet rs = null;//保存查询的结果集

		PageMan pm = PageManFactory.getInstance();

		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();

			if(con == null)
			{
				throw new CustomException("数据库连接Connection为空，连接失败。");
			}
			infoSB = new StringBuffer();
			sqlSB = new StringBuffer();
			countSB = new StringBuffer();

			sqlSB
					.append("select id,createBy,value,name,url,size,ctTime,recoverTime,recoverBy,recoverNumber from t_s_databack ");
			countSB.append("select count(*) from t_s_databack");

			if(s != null && s.length() > 0)
			{
				sqlSB.append(s);
				countSB.append(s);
			}

			sqlSB.append(" and status=1 order by id desc");
			countSB.append(" and status=1 order by id desc");

			rs = pm.list(con, perPage, curPage, countSB.toString(), sqlSB
					.toString());
			if(rs == null)
			{

				return "no";
			}

			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();

			while (rs != null && rs.next())
			{
				for (int i = 1; i <= numberOfColumns; i++)
				{
					infoSB.append(basePublic.out(rs.getString(i))).append(
							"</C>");

				}
				//       System.out.println(basePublic.out(rs.getString(2)));
				infoSB.append("</R>");
			}

			infoSB.append("|");

			infoSB.append(pm.getTotalPage()).append("</C>").append(
					pm.getTotalRow()).append("</C>").append(pm.getCurPage())
					.append("</C>");
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			throw new CustomException("转化字符集时出现错误。");
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			throw new CustomException("出现未知异常错误。");
		}
		finally
		{
			pm.close(true);

			close(rs, null, null, con);
			//关闭所有可用资源
			// close(rs,pstm,null,con);
		}

		return infoSB.toString();
	}

	private String allocSqlFileName(){
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss.SSS");
		String retStr = dateFormat.format(now) + ".sql";
	//	System.out.println("system auto backup database with file "+retStr);
		return retStr;
	}
	public int autoBackDatabase(ServletContext sc)
	throws CustomException,Exception
	{
		if(h_handleUsing)
			return -1;//mysql is backuping , please try later.
		int ret = 0;
		Date nowTime = new Date();
		Date beforTime = null;
		Date afterTime = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat str2date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowDataStr = dateFormat.format(nowTime);
		String time1 = nowDataStr+" "+"00:00:00";
		String time2 = nowDataStr+" "+"01:00:00";

		beforTime = str2date.parse(time1);  
		afterTime = str2date.parse(time2);  

		if(beforTime.getTime()<=nowTime.getTime() && nowTime.getTime()<=afterTime.getTime()){
			String thisPath = sc.getRealPath("/");
			thisPath = thisPath.replaceAll("\\\\", "/");
			System.out.println("thisPath="+thisPath);
			if(thisPath.charAt( thisPath.length()-1)=='/')
				thisPath = thisPath.substring(0,thisPath.length()-1);
			System.out.println("thisPath="+thisPath);
			int index = thisPath.lastIndexOf("/");
			String contextName = thisPath.substring(index+1, thisPath.length());
			thisPath = thisPath.substring(0, index);
			
			String basePathExt = sc.getInitParameter("basePathExt");
			String basePathExtName = sc.getInitParameter("basePathExtName");
			String databasePath = sc.getInitParameter("databasePath");
			
			sqlpath = basePathExt+"/"+basePathExtName+"/"+databasePath+"/";
			sqlpath = sqlpath.replaceAll("\\\\", "/");
			
			System.out.println("sqlpath="+sqlpath);
			File fdir = new File(sqlpath);
			if(!fdir.exists())
				fdir.mkdir();
			
			String sqlFileName = allocSqlFileName();
			String fileUrl = sqlpath + sqlFileName;
			h_handleUsing = true;
			ret = this.backupDatabase(sqlFileName, sqlFileName, fileUrl, "system", null, sc);
			h_handleUsing = false;
		}
		else ret =2;
		return ret;
	}
	
	private int backupDatabase(String sqlFileName, String fileShowName, String fileUrl, String mod_user, baseForm bform, ServletContext sc) 
		throws CustomException,Exception, FileNotFoundException
	{
		String mysqlBinPath;
		String thisPath = sc.getRealPath("/");
		String dbname = (String)Configuration.getValue("db.dbname");
		if(dbname!=null)
			databaseName = dbname;
		try
		{
			mysqlBinPath ="\"" + thisPath+"WEB-INF/mysql/bin/mysqldump.exe\" ";
			if(sqlpath!=null){
				File backupath = new File(sqlpath);
				boolean bMd = backupath.mkdir();
				System.out.println("bMd="+bMd+"["+sqlpath+"]");
			}
			StringBuffer sb = new StringBuffer();

			sb.append(mysqlBinPath);
			sb.append(" ");
			sb.append("--opt ");
			sb.append("-h ");
			address = (String)Configuration.getValue("db.ip");
			sb.append(address);
			sb.append(" ");
			sb.append("-P ");
			port = (String)Configuration.getValue("db.port");
			port = port==null? "3306":port;
			sb.append(port);
			sb.append(" ");
			sb.append("-u ");
			username = Configuration.getValue("jdbc.username");
			sb.append(username);
			sb.append(" ");
			sb.append("--password=");
			password = Configuration.getValue("jdbc.password");
			sb.append(password);
			sb.append(" ");
			sb.append("--lock-all-tables=true ");
			sb.append("--result-file=");
			sb.append("\"" + fileUrl + "\" ");
			sb.append(" ");
			sb.append("--default-character-set=utf8 ");
			sb.append(databaseName);
		System.out.println("" + sb.toString());
			Runtime rt = Runtime.getRuntime();
			try
			{
				Process process = rt.exec("cmd /c" + sb.toString());
				int exitVal = process.waitFor();
			//	System.out.println("/* Output OK! */");
			}
			catch (IOException e)
			{
				e.printStackTrace();
				return -1;
			}
		}
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		int size = 0;
		File file = new File(fileUrl);
		//System.out.println(file);
		FileInputStream fis = null;
		if(file.exists() && file.isFile())
		{
			fis = new FileInputStream(file);
			size = fis.available() / 1024;
		}
		else
		{
		//	System.out.println("file is not exist!");
			return -2;
		}
		StringBuffer sqlSB = null;

		Connection con = null;//保存数据库连接
		PreparedStatement pstm = null;//保存预处理语句
		DataSource ds = null;
		try
		{
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException("数据库连接Connection为空，连接失败。");
			}

			sqlSB = new StringBuffer();

			sqlSB.append("insert into t_s_databack (createBy,value,name,url,size) VALUES (?,?,?,?,?) ");

			pstm = con.prepareStatement(basePublic.in(sqlSB.toString()));

			pstm.setString(1, mod_user);
			pstm.setString(2, sqlFileName);
			if(fileShowName.length()<1)
				fileShowName = sqlFileName;
			pstm.setString(3, fileShowName);
			pstm.setString(4, fileUrl);
			pstm.setInt(5, size);

			int num = pstm.executeUpdate();
			if(bform!=null)
			{
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "备份数据类型信息成功！",dataMgrBean.class.getName());
			}
			return num;
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			if(bform!=null)
			{
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "dataMgrBean.backupDatabase出现数据库连接错误,操作为：备份数据类型信息失败!" + sql.getMessage(),dataMgrBean.class.getName());
			}
			throw new CustomException("出现数据库连接方面的错误..." );
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			if(bform!=null)
			{
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "dataMgrBean.backupDatabase出现转化字符错误,操作为：备份数据类型信息失败!" + ue.getMessage(),dataMgrBean.class.getName());
			}
			throw new CustomException("转化字符集时出现错误");
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			if(bform!=null)
			{
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "dataMgrBean.backupDatabase出现错误,操作为：删除标准数据管理信息失败!" + ce.getMessage(),dataMgrBean.class.getName());
			}
			throw new CustomException("出现未知异常错误");
		}
		finally
		{
			//关闭所有可用资源
			close(null, pstm, null, con);
		}
	}
	public int addTSBackDataMgr(String sqlFileName, String fileShowName, String mod_user,
			ServletContext sc, HttpSession session) throws CustomException,
			Exception
	{   
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}
		if(session == null)
		{
			throw new CustomException("HttpSession 为空，返回");
		}
		baseForm bform = (baseForm) session.getAttribute("baseuser");
		if(bform == null)
		{
			throw new CustomException("连接失效，请重新登录系统。");
		}
		
		if(h_handleUsing)
			return -1;//mysql is backuping , please try later.
		
		String thisPath = sc.getRealPath("/");
		thisPath = thisPath.replaceAll("\\\\", "/");
		System.out.println("thisPath="+thisPath);
		if(thisPath.charAt( thisPath.length()-1)=='/')
			thisPath = thisPath.substring(0,thisPath.length()-1);
		System.out.println("thisPath="+thisPath);
		int index = thisPath.lastIndexOf("/");
		String contextName = thisPath.substring(index+1, thisPath.length());
		thisPath = thisPath.substring(0, index);
		
		
		String basePathExt = sc.getInitParameter("basePathExt");
		String basePathExtName = sc.getInitParameter("basePathExtName");
		String databasePath = sc.getInitParameter("databasePath");
		
		sqlpath = basePathExt+"/"+basePathExtName+"/"+databasePath+"/";
		sqlpath = sqlpath.replaceAll("\\\\", "/");
		
		System.out.println("sqlpath="+sqlpath);
		File fdir = new File(sqlpath);
		if(!fdir.exists())
			fdir.mkdir();
		
		sqlFileName = allocSqlFileName();
		String fileUrl = sqlpath + sqlFileName;
		//System.out.println(fileUrl);
		h_handleUsing = true;
		int ret = this.backupDatabase(sqlFileName, fileShowName, fileUrl, mod_user, bform, sc);
		h_handleUsing = false;
		return ret;
	}
	public static void main(String []args){
		String thisPath = "E:\\TeleframeMonitor\\.metadata\\.me_tcat\\webapps\\monitorWeb\\";
		thisPath = thisPath.replaceAll("\\\\", "/");
		System.out.println("thisPath="+thisPath);
		if(thisPath.charAt( thisPath.length()-1)=='/')
			thisPath = thisPath.substring(0,thisPath.length()-1);
		System.out.println("thisPath="+thisPath);
		int index = thisPath.lastIndexOf("/");
		String contextName = thisPath.substring(index+1, thisPath.length());
		thisPath = thisPath.substring(0, index);
		String sqlpath = thisPath + "/database/"+contextName+"/";
		sqlpath = sqlpath.replaceAll("\\\\", "/");
		
		System.out.println("sqlpath="+sqlpath);
	}
	/*
	 * 还原代码信息AJAX
	 */
	public int addTSRestoreDataMgr(String id, String use,
			ServletContext sc, HttpSession session) throws CustomException,
			Exception
	{
		String dbname = (String) sc.getAttribute("databaseName");
		if(dbname!=null)
			databaseName = dbname;
		//判断环境实例是否为空
		if(sc == null)
		{
			//////System.out.println("ServletContext 为空，返回。");
			throw new CustomException("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if(session == null)
		{
			//////System.out.println("HttpSession 为空，返回。");
			throw new CustomException("HttpSession 为空，返回");
		}

		//判断用户是否登录
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException("连接失效，请重新登录系统。");
		}

		//保存查询结果信息
		StringBuffer infoSB = null;

		Connection con = null;//保存数据库连接
		PreparedStatement pstm = null;//保存预处理语句
		ResultSet rs = null;//保存查询的结果集
		DataSource ds = null;
		String file = null;
		String dbSqlPath = "";
		int numb = 0;
		try
		{
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException("数据库连接Connection为空，连接失败。");
			}

			infoSB = new StringBuffer();

			pstm = con
					.prepareStatement("select value,recoverNumber,url from t_s_databack where id=?");
			// System.out.println(pstm);
			pstm.setInt(1, Integer.parseInt(id));

			rs = pstm.executeQuery();
			if(rs != null && rs.next())
			{
				file = rs.getString(1);
				numb = rs.getInt(2);
				dbSqlPath = rs.getString(3);
			}

			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "数据还原前查询成功！",dataMgrBean.class.getName());
		}
		 catch (SQLException sql)
			{
				sql.printStackTrace();
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "dataMgrBean.addTSRestoreDataMgr出现数据库连接错误,操作为：数据还原前查询失败!" + sql.getMessage(),dataMgrBean.class.getName());
				throw new CustomException("出现数据库连接方面的错误...");
			}
			catch (Exception ce)
			{
				ce.printStackTrace();
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "dataMgrBean.addTSRestoreDataMgr出现错误,操作为：数据还原前查询失败!" + ce.getMessage(),dataMgrBean.class.getName());
				throw new CustomException("出现未知异常错误。");
			}
		finally
		{
			//关闭所有可用资源
			close(rs, pstm, null, con);
		}
		String address = "127.0.0.1";
		String add  = (String) sc.getAttribute("databaseIP");
		if(add!=null)
			address = add;
		String port = "3306";
		String root = "root";
		String pass = "teleframe20130301";
		String thisPath = sc.getRealPath("/");
		String mysqlpaths = thisPath+"/WEB-INF/mysql/bin/";

		String stmt1 = mysqlpaths + "mysqladmin -h " + address + " -P " + port
				+ " -u " + root + " -p" + pass + " create " + " "
				+ databaseName; // -p后面加的是你的密码
		String stmt2 = mysqlpaths + "mysql -h " + address + " -P " + port
				+ " -u " + root + " -p" + pass + " " + databaseName + "  < "
				+ dbSqlPath;
		System.out.println("stmt1="+stmt1);
		System.out.println("stmt2="+stmt2);
		String[] cmd =
		{ "cmd", "/c", stmt2 };
		try
		{
			Runtime.getRuntime().exec(stmt1);
			Runtime.getRuntime().exec(cmd);
		//	System.out.println("数据已从 " + dbSqlPath + " 导入到数据库中");
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dqsj = sdf1.format(new Date());
		//判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if(session == null)
		{
			//////System.out.println("HttpSession 为空，返回。");
			throw new CustomException("HttpSession 为空，返回");
		}

		//判断用户是否登录

		baseForm bform1 = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException("连接失效，请重新登录系统。");
		}

		//保存SQL语句
		StringBuffer sqlSB = null;

		/*   Connection con1=null;//保存数据库连接
		 PreparedStatement pstm2=null;//保存预处理语句
		 DataSource ds2=null;*/
		try
		{
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException("数据库连接Connection为空，连接失败。");
			}

			sqlSB = new StringBuffer();

			sqlSB
					.append("UPDATE  t_s_databack SET recoverTime=?,recoverBy=?,recoverNumber=? where status=1 and id=? ");
			//    conSB.append
			//    String cishu = null;
			pstm = con.prepareStatement(basePublic.in(sqlSB.toString()));

			pstm.setString(1, dqsj);
			pstm.setString(2, use);
			if(numb == 0)
			{
				numb = 1;
			}
			else
			{
				numb++;
			}
			pstm.setInt(3, numb);
			pstm.setInt(4, Integer.parseInt(id));

			int num = pstm.executeUpdate();
		//	System.out.println(num);
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "数据类型信息还原成功！",dataMgrBean.class.getName());
			return num;
		}
		 catch (SQLException sql)
			{
				sql.printStackTrace();
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "dataMgrBean.addTSRestoreDataMgr出现数据库连接错误,操作为：数据类型信息还原失败!" + sql.getMessage(),dataMgrBean.class.getName());
				throw new CustomException("出现数据库连接方面的错误...");
			}
			catch (UnsupportedEncodingException ue)
			{
				ue.printStackTrace();
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "dataMgrBean.addTSRestoreDataMgr出现转化字符错误,操作为：数据类型信息还原失败!" + ue.getMessage(),dataMgrBean.class.getName());
				throw new CustomException("转化字符集时出现错误。");
			}
			catch (Exception ce)
			{
				ce.printStackTrace();
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "dataMgrBean.addTSRestoreDataMgr出现错误,操作为：数据类型信息还原失败!" + ce.getMessage(),dataMgrBean.class.getName());
				throw new CustomException("出现未知异常错误。");
			}
		finally
		{
			//关闭所有可用资源
			close(null, pstm, null, con);
		}
	}
	public String downloadFile(String id,HttpSession session,ServletContext sc) throws CustomException, SQLException
	{
	//	System.out.println("downloadFile="+id);
		//判断环境实例是否为空
		if(sc == null)
		{
			//////System.out.println("ServletContext 为空，返回。");
			throw new CustomException("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if(session == null)
		{
			//////System.out.println("HttpSession 为空，返回。");
			throw new CustomException("HttpSession 为空，返回");
		}

		//判断用户是否登录
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException("连接失效，请重新登录系统。");
		}
         //保存SQL语句
	       StringBuffer sqlSB = null;
	       Connection con=null;//保存数据库连接
	       PreparedStatement pstm=null;//保存预处理语句
	       ResultSet rs=null;
	     //保存查询结果信息
	       StringBuffer infoSB=null;
	       infoSB = new StringBuffer();
	       try
	       {
	           con=((DataSource)sc.getAttribute("basedb")).getConnection();
	           if (con==null)
	           {
	               throw new CustomException("数据库连接Connection为空，连接失败。");
	           }

	           
	           sqlSB=new StringBuffer();
	           sqlSB.append("select ");
	           sqlSB.append("value from t_s_databack where id=?");
	           pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
	           pstm.setInt(1, Integer.parseInt(id));
	           rs=pstm.executeQuery(); 
	           while(rs!=null&&rs.next()){
	        	   infoSB.append(basePublic.out(rs.getString("value")));
	           }
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "下载数据信息成功！",dataMgrBean.class.getName());
	       }
	       catch (SQLException sql)
			{
				sql.printStackTrace();
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "dataMgrBean.downloadFile出现数据库连接错误,操作为：下载数据信息失败!" + sql.getMessage(),dataMgrBean.class.getName());
				throw new CustomException("出现数据库连接方面的错误...");
			}
			catch (UnsupportedEncodingException ue)
			{
				ue.printStackTrace();
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "dataMgrBean.downloadFile出现转化字符错误,操作为：下载数据信息失败!" + ue.getMessage(),dataMgrBean.class.getName());
				throw new CustomException("转化字符集时出现错误。");
			}
			catch (Exception ce)
			{
				ce.printStackTrace();
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "dataMgrBean.downloadFile出现错误,操作为：下载数据信息失败!" + ce.getMessage(),dataMgrBean.class.getName());
				throw new CustomException("出现未知异常错误。");
			}
	       finally
	       {
	           //关闭所有可用资源
	           close(null,pstm,null,con);
	       }
	       return infoSB.toString();
	   }
}
