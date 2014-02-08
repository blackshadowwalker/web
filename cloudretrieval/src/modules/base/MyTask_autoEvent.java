package modules.base;


import javax.servlet.ServletContext;

public class MyTask_autoEvent  extends java.util.TimerTask {
		
	private ServletContext context = null;
	AutoEventTableMgr aet = null;
	
	public MyTask_autoEvent (){
		
	}
	public MyTask_autoEvent (ServletContext context){
		this.context = context;
	}
	
	public void run() {
		aet=new AutoEventTableMgr();
		try
		{
			aet.createTable(context);
		}
		catch (Exception e)
		{
			System.out.println("调用create_bean出现异常！！！");
		}
	}
}
