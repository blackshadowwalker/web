package modules.ajgl.ajxxgl.clgl;

import java.io.*;
import java.net.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.image.ImageProcess;

import modules.base.CustomException;
import modules.base.LogBean;
import modules.base.PageMan;
import modules.base.PageManFactory;
import modules.base.ResourceClose;
import modules.base.baseForm;
import modules.base.basePublic;
import modules.cloud.fileMgr.fileMgrBean;

public class clglBean  extends ResourceClose
{
	private DataSource dataSource;
	private List<String> tempImageList = new ArrayList<String>();
	public clglBean()
    {
		
    }
	public clglBean(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	public String getImageUrl(long id, ServletContext sc, HttpSession session)
	throws CustomException , Exception{
		String url = "";
		StringBuffer sqlSB = null;
		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		try{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();
			if(con == null){
				throw new CustomException(rb.getString("exp.databaseConnectFaild"));
			}

			int num = 0;
			sqlSB = new StringBuffer();
			sqlSB.append("select * from t_m_report where id=? ");
			pstm = con.prepareStatement(basePublic.in(sqlSB.toString()));
			pstm.setLong(1, id);
			ResultSet rs = pstm.executeQuery();
			if(rs!=null && rs.next())
				url = rs.getString("picUrl");
		}
		catch (SQLException sql)
		{
			throw new CustomException(rb.getString("exp.databaseConnectError"));
		}
		catch (UnsupportedEncodingException ue)
		{
			throw new CustomException(rb.getString("exp.convertCharacterSetWrong"));
		}
		catch (Exception ce)
		{
			throw new CustomException(rb.getString("exp.unknownError"));
		}
		finally
		{
			close(null, pstm, null, con);
		}
		return url;
	}
	public String updateImageUrl(long id, String tempurl,ServletContext sc, HttpSession session)
	throws CustomException , Exception{
		System.out.println("updateImageUrl");
		String outurl = "";
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd_hhmmssSSS");
		String date = sd.format(new Date());
		String imageName = date+".jpg";
		String thisPath = sc.getRealPath("/");
		String localurl = sc.getInitParameter("uploadPath")+"/"+"producedImages/";
		File dest = new File(thisPath+localurl+imageName);
		File file = new File(thisPath+tempurl);
		System.out.println("MOVE: ");
		System.out.println("From: "+thisPath+tempurl);
		System.out.println("TO: "+thisPath+localurl+imageName);
		boolean succed = file.renameTo(dest);
		String filepath ="";
		if(succed){
			filepath = localurl+imageName;
			file.delete();//delete the old file;
		}
		else
			filepath = tempurl;
		if(session.getAttribute("tempImageList")!=null){
			tempImageList = (List<String>) session.getAttribute("tempImageList");
			for(String img :tempImageList){
				if(img.indexOf("/temp/")>0){
					(new File(img)).delete();
				}
			}
		}
		return filepath;
	}
	public String downloadImageToLocal(long id, ServletContext sc, HttpSession session)
	throws CustomException , Exception{
		if(session.getAttribute("tempImageList")!=null)
			tempImageList = (List<String>) session.getAttribute("tempImageList");
		
		String url = getImageUrl(id, sc, session);//get image url
		if(url.indexOf("://")<0)
			return url;
		String thisPath = sc.getRealPath("/");
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd_hhmmssSSS");
		String date = sd.format(new Date());
		
		String imageName = date+".jpg";
		String localurl = sc.getInitParameter("uploadPath")+"/"+"producedImages/temp/";
		String inputImage = localurl+imageName;
		String fullPath = thisPath+localurl;
		File dir = new File(fullPath);
		dir.mkdirs();
		
		downloadImageByUrl(url, thisPath + inputImage); // download image to outImage
		
		tempImageList.add(thisPath + inputImage);
		session.setAttribute("tempImageList", tempImageList);
		return inputImage;
	}
	public boolean downloadImageByUrl(String rpcurl, String localurl){
		URL url = null;
		URLConnection uc=null;
		try
		{
			url = new   URL( rpcurl);
			uc = url.openConnection();
			InputStream   is   =   uc.getInputStream(); 
			File   file   =   new   File( localurl); 
			FileOutputStream   out   =   new   FileOutputStream(file); 
			int   i=0; 
			while   ((i=is.read())!=-1)   { 
				out.write(i); 
			} 
	        is.close();
	        out.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return false;
		} 
		return true;
	}
	public static void main(String arg[]){
		System.out.println(System.getProperty("java.library.path"));
	}

	public String ImageEnhancement(long id, String function, String usedImage,
			ServletContext sc,HttpSession session) 
	throws CustomException, Exception
	{
		if(session.getAttribute("tempImageList")!=null)
			tempImageList = (List<String>) session.getAttribute("tempImageList");
		
		String inputImage="";
		String outImage="";
		String imageName="";
		String thisPath = sc.getRealPath("/");
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd_hhmmssSSS");
		String date = sd.format(new Date());
		imageName = date+".jpg";
		String localurl = sc.getInitParameter("uploadPath")+"/"+"producedImages/";
		File dir=null;
		inputImage = usedImage;

		outImage = localurl + "temp/"+imageName;
		dir = new File(thisPath+localurl+"temp");
		dir.mkdirs();
		
		System.out.println("input:"+inputImage);
		System.out.println("output:"+outImage);
		
		ImageProcess im = new ImageProcess();
		java.lang.reflect.Method method = im.getClass().getMethod(function, String.class, String.class);
		String ret = (String) method.invoke(im, thisPath + inputImage, thisPath+outImage);
		tempImageList.add(thisPath+outImage);
		session.setAttribute("tempImageList", tempImageList);
		return outImage;
		/*
		Class<?> demo = null;
		try {
            demo = Class.forName("com.image.ImageProcess");
        } catch (Exception e) {
            e.printStackTrace();
        }
        java.lang.reflect.Method method = demo.getMethod(function, String.class, String.class);
        String ret = (String)method.invoke(demo.newInstance(),"in.jpg","out.jpg");
         */
	}

	
	/*
	 * 信息数据删除
	 */
	public int deleteTSClgl(String id, int status, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{

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
			throw new CustomException(rb.getString("exp.databaseConnectFaild"));
		}

		// 保存SQL语句
		StringBuffer sqlSB = null;

		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句

		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();
			if(con == null)
			{
				throw new CustomException(rb.getString("exp.databaseConnectFaild"));
			}

			int num = 0;
			sqlSB = new StringBuffer();
			sqlSB.append("update t_m_report set ").append("status=0").append(
					" WHERE id=").append(Integer.parseInt(id));
			pstm = con.prepareStatement(basePublic.in(sqlSB.toString()));
			num = pstm.executeUpdate();

			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "删除车辆信息成功！",clglBean.class.getName());

			return num;

		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "clglBean.deleteTSClgl出现数据库错误，操作为：" 
					+"删除车辆信息失败" + sql.getMessage(),clglBean.class.getName());
			throw new CustomException(rb.getString("exp.databaseConnectError"));
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "clglBean.deleteTSClgl出现转化字符集错误，操作为：" 
					+ "删除车辆信息失败：" + ue.getMessage(),clglBean.class.getName());
			throw new CustomException(rb.getString("exp.convertCharacterSetWrong"));
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "clglBean.deleteTSClgl出现错误，操作为：" 
					+ "删除车辆信息失败" + ce.getMessage(),clglBean.class.getName());
			throw new CustomException(rb.getString("exp.unknownError"));
		}
		finally
		{
			// 关闭所有可用资源
			close(null, pstm, null, con);
		}
	}
	
	/*
     * 根据条件语句查询代码信息AJAX
     */
	 public String queryTSClgl(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
	    throws CustomException,Exception
	    {
		 
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
	            throw new CustomException(rb.getString("exp.connectionFails"));
	        }
		 
	        //保存查询结果信息
	        StringBuffer infoSB=null;
	        //保存SQL语句
	        StringBuffer sqlSB = null;
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
	                throw new CustomException(rb.getString("exp.databaseConnectFaild"));
	            }

	            infoSB=new StringBuffer();
	            sqlSB=new StringBuffer();
	            countSB=new StringBuffer();
	        	sqlSB.append("select r.id,r.LPNumber,r.absTime,l.locationName, ");
	        	sqlSB.append("(case xycd");
				pstm = con.prepareStatement("select c.code,c.value from t_s_code c where type='t_m_report.xycd' order by code asc");
				rs = pstm.executeQuery();
				while (rs != null && rs.next())
				{
					sqlSB.append(" when ");
					sqlSB.append(basePublic.out(rs.getString("code")));
					sqlSB.append(" then ");
					sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
				}
				sqlSB.append(" end)");
				// 关闭资源rs,pstm
				close(rs, pstm, null, null);
				sqlSB.append(",");  
	        	sqlSB.append("r.comment  from t_m_report r,t_m_tasks t,t_m_videos v,(SELECT id FROM t_m_report ORDER BY id DESC " );
	        	sqlSB.append(") s,t_s_location l where r.id=s.id and v.locationId=l.locationId and r.status=1 and r.taskId=t.taskID and t.inputVideoId=v.id ");
	            countSB.append("select count(r.id)  from t_m_report r,t_m_tasks t,t_m_videos v,t_s_location l where r.status=1 and v.locationId=l.locationId and r.taskId=t.taskID and t.inputVideoId=v.id ");
	            if(s!=null&&!s.equals("")){
	            	sqlSB.append(" ");
	            	sqlSB.append(s);
	            	countSB.append(s);
	            }
	            sqlSB.append("order by r.id desc ");
