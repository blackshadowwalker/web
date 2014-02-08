/*
 * @(#)codeBean.java
 * 
 * Copyright (C) ZXD Technologies. All rights reserved.
 * 
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.cloud.realAnaly;


import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import javax.sql.DataSource;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.mortbay.util.UrlEncoded;

import com.medianate.schlitter.api.TaskEndpoint;
import com.medianate.schlitter.api.WatchedFolderEndpoint;
import com.medianate.schlitter.api.data.ProducedAnalysis;
import com.medianate.schlitter.api.data.ProducedAnalysisStepReport;
import com.medianate.schlitter.api.data.ProducedFile;
import com.medianate.schlitter.api.data.ProducedThumbnail;
import com.medianate.schlitter.api.data.SimpleSource;
import com.medianate.schlitter.api.data.SimpleTask;
import com.medianate.schlitter.api.data.SourceDiffusion;
import com.medianate.schlitter.api.data.TaskDetail;
import com.medianate.schlitter.api.data.TaskPreview;
import com.medianate.schlitter.api.data.TaskSearchCriteria;
import com.medianate.schlitter.api.data.TaskSearchDTO;
import com.medianate.schlitter.api.data.WatchedFolderDetail;
import com.medianate.schlitter.api.exception.TaskValidationException;
import com.medianate.schlitter.api.impl.TaskEndpointImpl;
import com.medianate.schlitter.api.impl.WatchedFolderEndpointImpl;
import com.medianate.schlitter.dao.TaskNotFoundException;
import com.medianate.schlitter.edl.Edl;
import com.medianate.schlitter.edl.Source;
import com.medianate.schlitter.edl.Sources;
import com.medianate.schlitter.edl.io.exception.EdlParseException;
import com.medianate.schlitter.edl.io.exception.EdlSerializationException;
import com.medianate.schlitter.exception.SchlitterException;
import com.sun.xml.bind.v2.runtime.output.Encoded;

import modules.base.*;
import modules.jcxx.person.personBean;
import java.util.Date;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class realAnalyBean extends ResourceClose
{
	static String AuthName = "admin";
	static String PASSWORD = "resonate";
	// String SOAP_WS_BASE_URL =
	// "http://114.251.82.250:7070/api/services/soap/";
	static String SOAP_WS_BASE_URL = "http://10.168.1.160:8080/api/services/soap/";
	static TaskEndpoint service = null;
	static WatchedFolderEndpoint watchService = null;

	boolean bDebug = false;
	long 	moreMillis = 5000; //5s
	int 	percent = 0;

	public int getCurPercent(ServletContext sc, HttpSession session)
	{
		Integer pt = (Integer)session.getAttribute("percent");
		if(pt==null)
			return 0;
		return pt;
	}

	public int getPercent()
	{
		return percent;
	}

	public void setPercent(int percent)
	{
		this.percent = percent;
	}

	public realAnalyBean()
	{
		// System.out.println("new  realAnalyBean()");
	}

	public int saveURLStream(String srcUrl, String destUrl) throws IOException
	{
		URL url = null;
		url = new URL(srcUrl);
		File outFile = new File(destUrl);
		OutputStream os;
		os = new FileOutputStream(outFile);
		InputStream is = null;
		is = url.openStream();
		byte[] buff = new byte[1024];
		while (true)
		{
			int readed = 0;
			readed = is.read(buff);
			if(readed == -1)
			{
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

	public void setAuth(String userName, String passWord)
	{
		System.out
				.println("Main: Authenticating using the HTTP digest method. userName="
						+ userName + " passWord=" + passWord);
		AuthName = userName;
		PASSWORD = passWord;
		Authenticator auth = new Authenticator()
		{
			@Override
			protected PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication(AuthName, PASSWORD
						.toCharArray());
			}
		};
		Authenticator.setDefault(auth);
		System.out.println("Auth seted !");
	}

	public byte[] readBytes(URL url) throws IOException
	{
		ByteArrayOutputStream bais = new ByteArrayOutputStream();
		InputStream is = null;
		try
		{
			is = url.openStream();
			byte[] byteChunk = new byte[4096];
			int n;

			while ((n = is.read(byteChunk)) > 0)
			{
				bais.write(byteChunk, 0, n);
			}
		}
		finally
		{
			if(is != null)
			{
				is.close();
			}
		}

		return bais.toByteArray();
	}

	public String dumpReportByUrl(String urlString)
	{
		String LPNubmer = "";
		try
		{
			URL url = new URL(urlString);
			byte[] bytes = readBytes(url);
			String details = new String(bytes, "UTF8");
			String str1[] = details.split("Content=");
			// System.out.println("length="+str1.length);
			if(str1.length < 2)
			{
				System.out.println("length<1");
				return "";
			}
			// System.out.println(str1[1]);
			LPNubmer = str1[1].split(" ")[0];
			// System.out.println("LPNumber="+LPNubmer);
		}
		catch (IOException ioe)
		{
			System.out.println(ioe.getMessage());
		}
		return LPNubmer;
	}

	public Task getTaskInfo(long taskId) 
	{
		Task task = new Task();
		try
		{
			task.setTaskDetail(taskId, SOAP_WS_BASE_URL);
		}
		catch (TaskNotFoundException e)
		{
			e.printStackTrace();
		}
		return task;
	}
	
	public static void main(String[] args) throws TaskNotFoundException
	{
		realAnalyBean b = new realAnalyBean();
		b.setAuth(AuthName, PASSWORD);
		service = new TaskEndpointImpl(SOAP_WS_BASE_URL + "TaskEndpointService");
		List<SourceDiffusion> sourceList = null;
		try
		{
			sourceList = service.getSourcesDiffusionUrls(300);
		}
		catch (EdlParseException e1)
		{
			e1.printStackTrace();
		}
		System.out.println(sourceList.get(0).getDiffusionUrl());
		Edl edl=null;
		try
		{
			edl = service.getEdl(300);
		}
		catch (EdlParseException e)
		{
			e.printStackTrace();
		}
		List<Source> sc = edl.getSources().getSource();
		System.out.println(sc.get(0).getInternalLocalPath());
	}


	public reportMgr getReport(long taskId, String absTimeString) throws TaskNotFoundException
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date absDatetime=null;
		try
		{
			absDatetime = sdf.parse(absTimeString);
		}
		catch (ParseException e)
		{
			e.printStackTrace();
		}
		
		reportMgr reportmgr = new reportMgr();
		if(service==null)
			service = new TaskEndpointImpl(SOAP_WS_BASE_URL + "TaskEndpointService");
		if(service==null){
			System.out.println("Create TaskEndpoint Service Failed!");
			return null;
		}
		TaskDetail taskDetail = service.getDetail(taskId);
		if(taskDetail==null){
			System.out.println("taskDetail==null");
			return null;
		}
		List<ProducedFile> pfile = taskDetail.getFiles();
		if(pfile!=null){
			reportmgr.producedFileUrl = pfile.get(0).getUrl();
			System.out.println("producedFileUrl=" + pfile.get(0).getUrl());
		}
		List<ProducedAnalysis> parList = taskDetail.getProducedAnalysisReports();
		if(parList==null){
			System.out.println("parList==null");
			return null;
		}
		System.out.println("parListSize=" + parList.size());
		for (ProducedAnalysis par : parList)
		{
			reportmgr.OriginalMediafileUri = par.getOriginalMediafileUri();
			System.out.println("OriginalMediafileUri="+ par.getOriginalMediafileUri());
			List<ProducedThumbnail> pnailList = par.getProducedThumbnails();
			System.out.println("pnailListSize=" + pnailList.size());
			List<ProducedAnalysisStepReport> stepReports = par.getStepReports();
			System.out.println("stepReportsSize=" + stepReports.size());

			System.out.println(" id	frameIndex	frameCtsUs		picurl				 contentUrl"); 
			int length = pnailList.size(); 
			for(int i=0; i<length; i++){
				
				ProducedThumbnail pth = pnailList.get(i);
				ProducedAnalysisStepReport sr = stepReports.get(i);
				
				reportDetail rd = new reportDetail();
				rd.setId(sr.getId());
				rd.setFrameIndex(sr.getFrameIndex());
				rd.setFrameCtsUs(sr.getFrameCtsUs());
				rd.setReportUrl(sr.getReportUrl());
				rd.setLPNPicUrl(pth.getUrl());
				rd.setLPNumber(dumpReportByUrl(sr.getReportUrl()));
				rd.setTime(absDatetime.getTime() + sr.getFrameCtsUs()/1000000);
				
				reportmgr.addReportDetail(rd);
			}

		}
		return reportmgr;
	}

	/*
	 * Get watchfolder id by watchfolder name
	 */
	public long getWidByName(String wName)
	{
		if(watchService == null) watchService = new WatchedFolderEndpointImpl(
				SOAP_WS_BASE_URL + "WatchedFolderEndpointService");
		if(watchService == null)
		{
			System.out.println("Create watchService failed!");
			return 0;
		}
		List<WatchedFolderDetail> wList = watchService.findAllWatchedFolders();
		long wid = 0;
		for (int i = 0; i < wList.size(); i++)
		{
			WatchedFolderDetail wf = wList.get(i);
			if(bDebug)
			{
				System.out.print(" id=" + wf.getId());
				System.out.print("   getUsername=" + wf.getUsername());
				System.out.println("  url=" + wf.getWatchedFolderUrl());
			}
			if(wf.getWatchedFolderUrl().equals("/" + wName + "/"))
			{
				wid = wf.getId();
				break;
			}
		}
		return wid;
	}

	/*
	 * start process by create tasks
	 */
	public String startProcessT()
	{
		setAuth("admin", "resonate");
		return "";
	}
	
	public List<Long>  saveTasks(List<Long> taskIds, String locationId, ServletContext sc, HttpSession session) 
	throws CustomException,	Exception
	{
		List<Long> ids = new ArrayList<Long>();
		boolean retBool = false;
		StringBuffer sqlSB = null;
		Connection con=null;//保存数据库连接
		PreparedStatement pstm=null;//保存预处理语句
		DataSource ds=null;
		ResultSet rs = null;
		int ret=0;
		baseForm bform = (baseForm) session.getAttribute("baseuser");
		System.out.println("save tasks");
		try
		{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String time = sdf.format(new Date());
	        
			ds=(DataSource)sc.getAttribute("basedb");
			con=ds.getConnection();
			if (con==null){
				throw new CustomException("数据库连接Connection为空，连接失败。");
			}
			sqlSB=new StringBuffer();
			
			sqlSB.append("insert into t_m_tasks(taskID, locationId, state, inputVideoId, outputVideoId, ctTime)");
			sqlSB.append(" values");
			for(int i=taskIds.size()-1; i>=0; i--){
				Task task = getTaskInfo(taskIds.get(i));
				task.print();
				if(task==null || task.getInputVideoName().length()<1){
					continue;
				}
				pstm = con.prepareStatement("select * from t_m_tasks where taskId="+taskIds.get(i));
				rs = pstm.executeQuery();
				if(rs!=null && rs.next()){
					taskIds.remove(i);
					continue;
				}
				sqlSB.append("('"+taskIds.get(i)+"'");
				sqlSB.append(",'"+locationId+"'");
				sqlSB.append(",'Processing'");
				sqlSB.append(",(SELECT id from t_m_videos where value like '%"+task.inputVideoName+"%' ORDER BY id desc LIMIT 1)");
				sqlSB.append(",'"+task.outputVideoUrl+"'");
				sqlSB.append(",'"+time+"'");
				sqlSB.append(")");
				if(i==0)
					sqlSB.append(";");
				else
					sqlSB.append(",");
			}
			
			System.out.println(sqlSB.toString());
			
			if(sqlSB.length()>0 && taskIds.size()>0){
				pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
				ret = pstm.executeUpdate();
				if(ret<1){
					retBool = false;
				}else
					retBool = true;
			}
			String taskIdstr = "";
			for(int i=0; i<taskIds.size(); i++){
				taskIdstr += taskIds.get(i);
				if(i!=taskIds.size()-1)
					taskIdstr += ",";
			}
			sqlSB.setLength(0);
			sqlSB.append(" update t_m_videos set bAnalyzed=1, analyzer='"+bform.user_code+"', analyzeTime='"+time+"' " +
					"where id in ( SELECT inputVideoId FROM t_m_tasks where taskID in ("+taskIdstr+") )");
			System.out.println(sqlSB.toString());
			pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
			ret = pstm.executeUpdate();
			
			/*
			//update vidoes's path (add processed_input_files)
			Map<Long,String>  map = new HashMap<Long,String>();
			sqlSB.setLength(0);
			sqlSB.append("select id,path from t_m_videos where id in ( SELECT inputVideoId FROM t_m_tasks where taskID in ("+taskIdstr+") )");
			pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
			rs = pstm.executeQuery();
			while(rs!=null && rs.next()){
				map.put(rs.getLong("id"), rs.getString("path"));
			}
			
			sqlSB.setLength(0);
			for(Entry<Long, String> entry: map.entrySet()){
				sqlSB.append("update t_m_videos set path='"+entry.getValue()+"/processed_input_files'"+" where id="+entry.getKey()+"; ");
			}
			System.out.println(sqlSB.toString());
			pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
			ret = pstm.executeUpdate();
			*/
			
			//Get ids by taskID
			for(int i=0; i<taskIds.size(); i++){
				sqlSB.setLength(0);
				sqlSB.append("select id from t_m_tasks where taskID="+taskIds.get(i));
				System.out.println(sqlSB);
				pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
				rs = pstm.executeQuery();
				if(rs!=null && rs.next())
					ids.add(rs.getLong("id"));
			}
		}
		catch (SQLException sql){
			sql.printStackTrace();
			throw new CustomException("出现数据库连接方面的错误..."+sql.getMessage());
		}
		catch (UnsupportedEncodingException ue){
			ue.printStackTrace();
			throw new CustomException("转化字符集时出现错误:"+ue.getMessage());
		}
		catch (Exception ce){
			ce.printStackTrace();
			throw new CustomException("出现未知异常错误:"+ce.getMessage());
		}
		finally{
			//关闭所有可用资源
			close(null,pstm,null,con);
		}
		System.out.println(ids.toString());
		return ids;
	}
	
	public List<Long> saveReport(List<Long> taskIds,ServletContext sc, HttpSession session) 
		throws CustomException,	Exception
	{
		StringBuffer sqlSB = null;
		Connection con=null;//保存数据库连接
		PreparedStatement pstm=null;//保存预处理语句
		DataSource ds=null;
		ResultSet rs = null;
		List<Long> tid = new ArrayList<Long>();
		baseForm bform = (baseForm) session.getAttribute("baseuser");
		int ret=0;
		System.out.println("save Report");
		try
		{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String time = sdf.format(new Date());
	        
			ds=(DataSource)sc.getAttribute("basedb");
			con=ds.getConnection();
			if (con==null){
				throw new CustomException("数据库连接Connection为空，连接失败。");
			}
			sqlSB=new StringBuffer();
			System.out.println("size="+taskIds.size());
			System.out.println(taskIds.toArray().toString());
			for(int i=0; i<taskIds.size(); i++){
				long taskid = taskIds.get(i);
				pstm = con.prepareStatement("select v.absTime,t.id from t_m_videos v,t_m_tasks t where t.taskID="+taskid+" and v.id=t.inputVideoId ");
				rs = pstm.executeQuery();
				String absTime = "";
				if(rs!=null && rs.next()){
					absTime = rs.getString("absTime");
					tid.add(rs.getLong("id"));
				}
				reportMgr rg = getReport(taskid, absTime);
				if(rg==null)
					continue;
				if(service == null) service = new TaskEndpointImpl(SOAP_WS_BASE_URL + "TaskEndpointService");
				TaskDetail taskDetail = service.getDetail(taskid);
				String taskState = taskDetail.getState();
		//		if(taskState.equals("Completed")){
					sqlSB.setLength(0);
					sqlSB.append(" update t_m_tasks set state='"+taskState+"', creator='"+bform.user_code+"', outputVideoId='"+rg.getProducedFileUrl()+"' where taskID="+taskid+"; ");
					System.out.println(sqlSB.toString());
					pstm = con.prepareStatement(sqlSB.toString());
					ret = pstm.executeUpdate();
			//	}

				sqlSB.setLength(0);
				sqlSB.append(" update t_m_report set status=0 where taskId="+taskid);
				System.out.println(sqlSB.toString());
				pstm = con.prepareStatement(sqlSB.toString());
				ret = pstm.executeUpdate();

				sqlSB.setLength(0);
				sqlSB.append(" insert into t_m_report(taskId, LPNumber, absTime, frameIndex, frameCTS, confidence, posX, posY, width, height, picUrl, ctTime) ");
				sqlSB.append(" values");
				for(int j=0; j<rg.getReportList().size(); j++){
					reportDetail rd = rg.getReportDetail(j);
					sqlSB.append("(");
					sqlSB.append("'" + taskid + "',");
					sqlSB.append("'" + rd.getLPNumber() + "',");
					sqlSB.append("'" + sdf.format(rd.getTime()) + "',");
					sqlSB.append("'" + rd.getFrameIndex() + "',");
					sqlSB.append("'" + rd.getFrameCtsUs() + "',");
					sqlSB.append("'" + rd.getConfidence() + "',");
					sqlSB.append("'" + rd.getPos_x() + "',");
					sqlSB.append("'" + rd.getPos_y() + "',");
					sqlSB.append("'" + rd.getWidth() + "',");
					sqlSB.append("'" + rd.getHeight() + "',");
					sqlSB.append("'" + rd.getLPNPicUrl()+ "',");
					sqlSB.append("'" + time + "')");
					if(j!=rg.getReportList().size()-1)
						sqlSB.append(",\n");
					else
						sqlSB.append(";");
				}
				System.out.println(sqlSB.toString());
				pstm = con.prepareStatement(sqlSB.toString());
				ret = pstm.executeUpdate();
				System.out.println("Updated lines: "+ ret + " at task=" + taskid);
			}
		}
		catch (SQLException sql){
			sql.printStackTrace();
			throw new CustomException("出现数据库连接方面的错误..."+sql.getMessage());
		}
		catch (Exception ce){
			ce.printStackTrace();
			throw new CustomException("出现未知异常错误:"+ce.getMessage());
		}
		finally{
			//关闭所有可用资源
			close(null,pstm,null,con);
		}
		return tid;
	}
	
	public boolean updateBaseInfo(ServletContext sc, HttpSession session) 
		throws CustomException,	Exception
	{
		boolean retbool = false;
		DataSource ds=(DataSource)sc.getAttribute("basedb");
		Connection con = ds.getConnection();
		if (con==null){
			throw new CustomException("数据库连接Connection为空，连接失败。");
		}
		PreparedStatement pstm = con.prepareStatement("select * from t_m_baseinfo where status=1 and work=1 limit 1");
		ResultSet rs = pstm.executeQuery();
		if(rs!=null && rs.next()){
			String soap = rs.getString("defaultSoapUrl");
			String Name = rs.getString("defaultAuthName");
			String password = rs.getString("defaultAuthPwd");

			System.out.println("soap="+soap);

			if(soap!=null)
				SOAP_WS_BASE_URL = soap;
			if(Name!=null)
				AuthName = Name;
			if(password!=null)
				PASSWORD = password;
			retbool = true;
		}
		else 
			retbool = false;
		rs.close();
		pstm.close();
		con.close();
		System.out.println("soapURL="+SOAP_WS_BASE_URL);

		return retbool;
	}

	public List<Long> StartProcess(List<String> fileList) 
	throws TaskValidationException, SchlitterException, EdlParseException, EdlSerializationException
	{
		List<Long> taskIds = new ArrayList<Long>();
		if(service == null)	
			service = new TaskEndpointImpl(SOAP_WS_BASE_URL + "TaskEndpointService");
		for(int i=0; i<fileList.size(); i++){
			SimpleTask task = new SimpleTask();
			List<SimpleSource>	sources = new ArrayList<SimpleSource>();
			SimpleSource source = new SimpleSource();
			String videourl = fileList.get(i);
			System.out.println(videourl);
			source.setUrl( videourl);
			sources.add(source);
			task.setSources(sources);
			task.setDestination("processed_input_files"+fileList.get(i)+"_out.mp4");
			task.setPriority(3);
			TaskDetail taskDetail = null;
			taskDetail = service.createByProfile(100, task);
			if(taskDetail!=null){
				long taskId = taskDetail.getId();
				taskIds.add(taskId);
				service.start(taskId);
				System.out.println("Created task at id="+taskId+" and started!["+fileList.get(i)+"]");
			}
		}
		return taskIds;
	}
	
	public String processFile(String []files, String loactionId,
			ServletContext sc, HttpSession session) 
	throws CustomException,	Exception
	{
		System.out.println("procesFile="+files.length);
		for(int j=0; j<files.length; j++)
			System.out.println(files[j]);
		String retString = "";
		if(sc == null){
			throw new CustomException("ServletContext 为空，返回");
		}
		if(session == null){
			throw new CustomException("HttpSession 为空，返回");
		}
		baseForm bform = (baseForm) session.getAttribute("baseuser");
		if(bform == null){
			throw new CustomException("连接失效，请重新登录系统。");
		}
		String userName = bform.user_code;
		
		session.setAttribute("percent", 0);
		updateBaseInfo(sc, session);
		setAuth(AuthName, PASSWORD);
		List<String> fileList = new ArrayList<String>();
		for(int i=0; i<files.length; i++){
			fileList.add(files[i]);
		}
		List<Long> taskIds = StartProcess(fileList);
		
		if(taskIds==null){
			return "";
		}
		List<Long> ids = saveTasks(taskIds, loactionId, sc, session);
		if(ids==null){
			System.out.println("Report is null!");
			return "";
		}
		MonitorTasks(taskIds, sc, session);
		saveReport(taskIds, sc, session);
		for (int i = 0; i < taskIds.size(); i++)
		{
			retString += taskIds.get(i) + "</C>";
		}
		System.out.println(retString);
		return retString;
	}
	/*
	 * start process by watchfolder return task ids
	 */
	public String startProcessW(Date minCreationDate, Date maxCreationDate, String loactionId,int videoSum,
			ServletContext sc, HttpSession session) 
	throws CustomException,	Exception
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
		if(session.getId()!=bform.sessionID){
			System.out.println("你的账户已经从其他客户端登录!");
			throw new CustomException("你的账户已经从其他客户端登录!");
		}
		session.setAttribute("percent", 0);
		updateBaseInfo(sc, session);
		
		Thread.sleep(5000);
		maxCreationDate = new Date();
		System.out.println(minCreationDate.toLocaleString());
		System.out.println(maxCreationDate.toLocaleString());

		setAuth(AuthName, PASSWORD);
		String retString = "";
		String userName = bform.user_code;
		bDebug = true;
		long wId = getWidByName(userName);
		System.out.println("wName:" + userName + "  wid=" + wId);

		List<Long> taskIds = searchTidsByTimespan(wId, videoSum, minCreationDate,maxCreationDate);
		
		if(taskIds==null){
			return "";
		}
		List<Long> ids = saveTasks(taskIds, loactionId, sc, session);
		if(ids==null){
			System.out.println("Report is null!");
			return "";
		}
		String retmo = MonitorTasks(taskIds, sc, session);
		saveReport(taskIds, sc, session);
		for (int i = 0; i < taskIds.size(); i++)
		{
			retString += taskIds.get(i) + "</C>";
		}
		System.out.println(retString);
		return retString;
	}

	public List<Long> searchTidsByTimespan(long wId, int videoSum, Date minCreationDate,
			Date maxCreationDate)
	{
		List<Long> tIds = new ArrayList<Long>();
		try
		{
			if(service == null) 
				service = new TaskEndpointImpl(SOAP_WS_BASE_URL	+ "TaskEndpointService");
			if(service==null){
				System.out.println("Create TaskEndpoint Service Failed!");
				return null;
			}
			TaskSearchCriteria criteria = new TaskSearchCriteria();
			// paging disabled
			boolean pageMode = false;
			long firstRow = 0;
			long maxRows = -1;
			
			criteria.setWatchedFolderId(wId);
			// SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			// Date minCreationDate = ft.parse("2013-06-01 06:00:00");
			// Date maxCreationDate = ft.parse("2013-07-01 18:00:00");
			List<TaskPreview> taskPreviewList = null;
			int timesout = 10;
			do
			{
				maxCreationDate = new Date();
				criteria.setMinCreationDate(minCreationDate);
				criteria.setMaxCreationDate(maxCreationDate);
				TaskSearchDTO result = service.search(criteria, true, pageMode,firstRow, maxRows);
				taskPreviewList = result.getTaskPreviewList();
				if(timesout<10){
					System.out.println("No task found for this watched folder .timesout reminid:"+timesout);
					Thread.sleep(moreMillis);
				}
				timesout --;
			}while(timesout > 0 && (taskPreviewList == null || taskPreviewList.size() < videoSum));
			if(timesout<=0)
			{
				System.out.println("Sorry No task found for this watched folder. Returning.");
				return null;
			}
			else
			{
				// sort by last update time (most recent at end)
				Collections.sort(taskPreviewList, new Comparator<TaskPreview>()
				{
					public int compare(TaskPreview o1, TaskPreview o2)
					{
						return o1.getLastUpdate().compareTo(o2.getLastUpdate());
					}
				});

				int id;
				System.out.println("-----------Get full task detail ---------------");
				for (id = 0; id < taskPreviewList.size(); id++)
				{
					// get full task detail
					TaskPreview taskPreview = taskPreviewList.get(id);
					TaskDetail taskDetail = service.getDetail(taskPreview
							.getId());
					tIds.add(taskDetail.getId());
					System.out.println("tId=" + taskDetail.getId());
				}
				System.out.println("Number of tasks : " + id);
				System.out.println("-------------------------------------------------");
			}
		}
		catch (Exception e)
		{
			System.err.println("Something went wrong in main! Exception: " + e);
			e.printStackTrace();
		}
		return tIds;
	}

	public void setTaskState(long taskId, String state, ServletContext sc, HttpSession session) throws CustomException{
		DataSource ds=null;
		Connection con = null;
		PreparedStatement pstm = null;
		try
		{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String time = sdf.format(new Date());
	        
			ds = (DataSource)sc.getAttribute("basedb");
			con=ds.getConnection();
			if (con==null){
				throw new CustomException("数据库连接Connection为空，连接失败。");
			}
			String sql = "update t_m_tasks set state='"+state+"' where taskID="+taskId;
			System.out.println(sql);
			pstm = con.prepareStatement(sql);
			int ret = pstm.executeUpdate();
			System.out.println("Updated lines: "+ ret + " at task=" + taskId);
		}
		catch (SQLException sql){
			sql.printStackTrace();
			throw new CustomException("出现数据库连接方面的错误..."+sql.getMessage());
		}
		catch (Exception ce){
			ce.printStackTrace();
			throw new CustomException("出现未知异常错误:"+ce.getMessage());
		}
		finally{
			//关闭所有可用资源
			close(null,pstm,null,con);
		}
	}
	public String MonitorTasks(List<Long> taskIdList, ServletContext sc, HttpSession session) throws TaskNotFoundException
	{
		setPercent(0);
		String ret="";
		session.setAttribute("percent", 0);
		System.out.println("percent=" + getPercent());
		System.out.println("------------------- MonitorTasks -----------------------");
		List<Long> taskIds = new ArrayList<Long>();
		List<String> taskStates = new ArrayList<String>();
		for(int i=0; i<taskIdList.size(); i++){
			taskIds.add(taskIdList.get(i));
			if(service == null) service = new TaskEndpointImpl(
					SOAP_WS_BASE_URL + "TaskEndpointService");
			long taskId = taskIdList.get(i);
			TaskDetail taskDetail = service.getDetail(taskId);
			String taskState = taskDetail.getState();
			taskStates.add(taskState);
		}
		while (taskIds.size() > 0)
		{
			int pt = 0;
			try
			{
				if(service == null) service = new TaskEndpointImpl(
						SOAP_WS_BASE_URL + "TaskEndpointService");
				for (int i = taskIds.size() - 1; i >= 0; i--)
				{
					long taskId = taskIds.get(i);
					TaskDetail taskDetail = service.getDetail(taskId);
					String taskState = taskDetail.getState();
//					if(("Finalizing").equals(taskState))
//						throw new  CustomException("该文件已经被处理过，不能再次处理！");
					if(!taskStates.get(i).equals(taskState)){
						setTaskState(taskId, taskState, sc, session);//状态改变，修改数据库
					}
					// Cancelled  Completed  
					if(taskState.equals("Completed") || taskState.equals("Cancelled") || taskState.endsWith("Failed"))
					{
						System.out.println("remove monitor task at id="+taskId +" state="+taskState);
						taskIds.remove(i);
					}
					else
					{
						pt += taskDetail.getCurrentStateProgression();
						System.out.print(" [taskId=" + taskDetail.getId());
						System.out.print("  State=" + taskState);
						System.out.print("  Percent=" + taskDetail.getCurrentStateProgression()+"] ");
					}
				}
				if(taskIds.size() < 1) break;
				pt = pt / (taskIds.size());
				setPercent(pt);
				session.setAttribute("percent", pt);
				System.out.println("	Total Percent=" + getPercent());
				Thread.sleep(1000);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		setPercent(100);
		session.setAttribute("percent", 100);
		System.out.println("Monitor Finished!");
		System.out.println("---------------------------------------------------------");
		return "";
	}
	

}