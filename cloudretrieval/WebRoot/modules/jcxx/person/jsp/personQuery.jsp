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
    List XbIDs=(List)request.getAttribute("XbIDs");
    List XbNames=(List)request.getAttribute("XbNames");
   
    List RoleIDs=(List)request.getAttribute("RoleIDs");
    List RoleNames=(List)request.getAttribute("RoleNames");

	List rulerCodeList=(List)request.getAttribute("rulerCodeList");
    List rulerNameList=(List)request.getAttribute("rulerNameList");
    String pagePath = rulerNameList.get(2)+">"+rulerNameList.get(1)+">"+rulerNameList.get(0);
    
    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String language = bform.language;
    
    String user_dept=bform.dept_code;
    String role_code = bform.role_code;
  //  System.out.println(role_code);
   
%>

<html>

<head>
  <title><bean:message key="person.title" bundle="${language}"/></title>
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
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/person/scripts/personScript.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/person/scripts/personObject.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/personBean.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
</head>

<body onLoad="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/images/main/icon1.gif" width="18" height="16"></td>
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
      <td id=padindex0 class=activeindex onClick="switch_index(this, 0)"><div align="center">
      	<!-- <bean:message key="button.query" bundle="${language}"/>用户信息  -->
      	<bean:message key="person.title" bundle="${language}"/>
      	<div></td>
      <td id=padindex1 class=hiddenindex onClick="switch_index(this, 1)" style="display:none"><div align="center">
  	<!-- 增加用户信息 -->    
      <bean:message key="person.insert" bundle="${language}"/>
      <div></td>
    </tr>
  </table>
</div>

<div class=padcontent>

<div id=padcontent0 class=activecontent>

<form>

<!-- 选择query方式 -->

<table class=cardname>
<tbody>
  <tr>
    <td class=cardnameleft><!-- 用户信息 -->
    	<bean:message key="person.name" bundle="${language}"/>
    </td>
  </tr>
</tbody>
</table>

<!-- 输入query条件 -->

<div class=scrollarea>

<table class=tableinput>
<tbody>

  <tr>
		<!-- 用户ID -->
		<script language="javascript">
			show_string_condition("<bean:message key="person.label.userId" bundle="${language}"/>", "user_code_op");
		</script>
	   
		<td class=TDLeft>
		  <input type="text" id="user_code" name="user_code" size=6 maxlength=6 value="" onKeyDown="setTab()" >
		  <input type="hidden" name="user_code_value" value="">
		 <!--  <button onclick="forUserTree(user_code,'checkbox',user_code_value,1)" class="deptbutton" style="margin-left:-7px;">…</button>-->
		 <span id="i_per_name"></span>
		</td>
  </tr>
  <tr>
	<script language="javascript">
		//姓名
		show_string_condition("<bean:message key="person.label.userName" bundle="${language}"/>", "user_name_op");
	</script>
		<td class=TDLeft>
		  <input type="text" name="user_name" size=20 maxlength=20 value="" onKeyDown="setTab()">
		</td>
  </tr>
  <tr>
	<script language="javascript">
	//所属部门
		show_string_condition("<bean:message key="person.label.department" bundle="${language}"/>", "dept_code_op");
	</script>
		<td class=TDLeft>
		  <%if(role_code.equals("zgkkz")){ %>
		   <input type="text" name="dept_code" id="q_dept_code" size=9 maxlength=9 value="bm0001" onKeyDown="setTab()" onBlur="forCheckDept(dept_code,'bm0001')">
		  <%} else{%>
		   <input type="text" name="dept_code" id="q_dept_code" size=9 maxlength=9 value="<%=user_dept%>" onKeyDown="setTab()" onBlur="forCheckDept(dept_code,'<%=user_dept%>')">
		  <%}%>
		  
		  <input type="hidden" name="dept_code_value" value="">
		  <button id="q_dept_code_button" onClick="forDeptTree(dept_code,'radio',dept_code_value)" class="deptbutton"  style="margin-left:-7px;">…</button>        

		</td>
  </tr>
  
</tbody>
</table>

</div>

</form>

<!-- 显示结果 -->

<div id="hx_table_div" class="queryresult"></div>
</div>
<!-- 增加用户信息 -->

<div id=padcontent1 class=hiddencontent >

