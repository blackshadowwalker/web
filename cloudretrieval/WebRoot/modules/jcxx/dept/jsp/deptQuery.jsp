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
    
    List DeptLevelIDs=(List)request.getAttribute("DeptLevelIDs");
    List DeptLevelNames=(List)request.getAttribute("DeptLevelNames");
    List DeptLxIDs=(List)request.getAttribute("DeptLxIDs");
    List DeptLxNames=(List)request.getAttribute("DeptLxNames");
    List DeptAreaIDs=(List)request.getAttribute("DeptAreaIDs");
    List DeptAreaNames=(List)request.getAttribute("DeptAreaNames");
    List BmLxIDs=(List)request.getAttribute("BmLxIDs");
    List BmLxNames=(List)request.getAttribute("BmLxNames");
    List GradeIDs=(List)request.getAttribute("GradeIDs");
    List GradeNames=(List)request.getAttribute("GradeNames");
    
    List Gyqx_jglxIDs=(List)request.getAttribute("Gyqx_jglxIDs");
    List Gyqx_jglxNames=(List)request.getAttribute("Gyqx_jglxNames");
    
    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String language = bform.language;
    String user_dept=bform.dept_code;
    
   	List rulerCodeList=(List)request.getAttribute("rulerCodeList");
    List rulerNameList=(List)request.getAttribute("rulerNameList");
    String pagePath = rulerNameList.get(2)+">"+rulerNameList.get(1)+">"+rulerNameList.get(0);

%>

<html:html locale="true">

<head>
  <title><bean:message key="dept.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <link href="<%=thisPath%>/modules/base/hx_table/css/hx_table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
   
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/jquery.hx_table.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/dept/script/deptObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/dept/script/deptScript.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/deptBean.js"></script>
  
 
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
</head>
<body onload="isCheck()" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/images/main/icon1.gif" width="18" height="16"></td>
          <td width="915">
          <div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>
          	:<%=pagePath %></div></td>
        </tr>
    </table>
</div>

<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onclick="switch_index(this, 0)"><div align="center">
      	<bean:message key="dept.title" bundle="${language}"/>
      	<div></td>
      <td id=padindex1 class=hiddenindex onclick="switch_index(this, 1)" style="display:none"><div align="center">
      	<bean:message key="dept.insert" bundle="${language}"/>
      	<div></td>
    </tr>
  </table>
</div>

<div class=padcontent>

<div id=padcontent0 class=activecontent>

<form>

<!-- 选择Query方式 -->

<table class=cardname>
<tbody>
  <tr>
    <td class=cardnameleft>
		<bean:message key="dept.queryDept" bundle="${language}"/>
	</td>
  </tr>
</tbody>
</table>

<!-- 输入Query条件 -->

<div class=scrollarea>

<table class=tableinput>
<tbody>
<tr><td class=TDLeft2 width="18%">
     <div align="">
     <!-- 查询方式选择 -->
     <bean:message key="dept.label.queryMode" bundle="${language}"/>
  </div>
<input type="hidden" id="dl_jg" name="dl_jg" value='<%=bform.dept_code%>'>
</td></tr>
<tr>
<script language="javascript">
    radio_string_condition("<bean:message key="dept.label.queryByCode" bundle="${language}"/>", "check_radio","q_dept_id");
</script>
    <td class=TDLeft>
      <input type="text" name="dept_id" id="q_dept_id" size=9 maxlength=9 value="<%=user_dept%>" onKeyDown="setTab()" onblur="forCheckDept(dept_id,'<%=user_dept%>')">
      <input type="hidden" name="dept_id_value" value="">
      <button id="q_dept_id_button" onclick="forDeptTree(dept_id,'radio',dept_id_value)" class="deptbutton"  style="margin-left:-7px;">…</button>        
    </td>
  </tr>
     
<tr>
<script language="javascript">
    radio_string_condition("<bean:message key="dept.label.queryByName" bundle="${language}"/>", "check_radio","q_dept_name");
</script>
    <td class=TDLeft id="td_dept_name">
      <input type="text" name="dept_name" id="q_dept_name" size=20 maxlength=20 value="" onKeyDown="setTab()">
    </td>
  </tr>

</tbody>
</table>

</div>

<!-- 操作正在进行，请等待... -->
<span id=scrollbar><bean:message key="msg.inProgress" bundle="${language}"/></span>

</form>

<!-- 显示Query>结果 -->

<div id="hx_table_div" class="queryresult"></div>

</div>

<!-- 增加机构管理 -->

<div id=padcontent1 class=hiddencontent>

<table class=cardname>
  <tr>
    <td class=cardnameleft><bean:message key="dept.insert" bundle="${language}"/></td>
    <td class=cardnameright><bean:message key="label.note.requiredField" bundle="${language}"/></td>
  </tr>
</table>

