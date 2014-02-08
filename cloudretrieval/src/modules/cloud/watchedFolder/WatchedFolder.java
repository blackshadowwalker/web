package modules.cloud.watchedFolder;

/*
 * write-by : Karl 
 * Date : 2013.4.10 16:28
 * 
 */

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import modules.base.CustomException;
import modules.base.LogBean;
import modules.base.PageMan;
import modules.base.PageManFactory;
import modules.base.ResourceClose;
import modules.base.baseForm;
import modules.base.basePublic;


import com.medianate.schlitter.api.TaskEndpoint;
import com.medianate.schlitter.api.UserMediaRootManagerEndpoint;
import com.medianate.schlitter.api.WatchedFolderEndpoint;
import com.medianate.schlitter.api.data.ProducedAnalysis;
import com.medianate.schlitter.api.data.ProducedAnalysisStepReport;
import com.medianate.schlitter.api.data.TaskDetail;
import com.medianate.schlitter.api.data.TaskPreview;
import com.medianate.schlitter.api.data.TaskSearchCriteria;
import com.medianate.schlitter.api.data.TaskSearchDTO;
import com.medianate.schlitter.api.data.UserMediaFile;
import com.medianate.schlitter.api.data.WatchedFolderDetail;
import com.medianate.schlitter.api.exception.TaskValidationException;
import com.medianate.schlitter.api.impl.TaskEndpointImpl;
import com.medianate.schlitter.api.impl.UserMediaRootManagerEndpointImpl;
import com.medianate.schlitter.api.impl.WatchedFolderEndpointImpl;
import com.medianate.schlitter.dao.TaskNotFoundException;
import com.medianate.schlitter.edl.Sources;
import com.medianate.schlitter.edl.io.exception.EdlParseException;


public class WatchedFolder  extends ResourceClose  implements Runnable
{
	static String SOAP_WS_BASE_URL = "http://10.168.1.160:8080/api/services/soap/";    
    static String AuthName = "admin"; 
    static String PASSWORD = "resonate";
    
    static List<MedianteForm> mform = null;
    static TaskEndpoint service=null;
    static WatchedFolderEndpoint service1=null;
    static UserMediaRootManagerEndpoint service2=null;
    
    static String minTime=null;
    static String maxTime=null;
    MedianteForm userForm = null;
    public void run()
	{
    	
	}
	
	public WatchedFolder()
	{
		try{
			if(service == null)	
				service = new TaskEndpointImpl(SOAP_WS_BASE_URL + "TaskEndpointService");
		}
		catch(Exception e){
			service = null;
			mform = null;
			System.out.println(" new TaskEndpointImpl Exception");
			e.printStackTrace();
		}
		if(mform==null)
			mform = new ArrayList<MedianteForm>();
	//	System.out.println("Medianate()--> new TaskEndpointImpl ");
	}
	
	public int createMediante( ServletContext sc,HttpSession session)
	throws CustomException,Exception
	{
		MedianteForm userForm = new MedianteForm();
		int size = mform.size();
		userForm.userID = size+1;
		baseForm bform=(baseForm)session.getAttribute("baseuser");
		userForm.userCode = bform.user_code;
		mform.add(userForm);
		session.setAttribute("MedianteForm", userForm);
		return userForm.userID ;
	}
	
	public int setAuth(String userName, String passWord, int userID,ServletContext sc,HttpSession session)
	throws CustomException,Exception
	{
		userForm = (MedianteForm)session.getAttribute("MedianteForm");
		if(userForm==null)
			return 0;
		userForm.authName = userName;
    	userForm.authPwd = passWord;
    	session.setAttribute("MedianteForm", userForm);
    	userForm = (MedianteForm)session.getAttribute("MedianteForm");
		return 1;
	}
	
