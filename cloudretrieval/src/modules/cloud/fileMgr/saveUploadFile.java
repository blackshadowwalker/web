package modules.cloud.fileMgr;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ResourceBundle;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modules.base.CustomException;
import modules.base.MySessionContext;

public class saveUploadFile extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		this.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String path = request.getContextPath();
		String thisPath=request.getContextPath();
		
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		
		request.setCharacterEncoding("UTF-8");
		
		String dir = (String)request.getParameter("dir");
		String locationId = (String)request.getParameter("locationId");
		String videodatetime = (String)request.getParameter("videodatetime");
		String timespanStr = (String)request.getParameter("timespan");
		long timespan = Long.parseLong(timespanStr); 
		long starTime = Long.parseLong(videodatetime);
		
		String sessionid = (String)request.getParameter("sessionid");
		
		String postString = (String)request.getParameter("postString");
		String serverData = (String)request.getParameter("serverData");

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		ServletContext sc = this.getServletContext();
		HttpSession session = MySessionContext.getSession(sessionid);
		if(sc==null){
			out.println("Server Error![UNKNOW]");
			return;
		}
		ResourceBundle rb = (ResourceBundle)request.getSession().getAttribute("resourceBundle");
		String timeout = rb.getString("msg.error.timeOutAndLogout");
		String href = basePath;
		if(session==null){
			out.println("<p><h2><a href='"+href+"'>"+timeout+"</a></h2></p>");
			return ;
		}
		
		
		
		fileMgrBean fm = new fileMgrBean();
		try
		{
			fm.uploadFiles(serverData, dir, starTime, locationId, timespan, sc, session);
		}
		catch (CustomException e)
		{
			e.printStackTrace();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		String alert = rb.getString("button.save")+" "+rb.getString("msg.success");
		out.println("<script>alert('"+alert+"!');window.close();</script>");
	}

	@Override
	public void init(ServletConfig config) throws ServletException
	{
		// TODO Auto-generated method stub
		super.init(config);
	}

}
