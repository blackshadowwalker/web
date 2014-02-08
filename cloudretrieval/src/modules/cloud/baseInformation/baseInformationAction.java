package modules.cloud.baseInformation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import modules.base.baseBean;
import modules.base.baseForm;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class baseInformationAction extends Action
{
	public ActionForward execute(
	        ActionMapping mapping,
	        ActionForm form,
	        HttpServletRequest request,
	        HttpServletResponse response)
	        throws Exception
	    {
	    	//ÅÐ¶ÏÓÃ»§ÊÇ·ñµÇÂ¼
	    	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	    	
	        if (bform==null)
	            return mapping.findForward("failure");
	        
	        baseBean bb=new baseBean((DataSource)servlet.getServletContext().getAttribute("basedb"));
	        
	        List DeptLevelIDs=new ArrayList();
	        List DeptLevelNames=new ArrayList();
	        bb.getLevelInfos("t_s_dept.dept_level", DeptLevelIDs,DeptLevelNames);
	        request.setAttribute("DeptLevelIDs",DeptLevelIDs);
	        request.setAttribute("DeptLevelNames",DeptLevelNames);
	        
	        return mapping.findForward("success");
	    }
}
