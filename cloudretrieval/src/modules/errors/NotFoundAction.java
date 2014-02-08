/*
 * @(#)dbsxAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.errors;


import javax.servlet.http.*;
import org.apache.struts.action.*;

import modules.base.baseForm;

/**
 * 功能:本类为待办事项的Action类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: dbsxAction.java,v 1.1 2012/09/30 01:54:21 Administrator Exp $
 */
public class NotFoundAction extends Action
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
        
        return mapping.findForward("success");
    }
}
