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
  <title>��ɫ����</title>
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
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>��ϵͳ����Ȩ��/��ɫ������ɫ����</div></td>
        </tr>
    </table>
</div>

<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onclick="switch_index(this, 0)"><div align="center">�û�<bean:message key="button.query" bundle="${language}"/></div></td>
      <td id=padindex1 class=hiddenindex onclick="switch_index(this, 1)" style="display:none"><div align="center">�����û�</div></td>
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
    <td class=cardnameleft>�û�<bean:message key="button.query" bundle="${language}"/></td>
  </tr>
</tbody>
</table>

<!-- ����<bean:message key="button.query" bundle="${language}"/>���� -->

<div class=scrollarea>

<table class=tableinput>
<tbody>

  <tr>
<script language="javascript">
    show_string_condition("�û�����", "user_code_op");
</script>
    <td class=TDLeft>
      <input type="text" id="q_user_code" name="user_code" size=18 maxlength=18 value="" onblur="forCard('q_user_code')">
    </td>
  </tr>
 <!--  <tr>
<script language="javascript">
    show_string_condition("�û�����", "user_name_op");
</script>
    <td class=TDLeft>
      <input type="text" id="q_user_name" name="user_name" size=20 maxlength=20 value="" onKeyDown="setTab()">
    </td>
  </tr> -->
  <tr>
<script language="javascript">
    show_string_condition("��������", "dept_code_op");
</script>
    <td class=TDLeft>
    	<input type="text" id="q_dept_code" name="q_dept_code" size=10 maxlength=9 value="<%=user_dept %>" onblur="forCheckDept(q_dept_code,'<%=user_dept %>')">
      <input type='hidden' name="q_dept_code_value" value="">
      <html:button property="button" onclick="forDeptTree(q_dept_code,'radio',q_dept_code_value)" styleClass="deptbutton">��</html:button>
    </td>
  </tr>
  <tr>
<script language="javascript">
    show_string_condition("�û���ɫ", "role_code_op");
</script>
    <td class=TDLeft>
      <select size="1" id="q_role_code" name="role_code" value="" onKeyDown="setTab()">
        <option value=''>��ѡ���ɫ��Ϣ...</option>

      </select>
    </td>
  </tr>

</tbody>
</table>

</div>

<span id=scrollbar>�������ڽ��У���ȴ�...</span>

</form>

<!-- ��ʾ<bean:message key="button.query" bundle="${language}"/>��� -->

<div id="hx_table_div" class="queryresult"></div>

</div>

<!-- �����û���Ϣ -->

<div id=padcontent1 class=hiddencontent>

<table class=cardname>
  <tr>
    <td class=cardnameleft>�����û�</td>
    <td class=cardnameright><bean:message key="label.note.requiredField" bundle="${language}"/></td>
  </tr>
</table>

<!-- ���� -->

<form>

<div class=inputarea>

<table class=tableinput>

  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>�û����룺</td>
    <td class=TDLeft>
      <input type="text" id="i_user_code" name="user_code" onblur="isExist()" size=18 maxlength=18 value="" >

    </td>
  </tr>
   <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>�û�������</td>
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
      ����������<input type="text" id="i_dept_code" name="dept_code" size=10 maxlength=9 value="" onblur="forCheckDept(dept_code,'<%=user_dept%>',1)">
      <input type='hidden' name="dept_code_value" value="">
      <html:button property="button" onclick="forDeptTree(dept_code,'radio',dept_code_value)" styleClass="deptbutton">��</html:button>
      �û���ɫ��<select size="1" id="i_role_code" name="role_code" value="" onKeyDown="setTab()">
        <option value=''>��ѡ���ɫ��Ϣ...</option>

      </select>&nbsp;&nbsp;
      <button name="insrole" onClick="forInsRole()" class="button">����</button>
    </td>
  </tr>
</table>

<table width=100% cellSpacing=0 cellPadding=0 border=0>
  <tr>
    <td>
      <table width=100% cellSpacing=1 cellPadding=0 class=tablestyle>
        <tr>
          <th width=100px>�������</th>
          <th width=200px>�û���ɫ</th>
          <th>����</th>
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

<!-- ���������ť -->

<button name="submit" onClick="forInsert()" class="button">�ύ</button>
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
	
	if( (card_value.length) == 18 ) //18λ��15λ�����֤��
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
	   ������Ŵӵ�½��Ա��Ϣ�л��
	*/  

	
    var srcFile ="<%=thisPath%>/modules/base/jsp/deptree.jsp?jgbm="+"<%=user_dept%>"+"&type="+type;

    var winFeatures = "dialogHeight:600px;dialogWidth:450px;help:no;status:no";

    inArray = window.showModalDialog(srcFile, hidden.value, winFeatures);
	
	if (typeof(inArray) == "undefined")
	{
     	//test.value = "";
     }
	else //�������ָ���˻����������б���ʾ�û�������Ա����
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
        alert("�û�Ӧ���ٰ�����һ����ɫ��Ϣ!");
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
