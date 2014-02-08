package modules.logon;

import java.io.*;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.apache.struts.Globals;
import org.apache.struts.util.MessageResources;
import org.apache.struts.util.MessageResourcesFactory;
import org.apache.xbean.spring.context.ClassPathXmlApplicationContext;
import org.springframework.context.ApplicationContext;

import sun.security.provider.DSAKeyPairGenerator;

import com.sun.corba.se.impl.protocol.giopmsgheaders.Message;
import com.sun.net.httpserver.HttpContext;

import modules.base.CustomException;
import modules.base.baseForm;
import modules.base.basePublic;
import cryptix.CryptixException;
import cryptix.provider.md.SHA1;
import cryptix.util.core.Hex;
import modules.base.*;

public class logonBean extends ResourceClose{

	public logonBean(){
	}

	/*
	 * SHA加密函数
	 */
	public static String digest(String strBlock)
	throws CryptixException
	{
		if (strBlock == null)
			return null;

		try
		{
			SHA1 sha1 = new SHA1();
			return Hex.toString(sha1.digest(strBlock.getBytes()));
		}
		catch(CryptixException t)
		{
			return null;
		}
	}
	public boolean setLanguage(String code,String language,
			ServletContext sc,HttpSession session) 
	throws CustomException,Exception
	{
		System.out.println("setLanguage:"+language);
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		boolean ret = false;
		StringBuffer sqlSB = null;
		
		session.setAttribute(Globals.LOCALE_KEY, BaseLanguage.getLocale(language));
		ResourceBundle resourceBundle=ResourceBundle.getBundle(BaseLanguage.BASENAME,(Locale)session.getAttribute(Globals.LOCALE_KEY));
		session.setAttribute("resourceBundle", resourceBundle);
		
		baseForm theForm = (baseForm)session.getAttribute("baseuser");
		if(theForm==null)
			return true;
		if(sc==null)
			throw new CustomException("ServletContext无法获得。");
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		try{
			theForm.language = language;
			session.setAttribute("language", language);
			con = ((DataSource)sc.getAttribute("basedb")).getConnection();
			if (con == null)
			{
				throw new CustomException(rb.getString("exp.databaseConnectFaild"));//数据库连接失败，请检查连接池是否建立成功或正常运行
			}
			sqlSB = new StringBuffer();
			sqlSB.append("update t_u_person set language=?  where  user_code=? ");
			pstm = con.prepareStatement(sqlSB.toString());
			pstm.setString(1, language.trim());
			pstm.setString(2, code.trim());
			int val = pstm.executeUpdate();
			if(val>0)
				ret = true;
		}
		catch(SQLException sql){
			con.rollback();
			sql.printStackTrace();
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");
		}
		catch(Exception ce){
			con.rollback();
			ce.printStackTrace();
			throw ce;
		}
		finally{
			close(rs,pstm,false,null,false,con);
		}
		return ret;
	}
	
