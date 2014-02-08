package modules.base;


import java.io.DataInputStream;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.log4j.Level;


public class Log4j extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public static Logger logger=null;
	
	public void init(ServletConfig config) throws ServletException
	{
	    super.init(config);
	
	    try
	    {
	        ServletContext sc = getServletContext();
	
	        String prefix = sc.getRealPath("/");
	        String file = getInitParameter("log4j");
	        if (file != null)
	        {
	        	
	              PropertyConfigurator.configure(prefix + file);
	        }
	        //System.out.println(prefix + file+" .......................................start log4j");
	        logger = Logger.getLogger(Log4j.class);
	        /*
	        //////System.out.println("*********************开始加载树模版********************");
	        TranTempl.read(prefix+templFile);
	        //////System.out.println("***********************加载完毕***********************");
	        */
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		
		////////////////System.out.println("接收到请求...");
		
		//PrintWriter out=response.getWriter();
		
		
		DataInputStream dis=new DataInputStream(request.getInputStream());
		
		logger.log(Level.INFO,new String(dis.readUTF().getBytes("iso-8859-1"),"gb2312"));
		
		dis.close();
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		
		doGet(request,response);
	}
	
	public void destroy(){
		
		logger=null;
	}
}