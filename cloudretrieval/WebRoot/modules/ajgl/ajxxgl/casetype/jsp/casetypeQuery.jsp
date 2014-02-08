<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>


<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>

<!-- 查询 -->
<% 
	//得到系统路径；
    String thisPath=request.getContextPath();

  //  System.out.println("系统路径："+thisPath+"  ");
    //获得菜单代码：ruler
    String qx=request.getParameter("qx");
  
    baseForm bform=(baseForm)request.getSession().getAttribute("baseuser");
   	String user_code=bform.user_code;
   	String department=bform.dept_name;
    String user_dept=bform.locationId;   
    String type = (String)request.getSession().getAttribute("case_type");
%>


<html>
<head>
  <title><bean:message key="casetype.title" bundle="${language}"/></title>
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
  <script language="javascript" src="<%=thisPath%>/modules/ajgl/ajxxgl/casetype/scripts/casetypeObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/ajgl/ajxxgl/casetype/scripts/casetypeScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/casetypeBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/scripts/validateForm.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("modules/base/css/calendar-blue.css"); </style>
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
</head>

<body onLoad="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/modules/jcxx/ruler/image/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>：案件管理＞案件信息管理＞案件类型管理</div></td>
        </tr>
    </table>
</div>

<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onClick="switch_index(this, 0)"><div align="center"><bean:message key="casetype.title" bundle="${language}"/></div></td>
      <td id=padindex1 class=hiddenindex onClick="switch_index(this, 1)" style="display:none"><div align="center"><bean:message key="casetype.insert" bundle="${language}"/></div></td>
    </tr>
  </table>
</div>

<div class=padcontent>

<div id=padcontent0 class=activecontent>

<form>

<!-- 选择查询方式 -->

<table class=cardname>
<tbody>
  <tr>
    <td class=cardnameleft><bean:message key="casetype.query" bundle="${language}"/></td>
  </tr>
</tbody>
</table>



<!-- 查询操作按钮 -->

<!-- <button name="query" onClick="forQuery('')" class="button">开始查询</button>
<button name="reset" onClick="forReset()" class="button">清空条件</button> -->


<span id=scrollbar>操作正在进行，请等待...</span>

</form>

<!-- 显示查询结果 -->

<div id="hx_table_div" class="queryresult"></div>

</div>

<!-- 增加权限信息 -->

<div id=padcontent1 class=hiddencontent>

<table class=cardname>
  <tr>
    <td class=cardnameleft><bean:message key="casetype.insert" bundle="${language}"/></td>
    <td class=cardnameright><bean:message key="label.note.requiredField" bundle="${language}"/></td>
  </tr>
</table>

<!-- 输入 -->

<form id="case_form">

<div class=""s  style="height:220px;">

<table class="" height="50">
  <tr>
    <td class=TDTitle style="text-align:right;" ><span style="font-weight:normal;">*</span><bean:message key="casetype.label.name" bundle="${language}"/>：</td>
    <td class=TDLeft>
     <input type="text" id="name" name="name" size=20 maxlength=9 value="" isValidate="true" notEmpty="true" />
    </td>
  </tr>
</table>
</div>

<!-- 插入操作按钮 -->
<button name="submit" onClick="forInsert()" class="button"><bean:message key="button.label.submit" bundle="${language}"/></button>
<input type="reset" id="reset" value="<bean:message key="button.label.reset" bundle="${language}"/>" />
</form>
<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
<script type="text/javascript">

//查询等待中...
var waitObj=new hx_wait($("#this_path_id").val()+"/modules/base/hx_wait_plugin");
var height = document.body.clientHeight;
$("#hx_table_div").height(height - 173);
</script>
</div>
</div>

</body>
</html>