package modules.base;


import javax.servlet.ServletContext;

public class MyTask_autoIllegalDataInsert  extends java.util.TimerTask {
		
	private ServletContext context = null;
	AutoIllegalDataInsert aet = null;
	
	public MyTask_autoIllegalDataInsert (){
		
	}
	public MyTask_autoIllegalDataInsert (ServletContext context){
		this.context = context;
	}
	
	public void run() {
		aet=new AutoIllegalDataInsert();
		try
		{
			aet.illegalDataInsert(context);
			aet.whiteIllegalDataInsert(context);
			aet.unknownIllegalDataInsert(context);
		}
		catch (Exception e)
		{
			System.out.println("调用illegal_bean出现异常！！！");
		}
	}
}
