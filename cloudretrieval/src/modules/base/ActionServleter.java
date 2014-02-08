package modules.base;

import java.util.Enumeration;
import java.util.Properties;

import javax.servlet.ServletException;

import org.apache.struts.Globals;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.config.ModuleConfig;

public class ActionServleter extends ActionServlet
{
	public void init() throws ServletException
	{
		super.init();
		String config 		= 	getInitParameter("config");
		System.out.println("*************** init ActionServlet **********************");
		System.out.println("config="+config);
		System.out.println("*********************************************************");
	}

}
