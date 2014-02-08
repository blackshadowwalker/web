package modules.location;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import modules.base.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class locationBean extends ResourceClose
{
	private DataSource dataSource;

	public locationBean()
	{

	}

	public locationBean(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	
	/*
	 * ������Ϣ����ɾ��
	 */
	public int deleteTSLocation(String id, int status, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{

		// �жϻ���ʵ���Ƿ�Ϊ��
		if(sc == null)
		{
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		// �жϻỰʵ���Ƿ�Ϊ��
		if(session == null)
		{
			throw new CustomException("HttpSession Ϊ�գ�����");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		// �ж��û��Ƿ��¼
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
		}

		// ����SQL���
		StringBuffer sqlSB = null;

		Connection con = null;// �������ݿ�����
		PreparedStatement pstm = null;// ����Ԥ�������

		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
			}

			int num = 0;
			sqlSB = new StringBuffer();
			sqlSB.append("UPDATE t_s_location SET ").append("status=0").append(
					" WHERE id=").append(Integer.parseInt(id));
			pstm = con.prepareStatement(basePublic.in(sqlSB.toString()));
			num = pstm.executeUpdate();

			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "ɾ��������Ϣ�ɹ���",locationBean.class.getName());

			return num;

		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.deleteTSLocation�������ݿ���󣬲���Ϊ��" 
					+"ɾ��������Ϣʧ��" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.deleteTSLocation����ת���ַ������󣬲���Ϊ��" 
					+ "ɾ��������Ϣʧ�ܣ�" + ue.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.deleteTSLocation���ִ��󣬲���Ϊ��" 
					+ "ɾ��������Ϣʧ��" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
		finally
		{
			// �ر����п�����Դ
			close(null, pstm, null, con);
		}
	}

	/*
	 * ��Ӵ�����ϢAJAX
	 */
	public int addTSLocation(String labels, String values, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{
		// �жϻ���ʵ���Ƿ�Ϊ��
		if(sc == null)
		{
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		// �жϻỰʵ���Ƿ�Ϊ��
		if(session == null)
		{
			throw new CustomException("HttpSession Ϊ�գ�����");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		// �ж��û��Ƿ��¼

		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
		}

		// ����SQL���
		StringBuffer sqlSB = null;

		Connection con = null;// �������ݿ�����
		PreparedStatement pstm = null;// ����Ԥ�������
		DataSource ds = null;
		try
		{
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
			}

			sqlSB = new StringBuffer();

			sqlSB.append("insert into t_s_location(").append(labels).append(
					") values (").append(values).append(")");

			pstm = con.prepareStatement(basePublic.in(sqlSB.toString()));

			int num = pstm.executeUpdate();

			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "��ӵ�����Ϣ�ɹ���",locationBean.class.getName());
			return num;
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.addTSLocation�������ݿ���󣬲���Ϊ��" 
					+ "��ӵ�����Ϣʧ��" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//�������ݿ����ӷ���Ĵ���
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.addTSLocation����ת���ַ������󣬲���Ϊ��" 
					+ "��ӵ�����Ϣʧ��" + ue.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.addTSLocation���ִ��󣬲���Ϊ��" 
					+ "��ӵ�����Ϣʧ��" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//����δ֪�쳣����
		}
		finally
		{
			// �ر����п�����Դ
			close(null, pstm, null, con);
		}
	}

	/*
	 * �޸Ĵ�����ϢAJAX
	 */
	public int updateTSLocation(String id, String values, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{
		// �жϻ���ʵ���Ƿ�Ϊ��
		if(sc == null)
		{
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		// �жϻỰʵ���Ƿ�Ϊ��
		if(session == null)
		{
			throw new CustomException("HttpSession Ϊ�գ�����");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		// �ж��û��Ƿ��¼
		baseForm bform = (baseForm) session.getAttribute("baseuser");
		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
		}

		// ����SQL���
		StringBuffer sqlSB = null;

		Connection con = null;// �������ݿ�����
		PreparedStatement pstm = null;// ����Ԥ�������
		DataSource ds = null;
		try
		{
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
			}

			sqlSB = new StringBuffer();

			sqlSB.append("update t_s_location set ").append(values).append(
					" where id=").append(id);
			// System.out.println(basePublic.in(sqlSB.toString()));
			pstm = con.prepareStatement(basePublic.in(sqlSB.toString()));

			int num = pstm.executeUpdate();

			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "�޸ĵ�����Ϣ�ɹ���",locationBean.class.getName());

			return num;
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.updateTSLocation�������ݿ���󣬲���Ϊ��" 
					+ "�޸ĵ�����Ϣʧ��" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//�������ݿ����ӷ���Ĵ���
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.updateTSLocation����ת���ַ������󣬲���Ϊ��" 
					+ "�޸ĵ�����Ϣʧ��" + ue.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.updateTSLocation���ִ��󣬲���Ϊ��" 
					+ "�޸ĵ�����Ϣʧ��" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//����δ֪�쳣����
		}
		finally
		{
			// �ر����п�����Դ
			close(null, pstm, null, con);
		}
	}

	/*
	 * ������������ѯ������ϢAJAX
	 */
	public String queryTSLocation(int perPage, int curPage, String s,
			ServletContext sc, HttpSession session) throws CustomException,
			Exception
	{
		// �жϻ���ʵ���Ƿ�Ϊ��
		if(sc == null)
		{
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		// �жϻỰʵ���Ƿ�Ϊ��
		if(session == null)
		{
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
		// ����SQL���
		StringBuffer sqlSB = null;
		StringBuffer countSB = null;

		Connection con = null;// �������ݿ�����
		// PreparedStatement pstm=null;//����Ԥ�������
		ResultSet rs = null;// �����ѯ�Ľ����

		PageMan pm = PageManFactory.getInstance();

		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();

			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
			}

			infoSB = new StringBuffer();
			sqlSB = new StringBuffer();
			countSB = new StringBuffer();

			sqlSB
					.append("select id,locationId,locationName,longitude,latiTude,mapScaling from t_s_location ");
			countSB.append("select count(*) from t_s_location");

			if(s != null && s.length() > 0)
			{
				sqlSB.append(s);
				countSB.append(s);
			}

			sqlSB.append(" and status=1 order by id desc");
			countSB.append(" and status=1 order by id desc");

			rs = pm.list(con, perPage, curPage, countSB.toString(), sqlSB
					.toString());
			if(rs == null)
			{

				return "no";
			}

			ResultSetMetaData rsmd = rs.getMetaData();
			int numberOfColumns = rsmd.getColumnCount();

			while (rs != null && rs.next())
			{
				for (int i = 1; i <= numberOfColumns; i++)
				{
					infoSB.append(basePublic.out(rs.getString(i))).append(
							"</C>");

				}
				infoSB.append("</R>");
			}

			infoSB.append("|");

			infoSB.append(pm.getTotalPage()).append("</C>").append(
					pm.getTotalRow()).append("</C>").append(pm.getCurPage())
					.append("</C>");
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "����������ѯ������Ϣ�ɹ���",locationBean.class.getName());
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.queryTSLocation�������ݿ���󣬲���Ϊ��" 
					+ "����������ѯ������Ϣʧ��" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.queryTSLocation����ת���ַ������󣬲���Ϊ��" 
					+ "����������ѯ������Ϣʧ��" + ue.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.queryTSLocation���ִ��󣬲���Ϊ��" 
					+ "����������ѯ������Ϣʧ��" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
		finally
		{
			pm.close(true);

			close(rs, null, null, con);
			// �ر����п�����Դ
			// close(rs,pstm,null,con);
		}

		return infoSB.toString();
	}

	/*
	 * �޸�ǰ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
	 */
	public String beforeUpdateTSLocation(long id, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{

		// �жϻ���ʵ���Ƿ�Ϊ��
		if(sc == null)
		{
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		// �жϻỰʵ���Ƿ�Ϊ��
		if(session == null)
		{
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

		Connection con = null;// �������ݿ�����
		PreparedStatement pstm = null;// ����Ԥ�������
		PreparedStatement pstm2 = null;// ����Ԥ�������
		ResultSet rs = null;// �����ѯ�Ľ����
		ResultSet rs2 = null;// �����ѯ�Ľ����
		DataSource ds = null;
		try
		{
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
			}

			infoSB = new StringBuffer();

			pstm = con.prepareStatement("select locationId,locationName,longitude,latiTude,mapScaling,parentLocationId from t_s_location where id=?");

			pstm.setLong(1, id);

			rs = pstm.executeQuery();

			if(rs != null && rs.next())
			{
				String parentLocationId = rs.getString("parentLocationId");
				infoSB.append(id).append("</C>");
				infoSB.append(basePublic.out(rs.getString("locationId"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("locationName"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("longitude"))).append("</C>");
				infoSB.append(basePublic.out(basePublic.out(rs.getString("latiTude")))).append("</C>");
				infoSB.append(basePublic.out(basePublic.out(rs.getString("mapScaling")))).append("</C>");
				pstm2 = con.prepareStatement("select locationName from t_s_location where locationId='"+parentLocationId+"'");
				rs2 = pstm2.executeQuery();
				if(rs2!=null&&rs2.next()){
					infoSB.append(basePublic.out(rs2.getString("locationName"))).append("</C>");
				}
				infoSB.append(basePublic.out(rs.getString("parentLocationId"))).append("</C></R>");
			}
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "�޸�ǰ��ѯ������ϸ��Ϣ�ɹ���",locationBean.class.getName());
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.beforeUpdateTSLocation�������ݿ���󣬲���Ϊ��" 
					+ "�޸�ǰ��ѯ������ϸ��Ϣʧ��" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//�������ݿ����ӷ���Ĵ���
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.beforeUpdateTSLocation����ת���ַ������󣬲���Ϊ��" 
					+ "�޸�ǰ��ѯ������ϸ��Ϣʧ��" + ue.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.beforeUpdateTSLocation���ִ��󣬲���Ϊ��" 
					+ "�޸�ǰ��ѯ������ϸ��Ϣʧ��" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//����δ֪�쳣����
		}
		finally
		{
			// �ر����п�����Դ
			close(rs, pstm, null, con);
		}

		return infoSB.toString();
	}

	/*
	 * ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
	 */
	public String detailTSLocation(long id, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{

		// �жϻ���ʵ���Ƿ�Ϊ��
		if(sc == null)
		{
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		// �жϻỰʵ���Ƿ�Ϊ��
		if(session == null)
		{
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
		// ����SQL���

		Connection con = null;// �������ݿ�����
		PreparedStatement pstm = null;// ����Ԥ�������
		ResultSet rs = null;// �����ѯ�Ľ����

		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
			}

			infoSB = new StringBuffer();

			pstm = con
					.prepareStatement("select locationId, locationName,longitude,latiTude,mapScaling from t_s_location where id=?");
			// pstm.setObject(1, Integer.valueOf(s));
			pstm.setLong(1, id);

			rs = pstm.executeQuery();
			if(rs != null && rs.next())
			{
				infoSB.append(id).append("</C>");
				infoSB.append(basePublic.out(rs.getString("locationId"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("locationName"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("longitude"))).append("</C>");
				infoSB.append(basePublic.out(rs.getString("latiTude"))).append(
						"</C>");
				infoSB.append(basePublic.out(rs.getString("mapScaling")))
						.append("</C></R>");

			}
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "��ѯ������ϸ��Ϣ�ɹ���",locationBean.class.getName());
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.detailTSLocation�����ݿ��ִ��󣬲���Ϊ��" 
					+ "��ѯ������ϸ��Ϣʧ��" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.detailTSLocation���ִ��󣬲���Ϊ��" 
					+ "��ѯ������ϸ��Ϣʧ��" + ue.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.detailTSLocation���ִ��󣬲���Ϊ��" 
					+ "��ѯ������ϸ��Ϣʧ��" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
		finally
		{
			// �ر����п�����Դ
			close(rs, pstm, null, con);
		}

		return infoSB.toString();
	}

	/*
	 * ��ȡ������
	 */
	public String getLocationID(String s,ServletContext sc, HttpSession session)
			throws CustomException, SQLException
	{
		// �жϻ���ʵ���Ƿ�Ϊ��
		if(sc == null)
		{
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		// �жϻỰʵ���Ƿ�Ϊ��
		if(session == null)
		{
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

		Connection con = null;// �������ݿ�����
		PreparedStatement pstm = null;// ����Ԥ�������
		ResultSet rs = null;// �����ѯ�Ľ����
		DataSource ds = null;
		String result =null;
		String str="";
		try
		{
		
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
			}

			infoSB = new StringBuffer();
			pstm = con
			.prepareStatement("select locationId  from t_s_location where  parentLocationId=? and locationId!=parentLocationId and status=1");

			pstm.setString(1, s);
		
			rs = pstm.executeQuery();
			
			if(!rs.next()){
				result = s+"01";
			}
			rs.beforeFirst();
			List<String> list = new ArrayList<String>();
			
			while(rs != null && rs.next())
			{
				list.add(rs.getString("locationId"));
			}
			
			 if(list.size()==1){
				if(Integer.parseInt( list.get(0).substring(list.get(0).length()-2))>1){
					result = s +"01";
				}else{
					result = s+"02";
				}
			 }
			 for(int i=0;i<list.size()-1;i++){
				 int num  = Integer.parseInt(list.get(i).substring(list.get(i).length()-2, list.get(i).length()));
				 int numNext = Integer.parseInt(list.get(i+1).substring(list.get(i+1).length()-2, list.get(i+1).length()));
				 if(numNext-num != 1){
					 str=num +1>9?""+(num +1):"0"+(num +1);
					 result = s+str;
					break;
				 }else{
					 str=numNext+1>9?""+(numNext+1):"0"+(numNext+1);
					 result = s+str;
				 }
			 }
			 LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "���ɵ����ųɹ���",locationBean.class.getName());
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.getLocationID�������ݿ���󣬲���Ϊ��" 
					+ "���ɵ�����ʧ��" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.getLocationID���ִ��󣬲���Ϊ��" 
					+ "���ɵ�����ʧ��" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
		finally
		{
			// �ر����п�����Դ
			close(rs, pstm, null, con);
		}

		return result;
	}
}
