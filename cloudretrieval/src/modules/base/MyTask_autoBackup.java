package modules.base;


import javax.servlet.ServletContext;

import modules.xtgl.dataMgr.dataMgrBean;

public class MyTask_autoBackup  extends java.util.TimerTask {
		
	private ServletContext context = null;
	dataMgrBean datamgr = null;
	
	public MyTask_autoBackup (){
		
	}
	public MyTask_autoBackup (ServletContext context){
		this.context = context;
	}
	
	public void run() {
		datamgr=new dataMgrBean();
		try
		{
			int ret =-1;
			while(ret<1)
			{
				ret = datamgr.autoBackDatabase(context);
				System.out.println("MyTask_autoBackup ret="+ret);
				if(ret>=1)
					break;
				Thread.sleep(10*1000);
			}
		}
		catch (Exception e)
		{
			System.out.println("调用backUp_bean出现异常！！！");
		}
	}
}