<table class=cardname>
  <tr>
  	<!-- 新增用户信息 -->
    <td class=cardnameleft>
    <bean:message key="person.insert" bundle="${language}"/>
    </td>
    <td class=cardnameright>
    		<!--  <bean:message key="label.note.requiredField" bundle="${language}"/> -->
    		<bean:message key="label.note.requiredField" bundle="${language}"/>
    </td>
  </tr>
</table>

<!-- 输入 -->

<form>

<div class=inputarea style="height:200px;">

<table class=tableinput>

  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
      <!-- 用户ID： -->
      <bean:message key="person.label.userId" bundle="${language}"/>:
    </td>
    <td class=TDLeft>
      <input type="text" id="i_user_code" style="width:160px;" name="user_code" size=6 maxlength=6 value="" onBlur="pd_only('user_code',document.getElementById('i_user_code'),'t_u_person')">
    </td>
  </tr>
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
    	 <!--  姓名： -->
      <bean:message key="person.label.userName" bundle="${language}"/>:
    </td>
    <td class=TDLeft>
      <input type="text" id="i_user_name" name="user_name"style="width:160px;"  size=20 width=200 maxlength=20 value="">
    </td>
  </tr>
  

   <tr>
    <td class=TDTitle style=""><span style="font-weight:normal;">*</span>
 		<!--    所属机构： -->
    	<bean:message key="person.label.department" bundle="${language}"/>:
    </td>
    <td class=TDLeft>
      <input type="text" id="i_dept_code"style="width:160px;"  name="dept_code" size=10 maxlength=9 value="" onBlur="forCheckDept(dept_code,'<%=user_dept%>',1)" readonly>
      <input type="hidden" name="dept_code_value" value="">
      <button property="button" onclick="forDeptTree(dept_code,'radio',dept_code_value)" styleClass="deptbutton">…</button>

    </td>
  </tr>
  
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
      <!-- 性别： -->
      <bean:message key="person.label.sex" bundle="${language}"/>:
    </td>
    <td class=TDLeft>
      <select size="1" id="i_xb" name="xb" value="" style="width:160px;"  onKeyDown="setTab()">
      	<!-- 请选择性别... -->
        <option value=''><bean:message key="person.label.sexSelect" bundle="${language}"/></option>

        <option value='男' selected><bean:message key="person.columns.male" bundle="${language}"/></option>
        <option value='女'><bean:message key="person.columns.female" bundle="${language}"/></option>

      </select>
    </td>
  </tr>
		
   <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
    <!-- 角色： -->
     <bean:message key="person.label.role" bundle="${language}"/>:
    </td>
    <td class=TDLeft >
      <select size="1" id="i_role" name="role" value="" style="width:160px;"  onKeyDown="setTab()">
        <option value=''><bean:message key="person.label.roleSelect" bundle="${language}"/></option>
  	 <%
		    for (int i = 0; i < RoleIDs.size(); i ++){
		%>
		        <option value='<%=RoleIDs.get(i)%>'><%=RoleNames.get(i)%></option>
		<%
		    }
		%>
      </select>
    </td>
  </tr>
   <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
   	<!--   语言： -->
     <bean:message key="person.label.language" bundle="${language}"/>:
    </td>
    <td class=TDLeft >
      <select size="1" id="i_language" name="language" style="width:160px;"  value="" size="40">
        <option value=""><bean:message key="person.label.languageSelect" bundle="${language}"/></option>
		<option value="zh_CN">zh_CN</option>
		<option value="zh_TW">zh_TW</option>
		<option value="en_US">en_US</option>
		<option value="fr_FR">fr_FR</option>
	</select>
    </td>
  </tr>

</table>
</div>

<!-- 插入操作按钮 -->

<button name="submit" onClick="forInsert('<%=thisPath%>')" class="button">
	<bean:message key="button.label.submit" bundle="${language}"/>
</button>
<button name="clear" onClick="forClear()" class="button">
	<bean:message key="button.label.reset" bundle="${language}"/>
</button>

</form>

<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
<script type="text/javascript">


function forDeptTree(test,type,hidden)
{
    var dept = '<%=user_dept%>';
    
    var user_dept="";

	var role_code = '<%=role_code%>';
    if(role_code=='zgkkz')
    {
    	user_dept='bm0001'
    }
    else
    {
    	user_dept='<%=user_dept%>';
    }
	
    var srcFile = '<%=thisPath%>'+"/modules/base/jsp/deptree.jsp?jgbm="+user_dept+"&type="+type;
    


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
   
function forUserTree(test,type,hidden,form)
{
	//   机构编号从登陆人员信息中获得
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
</div>
</div>
</body>
</html>
