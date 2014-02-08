package modules.pad;

import java.sql.*;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.io.UnsupportedEncodingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import modules.base.*;


/*
 * 首页信息的java类
 *
 */
public class padBean extends ResourceClose{

	private NumberFormat nf;

	public padBean()
	{

		nf=NumberFormat.getPercentInstance();
	}
	/**
	 * @author Administrator xianlin 修改 2010/05/31
	 * 用于获取首页中各机构的统计数据，其中包括检查问题率、问题整改率、对账率、现金备付率、账户合规率、柜员权限合规率 
	 * @param dept_code 机构代码
	 * @param sortType  排序类型，就是上面的那几种排序方法
	 * @param ctx 
	 * @param session
	 * @return  
	 * @throws CustomException
	 * @throws Exception
	 */

//	获得message列表
	public String getxtxx(String user_code,ServletContext sc,HttpSession session)
	throws CustomException,Exception
	{

		//判断环境实例是否为空
		if (sc == null)
		{
			//////System.out.println("ServletContext 为空，返回。");
			throw new CustomException("ServletContext 为空，返回");
		}

		//判断会话实例是否为空
		if (session==null)
		{
			//////System.out.println("HttpSession 为空，返回。");
			throw new CustomException("HttpSession 为空，返回");
		}

		//判断用户是否登录
		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if (bform==null)
		{
			throw new CustomException("连接失效，请重新登录系统。");
		}

		Connection con=null;//保存数据库连接
		PreparedStatement pstm=null;//保存预处理语句
		ResultSet rs=null;//保存查询的结果集

		StringBuffer infoSB = new StringBuffer();

		try
		{
			con=((DataSource)sc.getAttribute("basedb")).getConnection();

			if (con==null)
			{
				throw new CustomException("数据库连接Connection为空，连接失败。");
			}

			con.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);

			infoSB=new StringBuffer();

			int i =1;   
			while(i<10)
			{	
				if(i==1)
				{	
					infoSB.append("<br><table width='100%' border='1' bordercolor='#000000' align='center' cellpadding='0' cellspacing='0' >");
					infoSB.append("<tr bgcolor='#ffffff'>");
					infoSB.append("<td colspan='4'> <div align='center'><font color='#000000' ><strong>新闻通知</strong></font></div></td>");
					infoSB.append("</tr>");
					infoSB.append("<tr bgcolor='#0060f9'>");
					infoSB.append("<td > <div align='center'><font color='#ffffff'><strong>发件人</strong></font></div></td>");
					infoSB.append("<td > <div align='center'><font color='#ffffff'><strong>时间</strong></font></div></td>");
					infoSB.append("<td > <div align='center'><font color='#ffffff'><strong>通知标题</strong></font></div></td>");
					infoSB.append("<td > <div align='center'><font color='#ffffff'><strong>操作</strong></font></div></td>");
					infoSB.append("</tr>");
				}

				if(i%2==0)
				{
					infoSB.append("<tr bgcolor='#FFFFFF' align='center'>");
				}
				else
				{
					infoSB.append("<tr align='center'>");
				}

		//		infoSB.append("<td > <div align='center'>"+rs.getString("rwmc")+"</div></td>");
		
				infoSB.append("<td > <div align='center'>信息来自：发件人 "+i+"</div></td>");
				infoSB.append("<td > <div align='center'>2012-09-01 15:30 </div></td>");
				infoSB.append("<td > <div align='center'>关于本系统实施的通知</div></td>");
				infoSB.append("<td > <div align='center'><a href=\"javascript:forjwrw('45123')\">查看</a></div></td>");
				//infoSB.append("<td > <div align='center'><a href=\"javascript:forjwrw('"+rs.getString("id")+"')\">查看</a></div></td>");
				infoSB.append("</tr>");
				i++;

			}

			infoSB.append("</table>");

			close(rs,pstm,null,null);

			infoSB.append("</tr>");
			i++;
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			throw new CustomException("出现未知异常错误。");
		}
		finally
		{

			//关闭所有可用资源
			close(rs,pstm,null,con);
		}

		return infoSB.toString();

	}
	
}

