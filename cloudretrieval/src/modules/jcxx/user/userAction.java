/*
 * @(#)userAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.user;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import modules.base.baseForm;

/**
 * 功能:本类为用户信息的Action类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: userAction.java,v 1.1 2012/09/30 01:54:22 Administrator Exp $
 */
public class userAction extends Action
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
