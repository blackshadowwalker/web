<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.baseBean"%>
<%@ page import="modules.base.*"%>
<%@ page import="javax.sql.DataSource"%>

<html>

<%
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String thisPath=request.getContextPath();
    String language = bform.language;
    
    baseBean bb=new baseBean((DataSource)application.getAttribute("basedb"));
    List DeptLevelIDs=new ArrayList();
    List DeptLevelNames=new ArrayList();
    bb.getLevelInfos("t_s_dept.dept_level",DeptLevelIDs,DeptLevelNames);
%>
<head>
  <title><bean:message key="person.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/scripts/cn_utf8.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/roleBean.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/role/scripts/roleScript.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/tree/alai_tree.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/tree/alai_tree_role.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
</head>

<body>

<div class=cardbody>

<form>
	<input type="hidden" name="rulervalues" size=100/>
  <table class="tablebox">
  <tr>
    <td class=tablebodyhead width=150px>
    	<bean:message key="role.label.roleCode" bundle="${language}"/>
    </td>
    <td class=TDLeft>
      <input type="text" name="role_code" size=20 maxlength=20 disabled="disabled">
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>
    	<bean:message key="role.label.roleName" bundle="${language}"/></td>
    <td class=TDLeft>
      <input type="text" name="role_name" size=20 maxlength=40  >
    </td>
  </tr>
  <tr><td colspan="2" height="10">&nbsp;</tr>
  <tr><td colspan="2">
  	<div id="tree_div" style="width:100%;height:400px;overflow-x:auto;overflow-y:auto"></div>
  </td></tr>
  
<script>

	var input_cols_array = window.dialogArguments;
   for (var x = 0; x < input_cols_array.length; x += 3)
   {
       if (input_cols_array[x+1] == "role_code")
       	document.forms[0].role_code.value = input_cols_array[x+2];
       if (input_cols_array[x+1] == "role_name")
           document.forms[0].role_name.value = input_cols_array[x+2];
   }
   
</script>

  </table>
</form>

<button name="button" onClick="forSure()" class="button">
	<bean:message key="button.label.submit" bundle="${language}"/>
</button>
<button name="button" onClick="forAbort()" class="button">
	<bean:message key="button.label.reset" bundle="${language}"/>
</button>
</div>

<script language="JavaScript">    

	function forSure()    
	{
		if(document.forms[0].role_name.value==""){
			alert("<bean:message key="msg.pleaseInput" bundle="${language}"/><bean:message key="role.label.roleName" bundle="${language}"/>!");//请填写角色名称
			return false;
		}
		if(!isSelectRuler("rulervalues")){
			alert("<bean:message key="msg.pleaseSelect" bundle="${language}"/><bean:message key="role.label.roleTree" bundle="${language}"/>!");//请选择角色权限。
			return false;
		}
		
		if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/><bean:message key="button.modify" bundle="${language}"/>?"))
	        return false;
		
		var input_cols = new Array();
		
		input_cols[input_cols.length]=document.forms[0].role_code.value;
		input_cols[input_cols.length]=document.forms[0].role_name.value;
		input_cols[input_cols.length]=document.forms[0].rulervalues.value;
		
	    window.returnValue = input_cols;
	   window.close();    
	} 
	
	function forAbort()    
	{         
	    window.close();    
	} 
	
	function forPrint()    
	{         
	    window.print();
	} 
	
	queryRoleValuesTree('<%=thisPath%>','rulervalues',document.forms[0].role_code.value);

</script> 

</body>

</html>
