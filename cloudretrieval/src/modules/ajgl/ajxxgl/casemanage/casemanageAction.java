package modules.ajgl.ajxxgl.casemanage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import modules.base.CustomException;
import modules.base.baseForm;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class casemanageAction  extends Action
{

	public ActionForward execute(
	        ActionMapping mapping,
	        ActionForm form,
	        HttpServletRequest request,
	        HttpServletResponse response)
	        throws Exception
	    {
	    	//判断用户是否登录
	    	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	    	
	        if (bform==null)
	            return mapping.findForward("failure");
	        
	        Connection con=null;
	        Statement sta=null;
	        ResultSet rs=null;
	        StringBuffer sb=null;
	        try{
		        con=((DataSource) servlet.getServletContext().getAttribute("basedb")).getConnection();
		        if (con==null)
	            {
	                throw new CustomException("数据库连接Connection为空，连接失败。");
	            }
		        sb = new StringBuffer();
		        sta=con.createStatement();
		        rs=sta.executeQuery("SELECT id,name FROM t_m_caseType WHERE status=1");
		        while(rs!=null && rs.next()){
		        	sb.append(rs.getInt(1)).append("</C>");
		        	sb.append(rs.getString(2)).append("</R>");
		        }
		        request.getSession().setAttribute("case_type", sb.toString());
	        }catch(Exception e){
	        	e.getStackTrace();
	        	throw new Exception("数据库方面错误！");
	        }finally{
	        	con.close();
	        	sta.close();
	        	rs.close();
	        }
	        return mapping.findForward("success");
	    }
}
