package modules.base;


import javax.servlet.ServletContext;

public class MyTask_autoGetMediaResult  extends java.util.TimerTask {
		
	private ServletContext context = null;
	AutoGetMediaResultData aet = null;
	
	public MyTask_autoGetMediaResult (){
		
	}
	public MyTask_autoGetMediaResult (ServletContext context){
		this.context = context;
	}
	
	public void run() {
		aet=new AutoGetMediaResultData();
		try
		{
			aet.callBackResultData(context);
		}
		catch (Exception e)
		{
			System.out.println("调用getMediaResultData出现异常！！！");
		}
	}
}
