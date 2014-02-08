package modules.base;

import javax.servlet.http.*;
import org.apache.struts.action.*;


public class logoffAction extends Action {

    /** 
     * Method execute
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return ActionForward
     */
    public ActionForward execute(
        ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        session.removeAttribute("baseuser");
        session.removeAttribute("basepage");
        session.invalidate();
        session = null;
        return (mapping.findForward("success"));
    }

}
