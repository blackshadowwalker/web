<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String language = bform.language;
	System.out.println(language);
	String thisPath = request.getContextPath();
	String qx = request.getParameter("qx");
//	List re1Names = (List) request.getAttribute("re1Names");

	String user_dept = bform.dept_code;
	String role_code = bform.role_code;
//	System.out.println("user_dept:"+user_dept + "  role_code:"+role_code);

	String user_loc=bform.locationId;  
	String pagePath = "云分析>文件管理";
    String uploadServer = (String)request.getAttribute("uploadServer");
    String uploadroot 	= (String)request.getAttribute("uploadroot");
    String uploadurl 	= (String)request.getAttribute("uploadurl");
    String uploadflash 	= (String)request.getAttribute("uploadflash");
    String uplodpath = ""+bform.user_code;
	
//	String uploadServer = "http://10.168.1.250:8888";
    Date nowTime = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地日期格式 
	long curDateTime = nowTime.getTime();
	String videodatetimeString = dateFormat.format(curDateTime);
%>

<html>

<head>
  <title><bean:message key="watchedfolder.name" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <link href="<%=thisPath%>/modules/base/hx_table/css/hx_table.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_wait_plugin/hx_wait_plugin.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/jquery.hx_table.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>
  
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/watchedFolderBean.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/cloud/watchedFolder/scripts/watchedFolderScript.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/cloud/watchedFolder/scripts/watchedFolderObject.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
  
  <script type="text/javascript" src="<%=thisPath%>/scripts/validateForm.js"></script>
</head>

<body onload="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/images/main/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>：WEB分析中心＞分析中心＞监视列表</div></td>
        </tr>
    </table>
</div>
<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onclick="switch_index(this, 0)"><div align="center"><bean:message key="watchedfolder.title" bundle="${language}"/></div></td>
      <td id=padindex1 class=hiddenindex onclick="switch_index(this, 1)" style="display:none"><div align="center">增加监视列表</div></td>
    </tr>
  </table>
</div>

<div class=padcontent>
<div id=padcontent0 class=activecontent>


<!-- 选择<bean:message key="button.query" bundle="${language}"/>方式 -->

<form> 

<table class=cardname>
<tbody>
  <tr>
    <td class=cardnameleft><bean:message key="watchedfolder.title" bundle="${language}"/></td>
  </tr>
</tbody>
</table>
<!-- 输入<bean:message key="button.query" bundle="${language}"/>条件 -->

<div class=scrollarea style=height:50px; >

<table class=tableinput>
<tbody>

 <tr> 
    <td width="150"><div align="right"><bean:message key="watchedfolder.label.plnumber" bundle="${language}"/>： </div></td>
    <td width="200"><input type="text" name="_LPNumber" size=20 maxlength=20 value="" style="width:88px" onKeyDown="setTab()"> 
    </td>
    <td width="100"><div align="right"></div></td>
    <td>
    </td>
  </tr>
</tbody>
</table>

</div>
</form>


<!-- 显示<bean:message key="button.query" bundle="${language}"/>结果 -->

<div id="hx_table_div" class="queryresult"></div>
</div>




<script type="text/javascript">

var uploadServer="<%=uploadServer%>";
var uploadroot="<%=uploadroot%>";
var uploadurl="<%=uploadurl%>";
var uploadflash="<%=uploadflash%>";
var uplodpath="<%=uplodpath%>";
var videodatetimeString="<%=videodatetimeString%>";
//<bean:message key="button.query" bundle="${language}"/>等待中...
	var waitObj=new hx_wait("<%=thisPath%>/modules/base/hx_wait_plugin");
    var height = document.body.clientHeight;
    $("#inputarea").height(height - 110);
    $("#hx_table_div").height(height - 173);
</script>
</div>
<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
</body>
</html>
