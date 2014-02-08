<%@ page contentType="text/html;charset=GBK" isErrorPage="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="modules.base.*"%>
<html>

<%
    String thisPath=request.getContextPath();
	baseForm user = (baseForm)session.getAttribute("baseuser");
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>bottom PAGE</title>

<LINK href="<%=thisPath%>/modules/bottom/css/base.css" rel=stylesheet type=text/css>
</head>

<body topmargin="0" leftmargin="0">
<table width="100%" height="23" border="0" cellpadding="0" cellspacing="0" background="<%=thisPath%>/modules/bottom/image/tou_bjs.jpg">
  <tr>
    <td align="center" valign="bottom"><font color="#666666"><%=user.footerContent %></font></td>
  </tr>
</table>
</body>
</html>