package modules.ajgl.ajxxgl.clgl;

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

public class clglAction  extends Action
{

	public ActionForward execute(
	        ActionMapping mapping,
	        ActionForm form,
	        HttpServletRequest request,
	        HttpServletResponse response)
	        throws Exception
	    {
	    	//�ж��û��Ƿ��¼
	    	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	    	
	        if (bform==null)
	            return mapping.findForward("failure");
	        
	        baseBean bb=new baseBean((DataSource)servlet.getServletContext().getAttribute("basedb"));
	    	(request.getSession()).setAttribute("picture", servlet.getServletContext().getInitParameter("picture"));

	        
	        String rulerCode = (String)request.getParameter("qx");
	        List rulerCodeList = new ArrayList();
	        List rulerNameList = new ArrayList();
	        bb.getRulers(rulerCode, rulerCodeList, rulerNameList);
	        request.setAttribute("rulerCodeList", rulerCodeList);
	        request.setAttribute("rulerNameList", rulerNameList);
	        
	        
	        // ���״̬���б�ID��ֵ
	        List XycdIDs=new ArrayList();
	        List XycdNames=new ArrayList();
	        bb.getLevelInfos("t_m_report.xycd ", XycdIDs,XycdNames);
	        (request.getSession()).setAttribute("XycdIDs",XycdIDs);
	        (request.getSession()).setAttribute("XycdNames",XycdNames);
	        
	        // ��û���������б�ID��ֵ
	        List DeptLevelIDs=new ArrayList();
	        List DeptLevelNames=new ArrayList();
	        bb.getLevelInfos("t_s_dept.dept_level", DeptLevelIDs,DeptLevelNames);
	        request.setAttribute("DeptLevelIDs",DeptLevelIDs);
	        request.setAttribute("DeptLevelNames",DeptLevelNames);
	        
	        return mapping.findForward("success");
	    }
}
