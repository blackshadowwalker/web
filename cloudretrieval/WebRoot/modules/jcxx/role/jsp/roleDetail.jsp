<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%@ page import="javax.sql.DataSource"%>


<%
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String thisPath=request.getContextPath();
    String language = bform.language;

%>

<html>

<head>
  <title><bean:message key="person.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/roleBean.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/role/scripts/roleScript.js"></script>
 <script language="javascript" src="<%=thisPath%>/modules/base/tree/alai_tree.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/tree/alai_tree_role.js"></script>
</head>

<body>

<div class=cardbody>
<input type="hidden" name="tempSpace"/>
  <table class="tablebox">
  <tbody>

<script>
    var input_cols_array = window.dialogArguments;
    var role_code=input_cols_array.role_code;
    
     document.write("<tr>");
    document.write("<td class=tablebodyhead width=150px><bean:message key="role.label.roleCode" bundle="${language}"/>：</td>");//角色代码
    document.write("<td class=column>"+role_code+"</td>");
    document.write("</tr>");
    
     document.write("<tr>");
    document.write("<td class=tablebodyhead><bean:message key="role.label.roleName" bundle="${language}"/>：</td>");//角色名称
    document.write("<td class=column>"+input_cols_array.role_name+"</td>");
    document.write("</tr>");

</script>
	<tr><td colspan="2" height="10">&nbsp;</td></tr>
	<tr><td colspan="2"><div id="view_tree_div" style="width:100%;height:360px;overflow-x:auto;overflow-y:auto"></div></td></tr>
  </tbody>
  </table>

<button name="button" onClick="forAbort()" class="button">
	<bean:message key="button.label.close" bundle="${language}"/>
</button>

</div>

<script language="JavaScript">    

function forPrint()    
{         
    window.print();
} 

function forAbort()    
{         
    window.close();    
}

viewRoleValuesTree('<%=thisPath%>',"tempSpace",role_code);

</script> 

</body>

</html>
