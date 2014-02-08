package modules.base;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener
{
	public static Map userMap = new HashMap();  
	private   MySessionContext myc=MySessionContext.getInstance();  
	
	public void sessionCreated(HttpSessionEvent httpSessionEvent)
	{
		HttpSession session = httpSessionEvent.getSession();
		myc.AddSession(session); 
		ResourceBundle resourceBundle=ResourceBundle.getBundle(BaseLanguage.BASENAME);
		session.setAttribute("resourceBundle", resourceBundle);
		session.setAttribute("language","zh_CN");
		System.out.println("Add Session: "+session.getId());
	}

	public void sessionDestroyed(HttpSessionEvent httpSessionEvent)
	{
		HttpSession session = httpSessionEvent.getSession();  
		myc.DelSession(session);
		baseFormMgr.deleteSession(session.getId());
		System.out.println("Del Session: "+session.getId());
	}

}
