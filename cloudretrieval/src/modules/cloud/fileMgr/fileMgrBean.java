/*
 * @(#)codeBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.cloud.fileMgr;

import java.net.URL;
import java.net.URLEncoder;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import javax.sql.DataSource;
import javax.swing.text.DefaultEditorKit.InsertBreakAction;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import modules.ajgl.ajxxgl.casemanage.casemanageAction;
import modules.base.*;
import modules.location.locationBean;


public class fileMgrBean extends ResourceClose
{   
	
	public fileMgrBean()
	{
	//	System.out.println("new  fileMgrBean()");
	}
	
	public int saveURLStream(String srcUrl, String destUrl)
	throws IOException
	{
		URL url = null;
		url = new URL(srcUrl);
		File outFile = new File(destUrl);				
		OutputStream os;
		os = new FileOutputStream(outFile);
		InputStream is = null;
		is = url.openStream();
		byte[] buff = new byte[1024];				
		while(true) {					
			int readed = 0;
			readed = is.read(buff);
			if(readed == -1) {						
				break;					
			}					
			byte[] temp = new byte[readed];					
			System.arraycopy(buff, 0, temp, 0, readed);					
			os.write(temp);
		}
		is.close();                                 
		os.close();
		return 1;
	}

	public static void main(String[] args)  {
		String type = "*.mp4;*.avi;*.txt";
		type = type.replaceAll(";", ",");
		System.out.println(type);
		String cntstr="5";
		int cnt = Integer.parseInt(cntstr);
		/*
		fileMgrBean c = new fileMgrBean();
	//	c.startTask(0, "");
		String src = "http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=790";
		String dest="d:/url.jpg";
		try
		{
			c.saveURLStream(src, dest);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}*/
	}
	public int uploadFiles(String fileInfos, String path,
			long starTime, String locationId, long timespan,
			ServletContext sc,HttpSession session)
	throws CustomException,Exception
	{
		System.out.println("fileInfos:"+fileInfos);
		
		String filelist [] = fileInfos.split("</C>");
		System.out.println("length="+filelist.length);
		if(filelist.length<1)
			return 0;
		for(int i=0; i<filelist.length; i++){
			String[] fileinfo = filelist[i].split(",");
			System.out.println("filelist["+i+"]="+filelist[i]);
			if(fileinfo[0].endsWith("true") && Integer.parseInt(fileinfo[1])>0){
				String filename = fileinfo[3];
				String filevalue = fileinfo[2];
				int ret = uploadFile(filename, path, starTime+timespan*1000*i, locationId, filevalue, sc, session);
				System.out.println("save: "+filename+","+filevalue+","+ret);
			}
		}
		return 1;
	}
	
	public int uploadFile(String fileName, String path,
			long videodatetimeLong,String loactionId,String fileNameValue,
			ServletContext sc,HttpSession session)
	throws CustomException,Exception
	{
		String videodatetime = "";
		Date d = new Date();
		System.out.println("videodatetimeLong="+videodatetimeLong);
		d.setTime(videodatetimeLong);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        videodatetime = sdf.format(d);
		
        System.out.println("uploadfiles: " +fileNameValue);
		String strs[] = fileNameValue.split("</C>");
		if(strs.length>0)
			fileNameValue = strs[0];
		System.out.println("uploadfiles: " +fileNameValue);
		System.out.println("uploadFile");
		
		if (sc == null){
			throw new CustomException("ServletContext 为空，返回");
		}
		if (session==null){
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		baseForm bform=(baseForm)session.getAttribute("baseuser");
		System.out.println("session.getId(="+session.getId());
		String user_code = "";
		if (bform==null){
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}
		else
			user_code =bform.user_code;
		
		//保存SQL语句
		StringBuffer sqlSB = null;
		Connection con=null;//保存数据库连接
		PreparedStatement pstm=null;//保存预处理语句
		DataSource ds=null;
		int ret=0;
		try
		{
			ds=(DataSource)sc.getAttribute("basedb");
			con=ds.getConnection();
			if (con==null){
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}

			sqlSB=new StringBuffer();
			fileNameValue = fileNameValue.trim();
	//		fileNameValue = URLEncoder.encode(fileNameValue);
			String values = "values('"+fileName+"','"+fileNameValue+"','"+path+"','"+videodatetime+"','"+loactionId+"'";
			
			pstm = con.prepareStatement("select * from t_m_baseinfo where status=1 and work=1 limit 1");
			ResultSet rs = pstm.executeQuery();
			if(rs!=null && rs.next()){
				values += ",'" + rs.getString("videoserver") +"/"+ rs.getString("rpcwebroot")+"'";
				values += ",'" + user_code + "'";
			}
			values += ")";
			sqlSB.append("insert into t_m_videos(name, value, path, absTime, locationId, url, uploader) ").append(values);
			System.out.println(basePublic.in(sqlSB.toString()));
			pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
			ret = pstm.executeUpdate();
			if(ret>0){
				sqlSB.setLength(0);
				sqlSB.append("select id from t_m_videos where value='"+fileNameValue+"' and absTime='"+videodatetime+"' order by ctTime desc limit 1 ");
				System.out.println(sqlSB.toString());
				pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
				rs = pstm.executeQuery();
				if(rs!=null && rs.next()){
					ret = rs.getShort(1);
					System.out.println(ret);
				}
			}
		}
		catch (SQLException sql){
			sql.printStackTrace();
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}
		catch (UnsupportedEncodingException ue){
			ue.printStackTrace();
			throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//转化字符集时出现错误
		}
		catch (Exception ce){
			ce.printStackTrace();
			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally{
			//关闭所有可用资源
			close(null,pstm,null,con);
		}
		return ret;
	}
	public String getFilePath(long id, ServletContext sc,HttpSession session)
	throws CustomException,Exception{
		String filePath = "";
		if (sc == null){
			throw new CustomException("ServletContext 为空，返回");
		}
		if (session==null){
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		baseForm bform=(baseForm)session.getAttribute("baseuser");
		if (bform==null){
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}
		Connection con=null;//保存数据库连接
		StringBuffer sqlSB = null;
		ResultSet rs=null;//保存查询的结果集
		PreparedStatement pstm=null;//保存预处理语句
		try{
			con=((DataSource)sc.getAttribute("basedb")).getConnection();
			if (con==null){
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}
			sqlSB = new StringBuffer();
			sqlSB.append("select url,path,value from t_m_videos where id="+id);
			pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
			rs = pstm.executeQuery();
			if (rs != null && rs.next())
			{
				filePath = basePublic.out(rs.getString("url")+"/"+rs.getString("path"))+"/" + basePublic.out(rs.getString("value"));
			}
		}catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.queryTUPerson出现数据库连接错误，操作为：根据条件查询用户信息失败！"+sql.getMessage(),fileMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.queryTUfileMgr出现转化字符集错误，操作为：根据条件查询用户信息失败！"+ue.getMessage(),fileMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.queryTUfileMgr出现错误，操作为：根据条件查询用户信息失败！"+ce.getMessage(),fileMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally
		{
			//关闭所有可用资源
			close(rs,pstm,null,con);
		}
		System.out.println(filePath);
		return filePath;
		
	}
	/*
	 * if(bTaskEnable) taskId is the id of task
	 * else taskId is th id of file
	 * return path/nameValue
	 */
	public String getFilePathById(int taskId, boolean bTaskEnable, ServletContext sc,HttpSession session)
	throws CustomException,Exception{
		String filePath = "";
		if (sc == null){
			throw new CustomException("ServletContext 为空，返回");
		}
		if (session==null){
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		baseForm bform=(baseForm)session.getAttribute("baseuser");
		if (bform==null){
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}
		Connection con=null;//保存数据库连接
		StringBuffer sqlSB = null;
		ResultSet rs=null;//保存查询的结果集
		PreparedStatement pstm=null;//保存预处理语句
		try{
			con=((DataSource)sc.getAttribute("basedb")).getConnection();
			if (con==null){
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}
			sqlSB = new StringBuffer();
			if(bTaskEnable)
				sqlSB.append("select url,path,value from t_m_videos where id=(SELECT inputVideoId from t_m_tasks WHERE taskId="+taskId+")");
			else
				sqlSB.append("select url,path,value from t_m_videos where id="+taskId);
			pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
			rs = pstm.executeQuery();
			if (rs != null && rs.next())
			{
				filePath = basePublic.out(rs.getString("path"))+"/" + basePublic.out(rs.getString("value"));
			}
		}catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.queryTUPerson出现数据库连接错误，操作为：根据条件查询用户信息失败！"+sql.getMessage(),fileMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.queryTUfileMgr出现转化字符集错误，操作为：根据条件查询用户信息失败！"+ue.getMessage(),fileMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.queryTUfileMgr出现错误，操作为：根据条件查询用户信息失败！"+ce.getMessage(),fileMgrBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally
		{
			//关闭所有可用资源
			close(rs,pstm,null,con);
		}
		System.out.println(filePath);
		return filePath;
	}

	public int UpdateFile(String id,String values,
			ServletContext sc,HttpSession session) 
	throws CustomException,Exception
	{
		if (sc == null){
			throw new CustomException("ServletContext 为空，返回");
		}
		if (session==null){
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		baseForm bform=(baseForm)session.getAttribute("baseuser");
		if (bform==null){
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}
		StringBuffer sqlSB = null;
		Connection con=null;//保存数据库连接
		PreparedStatement pstm=null;//保存预处理语句
		Integer ret = 0;
		try{
			DataSource ds = (DataSource)sc.getAttribute("basedb");
			con=((DataSource)sc.getAttribute("basedb")).getConnection();
			if (con==null){
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}
			sqlSB=new StringBuffer();
			String[] value = values.split("</C>");
			sqlSB.append("update t_m_videos set "+value[0]+"  where id="+id);
			System.out.println(sqlSB.toString());
			pstm = con.prepareStatement(sqlSB.toString());
			ret = pstm.executeUpdate();
			
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "修改文件信息成功！",fileMgrBean.class.getName());

		}
		catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "fileMgrBean.UpdateFile出现数据库错误，操作为：" 
						+"修改文件信息失败" + sql.getMessage(),fileMgrBean.class.getName());
	           throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	       }
		 catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "fileMgrBean.UpdateFile出现错误，操作为：" 
						+"修改文件信息失败" + ce.getMessage(),fileMgrBean.class.getName());
	           throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	       }
        finally
        {
            //关闭所有可用资源
            close(null, pstm,null,con);
        }
        return ret;
	}

	
	public String beforeUpdateFile(int id, ServletContext sc,HttpSession session)
		throws CustomException,Exception
	{
		if (sc == null){
			throw new CustomException("ServletContext 为空，返回");
		}
		if (session==null){
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		baseForm bform=(baseForm)session.getAttribute("baseuser");
		if (bform==null){
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}
		//保存SQL语句
		StringBuffer sqlSB = null;
		StringBuffer countSB = null;
		StringBuffer infoSB = null;
		Connection con=null;//保存数据库连接
		PreparedStatement pstm=null;//保存预处理语句
		ResultSet rs=null;//保存查询的结果集 
	
		try{
			con=((DataSource)sc.getAttribute("basedb")).getConnection();
			if (con==null){
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}
			infoSB=new StringBuffer();
			sqlSB=new StringBuffer();
			sqlSB.append("select a.*, b.locationName from t_m_videos a, t_s_location b  where a.id="+id+" and a.locationId = b.locationId");
			System.out.println(sqlSB);
			pstm =con.prepareStatement(sqlSB.toString());
			rs = pstm.executeQuery();
			if (rs!=null && rs.next()){
				infoSB.append(basePublic.out(rs.getString("id"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("name"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("value"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("path"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("url"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("absTime"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("locationName"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("uploader"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("ctTime"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("bAnalyzed"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("analyzer"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("analyzeTime"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("status"))).append("</C>");
				infoSB.append("</R>");
            }
		}
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.queryTUfileMgr出现数据库连接错误，操作为：根据条件查询用户信息失败！"+sql.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.queryTUfileMgr出现转化字符集错误，操作为：根据条件查询用户信息失败！"+ue.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.queryTUfileMgr出现错误，操作为：根据条件查询用户信息失败！"+ce.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
        return infoSB.toString();
	}
	public String queryFile(int perPage,int curPage,String s, ServletContext sc,HttpSession session)
			throws CustomException,Exception
	{
		if (sc == null){
			throw new CustomException("ServletContext 为空，返回");
		}
		if (session==null){
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	
		baseForm bform=(baseForm)session.getAttribute("baseuser");
		if (bform==null){
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}
		//保存SQL语句
		StringBuffer sqlSB = null;
		StringBuffer countSB = null;
		StringBuffer infoSB = null;
		Connection con=null;//保存数据库连接
		PreparedStatement pstm=null;//保存预处理语句
		ResultSet rs=null;//保存查询的结果集
		PageMan pm=PageManFactory.getInstance();
		try{
			con=((DataSource)sc.getAttribute("basedb")).getConnection();
			if (con==null){
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}
			infoSB=new StringBuffer();
			sqlSB=new StringBuffer();
			countSB=new StringBuffer();
			sqlSB.append("select a.*, b.locationName from t_m_videos a, t_s_location b  where a.locationId = b.locationId");
			countSB.append("select count(1) from t_m_videos "); 
			if (s != null && s.length()>0)
			{
				sqlSB.append(s);
				countSB.append(s);
			}
			sqlSB.append(" order by id desc");
			countSB.append(" order by id desc");
	//		System.out.println(sqlSB);
			rs=pm.list(con, perPage, curPage, countSB.toString(), sqlSB.toString());
			while (rs!=null && rs.next()){
				infoSB.append(basePublic.out(rs.getString("id"))).append("</C>");
				infoSB.append("<input type='checkbox' id='check_"+basePublic.out(rs.getString("id"))+"'  name='checkList' onclick='forGet(this)'>").append("</C>");
				infoSB.append(basePublic.out(rs.getString("name"))).append("</C>");
				infoSB.append(basePublic.out(URLEncoder.encode(rs.getString("value")))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("path"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("url"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("absTime"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("locationName"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("uploader"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("ctTime"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("bAnalyzed"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("analyzer"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("analyzeTime"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("status"))).append("</C>");
				infoSB.append("</R>");
            }
			 infoSB.append("</F>");
			 infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
	         
		}
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.queryTUfileMgr出现数据库连接错误，操作为：根据条件查询用户信息失败！"+sql.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.queryTUfileMgr出现转化字符集错误，操作为：根据条件查询用户信息失败！"+ue.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.queryTUfileMgr出现错误，操作为：根据条件查询用户信息失败！"+ce.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
        return infoSB.toString();
	}
	
	//获取案例名称

	public String getCase(ServletContext sc,HttpSession session)
	throws CustomException,Exception
	{
//		判断环境实例是否为空
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
	    //保存SQL语句
	    StringBuffer sqlSB = null;
	    
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
	        sqlSB=new StringBuffer();
	        sqlSB.append("select ");
	        sqlSB.append("caseName,caseNo ");
	        sqlSB.append("from t_m_case where status=1");
	        
	        pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
	        rs=pstm.executeQuery();
	        
	        while (rs!=null && rs.next())
	        {	
	        	infoSB.append(basePublic.out(rs.getString(1)) + "</C>");
	        	infoSB.append(basePublic.out(rs.getString(2)) + "</C>");
	        	infoSB.append("</R>");
	        }
	        LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"获取案件名称成功！",fileMgrBean.class.getName());
	    }
	    catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.getCase出现数据库连接错误，操作为：查询案件名称失败！"+sql.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.getCase出现转化字符集错误，操作为：查询案件名称失败！"+ue.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.getCase出现错误，操作为：查询案件名称失败！"+ce.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
	    finally
	    {
	        //关闭所有可用资源
	        close(rs,pstm,null,con);
	    }
	    return infoSB.toString();
	}

	/*
	 * 添加代码信息AJAX
	 */
	public String addCaseDistribution(String labels, String values, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{
		System.out.println(labels);
		System.out.println(values);
		String a[] = values.split(",");
		String code = a[0];
		String video = a[1].substring(1, 4);
		System.out.println("code="+code);
		System.out.println("video="+video);
		// 判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		// 判断用户是否登录

		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}
		String tmp ="";
		List<String> list = new ArrayList<String>();
		// 保存SQL语句
		StringBuffer sqlSB = null;
		StringBuffer sqlSB2 = null;
		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句
		PreparedStatement pstm2 = null;// 保存预处理语句
		PreparedStatement pstm3 = null;// 保存预处理语句
		DataSource ds = null;
		ResultSet rs=null;//保存查询的结果集 
		ResultSet rs2=null;//保存查询的结果集 
		try
		{
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}
	        sqlSB=new StringBuffer();
	        sqlSB2=new StringBuffer();
	        pstm3 = con.prepareStatement("select name from t_m_videos where id="+video+" ");
	        rs2 = pstm3.executeQuery();
	        if(rs2!=null && rs2.next()){
	        	tmp = rs2.getString(1);
	        }
	        sqlSB.append("SELECT video_code FROM t_m_casevideos  WHERE case_code="+code+" ");
	        pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
	        rs=pstm.executeQuery();
	        boolean b=true;
	        while (rs!=null && rs.next())
	        {	
	        	
	        	list.add(rs.getString(1));
//	        	System.out.println(rs.getString(1));
	        	for(int p=0;p<list.size();p++){
	        		if(video.equals(list.get(p).toString()))
					{
	        			b=false;
//	        			System.out.println(video+"视频已存在");
	        			return tmp+"视频已存在";
//	        			break;
					}
	        	}
	        }
	        
	        if(b){
		        values = code+","+"'"+video+"'";	        			
		        System.out.println("nihao"+values);
		        sqlSB2.append("insert into t_m_casevideos(").append(labels).append(
		        ") values (").append(values).append(")");
		        System.out.println(sqlSB2.toString());
		        pstm2 = con.prepareStatement(basePublic.in(sqlSB2.toString()));
		        int num = pstm2.executeUpdate();
//		        System.out.println(video+"视频分配成功");
		        return tmp+"视频分配成功";
	        }
			
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "添加案件分发信息成功！",fileMgrBean.class.getName());
		}
		catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.addCaseDistribution出现数据库连接错误，操作为：添加案件分发信息失败！"+sql.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.addCaseDistribution出现转化字符集错误，操作为：添加案件分发信息失败！"+ue.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.addCaseDistribution出现错误，操作为：添加案件分发信息失败！"+ce.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
		finally
		{
			// 关闭所有可用资源
			close(null, pstm, null, con);
		}
		return tmp;
	}
	
	//获取视频URL
	public String getUrl(String id,ServletContext sc,HttpSession session)
	throws CustomException,Exception
	{
	    if (sc == null){
	        throw new CustomException("ServletContext 为空，返回");
	    }
	    if (session==null){
	        throw new CustomException("HttpSession 为空，返回");
	    }
	    ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

	    baseForm bform=(baseForm)session.getAttribute("baseuser");
	    if (bform==null){
	    	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
	    }
	    StringBuffer infoSB=null;
	    StringBuffer sqlSB = null;
	    Connection con=null;//保存数据库连接
	    PreparedStatement pstm=null;//保存预处理语句
	    ResultSet rs=null;//保存查询的结果集
	    try
	    {
	        con=((DataSource)sc.getAttribute("basedb")).getConnection();
	        if (con==null){
	        	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	        }
	        infoSB=new StringBuffer();
	        sqlSB=new StringBuffer();
	        sqlSB.append("SELECT url,path,value,bAnalyzed FROM t_m_videos  WHERE id='"+id+"' ");
	        pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
	        rs=pstm.executeQuery();
	        int analy =0;
	        while (rs!=null && rs.next())
	        {	
	        	analy =Integer.parseInt(rs.getString(4));
	        	if(analy == 1){
	        		infoSB.append(basePublic.out(rs.getString(1)) + "</C>");
	        		infoSB.append(basePublic.out(rs.getString(2)) + "</C>");
	        		infoSB.append("processed_input_files"+"</C>");
	        		infoSB.append(basePublic.out(rs.getString(3)) + "</C>");
//	        		System.out.println(infoSB.toString());
	        	}else {
	        		infoSB.append(basePublic.out(rs.getString(1)) + "</C>");
	        		infoSB.append(basePublic.out(rs.getString(2)) + "</C>");
	        		infoSB.append(basePublic.out(rs.getString(3)) + "</C>");
//	        		System.out.println(infoSB.toString());
				}
	        	infoSB.append("</R>");
	        }
	        LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"获取视频URL成功！",fileMgrBean.class.getName());
	    }
	    catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.getUrl出现数据库连接错误，操作为：获取视频URL失败！"+sql.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.getUrl出现转化字符集错误，操作为：获取视频URL失败！"+ue.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"fileMgrBean.getUrl出现错误，操作为：获取视频URL失败！"+ce.getMessage(),fileMgrBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
	    finally
	    {
	        //关闭所有可用资源
	        close(rs,pstm,null,con);
	    }
	    return infoSB.toString();
	}
}