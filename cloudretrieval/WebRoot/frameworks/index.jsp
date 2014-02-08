<%@ page contentType="text/html;charset=GBK" isErrorPage="false" %>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>


<HTML>

<%
    String thisPath=request.getContextPath();
%>

<HEAD>
  <title></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="css/base.css" type="text/css">
  
</HEAD>

<CENTER>

<frameset rows="100,30,*,23" noresize frameborder=0>

  <frame src="<%=thisPath %>/topAction.do" name="topic" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" noresize="false" framespacing="0"/>
  <frame src="<%=thisPath %>/modules/nav/index.jsp" name="nav" scrolling="no" marginheight="0" marginwidth="0" frameborder="0" noresize="false" framespacing="0"/>
  
  <frameset cols="180,10,*" name="second" frameborder=0>
    <frame src="<%=thisPath %>/modules/menu/index.jsp" id="menu" name="menu" scrolling=no marginwidth=0 marginheight=0 noresize="false" framespacing="0"/>
    <frame src="<%=thisPath %>/modules/span/jsp/span.jsp" name="span" scrolling=no marginwidth=0 marginheight=0 noresize="false" framespacing="0"/>
    <frame src="<%=thisPath%>/modules/pad/index.jsp" name="pad" scrolling=yes marginwidth=0 marginheight=0/>
  </frameset>
  <frame name="bottomFrame" noresize="false" scrolling="no" src="<%=thisPath %>/modules/bottom/index.jsp">
</frameset>  

</CENTER>

</HTML>
