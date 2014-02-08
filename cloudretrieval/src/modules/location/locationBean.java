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
	 * 地域信息数据删除
	 */
	public int deleteTSLocation(String id, int status, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{

		// 判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		// 判断用户是否登录
		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}

		// 保存SQL语句
		StringBuffer sqlSB = null;

		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句

		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
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
					+ "删除地域信息成功！",locationBean.class.getName());

			return num;

		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.deleteTSLocation出现数据库错误，操作为：" 
					+"删除地域信息失败" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.deleteTSLocation出现转化字符集错误，操作为：" 
					+ "删除地域信息失败：" + ue.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.deleteTSLocation出现错误，操作为：" 
					+ "删除地域信息失败" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally
		{
			// 关闭所有可用资源
			close(null, pstm, null, con);
		}
	}

	/*
	 * 添加代码信息AJAX
	 */
	public int addTSLocation(String labels, String values, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{
		// 判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		// 判断用户是否登录

		baseForm bform = (baseForm) session.getAttribute("baseuser");

		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}

		// 保存SQL语句
		StringBuffer sqlSB = null;

		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句
		DataSource ds = null;
		try
		{
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
			}

			sqlSB = new StringBuffer();

			sqlSB.append("insert into t_s_location(").append(labels).append(
					") values (").append(values).append(")");

			pstm = con.prepareStatement(basePublic.in(sqlSB.toString()));

			int num = pstm.executeUpdate();

			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "添加地域信息成功！",locationBean.class.getName());
			return num;
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.addTSLocation出现数据库错误，操作为：" 
					+ "添加地域信息失败" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.addTSLocation出现转化字符集错误，操作为：" 
					+ "添加地域信息失败" + ue.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.addTSLocation出现错误，操作为：" 
					+ "添加地域信息失败" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally
		{
			// 关闭所有可用资源
			close(null, pstm, null, con);
		}
	}

	/*
	 * 修改代码信息AJAX
	 */
	public int updateTSLocation(String id, String values, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{
		// 判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
			throw new CustomException("HttpSession 为空，返回");
		}
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

		// 判断用户是否登录
		baseForm bform = (baseForm) session.getAttribute("baseuser");
		if(bform == null)
		{
			throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
		}

		// 保存SQL语句
		StringBuffer sqlSB = null;

		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句
		DataSource ds = null;
		try
		{
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
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
					+ "修改地域信息成功！",locationBean.class.getName());

			return num;
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.updateTSLocation出现数据库错误，操作为：" 
					+ "修改地域信息失败" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.updateTSLocation出现转化字符集错误，操作为：" 
					+ "修改地域信息失败" + ue.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.updateTSLocation出现错误，操作为：" 
					+ "修改地域信息失败" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally
		{
			// 关闭所有可用资源
			close(null, pstm, null, con);
		}
	}

	/*
	 * 根据条件语句查询代码信息AJAX
	 */
	public String queryTSLocation(int perPage, int curPage, String s,
			ServletContext sc, HttpSession session) throws CustomException,
			Exception
	{
		// 判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
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
		// 保存SQL语句
		StringBuffer sqlSB = null;
		StringBuffer countSB = null;

		Connection con = null;// 保存数据库连接
		// PreparedStatement pstm=null;//保存预处理语句
		ResultSet rs = null;// 保存查询的结果集

		PageMan pm = PageManFactory.getInstance();

		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();

			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
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
					+ "根据条件查询地域信息成功！",locationBean.class.getName());
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.queryTSLocation出现数据库错误，操作为：" 
					+ "根据条件查询地域信息失败" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.queryTSLocation出现转化字符集错误，操作为：" 
					+ "根据条件查询地域信息失败" + ue.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.queryTSLocation出现错误，操作为：" 
					+ "根据条件查询地域信息失败" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally
		{
			pm.close(true);

			close(rs, null, null, con);
			// 关闭所有可用资源
			// close(rs,pstm,null,con);
		}

		return infoSB.toString();
	}

	/*
	 * 修改前根据ID值查询详细的代码信息AJAX
	 */
	public String beforeUpdateTSLocation(long id, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{

		// 判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
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

		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句
		PreparedStatement pstm2 = null;// 保存预处理语句
		ResultSet rs = null;// 保存查询的结果集
		ResultSet rs2 = null;// 保存查询的结果集
		DataSource ds = null;
		try
		{
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
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
					+ "修改前查询地域详细信息成功！",locationBean.class.getName());
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.beforeUpdateTSLocation出现数据库错误，操作为：" 
					+ "修改前查询地域详细信息失败" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.beforeUpdateTSLocation出现转化字符集错误，操作为：" 
					+ "修改前查询地域详细信息失败" + ue.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.beforeUpdateTSLocation出现错误，操作为：" 
					+ "修改前查询地域详细信息失败" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
		}
		finally
		{
			// 关闭所有可用资源
			close(rs, pstm, null, con);
		}

		return infoSB.toString();
	}

	/*
	 * 根据ID值查询详细的代码信息AJAX
	 */
	public String detailTSLocation(long id, ServletContext sc,
			HttpSession session) throws CustomException, Exception
	{

		// 判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
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
		// 保存SQL语句

		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句
		ResultSet rs = null;// 保存查询的结果集

		try
		{
			con = ((DataSource) sc.getAttribute("basedb")).getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
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
					+ "查询地域详细信息成功！",locationBean.class.getName());
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.detailTSLocation出数据库现错误，操作为：" 
					+ "查询地域详细信息失败" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.detailTSLocation出现错误，操作为：" 
					+ "查询地域详细信息失败" + ue.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.detailTSLocation出现错误，操作为：" 
					+ "查询地域详细信息失败" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally
		{
			// 关闭所有可用资源
			close(rs, pstm, null, con);
		}

		return infoSB.toString();
	}

	/*
	 * 获取地域编号
	 */
	public String getLocationID(String s,ServletContext sc, HttpSession session)
			throws CustomException, SQLException
	{
		// 判断环境实例是否为空
		if(sc == null)
		{
			throw new CustomException("ServletContext 为空，返回");
		}

		// 判断会话实例是否为空
		if(session == null)
		{
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

		Connection con = null;// 保存数据库连接
		PreparedStatement pstm = null;// 保存预处理语句
		ResultSet rs = null;// 保存查询的结果集
		DataSource ds = null;
		String result =null;
		String str="";
		try
		{
		
			ds = (DataSource) sc.getAttribute("basedb");
			con = ds.getConnection();
			if(con == null)
			{
				throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
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
						+ "生成地域编号成功！",locationBean.class.getName());
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.getLocationID出现数据库错误，操作为：" 
					+ "生成地域编号失败" + sql.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "locationBean.getLocationID出现错误，操作为：" 
					+ "生成地域编号失败" + ce.getMessage(),locationBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
		finally
		{
			// 关闭所有可用资源
			close(rs, pstm, null, con);
		}

		return result;
	}
}
