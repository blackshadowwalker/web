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
		String thisPath=request.getContextPath();
		String qx=request.getParameter("qx");
		baseForm bform = (baseForm) (request.getSession()).getAttribute("baseuser");
		String user_loc=bform.locationId; 
		
		List XycdIDs = (List)request.getSession().getAttribute("XycdIDs");
	    List XycdNames = (List)request.getSession().getAttribute("XycdNames");
      
	    List rulerCodeList=(List)request.getAttribute("rulerCodeList");
	    List rulerNameList=(List)request.getAttribute("rulerNameList");
	    String pagePath = rulerNameList.get(2)+">"+rulerNameList.get(1)+">"+rulerNameList.get(0);
%>


<html>
<head>
  <title><bean:message key="clgl.title" bundle="${language}"/></title>
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
  <script language="javascript" src="<%=thisPath%>/modules/ajgl/ajxxgl/clgl/scripts/clglObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/ajgl/ajxxgl/clgl/scripts/clglScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/clglBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/scripts/validateForm.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/calendar.js"></script>
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("modules/base/css/calendar-blue.css"); </style>
</head>

<body onLoad="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/images/main/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>：
              <%=pagePath %>
            </div></td>
        </tr>
    </table>
</div>
<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onclick="switch_index(this, 0)"><div align="center">
            <bean:message key="clgl.query" bundle="${language}"/>
      </div></td>
    </tr>
  </table>
</div>
<div class=padcontent>

<div id=padcontent0 class=activecontent>
<input type="hidden" id="this_path_id" value="<%=thisPath %>" />
<form>

<!-- 选择查询方式 -->

<table class=cardname>
<tbody>
  <tr>
    <td class=cardnameleft>
      <bean:message key="clgl.name" bundle="${language}"/>
    </td>
  </tr>
</tbody>
</table>

<!-- 输入查询条件 -->

<div class=scrollarea>
<table class=tableinput>
<tbody> 
<tr>
	<script language="javascript">
	    show_string_condition("<bean:message key="clgl.label.lpNumber" bundle="${language}"/> ", "LPnumber_op");
	</script>
    <td class=TDLeft>
      <input type="text" name="LPNumber" size=20 maxlength=40 value="" >
    </td>
 
	<script language="javascript">
	    show_string_condition("<bean:message key="clgl.label.location" bundle="${language}"/>", "location_op");
	</script>
    <td class=TDLeft>
      <input type="text" id="_locationName" name="_locationName" value="" style="width:118px;" disabled>
      	<input type="hidden" id="_locationId" name="locationId" size=20 maxlength=20 value="" disabled >&nbsp;&nbsp;
      	<html:button property="button" onclick="forLocationTree_query(_locationId)" styleClass="deptbutton">…</html:button>
    </td>
 
	<script language="javascript">
	    show_string_condition("<bean:message key="clgl.label.time" bundle="${language}"/>", "time_op");
	</script>
    <td class=TDLeft>
      <input type="text" name="time1" size=20 maxlength=80 value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" readonly>-<input type="text" name="time2" size=20 maxlength=80 value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" readonly>
    </td>
  </tr>
  
	<tr>
	<script language="javascript">
	    show_string_condition("<bean:message key="clgl.label.xycd" bundle="${language}"/>", "xycd_op");
	</script>
    <td class=TDLeft>
      <select size="1"  name="xycd" value="" onKeyDown="setTab()">
        <option value=''><bean:message key="clgl.label.xycdSelect" bundle="${language}"/></option>
		<%
		    for (int i = 0; i < XycdIDs.size(); i ++){
		%>
		        <option value='<%=XycdIDs.get(i)%>'><%=XycdNames.get(i)%></option>
		<%
		    }
		%>
      </select> 
    </td>
    
    <script language="javascript">
	    show_string_condition("<bean:message key="clgl.label.comment" bundle="${language}"/>", "comment_op");
	</script>
    <td class=TDLeft>
      <input type="text" name="comment" size=20 maxlength=40 value="" onKeyDown="setTab()">
    </td>
  </tr>
</tbody>
</table>

</div>

<!-- 查询操作按钮 -->

<!-- <button name="query" onClick="forQuery('')" class="button">开始查询</button>
<button name="reset" onClick="forReset()" class="button">清空条件</button> -->


<span id=scrollbar><bean:message key="msg.inProgress" bundle="${language}"/></span>

</form>

<!-- 显示查询结果 -->

<div id="hx_table_div" class="queryresult"></div>

</div>

<!-- 增加权限信息 -->

<div id=padcontent1 class=hiddencontent>




<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
<script type="text/javascript">

//查询等待中...
var waitObj=new hx_wait($("#this_path_id").val()+"/modules/base/hx_wait_plugin");
var height = document.body.clientHeight;
$("#hx_table_div").height(height - 173);


function forLocationTree_query(_locationId)
{
   // var dept = "37015oooo";
	
    var srcFile = '<%=thisPath%>'+"/modules/base/jsp/locationtree.jsp?jgbm="+'<%=user_loc%>'+"&type="+"radio";

    var winFeatures = "dialogHeight:600px;dialogWidth:450px;help:no;status:no";

   	var inArray = window.showModalDialog(srcFile, "", winFeatures);
	
	if (typeof(inArray) == "undefined"||inArray == "")
	{
     	//test.value = "";
     }
     else
     {
		_locationId.value = inArray.split("</C>")[1];	
		$("#_locationName").val(inArray.split("</C>")[2]);
	}
}
</script>
</div>
</div>
</body>
</html>