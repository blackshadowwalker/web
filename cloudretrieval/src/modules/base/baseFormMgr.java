package modules.base;

import java.util.ArrayList;
import java.util.List;

public final class baseFormMgr
{
	private static List<baseForm> baseFromList = new ArrayList<baseForm>();
	
	public static void push(baseForm bf){
		if(getSessionID(bf.user_code)!=null)
			pop(bf);
		baseFromList.add(bf);
		System.out.println("Push user: " + bf.user_code + "\r [session: "+bf.sessionID+"]");
	}
	public static void pop(baseForm bf){
		for(int i=baseFromList.size()-1; i>=0; i--){
			baseForm b = baseFromList.get(i);
			if(bf.user_code.equals(b.user_code)){
				System.out.println("Pop  user: " + bf.user_code + "\r [session: "+bf.sessionID+"]");
				baseFromList.remove(i);
			}
		}
	}
	public static void deleteSession(String sessionID){
		for(int i=baseFromList.size()-1; i>=0; i--){
			baseForm b = baseFromList.get(i);
			if(sessionID.equals(b.sessionID))
				baseFromList.remove(i);
		}
	}
	public static String getSessionID(String userCode){
		System.out.println("baseFromList.size()="+baseFromList.size());
		for(int i=baseFromList.size()-1; i>=0; i--){
			baseForm b = baseFromList.get(i);
			if(userCode.equals(b.user_code))
				return b.sessionID;
		}
		return null;
	}
	
	public static void main(String[] args)
	{
	}

}
