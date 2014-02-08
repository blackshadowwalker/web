/*
 * @(#)codeAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.mmxg;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import modules.base.*;

/**
 * ����:����Ϊ������Ϣ��Action��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: mmxgAction.java,v 1.1 2012/09/30 01:54:27 Administrator Exp $
 */
public class mmxgAction extends Action
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
        
        
        return mapping.findForward("success");
    }
}