//	            System.out.println(sqlSB.toString());
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
					}
					infoSB.append("</R>");
	            }
	            infoSB.append("|");
	            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"查询车辆信息成功！",clglBean.class.getName());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"clglBean.queryTSClgl出现数据库错误，操作为：查询车辆信息失败！"+sql.getMessage(),clglBean.class.getName());
	            throw new CustomException(rb.getString("exp.databaseConnectError"));
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"clglBean.queryTSClgl出现转化字符集错误，操作为：查询车辆信息失败！"+ue.getMessage(),clglBean.class.getName());
	            throw new CustomException(rb.getString("exp.convertCharacterSetWrong"));
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"clglBean.queryTSClgl出现错误，操作为：查询车辆信息失败！"+ce.getMessage(),clglBean.class.getName());
	            throw new CustomException(rb.getString("exp.unknownError"));
	        }
	        finally
	        {
	            //关闭所有可用资源
	            close(rs,pstm,null,con);
	        }
	 }
	    /*
		 * 根据ID值查询详细的代码信息AJAX
		 */
		public String detailTSClgl(long id, ServletContext sc,
				HttpSession session) throws CustomException, Exception
		{
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
	            throw new CustomException(rb.getString("exp.connectionFails"));
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
	                throw new CustomException(rb.getString("exp.databaseConnectFaild"));
	            }

	            infoSB=new StringBuffer();
	            sqlSB=new StringBuffer();
	            sqlSB.append("select r.LPNumber,r.absTime,l.locationName, ");
	        	sqlSB.append("(case xycd");
				pstm = con.prepareStatement("select c.code,c.value from t_s_code c where type='t_m_report.xycd' order by code asc");
				rs = pstm.executeQuery();
				while (rs != null && rs.next())
				{
					sqlSB.append(" when ");
					sqlSB.append(basePublic.out(rs.getString("code")));
					sqlSB.append(" then ");
					sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
				}
				sqlSB.append(" end)");
				// 关闭资源rs,pstm
				close(rs, pstm, null, null);
				sqlSB.append(",");  
	        	sqlSB.append("r.comment,v.url,v.path,v.value,r.picUrl  from t_m_report r,t_m_tasks t,t_m_videos v,(SELECT id FROM t_m_report ORDER BY id DESC " );
	        	sqlSB.append(") s,t_s_location l where r.id=s.id and v.locationId=l.locationId and r.status=1 and r.taskId=t.taskID and t.inputVideoId=v.id and r.id=? ");
	        	pstm=con.prepareStatement(sqlSB.toString());
	        	pstm.setLong(1, id);
	        	rs=pstm.executeQuery();
	        	System.out.println(sqlSB.toString());
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
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"查询车辆细信息成功！",clglBean.class.getName());
	            return infoSB.toString();
	        }
	        catch (SQLException sql)
	        {
	            sql.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"clglBean.detailTSClgl出现数据库错误，操作为：查询车辆细信息失败！"+sql.getMessage(),clglBean.class.getName());
	            throw new CustomException(rb.getString("exp.databaseConnectError"));
	        }
	        catch (UnsupportedEncodingException ue)
	        {
	            ue.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"clglBean.detailTSClgl出现转化字符集错误，操作为：查询车辆细信息失败！"+ue.getMessage(),clglBean.class.getName());
	            throw new CustomException(rb.getString("exp.convertCharacterSetWrong"));
	        }
	        catch (Exception ce)
	        {
	            ce.printStackTrace();
	            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"clglBean.detailTSClgl出现错误，操作为：查询车辆细信息失败！"+ce.getMessage(),clglBean.class.getName());
	            throw new CustomException(rb.getString("exp.unknownError"));
	        }
	        finally
	        {
	            //关闭所有可用资源
	            close(rs,pstm,null,con);
	        }
		
		}
		
		/*
		 * 修改前根据ID值查询详细的代码信息AJAX
		 */
		public String beforeUpdateTSClgl(long id, ServletContext sc,
				HttpSession session) throws CustomException, Exception
		{
			 if(sc == null)
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
		            throw new CustomException(rb.getString("exp.connectionFails"));
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
		                throw new CustomException(rb.getString("exp.databaseConnectFaild"));
		            }

		            infoSB=new StringBuffer();
		            sqlSB=new StringBuffer();
		            sqlSB.append("select r.LPNumber,r.absTime,l.locationName,xycd, ");
		        	sqlSB.append("r.comment, picUrl  from t_m_report r,t_m_tasks t,t_m_videos v,(SELECT id FROM t_m_report ORDER BY id DESC " );
		        	sqlSB.append(") s,t_s_location l where r.id=s.id and v.locationId=l.locationId and r.status=1 and r.taskId=t.taskID and t.inputVideoId=v.id and r.id=? ");
		        	System.out.println(sqlSB);
		        	pstm=con.prepareStatement(sqlSB.toString());
		        	pstm.setLong(1, id);
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
					System.out.println(infoSB.toString());
		            return infoSB.toString();
		        }
		        catch (SQLException sql)
		        {
		            sql.printStackTrace();
		            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"clglBean.beforeUpdateTSClgl出现数据库错误，操作为：修改前查询车辆细信息失败！"+sql.getMessage(),clglBean.class.getName());
		            throw new CustomException(rb.getString("exp.databaseConnectError"));
		        }
		        catch (UnsupportedEncodingException ue)
		        {
		            ue.printStackTrace();
		            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"clglBean.beforeUpdateTSClgl出现转化字符集错误，操作为：修改前查询车辆细信息失败！"+ue.getMessage(),clglBean.class.getName());
		            throw new CustomException(rb.getString("exp.convertCharacterSetWrong"));
		        }
		        catch (Exception ce)
		        {
		            ce.printStackTrace();
		            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"clglBean.beforeUpdateTSClgl出现错误，操作为：修改前查询车辆细信息失败！"+ce.getMessage(),clglBean.class.getName());
		            throw new CustomException(rb.getString("exp.unknownError"));
		        }
		        finally
		        {
		            //关闭所有可用资源
		            close(rs,pstm,null,con);
		        }   
		        
		}
		/*
		 * 修改代码信息AJAX
		 */
		public int updateTSClgl(String id, String values, ServletContext sc,
				HttpSession session) throws CustomException, Exception
		{
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
				throw new CustomException(rb.getString("exp.connectionFails"));
			}

			// 保存SQL语句
			StringBuffer sqlSB = null;

			Connection con = null;// 保存数据库连接
			PreparedStatement pstm = null;// 保存预处理语句
			DataSource ds = null;
			try
			{
				ds = (DataSource) sc.getAttribute("basedb");
				con = ds.getConnection();
				if(con == null)
				{
					throw new CustomException(rb.getString("exp.databaseConnectFaild"));
				}

				sqlSB = new StringBuffer();

				sqlSB.append("update t_m_report set ").append(values).append(
						" where id=").append(id);
				pstm = con.prepareStatement(basePublic.in(sqlSB.toString()));

				int num = pstm.executeUpdate();

				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "修改车辆信息成功！",clglBean.class.getName());

				return num;
			}
			catch (SQLException sql)
			{
				sql.printStackTrace();
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "clglBean.updateTSClgl出现数据库错误，操作为：" 
						+ "修改车辆信息失败" + sql.getMessage(),clglBean.class.getName());
				throw new CustomException(rb.getString("exp.databaseConnectError") + sql.getMessage());
			}
			catch (UnsupportedEncodingException ue)
			{
				ue.printStackTrace();
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "clglBean.updateTSClgl出现转化字符集错误，操作为：" 
						+ "修改车辆信息失败" + ue.getMessage(),clglBean.class.getName());
				throw new CustomException("转化字符集时出现错误:" + ue.getMessage());
			}
			catch (Exception ce)
			{
				ce.printStackTrace();
				LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "clglBean.updateTSClgl出现错误，操作为：" 
						+ "修改车辆信息失败" + ce.getMessage(),clglBean.class.getName());
				throw new CustomException("出现未知异常错误:" + ce.getMessage());
			}
			finally
			{
				// 关闭所有可用资源
				close(null, pstm, null, con);
			}
		}
		
}
