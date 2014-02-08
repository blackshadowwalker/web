package modules.base;

import javax.sql.DataSource;
import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public final class baseServlet extends HttpServlet
{
    public void init(ServletConfig config)
        throws ServletException
    {
        super.init(config);

        try
        {
            ServletContext sc = getServletContext();

            String prefix = sc.getRealPath("/");
            String file = getInitParameter("log4j");
            System.out.println(getServletConfig().getInitParameter("config"));

            if (file != null)
            {
                  PropertyConfigurator.configure(prefix + file);
            }
            
            
            Logger logger = Logger.getLogger(baseServlet.class);
            logger.debug("End of Servlet init.");

            Logger InfoLogger = Logger.getLogger("InfoLogger");
            InfoLogger.info("End of Servlet init.");

            Logger ErrorLogger = Logger.getLogger("ErrorLogger");
            ErrorLogger.error("End of Servlet init.");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
