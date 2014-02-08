package modules.cloud.taskMgr;

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

public class taskMgrAction extends Action
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
	        
	        baseBean bb=new baseBean((DataSource)servlet.getServletContext().getAttribute("basedb"));
	        
	        // 获得机构级别的列表ID和值
	        //List<String> DeptLevelIDs=new ArrayList<String>();
	        //List<String> DeptLevelNames=new ArrayList<String>();
	        List DeptLevelIDs=new ArrayList();
	        List DeptLevelNames=new ArrayList();
	        bb.getLevelInfos("t_s_dept.dept_level", DeptLevelIDs,DeptLevelNames);
	        request.setAttribute("DeptLevelIDs",DeptLevelIDs);
	        request.setAttribute("DeptLevelNames",DeptLevelNames);
	        
	        return mapping.findForward("success");
	    }
}