	public String	getfolderID(ServletContext sc,HttpSession session)
		throws CustomException,Exception
	{
		//int userID = this.createMediante(sc, session);
		
		//this.setAuth(AuthName, PASSWORD, userID, sc, session);
		//userForm = (MedianteForm)session.getAttribute("MedianteForm");
		
		Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
               return new PasswordAuthentication(AuthName, PASSWORD.toCharArray());
            }
        };
    	Authenticator.setDefault(auth);
		
		service = new TaskEndpointImpl(SOAP_WS_BASE_URL + "TaskEndpointService");
		service1 = new WatchedFolderEndpointImpl(SOAP_WS_BASE_URL+"WatchedFolderEndpointService");
		service2 = new UserMediaRootManagerEndpointImpl(SOAP_WS_BASE_URL+"UserMediaRootManagerEndpointService");
		List<WatchedFolderDetail> listw=service1.findAllWatchedFolders();
		TaskSearchCriteria taskSearchCriteria = new TaskSearchCriteria();
		StringBuffer sb=new StringBuffer();
		long firstrow=1;
		long maxrow=100;
		for(int i=0;i<listw.size();i++){
			sb.append(listw.get(i).getId()).append("</C>").append(listw.get(i).getWatchedFolderUrl()).append("</R>");
			System.out.println(listw.get(i).getId()+"  "+listw.get(i).getWatchedFolderUrl());
			taskSearchCriteria.setWatchedFolderId(listw.get(i).getId());
			TaskSearchDTO dto = service.search(taskSearchCriteria, false, false, firstrow, maxrow);
			List<TaskPreview> list = dto.getTaskPreviewList();
			for(int j=0; j<list.size(); j++){
				TaskPreview tv = list.get(j);
				
				System.out.println(tv.getId());
				
				System.out.println(tv.getState());
			}
		}
		return sb.toString();
		
	}
	
	public long	addFolder(ServletContext sc,HttpSession session)
	throws CustomException,Exception
{
		
	ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	
	baseForm bform=(baseForm)session.getAttribute("baseuser");
    if (bform==null)
    {
    	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
    }
    
    Authenticator auth = new Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication()
        {
           return new PasswordAuthentication(AuthName, PASSWORD.toCharArray());
        }
    };
	Authenticator.setDefault(auth);
	service1 = new WatchedFolderEndpointImpl(SOAP_WS_BASE_URL+"WatchedFolderEndpointService");
	service2 = new UserMediaRootManagerEndpointImpl(SOAP_WS_BASE_URL+"UserMediaRootManagerEndpointService");
	List<UserMediaFile> list;
	boolean add=true;
	long folderId=0;
	
	list=service2.listFiles();
	for(int i=0;i<list.size();i++){
		if(list.get(i).getRelativeURI().equals("/"+bform.user_code)){
			//System.out.println(list.get(i).getRelativePath());
			add=false;
			break;
		}
		
	}
	if(add){
		service2.createSubDirectory("/", bform.user_code);
		service1.createWatchedFolderByProfile(100, "/"+bform.user_code+"/", bform.user_code+"_%250f_ok.mp4", "*.avi;*.map4", false, false, "admin");
	}
	
	List<WatchedFolderDetail> list2;
	list2=service1.findAllWatchedFolders();
	for(int i=0;i<list2.size();i++){
		if(list2.get(i).getWatchedFolderUrl().equals("/"+bform.user_code+"/")){
			folderId=list2.get(i).getId();
		}
	}
	return folderId;
	
}
	
	public String queryWatchedFolder(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
    throws CustomException,Exception
    {
    	//System.out.println("queryRT traffic!");
//    	判断环境实例是否为空
        if (sc == null)
        {
        //    System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
         //   System.out.println("HttpSession 为空，返回。");
            throw new CustomException("HttpSession 为空，返回");
        }
        
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
        
        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
        }
        
        addFolder(sc, session);
        
        //保存查询结果信息
        StringBuffer infoSB=null;
        //保存SQL语句
        StringBuffer sqlSB = null;
        StringBuffer sqlSB2 = null;
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        
        StringBuffer countSB = null;
        PageMan pm=PageManFactory.getInstance();
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            sqlSB2=new StringBuffer();
            countSB=new StringBuffer();
        	//sqlSB.append("select r.id,r.LPNumber,r.frameCTS,r.absTime ");
        	//sqlSB.append("from t_m_report r,t_m_tasks t,t_m_videos v where r.status=1 and r.taskId=t.taskID and t.inputVideoId=v.id and v.uploader='"+bform.user_code+"' ");
        	sqlSB.append("select r.id,r.LPNumber,r.absTime,l.locationName ");
        	sqlSB.append("from t_m_report r,t_m_tasks t,t_m_videos v,(SELECT id FROM t_m_report ORDER BY id DESC " );
        	sqlSB.append(") s,t_s_location l where r.id=s.id and v.locationId=l.locationId and r.status=1 and r.taskId=t.taskID and t.inputVideoId=v.id and v.uploader='"+bform.user_code+"'");
            countSB.append("select count(r.id)  from t_m_report r,t_m_tasks t,t_m_videos v,t_s_location l where r.status=1 and v.locationId=l.locationId and r.taskId=t.taskID and t.inputVideoId=v.id and v.uploader='"+bform.user_code+"' ");
            if(s!=null&&!s.equals("")){
            	sqlSB.append(" ");
            	sqlSB.append(s);
            	countSB.append(s);
            }
            sqlSB.append("order by r.id desc ");
            //System.out.println(sqlSB);
            rs=pm.list(con, perPage, curPage, countSB.toString(), basePublic.in(sqlSB.toString()));
            
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
					// System.out.println(infoSB.toString());

				}
				// System.out.println(basePublic.out(rs.getString(2)));
				infoSB.append("</R>");
            }
            //System.out.println(infoSB.toString());
            infoSB.append("|");
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"根据watchedFolder查询分析结果成功！",WatchedFolder.class.getName());
            return infoSB.toString();
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现数据库错误，操作为：根据watchedFolder查询分析结果失败！"+sql.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现转化字符集错误，操作为：根据watchedFolder查询分析结果失败！"+ue.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现错误，操作为：根据watchedFolder查询分析结果失败！"+ce.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
    }
	
	
	public String watchedFolderDetail(String id,ServletContext sc,HttpSession session)
    throws CustomException,Exception
    {
    	//System.out.println("queryRT traffic!");
//    	判断环境实例是否为空
        if (sc == null)
        {
        //    System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
         //   System.out.println("HttpSession 为空，返回。");
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
        	sqlSB.append("select r.id,r.LPNumber,r.frameCTS,r.absTime,r.picUrl,t.outputVideoId,l.locationName ");
        	sqlSB.append("from t_m_report r,t_m_tasks t,t_s_location l,t_m_videos v where r.status=1 and l.locationId=v.locationId and r.taskId=t.taskID and r.id=?");
        	pstm=con.prepareStatement(sqlSB.toString());
        	pstm.setString(1, id);
        	rs=pstm.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();

			while (rs != null && rs.next())
			{
				for (int i = 1; i <= numberOfColumns; i++)
				{
					infoSB.append(basePublic.out(rs.getString(i))).append("</C>");
				}
				infoSB.append("</R>");
            }
            //System.out.println(infoSB.toString());
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"根据watchedFolder查询分析结果成功！",WatchedFolder.class.getName());
            //System.out.println(infoSB.toString());
            return infoSB.toString();
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现数据库错误，操作为：根据watchedFolder查询分析结果失败！"+sql.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现转化字符集错误，操作为：根据watchedFolder查询分析结果失败！"+ue.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"WatchedFolder.queryWatchedFolder出现错误，操作为：根据watchedFolder查询分析结果失败！"+ce.getMessage(),WatchedFolder.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
    }   
	public int uploadFile(String fileName, String path, String videodatetime, String fileNameValue, String locationId, String timeInternal, int fileNum, ServletContext sc,HttpSession session)
	throws CustomException,Exception
	{
		String strs[] = fileNameValue.split("</C>");
		if(strs.length>0)
			fileNameValue = strs[0];
		//System.out.println("uploadFile");
		System.out.println(locationId);
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
		
		long folderId=this.addFolder(sc, session);
		//保存SQL语句
		StringBuffer sqlSB = null;
		Connection con=null;//保存数据库连接
		PreparedStatement pstm=null;//保存预处理语句
		DataSource ds=null;
		try
		{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		    String time = sdf.format(new Date(0));
		    
		    SimpleDateFormat ft = new SimpleDateFormat ("yyyy/MM/dd HH:mm:ss");
			Date date=ft.parse(videodatetime);
			videodatetime=ft.format(date.getTime()+Long.parseLong(timeInternal)*1000*(fileNum-1));
			System.out.println(videodatetime);
		    
			ds=(DataSource)sc.getAttribute("basedb");
			con=ds.getConnection();
			if (con==null){
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}
		
			sqlSB=new StringBuffer();
			String values = "values('"+fileName+"','"+fileNameValue+"','"+path+"/processed_input_files'" + ",'"+videodatetime+"'";
			
			pstm = con.prepareStatement("select * from t_m_baseinfo where status=1 and work=1 limit 1");
			ResultSet rs = pstm.executeQuery();
			if(rs!=null && rs.next()){
				//values += ",'" + rs.getString("uploadServer") + "'";
				values += ",'" + rs.getString("videoserver") +"/"+ rs.getString("rpcwebroot")+"'";
				values += ",'" + bform.user_code + "'";
			}
			values += ",'"+folderId+"'";
			values +=",'"+locationId+"')";
			sqlSB.append("insert into t_m_videos(name, value, path, absTime ,url, uploader,watchfolderID,locationId) ").append(values);
			//System.out.println(basePublic.in(sqlSB.toString()));
			pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
			int num=pstm.executeUpdate();
		
			return num;
		}
		catch (SQLException sql){
			sql.printStackTrace();
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
		}
		catch (UnsupportedEncodingException ue){
			ue.printStackTrace();
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce){
			ce.printStackTrace();
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally{
			//关闭所有可用资源
			close(null,pstm,null,con);
		}
		//    System.out.println("sourceList="+sourceList);
	}
	public int setMinTime()throws Exception{
		try{
			Date date = new Date();
			SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			minTime=ft.format(new java.util.Date(date.getTime()-1000*3));
			return 1;
		}catch(Exception ce){
			ce.printStackTrace();
			throw new CustomException("出现未知异常错误:"+ce.getMessage());
		}
	}
	public void setMaxTime(int num,ServletContext sc,HttpSession session)throws Exception{
		
		if (sc == null){
			throw new CustomException("ServletContext 为空，返回");
		}
		if (session==null){
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		try{
			System.out.println(num);
			Thread.sleep(10000);
			SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			maxTime=ft.format(new java.util.Date());
			getResult(num, sc, session);
		}catch(Exception ce){
			ce.printStackTrace();
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
	}
	
	
	public void getResult(int num,ServletContext sc,HttpSession session)
	throws CustomException,Exception
	{
		
		System.out.println("-------------------------");
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
		
		Authenticator auth = new Authenticator() {
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication()
	        {
	           return new PasswordAuthentication(AuthName, PASSWORD.toCharArray());
	        }
	    };
		Authenticator.setDefault(auth);
		
		service = new TaskEndpointImpl(SOAP_WS_BASE_URL+"TaskEndpointService");
		service1 = new WatchedFolderEndpointImpl(SOAP_WS_BASE_URL+"WatchedFolderEndpointService");
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		//保存SQL语句
		StringBuffer sqlSB = null;
		Connection con=null;//保存数据库连接
		ResultSet rs=null;
		PreparedStatement pstm=null;//保存预处理语句
		TaskSearchCriteria tsc=null;
		long folderId=0;
		List<WatchedFolderDetail> list2=null;
		String inputVideo="";
		Statement sta=null;
		int sleepNum=10;
		List<TaskPreview> list=null;
		Sources surces=null;
		int count=0;
		try
		{
			list2=service1.findAllWatchedFolders();
			for(int i=0;i<list2.size();i++){
				if(list2.get(i).getWatchedFolderUrl().equals("/"+bform.user_code+"/")){
					folderId=list2.get(i).getId();
				}
			}
			tsc=new TaskSearchCriteria();
			tsc.setWatchedFolderId(folderId);
			tsc.setMinCreationDate(ft.parse(minTime));
			tsc.setMaxCreationDate(ft.parse(maxTime));
			con=((DataSource)sc.getAttribute("basedb")).getConnection();
	         
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }
			sta=con.createStatement();
			con.setAutoCommit(false);
			TaskSearchDTO dto= service.search(tsc, true, false, Long.parseLong("0"), Long.parseLong("-1"));
			
			while(sleepNum>0){
				Thread.sleep(5000);
				System.out.println(dto.getTaskPreviewList());
				if(dto.getTaskPreviewList()!=null && !dto.getTaskPreviewList().equals("null")){
					System.out.println("21321654968797");
					list=dto.getTaskPreviewList();
				}
				if(list!=null){
					if(list.size()==num){
						//System.out.println("list.size:"+list.size());
						break;
					}
				}
				sleepNum--;
			}
			if(sleepNum<=0){
				System.out.println("未请求到数据！");
			}else{
			System.out.println(list.get(0).getId());
			Thread.sleep(5000);
			//System.out.println("++++++++++++++++++++");
			
			while(list.size()>0){
				Thread.sleep(1000);
				count++;
				if(count==3000){
					count=0;
					System.out.println("请求结果失败！");
					break;
				}
				//System.out.println("sleep");
//				list=dto.getTaskPreviewList();
				
//				System.out.println("+_+_+_+_+_+_+_+_+_+_+"+list.size());
//				System.out.println(list.get(0).getState());
//				System.out.println(list.get(0).getMacroState());
//				System.out.println(list.get(0).getId());
//				
				for(int i=0;i<list.size();i++){
					rs=sta.executeQuery("SELECT id FROM t_m_tasks WHERE taskID = '"+list.get(i).getId()+"'");
					if(rs!=null && rs.next()){
						list.remove(i);
						continue;
					}
					
					TaskDetail taskDetail=service.getDetail(list.get(i).getId());
					//System.out.println(taskDetail.getMacroState());
					//System.out.println(list.size());
					if(taskDetail.getMacroState().equals("COMPLETED")){ 
						count=0;
							//System.out.println(taskDetail.getState());
						  List<ProducedAnalysis> listProducedAnalysis=taskDetail.getProducedAnalysisReports();
						  if(listProducedAnalysis!=null){
							  //System.out.println("outputVideoUrl="+taskDetail.getFiles().get(0).getUrl());
							 // System.out.println("inputVideoUrl="+listProducedAnalysis.get(0).getOriginalMediafileUri());
							  
							  /*if(listProducedAnalysis.get(0).getOriginalMediafileUri().split("/").length>2){
								  inputVideo=listProducedAnalysis.get(0).getOriginalMediafileUri().split("/")[listProducedAnalysis.get(0).getOriginalMediafileUri().split("/").length-1];
							  }else{
								  inputVideo=listProducedAnalysis.get(0).getOriginalMediafileUri();
							  }*/
							  surces=service.getEdl(taskDetail.getId()).getSources();
							  inputVideo=surces.getSource().get(0).getInternalLocalPath().split("/")[surces.getSource().get(0).getInternalLocalPath().split("/").length-1];
							  System.out.println(inputVideo+"^^^^^^^^^^^^^^^^^^^^^^");
							  sta.addBatch("INSERT INTO t_m_tasks (taskID,state,inputVideoId,outputVideoId) values ('"+list.get(i).getId()+"','finished',(SELECT id FROM t_m_videos WHERE value ='"+inputVideo+"'),'"+taskDetail.getFiles().get(0).getUrl()+"');");
							  for(int j=0;j<listProducedAnalysis.size();j++){
								  ProducedAnalysis producedAnalysis=listProducedAnalysis.get(j);
								  //System.out.println(producedAnalysis.getOriginalMediafileTrackId());
								  
								  List<ProducedAnalysisStepReport> listProducedAnalysisStepReports=listProducedAnalysis.get(j).getStepReports();
								  if(producedAnalysis.getProducedThumbnails()!=null&&listProducedAnalysisStepReports!=null){
									  for(int m=0;m<producedAnalysis.getProducedThumbnails().size();m++){
										  
										  URL url = new URL(listProducedAnalysisStepReports.get(m).getReportUrl());
										  byte[] bytes = readBytes(url);
//										  System.out.println(new String(bytes, "UTF8"));	
										  String str1[] = new String(bytes, "UTF8").split("Content=");
										  String str2[] = new String(bytes, "UTF8").split("Type=");
										  String str3[] = new String(bytes, "UTF8").split("x=");
										  String str4[] = new String(bytes, "UTF8").split("y=");
										  String str5[] = new String(bytes, "UTF8").split("width=");
										  String str6[] = new String(bytes, "UTF8").split("height=");
										  String str7[] = new String(bytes, "UTF8").split("Confidence=");
//										  System.out.println("taskId="+list.get(i).getId());
//										  System.out.println("outputVideoUrl="+taskDetail.getFiles().get(0).getUrl());
//										  System.out.println("watchedFolderId="+taskDetail.getWatchedFolderId());
//										  System.out.println("inputVideoUrl="+inputVideo);
//										  System.out.println("LPNpicUrl="+producedAnalysis.getProducedThumbnails().get(m).getUrl());
//										  System.out.println("FrameCtsUs="+listProducedAnalysisStepReports.get(m).getFrameCtsUs());
//										  System.out.println("FrameIndex="+listProducedAnalysisStepReports.get(m).getFrameIndex());
//
//										  System.out.println("LPNumber="+str1[1].split(" ")[0]);
//										  System.out.println("Type="+str2[1].split("\n")[0]);
//										  System.out.println("PositionX="+str3[1].split(" ")[0]);
//										  System.out.println("PositionY="+str4[1].split("\n")[0]);
//										  System.out.println("Width="+str5[1].split(" ")[0]);
//										  System.out.println("Height="+str6[1].split("\n")[0]);
//										  System.out.println("Confidence="+str7[1].split(" ")[0]);
										  sta.addBatch("INSERT INTO t_m_report (taskId,LPNumber,frameIndex,frameCTS,confidence,posX,posY,width,height,picUrl,status,absTime) values " +
										  		"('"+list.get(i).getId()+"','"+str1[1].split(" ")[0]+"','"+listProducedAnalysisStepReports.get(m).getFrameIndex()+"'," +
										  				"'"+listProducedAnalysisStepReports.get(m).getFrameCtsUs()+"','"+str7[1].split(" ")[0]+"','"+str3[1].split(" ")[0]+"'," +
										  						"'"+str4[1].split("\n")[0]+"','"+str5[1].split(" ")[0]+"','"+str6[1].split("\n")[0]+"','"+producedAnalysis.getProducedThumbnails().get(m).getUrl()+"'," +
										  								"'"+1+"',DATE_ADD((SELECT absTime FROM t_m_videos WHERE value ='"+inputVideo+"'),INTERVAL "+listProducedAnalysisStepReports.get(m).getFrameCtsUs()/1000000+" SECOND))");
									  }
								  }
							  }
						  }
						list.remove(i);
					}else if(taskDetail.getMacroState().equals("FAILED")){
						count=0;
						/*if(service.getDetail(list.get(i).getId()).getProducedAnalysisReports()!=null){
//							  System.out.println("--------------"+service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri());
						  
						  if(service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri().split("/").length>2){
							  inputVideo=service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri().split("/")[service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri().split("/").length-1];
						  }else{
							  service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri().split("/");
						  }
					  }*/
					  surces=service.getEdl(taskDetail.getId()).getSources();
					  inputVideo=surces.getSource().get(0).getInternalLocalPath().split("/")[surces.getSource().get(0).getInternalLocalPath().split("/").length-1]; 	
					  sta.addBatch("INSERT INTO t_m_tasks (taskID,state,inputVideoId) values ('"+list.get(i).getId()+"','failed',(SELECT id FROM t_m_videos WHERE value ='"+inputVideo+"'));");
					  list.remove(i);
					}else if(taskDetail.getMacroState().equals("CANCELLED")){
						count=0;
						/*if(service.getDetail(list.get(i).getId()).getProducedAnalysisReports()!=null){
//							  System.out.println("--------------"+service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri());
						  
						  if(service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri().split("/").length>2){
							  inputVideo=service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri().split("/")[service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri().split("/").length-1];
						  }else{
							  service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri().split("/");
						  }
					  }*/
					  surces=service.getEdl(taskDetail.getId()).getSources();
					  inputVideo=surces.getSource().get(0).getInternalLocalPath().split("/")[surces.getSource().get(0).getInternalLocalPath().split("/").length-1];
					  sta.addBatch("INSERT INTO t_m_tasks (taskID,state,inputVideoId) values ('"+list.get(i).getId()+"','failed',(SELECT id FROM t_m_videos WHERE value ='"+inputVideo+"'));");
					  list.remove(i);
					}
				}
			}
			sta.executeBatch();
			con.commit();
			System.out.println("分析完成！");
			}
		}
		catch (SQLException sql){
			con.rollback();
			con.setAutoCommit(true);
			sql.printStackTrace();
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
		}
		catch (UnsupportedEncodingException ue){
			ue.printStackTrace();
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce){
			con.rollback();
			con.setAutoCommit(true);
			ce.printStackTrace();
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally{
			//关闭所有可用资源
			close(null,pstm,null,con);
		}
		//    System.out.println("sourceList="+sourceList);
	}
	public static byte[] readBytes(URL url) throws IOException {
	    ByteArrayOutputStream bais = new ByteArrayOutputStream();
	    InputStream is = null;
	    try {
	      is = url.openStream ();
	      byte[] byteChunk = new byte[4096];
	      int n;

	      while ( (n = is.read(byteChunk)) > 0 ) {
	        bais.write(byteChunk, 0, n);
	      }
	    }
	    finally {
	      if (is != null) { is.close(); }
	    }
	    
	    return bais.toByteArray();
	}	
	
	public static void main(String[] args) 
//	throws TaskNotFoundException, NumberFormatException, TaskValidationException, ParseException, EdlParseException
	{ 
		
		String str = "123</c>";
		String []strs = str.split("</c>");
		System.out.println(strs.length);
		/*
		Authenticator auth = new Authenticator() {
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication()
	        {
	           return new PasswordAuthentication(AuthName, PASSWORD.toCharArray());
	        }
	    };
		Authenticator.setDefault(auth);
		service = new TaskEndpointImpl(SOAP_WS_BASE_URL+"TaskEndpointService");
			SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			Date date=ft.parse("2013-12-12 3:30:00");
			String s=ft.format(date.getTime()-6000*60);
			System.out.println(s);
			*/
	}
}
