package modules.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;

public final class logonAction extends Action
{
    /** 
     * Method execute
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return ActionForward
     * @throws Exception 
     */
    public ActionForward execute(
        ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response)
    throws Exception
    {
    		
    	baseForm theForm=(baseForm)request.getSession().getAttribute("baseuser");
    	
    	if(theForm==null){
    		System.out.println("ActionForward");
    		return mapping.findForward("failure");
    	}
    	else{
    		request.setAttribute("language", theForm.language);
    		theForm.clientIP=request.getRemoteAddr();
    		request.getSession().setAttribute("baseuser", theForm);
    		return mapping.findForward("success");
    	}
    }
}
