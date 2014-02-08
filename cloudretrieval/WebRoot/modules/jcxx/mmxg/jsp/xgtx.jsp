<%@ page language="java" contentType="text/html;charset=GBK" %>

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

<head>  <base target="_self"/> 
  <title><bean:message key="button.modify" bundle="${language}"/>个人信息</title>
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
    <td class=cardnameleft>选择头像</td>
    <td class=cardnameright>注：单击选择头像</td>
  </tr>
</table>

<!-- 输入 -->

<form>

<div class=inputarea2>

<table class=tableinput>

  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>选择头像：</td>
    <td class=TDLeft>
     <script language="javascript">
	for(var i = 1;i<=87;i++)
	{
	
    document.write("<a href=\"javascript:fortj('"+i+"')\"><img src='<%=thisPath%>/modules/zxjl/qqface/"+i+"-1.bmp'></a>");
    if(i%8==0)
    document.write("<br>");
    }
	</script>
    </td>
	
  </tr>
  

 
<script language="javascript">

</script>
</table>
</div>

<!-- 插入操作按钮 -->

</form>

</div>
</div>

<script language="javascript">


function fortj(value)
{
	  window.returnValue =value;
	  window.close();
}
</script>
</body>
</html>
