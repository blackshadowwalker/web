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
    
    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String language = bform.language;
	
	List rulerCodeList=(List)request.getAttribute("rulerCodeList");
    List rulerNameList=(List)request.getAttribute("rulerNameList");
    String pagePath = rulerNameList.get(2)+">"+rulerNameList.get(1)+">"+rulerNameList.get(0);
    
    String qx=request.getParameter("qx");
    List DeptLevelIDs=(List)request.getAttribute("DeptLevelIDs");
    List DeptLevelNames=(List)request.getAttribute("DeptLevelNames");
%>

<html>

<head>
  <title><bean:message key="role.title" bundle="${language}"/></title>
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
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/role/scripts/roleObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/role/scripts/roleScript.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/tree/alai_tree.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/tree/alai_tree_role.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/roleBean.js"></script>
  <script type="text/javascript" src="modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
</head>

<body onload="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/modules/jcxx/ruler/image/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name">
			<bean:message key="label.pagepath" bundle="${language}"/>:
         	<%=pagePath %>
         </div></td>

        </tr>
    </table>
</div>

<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onclick="switch_index(this, 0)"><div align="center">
      	<bean:message key="role.title" bundle="${language}"/></div></td>
      <td id=padindex1 class=hiddenindex onclick="switch_index(this, 1)"><div align="center">
      	<bean:message key="role.insert" bundle="${language}"/>
      	</div></td>   
    </tr>
  </table>
</div>

<div class=padcontent>

<div id=padcontent0 class=activecontent>

<form>

<table class=cardname>
<tbody>
  <tr>
    <td class=cardnameleft><bean:message key="role.title" bundle="${language}"/></td>
  </tr>
</tbody>
</table>

<div class=scrollarea>

<table class=tableinput>
<tbody>

  <tr>
<script language="javascript">
    show_string_condition("<bean:message key="role.label.roleCode" bundle="${language}"/>", "role_code_op");
</script>
    <td class=TDLeft>
      <input type="text" name="role_code" size=20 maxlength=20 value="" onKeyDown="setTab()">
    </td>
  </tr>
  <tr>
<script language="javascript">
    show_string_condition("<bean:message key="role.label.roleName" bundle="${language}"/>", "role_name_op");
</script>
    <td class=TDLeft>
      <input type="text" name="role_name" size=20 maxlength=40 value="" onKeyDown="setTab()">
    </td>
  </tr>

</tbody>
</table>

</div>

</form>

<!-- 显示结果 -->

<div id="hx_table_div" class="queryresult"></div>

</div>

<!-- 增加角色信息 -->

<div id=padcontent1 class=hiddencontent>

<table class=cardname>
  <tr>
    <td class=cardnameleft><bean:message key="role.insert" bundle="${language}"/></td>
    <td class=cardnameright>
			<!--  <bean:message key="label.note.requiredField" bundle="${language}"/> -->
    		<bean:message key="label.note.requiredField" bundle="${language}"/>
	</td>
  </tr>
</table>

<!-- 输入 -->

<form>
<input type="hidden" id="rulervalues"/>
<div class=inputarea>

<table class=tableinput>

  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
		<bean:message key="role.columns.roleCode" bundle="${language}"/>
		：
	</td>
    <td class=TDLeft>
      <input type="text" name="role_code" id="i_role_code" size=20 maxlength=20 value="">

    </td>
  </tr>
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
    	<bean:message key="role.columns.roleCode" bundle="${language}"/>
    	：
    </td>
    <td class=TDLeft>
      <input type="text" name="role_name" id="i_role_name" size=20 maxlength=40 value="">

    </td>
 
  <tr><td colspan="2" height="10"></td></tr>
  <tr>
  	<td colspan="2"><div id="tree_div" style="width:100%;height:350px;overflow-x:auto;overflow-y:auto"></div></td>
  </tr>
</table>
</div>

<!-- 插入操作按钮 -->

<button name="submit" onClick="forInsert('<%=thisPath %>')" class="button">
	<bean:message key="button.label.submit" bundle="${language}"/>
</button>
<button name="clear" onClick="forClear()" class="button">
	<bean:message key="button.label.reset" bundle="${language}"/>
</button>

</form>
<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
</div>
</div>
<script language="javascript">
    createRulerTree('<%=thisPath%>','rulervalues','checkbox','true',"");
</script>
</body>
</html>