	/*
	 * 检查用户是否存在角色
	 */
	public String checkRole(String code,String pw, String captchacode,ServletContext sc,HttpSession session) throws CustomException,Exception
	{
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		StringBuffer sqlSB = new StringBuffer();
		
		PreparedStatement pstm2 = null;
		ResultSet rs2 = null;
		
		if (code == null || pw == null)
			throw new CustomException("请按流程正常登录。");//
		if(sc==null)
			throw new CustomException("ServletContext无法获得");//
		ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
		
		String captcha = (String)session.getAttribute("CaptchaCode");
		if(captcha==null || !captcha.trim().equals(captchacode.toUpperCase()))
			throw new CustomException(rb.getString("login.err.captchaError"));
		
		try{
			con = ((DataSource)sc.getAttribute("basedb")).getConnection();
			if (con == null)
			{
				throw new CustomException(rb.getString("exp.databaseConnectFaild"));//数据库连接失败，请检查连接池是否建立成功或正常运行
			}
			con.setAutoCommit(false);
			baseForm theForm=null;
			sqlSB = new StringBuffer();
			sqlSB.append("select * from t_u_person where  user_code=? and passwd=?");
			System.out.println(code);
			pstm = con.prepareStatement(sqlSB.toString());
			pstm.setString(1,code.trim());
			pstm.setString(2, pw);
			rs=pstm.executeQuery();
			boolean jcz = false;
			String role_code = "";
			if(rs!=null && rs.next())
			{
					if(rs.getString("status").equals("0"))
					{
						throw new CustomException(rb.getString("exp.login.userBeCanceled"));//该用户已经被注销了，无法正常登陆系统!
					}
					theForm=new baseForm();
					theForm.user_code=rs.getString("user_code");
					theForm.user_name = basePublic.out(rs.getString("user_name"));
					theForm.photo_path = rs.getString("photo_path");
					theForm.csrq = rs.getString("csrq");
					String language = rs.getString("language");
					if(language==null || language.isEmpty())
						theForm.language = "en_US";
					else
						theForm.language = language;
					session.setAttribute("language", language);
					session.setAttribute(Globals.LOCALE_KEY, BaseLanguage.getLocale(language));
					theForm.role_code = rs.getString("role_code");
					//机构代码
					theForm.dept_code = rs.getString("dept_code");
			}
			else
			{
				session.setAttribute("CaptchaCode","");
				throw new CustomException(rb.getString("exp.login.pleaseCheckUsernameAndPassword"));
//				throw new CustomException("请检查用户名或密码是否正确!");
			}
			close(rs,pstm,null,null);
			//查找机构名称
			sqlSB = new StringBuffer();
			sqlSB.append("select dept_name from t_s_dept where dept_code ='"+theForm.dept_code+"'");
			pstm = con.prepareStatement(sqlSB.toString());
			rs = pstm.executeQuery();
			if(rs!=null && rs.next())
			{
				theForm.dept_name = rs.getString("dept_name");
			}
			close(rs,pstm,null,null);
			// 查询角色的名称
			sqlSB = new StringBuffer();
			sqlSB.append("select role_name from t_s_role where role_code ='"+theForm.role_code+"'");
			pstm = con.prepareStatement(sqlSB.toString());
			rs = pstm.executeQuery();
			if(rs!=null && rs.next())
			{
				theForm.role_name = rs.getString("role_name");
			}
			// 查询LOGO、主题、页脚
			sqlSB = new StringBuffer();
			sqlSB.append("SELECT * FROM t_s_baseinfo WHERE work =1");
			pstm = con.prepareStatement(sqlSB.toString());
			rs = pstm.executeQuery();
			if(rs!=null && rs.next())
			{
				pstm2 = con.prepareStatement("SELECT filePath FROM t_s_uploadfiles WHERE fileCode=? ");
				pstm2.setString(1, rs.getString("logo"));
				rs2 = pstm2.executeQuery();
				if(rs2!=null&&rs2.next()){
					theForm.logo = rs2.getString("filePath");
				}else{
					theForm.logo = "nofiles";
				}
				//theForm.logo = rs.getString("logo");
				theForm.mainTitle = rs.getString("mainTitle");
				theForm.footerContent = rs.getString("footerContent");
				session.setAttribute("version", rs.getString("version"));
			}
			close(rs,pstm,null,null);
           //查找地理位置
			sqlSB = new StringBuffer();
			sqlSB.append("select locationId from t_s_location where status = 1 ");
			pstm = con.prepareStatement(sqlSB.toString());
			rs = pstm.executeQuery();
			if(rs!=null && rs.next())
			{
				theForm.locationId = rs.getString("locationId");
			}
			close(rs,pstm,null,null);

			System.out.println("squeezedEnable="+sc.getInitParameter("squeezedEnable"));
			
			String sessionId = null;
			String squeezedEnable = (String)sc.getInitParameter("squeezedEnable");
			if(squeezedEnable.equals("1"))
				sessionId = baseFormMgr.getSessionID(theForm.user_code);
			if(sessionId!=null){
				MySessionContext myc= MySessionContext.getInstance();
				HttpSession sess = myc.getSession(sessionId);
				sess.invalidate();
				sess = null;
				baseFormMgr.pop(theForm);
			}			
			theForm.sessionID = session.getId();
			System.out.println("sessionID="+theForm.sessionID+"  user:"+theForm.user_name+" log in.");
			session.setAttribute("baseuser",theForm);
			baseFormMgr.push(theForm);

			close(rs,pstm,null,null);
			
			return role_code;//正常返回
		}
		catch(SQLException sql){
			con.rollback();
			sql.printStackTrace();
			throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
		}
		catch(Exception ce){
			con.rollback();
			ce.printStackTrace();

			throw ce;
		}
		finally{
			//关闭所有可用资源
			close(rs,pstm,false,null,false,con);
		}
	}
	
}