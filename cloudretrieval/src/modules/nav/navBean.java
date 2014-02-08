package modules.nav;

import java.sql.*;
import java.io.UnsupportedEncodingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import modules.base.*;


public class navBean extends ResourceClose{

	public navBean(){

	}
	public String getMenu(String ruler_level,String ruler_code,ServletContext ctx,HttpSession session) throws CustomException,Exception 
	{
		//判断环境实例是否为空
		if (ctx == null){
			throw new CustomException("ServletContext 为空，返回");
		}
		//判断会话实例是否为空
		if(session==null){
			throw new CustomException("HttpSession 为空，返回");
		}
		//判断用户是否登录
		baseForm bform=(baseForm)session.getAttribute("baseuser");
		if(bform==null){
			throw new CustomException("连接失效，请重新登录系统。");
		}
		//保存查询结果信息
		StringBuffer infoSB=null;
		//保存SQL语句
		Connection con=null;//保存数据库连接
		PreparedStatement pstm=null;//保存预处理语句
		ResultSet rs=null;//保存查询的结果集
		
		PreparedStatement pstm2=null;//保存预处理语句
		ResultSet rs2=null;//保存查询的结果集

		String sql="";
		String role_code=null;//角色代码
		try{
			con= ((DataSource)ctx.getAttribute("basedb")).getConnection();
			//判断数据库连接是否连接成功
			if (con == null){
				throw new CustomException("数据库连接Connection为空，连接失败。");
			}
			role_code=bform.role_code;
			String dept_code = bform.dept_code;
			String role_codes = baseBean.getAllRole(role_code);//多角色管理之用
			infoSB=new StringBuffer();
		
			if (role_code == null)
			{
				//role_code==0 for test
				sql = "select distinct a.id,a.ruler_code,(c.ruler_name),ruler_desc,ruler_page,sffq,target,xuhao  from t_s_ruler a,t_s_rulerValue c ";
				if (ruler_level.equals("0"))
				{
					sql += " where ruler_level=?  and a.ruler_code=c.ruler_code and c.language=? and ruler_echo=0 and a.status=1 order by a.xuhao ";
					pstm = con.prepareStatement(sql);
					pstm.setObject(1,Integer.valueOf(ruler_level));
					pstm.setObject(2, bform.language);
				}
				else
				{	
					sql += " where ruler_level=? and  a.ruler_code=c.ruler_code and c.language=? and ruler_manager=? and ruler_echo=0 and status=1 order by xuhao ";
					pstm = con.prepareStatement(sql);
					pstm.setObject(1, Integer.valueOf(ruler_level));
					pstm.setObject(2, bform.language);
					pstm.setObject(3, ruler_code);
				}
			}
			else
			{
				sql = "select distinct a.id, a.ruler_code as ruler_code, (c.ruler_name) as ruler_name,a.ruler_desc as ruler_desc," +
					"a.ruler_page as ruler_page,a.sffq as sffq,a.target as target,a.xuhao as xuhao " +
					"from t_s_ruler a,t_s_rolevalue b, t_s_rulerValue c ";
				
				if (ruler_level.equals("0"))
				{
					//支持一个帐号多角色查询
					sql += "where b.role_code in ("+role_codes+") " +
							"and a.ruler_level=? and  a.ruler_code=c.ruler_code and c.language=? and a.ruler_code=b.ruler_code and a.ruler_echo=0 and a.status=1 and b.status=1 order by a.xuhao";
					pstm = con.prepareStatement(sql);
					pstm.setObject(1, Integer.valueOf(ruler_level));
					pstm.setObject(2, bform.language);
				}
				else
				{
					sql += " where b.role_code in ("+role_codes+") and a.ruler_level=? and  a.ruler_code=c.ruler_code and c.language=? and a.ruler_manager=? and a.ruler_code=b.ruler_code and a.ruler_echo=0 and a.status=1 and b.status=1 order by a.id";
					pstm = con.prepareStatement(sql);
					pstm.setObject(1, Integer.valueOf(ruler_level));
					pstm.setObject(2, bform.language);
					pstm.setObject(3, ruler_code);
				}
			}
			System.out.println(sql);
			//获得查询的结果集
			rs = pstm.executeQuery();
			while (rs!=null && rs.next())
			{
				//获得并封装数据
				infoSB.append(rs.getString("ruler_code")).append(",");
				infoSB.append(basePublic.out(rs.getString("ruler_name"))).append(",");
				infoSB.append(basePublic.out(rs.getString("ruler_desc"))).append(",");
				infoSB.append(basePublic.out(rs.getString("ruler_page"))).append(",");
				infoSB.append(rs.getInt("sffq")).append(",");
				infoSB.append(rs.getString("target")).append(",");
				infoSB.append(dept_code).append(";");
			
			}
			System.out.println(infoSB.toString());
		}
		catch(SQLException e){

			e.printStackTrace();

			throw new CustomException("出现错误："+e.getMessage());
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("出现错误："+ue.getMessage());
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现错误："+ce.getMessage());
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,null,null);
			
			close(rs2,pstm2,null,con);
		}
		return infoSB.toString();
	}

}


