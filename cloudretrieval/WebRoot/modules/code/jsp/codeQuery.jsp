<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<% 
    String thisPath=request.getContextPath();
    String qx=request.getParameter("qx");
     baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String language = bform.language;
%>

<html>

<head>
  <title><bean:message key="basedata.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
    <link href="<%=thisPath%>/modules/base/hx_table/css/hx_table.css" rel="stylesheet" type="text/css" />
	
	 <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/jquery.hx_table.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/code/script/codeObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/code/script/codeScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/codeBean.js"></script>
  <script type="text/javascript" src="scripts/calendar.js"></script>
  <script type="text/javascript" src="scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="scripts/cn_utf8.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/scripts/validateForm.js"></script>
  <style type="text/css"> @import url("css/calendar-blue.css"); </style>
</head>

<body onload="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/images/main/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>：系统管理＞系统信息管理＞标准数据管理</div></td>
        </tr>
    </table>
</div>
<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onclick="switch_index(this, 0)"><div align="center"><bean:message key="basedata.title" bundle="${language}"/></div></td>
      <td id=padindex1 class=hiddenindex onclick="switch_index(this, 1)" style="display:none"><div align="center"><bean:message key="basedata.insert" bundle="${language}"/></div></td>
    </tr>
  </table>
</div>
<div class=padcontent>

<div id=padcontent0 class=activecontent>

<form>

<!-- 选择<bean:message key="button.query" bundle="${language}"/>方式 -->

<table class=cardname>
<tbody>
  <tr>
    <td class=cardnameleft><bean:message key="basedata.query" bundle="${language}"/></td>
  </tr>
</tbody>
</table>

<!-- 输入<bean:message key="button.query" bundle="${language}"/>条件 -->

<div class=scrollarea>

<table class=tableinput>
<tbody>

  <tr>
<script language="javascript">
    show_string_condition("<bean:message key="basedata.label.codetype" bundle="${language}"/>", "type_op");
</script>
    <td class=TDLeft>
      <input type="text" name="type" size=20 maxlength=40 value="" onKeyDown="setTab()">
    </td>
  </tr>
  <tr>
<script language="javascript">
    show_string_condition("<bean:message key="basedata.label.codevalue" bundle="${language}"/>", "code_op");
</script>
    <td class=TDLeft>
      <input type="text" name="code" size=20 maxlength=40 value="" onKeyDown="setTab()">
    </td>
  </tr>
  <tr>
<script language="javascript">
    show_string_condition("<bean:message key="basedata.label.codetext" bundle="${language}"/>", "value_op");
</script>
    <td class=TDLeft>
      <input type="text" name="value" size=20 maxlength=80 value="" onKeyDown="setTab()">
    </td>
  </tr>

</tbody>
</table>

</div>

<!-- <bean:message key="button.query" bundle="${language}"/>操作按钮 -->

<!-- <button name="query" onClick="forQuery()" class="button">开始<bean:message key="button.query" bundle="${language}"/></button>
<button name="reset" onClick="forReset()" class="button">清空条件</button> -->

</form>

<!-- 显示<bean:message key="button.query" bundle="${language}"/>结果 -->

<div id="hx_table_div" class="queryresult"></div>

</div>

<!-- 增加代码信息 -->

<div id=padcontent1 class=hiddencontent>

<table class=cardname>
  <tr>
    <td class=cardnameleft><bean:message key="basedata.insert" bundle="${language}"/></td>
    <td class=cardnameright><bean:message key="label.note.requiredField" bundle="${language}"/></td>
  </tr>
</table>

<!-- 输入 -->

<form id="codeform">

<div class=inputarea style="height:200px">

<table class=tableinput>

  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span><bean:message key="basedata.label.codetype" bundle="${language}"/>：</td>
    <td class=TDLeft>
      <input type="text" id="i_type" name="type" size=20 maxlength=40 value="" isValidate="true" notEmpty="true" >

    </td>
  </tr>
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span><bean:message key="basedata.label.codevalue" bundle="${language}"/>：</td>
    <td class=TDLeft>
      <input type="text" id="i_code" name="code" size=20 maxlength=40 value="" isValidate="true" notEmpty="true" >

    </td>
  </tr>
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span><bean:message key="basedata.label.codetext" bundle="${language}"/>：</td>
    <td class=TDLeft>
      <input type="text" id="i_value" name="value" size=20 maxlength=80 value="" isValidate="true" notEmpty="true" >

    </td>
  </tr>
  
    <tr>
    <td class=TDTitle><bean:message key="basedata.label.comment" bundle="${language}"/>：</td>
    <td class=TDLeft>
      <input type="text" id="i_content" name="content" size=20 maxlength=40 value="">
    </td>
  </tr>

</table>
</div>

<!-- 插入操作按钮 -->

<button name="submit" onClick="forInsert('<%=thisPath%>')" class="button"><bean:message key="button.label.submit" bundle="${language}"/></button>
<button name="clear" onClick="forClear()" class="button"><bean:message key="button.label.reset" bundle="${language}"/></button></button>

</form>
<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
</div>
</div>
</body>
</html>
