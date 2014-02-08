<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="modules.base.*"%>

<% 
    String thisPath=request.getContextPath();
    String qx=request.getParameter("qx");
    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
%>

<html>

<head>
  <title><bean:message key="modifyPassword" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/mmxg/script/mmxgScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/mmxgBean.js"></script>

  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
</head>

<body onload="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div >


<!-- 增加代码信息 -->

<div id=padcontent1 >

<table class=cardname>
  <tr>
    <td class=cardnameleft><bean:message key="modifyPassword" bundle="${language}"/></td>
    <td class=cardnameright><bean:message key="label.note.requiredField" bundle="${language}"/></td>
  </tr>
</table>

<!-- 输入 -->
<form></form>
<form>

<div class=inputarea2>

<table class=tableinput>

  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span><bean:message key="mmxg.oldPassword" bundle="${language}"/>：</td>
    <td class=TDLeft>
      <input type="password" id="i_oldpasswd" name="oldpasswd" size=20 maxlength=40 value="">

    </td>
  </tr>
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span><bean:message key="mmxg.newPassword" bundle="${language}"/>：</td>
    <td class=TDLeft>
      <input type="password" id="i_newpasswd" name="newpasswd" size=20 maxlength=40 value="">

    </td>
  </tr>
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span><bean:message key="mmxg.confirmPassword" bundle="${language}"/>：</td>
    <td class=TDLeft>
      <input type="password" id="i_renewpasswd" name="renewpasswd" size=20 maxlength=80 value="">

    </td>
  </tr>

</table>
</div>

<!-- 插入操作按钮 -->

<button id="submit_id" name="submit" onClick="forInsert('<%=thisPath%>','<%=bform.user_code%>')" class="button"><bean:message key="button.label.submit" bundle="${language}"/></button>
<button id="reset_id" name="clear" onClick="forClear()" class="button"><bean:message key="button.label.close" bundle="${language}"/></button>

</form>

</div>
</div>

<script language="javascript">
  /**  
    getQX('<%=qx%>','<%=thisPath%>',[
    	{
    		optMark:"S",//提交操作
    		elemId:"submit_id",//操作所关联元素ID
    		type:"disabled",//元素屏蔽类型(hide或disabled)
    		objSource:"page"//元素所属范围(目前：page--页面或tableObj--表格控件)
    	},
    	{
    		optMark:"R",//重置操作
    		elemId:"reset_id",//操作所关联元素ID
    		type:"disabled",//元素屏蔽类型(hide或disabled)
    		objSource:"page"//元素所属范围(目前：page--页面或tableObj--表格控件)
    	}
    ]);
**/    
</script>
</body>
</html>