<!-- 输入 -->

<form>

<div class=inputarea style="height:200px">

<table class=tableinput>

  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
    <!-- 机构编号： -->
    <bean:message key="dept.columns.deptCode" bundle="${language}"/>:
    </td>
    <td class=TDLeft>
      <input type="text" id="i_dept_code" name="dept_code" size=6 maxlength=6 value="" onblur="pd_only('dept_code',document.getElementById('i_dept_code'),'t_s_dept')">

    </td>
  </tr>
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
    	<!--机构名称：-->
    	<bean:message key="dept.columns.deptName" bundle="${language}"/>:
    	</td>
    <td class=TDLeft>
      <input type="text" id="i_dept_name" name="dept_name" size=40 maxlength=80 value="">
      <input type="hidden" id="i_dept_level" name="dept_level" size=40 maxlength=80 value="10">
       <input type="hidden" id="i_dept_lx" name="dept_lx" size=40 maxlength=80 value="10">

    </td>
  </tr>

    <tr>
    <td class=TDTitle>
    	<!-- 分管领导： -->
    	<bean:message key="dept.columns.deptLeader" bundle="${language}"/>:
    </td>
    <td class=TDLeft>
      <input type="text" id="i_fgld" name="fgld" size=18 maxlength=18 value="" onKeyDown="setTab()" onblur="getPerName('<%=thisPath%>',value)">
      <input type="hidden" name="fgld_value" value="">
     <button onclick="forUserTree(fgld,'radio',fgld_value,1)" class="deptbutton" style="margin-left:-7px;">…</button>
	 <span id="i_per_name"></span>
    </td>
  </tr>

   <tr>
    <td class=TDTitle style="text-align:right;"><span style="font-weight:normal;">*</span>
    	<!-- 上级机构编号： -->
    	<bean:message key="dept.columns.deptManager" bundle="${language}"/>:
    	</td>
    <td class=TDLeft>
      <input type="text" id="i_dept_manager" name="dept_manager" size=10 maxlength=9 value="" >
      <input type="hidden" name="dept_manager_value" value="">
      <html:button property="button" onclick="forDeptTree(dept_manager,'radio',dept_manager_value)" styleClass="deptbutton">…</html:button>

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
<input type="hidden" id="user_dept" value='<%=user_dept%>'>
</div>
</div>
<script language="javascript">
    document.forms[0].check_radio[0].checked = true;
    
</script>


<script>
function forDeptTree(test,type,hidden)
{
    var dept = "37015oooo";
	
    var srcFile = '<%=thisPath%>'+"/modules/base/jsp/deptree.jsp?jgbm="+'<%=user_dept%>'+"&type="+type;

    var winFeatures = "dialogHeight:600px;dialogWidth:450px;help:no;status:no";

    inArray = window.showModalDialog(srcFile, hidden.value, winFeatures);
	
	if (typeof(inArray) == "undefined"||inArray == "")
	{
     	//test.value = "";
     }
	else //如果另外指定了机构则下拉列表显示该机构的人员姓名
	{
		hidden.value=inArray+"</R>";
		test.value = inArray.split("</C>")[1];
		
	}
}


function Add_number(id,max)
{
	var number = document.getElementById(id);
	if(number.value<max)
		number.value++;
}

function Muli_number(id,min)
{
	var number = document.getElementById(id);
	if(number.value>min)
		number.value--;
}

function isCheck()
{
	if(document.forms[0].check_radio[0].checked)
	{
		document.getElementById("q_dept_id").disabled = false;
		document.getElementById("q_dept_id_button").style.display = "";
		document.getElementById("q_dept_id").focus();
		document.getElementById("q_dept_name").disabled = true;
	}
	if(document.forms[0].check_radio[1].checked)
	{
		document.getElementById("q_dept_name").disabled = false;
		document.getElementById("q_dept_id_button").style.display = "none";
		document.getElementById("q_dept_name").focus();
		document.getElementById("q_dept_id").disabled = true;
	}
}   
function forUserTree(test,type,hidden,form)
{
	/*
	   机构编号从登陆人员信息中获得
	*/  

	var dept = '<%=user_dept%>';
	
    var srcFile = "<%=thisPath%>/modules/base/jsp/usertree.jsp?jgbm="+dept+"&type="+type;

    var winFeatures = "dialogHeight:600px;dialogWidth:500px;help:no;status:no";

    inArray = window.showModalDialog(srcFile, hidden.value, winFeatures);
    
	
	if (typeof(inArray) != "undefined" && trim(inArray)!="")
	{
		hidden.value=inArray+"</R>";
		test.value=inArray.split("</C>")[1];
		document.getElementById("i_per_name").innerHTML = inArray.split("</C>")[2];
	}
	else
	{
		test.value="";
	}
		
}     
</script>
</body>
</html:html>