/*
 * @(#)ggfjAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.image;

import java.util.*;
import java.sql.*;
import javax.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

import modules.base.*;

/**
 * ����:����Ϊ����������Action��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: ggfjAction.java,v 1.1 2012/10/13 08:45:55 Administrator Exp $
 */
public class imageAction extends Action
{

    public ActionForward execute(
        ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response)
        throws Exception
    {
    	System.out.println("imageAction");
        return mapping.findForward("success");
    }
}
