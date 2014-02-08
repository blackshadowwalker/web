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
    
    String user_dept=bform.dept_code;
%>

<html>

<head>
  <title>角色分配</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
   <link href="<%=thisPath%>/modules/base/hx_table/css/hx_table.css" rel="stylesheet" type="text/css" />
   
 <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/jquery.hx_table.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/user/scripts/userObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/user/scripts/userScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/userBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css");</style>
</head>

<body onload="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/modules/base/image/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>：系统管理＞权限/角色管理＞角色分配</div></td>
        </tr>
    </table>
</div>

<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onclick="switch_index(this, 0)"><div align="center">用户<bean:message key="button.query" bundle="${language}"/></div></td>
      <td id=padindex1 class=hiddenindex onclick="switch_index(this, 1)" style="display:none"><div align="center">新增用户</div></td>
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
    <td class=cardnameleft>用户<bean:message key="button.query" bundle="${language}"/></td>
  </tr>
</tbody>
</table>

<!-- 输入<bean:message key="button.query" bundle="${language}"/>条件 -->

<div class=scrollarea>

<table class=tableinput>
<tbody>

  <tr>
<script language="javascript">
    show_string_condition("用户代码", "user_code_op");
</script>
    <td class=TDLeft>
      <input type="text" id="q_user_code" name="user_code" size=18 maxlength=18 value="" onblur="forCard('q_user_code')">
    </td>
  </tr>
 <!--  <tr>
<script language="javascript">
    show_string_condition("用户姓名", "user_name_op");
</script>
    <td class=TDLeft>
      <input type="text" id="q_user_name" name="user_name" size=20 maxlength=20 value="" onKeyDown="setTab()">
    </td>
  </tr> -->
  <tr>
<script language="javascript">
    show_string_condition("所属机构", "dept_code_op");
</script>
    <td class=TDLeft>
    	<input type="text" id="q_dept_code" name="q_dept_code" size=10 maxlength=9 value="<%=user_dept %>" onblur="forCheckDept(q_dept_code,'<%=user_dept %>')">
      <input type='hidden' name="q_dept_code_value" value="">
      <html:button property="button" onclick="forDeptTree(q_dept_code,'radio',q_dept_code_value)" styleClass="deptbutton">…</html:button>
    </td>
  </tr>
  <tr>
<script language="javascript">
    show_string_condition("用户角色", "role_code_op");
</script>
    <td class=TDLeft>
      <select size="1" id="q_role_code" name="role_code" value="" onKeyDown="setTab()">
        <option value=''>请选择角色信息...</option>

      </select>
    </td>
  </tr>

</tbody>
</table>

</div>

<span id=scrollbar>操作正在进行，请等待...</span>

</form>

<!-- 显示<bean:message key="button.query" bundle="${language}"/>结果 -->

<div id="hx_table_div" class="queryresult"></div>

</div>

<!-- 增加用户信息 -->

<div id=padcontent1 class=hiddencontent>

<table class=cardname>
  <tr>
    <td class=cardnameleft>新增用户</td>
    <td class=cardnameright><bean:message key="label.note.requiredField" bundle="${language}"/></td>
  </tr>
</table>

<!-- 输入 -->

<form>

<div class=inputarea>

<table class=tableinput>

  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>用户代码：</td>
    <td class=TDLeft>
      <input type="text" id="i_user_code" name="user_code" onblur="isExist()" size=18 maxlength=18 value="" >

    </td>
  </tr>
   <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>用户姓名：</td>
    <td class=TDLeft>
      <input type="text" id="i_user_name" name="user_name" size=20 maxlength=20 value="" disabled>

    </td>
  </tr>

</table>

<table class=prompt>
  <tr>
    <td width="10px">
    </td>
    <td>
      所属机构：<input type="text" id="i_dept_code" name="dept_code" size=10 maxlength=9 value="" onblur="forCheckDept(dept_code,'<%=user_dept%>',1)">
      <input type='hidden' name="dept_code_value" value="">
      <html:button property="button" onclick="forDeptTree(dept_code,'radio',dept_code_value)" styleClass="deptbutton">…</html:button>
      用户角色：<select size="1" id="i_role_code" name="role_code" value="" onKeyDown="setTab()">
        <option value=''>请选择角色信息...</option>

      </select>&nbsp;&nbsp;
      <button name="insrole" onClick="forInsRole()" class="button">增加</button>
    </td>
  </tr>
</table>

<table width=100% cellSpacing=0 cellPadding=0 border=0>
  <tr>
    <td>
      <table width=100% cellSpacing=1 cellPadding=0 class=tablestyle>
        <tr>
          <th width=100px>机构编号</th>
          <th width=200px>用户角色</th>
          <th>操作</th>
        <tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
      <div id="userRoles" class="listarea"></div>
    </td>
  </tr>
</table>

</div>

<!-- 插入操作按钮 -->

<button name="submit" onClick="forInsert()" class="button">提交</button>
<button name="clear" onClick="forClear()" class="button"><bean:message key="button.label.reset" bundle="${language}"/></button></button>

</form>
<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>

<input id="user_dept" type="hidden" value="<%=user_dept%>"/>
</div>
</div>
<script language="javascript">

getRole("q_role_code");

getRole("i_role_code");


function forCard(card_id)
{

	var per_card = document.getElementById(card_id);
	
	var card_value=trim(per_card.value);
	
	if( (card_value.length) == 18 ) //18位于15位的身份证号
    {
		var  card_end = card_value.substr(17,1);
		
		if(card_end == "x")
	    {
		    	card_end="X"; 
		    	
		    	var card_tou = card_value.substr(0,17);
		    	
		    	per_card.value=card_tou+card_end;

		 }

    }			
				
}

 function forDeptTree(test,type,hidden)
{
	/*
	   机构编号从登陆人员信息中获得
	*/  

	
    var srcFile ="<%=thisPath%>/modules/base/jsp/deptree.jsp?jgbm="+"<%=user_dept%>"+"&type="+type;

    var winFeatures = "dialogHeight:600px;dialogWidth:450px;help:no;status:no";

    inArray = window.showModalDialog(srcFile, hidden.value, winFeatures);
	
	if (typeof(inArray) == "undefined")
	{
     	//test.value = "";
     }
	else //如果另外指定了机构则下拉列表显示该机构的人员姓名
	{
		hidden.value="";
		test.value = inArray.split("</C>")[1];
		
	}
}
function forSure()    
{
    var updateString = new Array();
    var updateDepts = new Array();
    var updateRoles = new Array();

    if (roleArray.length < 3)
    {
        alert("用户应至少包含有一条角色信息!");
        return false;
    }

    var i = 0;

    updateString[i++] = "user_code='"+document.forms[0].user_code.value+"'";
    updateString[i++] = "user_name='"+document.forms[0].user_name.value+"'";
    updateString[i++] = "user_email='"+document.forms[0].user_email.value+"'";
    updateString[i++] = "user_phone='"+document.forms[0].user_phone.value+"'";
    updateString[i++] = "user_mobile='"+document.forms[0].user_mobile.value+"'";

    for (var i = k = 0; k < roleArray.length; k += 3, i++)
    {
        updateDepts[i] = roleArray[k];
        updateRoles[i] = roleArray[k+1];
    }

    retValue = new Array(3);

    retValue[0] = updateString.toString();
    retValue[1] = updateDepts.toString();
    retValue[2] = updateRoles.toString();

    window.returnValue = retValue;
    window.close();    
} 
</script>
</body>
</html>
