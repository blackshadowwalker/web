package modules.base;

import javax.jms.Session;
import javax.servlet.http.HttpSession;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

public class MySessionContext {
	private static MySessionContext instance;
	private static HashMap mymap;

	private MySessionContext() {
		mymap = new HashMap();
	}

	public static MySessionContext getInstance() {
		if (instance == null) {
			instance = new MySessionContext();
		}
		return instance;
	}

	public static synchronized void AddSession(HttpSession session) {
		if (session != null) {
			mymap.put(session.getId(), session);
		}
	}

	public static synchronized void DelSession(HttpSession session) {
		if (session != null) {
			mymap.remove(session.getId());
		}
	}
	public static void pringlnSessions(){
		Collection sss = mymap.values();
		Iterator it = sss.iterator();
		while(it.hasNext()){
			HttpSession s = (HttpSession)it.next();
			System.out.println(s.getId());
		}
	}
	public static synchronized HttpSession getSession(String session_id) {
		//pringlnSessions();
		if (session_id == null) return null;
		return (HttpSession) mymap.get(session_id);
	}

}