<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%
    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String language = bform.language;
//    System.out.println(language);
%>


<% 
    String thisPath=request.getContextPath();
    String qx=request.getParameter("qx"); 
%>


<html>
<head>
  <title><bean:message key="user.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <link href="<%=thisPath%>/modules/base/hx_table/css/hx_table.css" rel="stylesheet" type="text/css" />
  
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_wait_plugin/hx_wait_plugin.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/jquery.hx_table.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/rzgl/userlog/scripts/userlogObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/rzgl/userlog/scripts/userlogScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/userlogBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/scripts/validateForm.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("modules/base/css/calendar-blue.css"); </style>
</head>

<body onLoad="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/modules/jcxx/ruler/image/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>��ͳ�Ʒ�������־�������û���־</div></td>
        </tr>
    </table>
</div>

<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onClick="switch_index(this, 0)"><div align="center"><bean:message key="user.query" bundle="${language}"/></div></td>
    </tr>
  </table>
</div>

<div class=padcontent>

<div id=padcontent0 class=activecontent>

<form>

<!-- ѡ��<bean:message key="button.query" bundle="${language}"/>��ʽ -->

<table class=cardname>
<tbody>
  <tr>
    <td class=cardnameleft><bean:message key="user.query" bundle="${language}"/></td>
  </tr>
</tbody>
</table>

<!-- ����<bean:message key="button.query" bundle="${language}"/>���� -->

<div class=scrollarea style="width:100%;height:60px">
<table class=tableinput style="width:700px;">
<tbody>  
<tr >
    <td class=TDLeft>
		<bean:message key="user.label.userCode" bundle="${language}"/>
      	<input type="text" name="user_code" size=20 maxlength=40 value="" onKeyDown="setTab()">
    </td>
    <td class=TDLeft>
    	<bean:message key="user.label.userIP" bundle="${language}"/>
      <input type="text" name="user_ip" size=20 maxlength=40 value="" onKeyDown="setTab()">
    </td>
    <td class=TDLeft>
   	 <bean:message key="user.columns.content" bundle="${language}"/>
      <input type="text" name="logcontent" size=20 maxlength=40 value="" onKeyDown="setTab()">
    </td>
</tr>
</tbody>
</table>

</div>

<!-- <bean:message key="button.query" bundle="${language}"/>������ť -->

<!-- <button name="query" onClick="forQuery('')" class="button">��ʼ<bean:message key="button.query" bundle="${language}"/></button>
<button name="reset" onClick="forReset()" class="button">�������</button> -->

<span id=scrollbar><bean:message key="msg.inProgress" bundle="${language}"/></span>

</form>

<!-- ��ʾ<bean:message key="button.query" bundle="${language}"/>��� -->

<div id="hx_table_div" class="queryresult"></div>

</div>

<!-- ����Ȩ����Ϣ -->

<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
<script type="text/javascript">

//<bean:message key="button.query" bundle="${language}"/>�ȴ���...
var waitObj=new hx_wait($("#this_path_id").val()+"/modules/base/hx_wait_plugin");
var height = document.body.clientHeight;
$("#hx_table_div").height(height - 173);
</script>
</div>
</body>
</html>