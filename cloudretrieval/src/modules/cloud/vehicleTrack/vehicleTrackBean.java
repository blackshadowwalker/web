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
	 * ���ݲ�ѯ
	 */
	public String getCarTrack(String plnumber, String startTime,
			String endTime, ServletContext sc, HttpSession session)
			throws CustomException, SQLException
	{
		// �жϻ���ʵ���Ƿ�Ϊ��
		if(sc == null)
		{
			// System.out.println("ServletContext Ϊ�գ����ء�");
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		// �жϻỰʵ���Ƿ�Ϊ��
		if(session == null)
		{
			// System.out.println("HttpSession Ϊ�գ����ء�");
			throw new CustomException("HttpSession Ϊ�գ�����");
		}

		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		
		// �ж��û��Ƿ��¼
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
		}
		// �����ѯ�����Ϣ
		StringBuffer infoSB = null;
		StringBuffer infoSB1 = null;
		// ����SQL���
		StringBuffer sqlSB = null;
		StringBuffer sqlSB1 = null;

		Connection con = null;// �������ݿ�����
		PreparedStatement pstm = null;// ����Ԥ�������
		PreparedStatement pstm1 = null;
		ResultSet rs = null;// �����ѯ�Ľ����
		ResultSet rs1 = null;
		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
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
					+ "��ѯ����׷����Ϣ�ɹ���", vehicleTrackBean.class.getName());
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "vehicleTrackBean.getCarTrack�������ݿ����Ӵ���,����Ϊ����ѯ����׷����Ϣʧ��!"
					+ sql.getMessage(), vehicleTrackBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "vehicleTrackBean.getCarTrack����ת���ַ�����,����Ϊ����ѯ����׷����Ϣʧ��!"
					+ ue.getMessage(), vehicleTrackBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "vehicleTrackBean.getCarTrack���ִ���,����Ϊ����ѯ����׷����Ϣʧ��!"
					+ ce.getMessage(), vehicleTrackBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
		finally
		{
			// �ر����п�����Դ
			close(rs, pstm, null, con);
		}
		return infoSB.toString();
	}
}