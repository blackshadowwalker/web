package modules.base;

import java.util.*;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.*;

public class MyTask extends TimerTask {
  private static final int C_SCHEDULE_HOUR = 4;
  private static boolean isRunning = false;
  private ServletContext context = null;

  public MyTask() {
  }
  public MyTask(ServletContext context) {
    this.context = context;
  }

  public void run() {
    Calendar cal = Calendar.getInstance();
    if (!isRunning) {
    	
      if (C_SCHEDULE_HOUR == cal.get(5)) {
        isRunning = true;
        context.log("开始执行指定任务");
       
        //系统定时接收邮件
       /* DayEnd day = new DayEnd();
        try {
			day.ywzb();
		} catch (CustomException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		} catch (Exception e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}*/
        isRunning = false;
        context.log("指定任务执行结束");
      }
    }
    else {
      context.log("上一次任务执行还未结束");
    }
  }

}

