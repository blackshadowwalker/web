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
//	System.out.println(language);
    String thisPath=request.getContextPath();

    String qx=request.getParameter("qx"); 
    String user = bform.user_code;
%>


<html>
<head>
  <title><bean:message key="task.title" bundle="${language}"/></title>
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
  <script language="javascript" src="<%=thisPath%>/modules/cloud/taskMgr/scripts/taskMgrObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/cloud/taskMgr/scripts/taskMgrScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/taskMgrBean.js"></script>
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
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>：云计算分析中心＞分析中心＞任务管理</div></td>
        </tr>
    </table>
</div>

<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onClick="switch_index(this, 0)"><div align="center"><bean:message key="task.query" bundle="${language}"/></div></td>
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
    <td class=cardnameleft><bean:message key="task.query" bundle="${language}"/></td>
  </tr>
</tbody>
</table>

<!-- 输入<bean:message key="button.query" bundle="${language}"/>条件 -->

<div class=scrollarea>
<table class=tableinput>
<tbody>  
<tr>
	<script language="javascript">
	    show_string_condition("<bean:message key="task.label.taskName" bundle="${language}"/>", "taskName_op");
	</script>
    <td class=TDLeft>
      <input type="text" name="taskName" size=20 maxlength=40 value="" onKeyDown="setTab()">
    </td>
</tr>
<tr>
	<script language="javascript">
	    show_string_condition("<bean:message key="task.label.founder" bundle="${language}"/>", "creator_op");
	</script>
    <td class=TDLeft>
      <input type="text" name="creator" size=20 maxlength=40 value="" onKeyDown="setTab()">
    </td>
</tr>
</tbody>
</table>

</div>

<!-- <bean:message key="button.query" bundle="${language}"/>操作按钮 -->

<!-- <button name="query" onClick="forQuery('')" class="button">开始<bean:message key="button.query" bundle="${language}"/></button>
<button name="reset" onClick="forReset()" class="button">清空条件</button> -->


<span id=scrollbar><bean:message key="msg.inProgress" bundle="${language}"/></span>

</form>

<!-- 显示<bean:message key="button.query" bundle="${language}"/>结果 -->

<div id="hx_table_div" class="queryresult"></div>

</div>
<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<script type="text/javascript">

//<bean:message key="button.query" bundle="${language}"/>等待中...
var waitpath = $("#this_path_id").val()+"/modules/base/hx_wait_plugin";
var waitObj=new hx_wait(waitpath);

var height = document.body.clientHeight;
$("#hx_table_div").height(height - 173);

var index = new Array();
function forGet(){
//	s="";
	index = new Array();
	var checkList = $("input[name='checkList']:checkbox:checked");
	for(var i=0; i<checkList.length; i++){
		var cheId = checkList[i].id;
		var taskId = cheId.substring(6,cheId.length);
    //  s += taskId+"</C>";
	    index.push(taskId);
	}
}

</script>
</div>
</body>
</html>