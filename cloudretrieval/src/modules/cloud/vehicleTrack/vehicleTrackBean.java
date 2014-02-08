package modules.cloud.vehicleTrack;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import modules.base.CustomException;
import modules.base.LogBean;
import modules.base.ResourceClose;
import modules.base.baseForm;
import modules.base.basePublic;

public class vehicleTrackBean extends ResourceClose
{
	private DataSource dataSource;

	public vehicleTrackBean()
	{

	}

	public vehicleTrackBean(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	/*
	 * 数据查询
	 */
	public String getCarTrack(String plnumber, String startTime,
			String endTime, ServletContext sc, HttpSession session)
			throws CustomException, SQLException
	{
		// 判断环境实例是否为空
		if(sc == null)
		{
			// System.out.println("ServletContext 为空，返回。");
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
			// System.out.println("HttpSession 为空，返回。");
			throw new CustomException("HttpSession 为空，返回");
		}

		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		
		// 判断用户是否登录
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}
		// 保存查询结果信息
		StringBuffer infoSB = null;
		StringBuffer infoSB1 = null;
		// 保存SQL语句
		StringBuffer sqlSB = null;
		StringBuffer sqlSB1 = null;

		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句
		PreparedStatement pstm1 = null;
		ResultSet rs = null;// 保存查询的结果集
		ResultSet rs1 = null;
		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}

			infoSB = new StringBuffer();
			infoSB1 = new StringBuffer();

			sqlSB = new StringBuffer();
			sqlSB.append("select ");
			sqlSB.append(" r.absTime,l.longitude,l.latitude,r.picUrl,t.outputVideoId,r.id,r.frameCTS from ");
			sqlSB.append("t_s_location as l ");
			sqlSB.append(" , t_m_report as r ");
			sqlSB.append(" , t_m_tasks as t ");
			sqlSB.append(" , t_m_videos as v ");
			sqlSB.append(" where r.taskId=t.taskID and t.inputVideoId=v.id and l.locationId = v.locationId and r.status=1  ");
			sqlSB.append(" and r.LPNumber='" + plnumber + "' and r.absTime>='"
					+ startTime + "' and r.absTime<='" + endTime + "' ");
			sqlSB.append(" ORDER BY r.absTime ASC ");
			// System.out.println(sqlSB.toString());

			pstm = con.prepareStatement(basePublic.in(sqlSB.toString()));
			rs = pstm.executeQuery();

			while (rs != null && rs.next())
			{
				infoSB.append(basePublic.out(rs.getString("l.longitude"))
						+ "</C>");
				infoSB.append(basePublic.out(rs.getString("l.latitude"))
						+ "</C>");
				infoSB.append(basePublic.out(rs.getString("r.absTime"))
						+ "</C>");
				infoSB.append(basePublic.out(rs.getString("r.picUrl"))
						+ "</C>");
				infoSB.append(basePublic.out(rs.getString("t.outputVideoId"))
						+ "</C>");
				infoSB.append(basePublic.out(rs.getString("r.id"))
						+ "</C>");
				infoSB.append(basePublic.out(rs.getString("r.frameCTS"))
						+ "</C>");
				infoSB.append("</R>");
			}
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "查询车辆追踪信息成功！", vehicleTrackBean.class.getName());
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "vehicleTrackBean.getCarTrack出现数据库连接错误,操作为：查询车辆追踪信息失败!"
					+ sql.getMessage(), vehicleTrackBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "vehicleTrackBean.getCarTrack出现转化字符错误,操作为：查询车辆追踪信息失败!"
					+ ue.getMessage(), vehicleTrackBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "vehicleTrackBean.getCarTrack出现错误,操作为：查询车辆追踪信息失败!"
					+ ce.getMessage(), vehicleTrackBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally
		{
			// 关闭所有可用资源
			close(rs, pstm, null, con);
		}
		return infoSB.toString();
	}
}