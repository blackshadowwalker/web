package modules.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class BaseAction extends Action
{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		String language = request.getLocale().getLanguage();
		if(language==null)
			language = BaseLanguage.DEFAULT_LANGUAGE;
		System.out.println("Browser Default Language="+language);
		request.setAttribute("language", language);
		return mapping.findForward("success");
	}
	
}
