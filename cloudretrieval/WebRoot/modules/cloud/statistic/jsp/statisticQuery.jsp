<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String language = bform.language;
	System.out.println(language);
    String user_loc=bform.locationId;  
    String thisPath=request.getContextPath();
    String qx=request.getParameter("qx");
%>

<html>

<head>
  <title><bean:message key="report.title" bundle="${language}"/></title>
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
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/statisticBean.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/cloud/statistic/scripts/statisticObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/cloud/statistic/scripts/statisticScript.js"></script>
  <script type="text/javascript" src="scripts/calendar.js"></script>
  <script type="text/javascript" src="scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("css/calendar-blue.css"); </style>
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
  
  <script src="<%=thisPath%>/scripts/Highcharts-3.0.1/js/highcharts.js"></script>
  <script src="<%=thisPath%>/scripts/Highcharts-3.0.1/js/modules/exporting.js"></script>
</head>

<body onload="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/images/main/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>：云计算分析中心＞分析中心＞报表分析</div></td>
        </tr>
    </table>
</div>
<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onclick="switch_index(this, 0)"><div align="center"><bean:message key="report.title" bundle="${language}"/></div></td>
      <td id=padindex1 class=hiddenindex onclick="switch_index(this, 1)"><div align="center"><bean:message key="report.chart" bundle="${language}"/></div></td>
    </tr>
  </table>
</div>
<div class=padcontent>

<div id=padcontent0 class=activecontent>
<input type="hidden" id="this_path_id" value="<%=thisPath %>" />
<form>

<!-- 选择<bean:message key="button.query" bundle="${language}"/>方式 -->

<table class=cardname>
<tbody>
  <tr>
    <td class=cardnameleft><bean:message key="report.title" bundle="${language}"/></td>
  </tr>
</tbody>
</table>

<!-- 输入<bean:message key="button.query" bundle="${language}"/>条件 -->

<div class=scrollarea  style=height:50px>

<table class=tableinput>
<tbody>

  <tr>
<script language="javascript">
    show_string_condition("<bean:message key="report.label.plnumber" bundle="${language}"/> ", "type_op");
</script>
    <td class=TDLeft>
      <input type="text" name="LPNumber" size=20 maxlength=40 value="" >
    </td>
 
<script language="javascript">
    show_string_condition("<bean:message key="report.label.location" bundle="${language}"/>", "code_op");
</script>
    <td class=TDLeft>
      <input type="text" id="_locationName" name="_locationName" value="" style="width:118px;" disabled>
      	<input type="hidden" id="_locationId" name="locationId" size=20 maxlength=20 value="" disabled >&nbsp;&nbsp;
      	<html:button property="button" onclick="forLocationTree_query(_locationId)" styleClass="deptbutton">…</html:button>
    </td>
 
<script language="javascript">
    show_string_condition("<bean:message key="report.label.abstime" bundle="${language}"/>", "value_op");
</script>
    <td class=TDLeft>
      <input type="text" name="time1" size=20 maxlength=80 value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" readonly>-<input type="text" name="time2" size=20 maxlength=80 value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" readonly>
    </td>
  </tr>

</tbody>
</table>

</div>


</form>

<!-- 显示<bean:message key="button.query" bundle="${language}"/>结果 -->

<div id="hx_table_div" class="queryresult"></div>

</div>


<div id=padcontent1 class=hiddencontent>

<table class=cardname>
  <tr>
    <td class=cardnameleft><bean:message key="report.chart" bundle="${language}"/></td>
    <td class=cardnameright></td>
  </tr>
</table>

<!-- 输入 -->

<form>

<!-- 输入<bean:message key="button.query" bundle="${language}"/>条件 -->

<div  style="height:200px" class=scrollarea >

<table  border="0" class=tableinput>
<tbody>
	<tr>
		<script language="javascript">
		    show_string_condition("<bean:message key="report.choosetime" bundle="${language}"/>", "rq_op");
		</script>
	    <td class=TDLeft>
	       <input id="time_1" type="text" name="time" size=12 maxlength=10 onKeyDown="setTab()" class="Wdate"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly>
	       <input id="time_2" type="text" name="time" size=12 maxlength=10 onKeyDown="setTab()" class="Wdate"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly>
	    </td>
	</tr>
	<tr>
		<script language="javascript">
		    show_string_condition("<bean:message key="report.chooselocation" bundle="${language}"/>", "rq_op");
		</script>
	    <td class=TDLeft>
	       <input type="text"  size=12 maxlength=10 id="chart_locationName" name="chart_locationName" size=20 maxlength=20 value="" disabled >
      	   <input type="hidden" id="chart_locationId" name="chart_locationId" size=20 maxlength=20 value="" disabled>&nbsp;&nbsp;
      	   <html:button property="button" onclick="chart_forLocationTree(chart_locationId)" styleClass="deptbutton">…</html:button>
	    </td>
	</tr>
	

	<tr height="10px"><td></td></tr>
	<tr>
	    <td></td>
		<td>
			<button name="submit" onClick="showChart()" class="button"><bean:message key="button.query" bundle="${language}"/></button> &nbsp;
		</td> 
	</tr>      
</tbody>
</table>

</div>

</form>

<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>

</div>

<script type="text/javascript">
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

	function chart_forLocationTree(chart_locationId)
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
			chart_locationId.value = inArray.split("</C>")[1];	
			$("#chart_locationName").val(inArray.split("</C>")[2]);
		}
	}
	function showChart(){
		var time_1=$("#time_1").val();
		var time_2=$("#time_2").val();
		var location=$("#chart_locationId").val();
		if(time_1=="" || time_1==null){
			alert("<bean:message key="report.chart.starttime" bundle="${language}"/>!");
			return;
		}
		if(time_2=="" || time_2==null){
			alert("<bean:message key="report.chart.endtime" bundle="${language}"/>!");
			return;
		}
		if(location=="" || location==null){
			alert("<bean:message key="report.chart.chooselocation" bundle="${language}"/>!");
			return;
		}
		window.open("<%=thisPath%>/modules/cloud/statistic/jsp/chart.jsp?time_1="+time_1+"&time_2="+time_2+"&location="+location);
	}
</script>
</div>
</body>
</html>
