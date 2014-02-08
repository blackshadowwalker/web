<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>

<%
String thisPath = request.getContextPath();
%>

<script language="javascript">
    var args = window.dialogArguments; //父窗口传递的参数
</script>

<head>
<title><bean:message key="task.report" bundle="${language}"/></title>
<meta http-equiv="Expires" CONTENT="0">
<meta http-equiv="Cache-Control" CONTENT="no-cache">
<meta http-equiv="Pragma" CONTENT="no-cache">
<link rel="stylesheet" href="<%=thisPath%>/modules/base/report/report.css"	type="text/css" media="screen">
<script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
<script type="text/javascript"	src="<%=thisPath%>/modules/base/scripts/base.js"></script>
<script language="javascript"	src="<%=thisPath%>/modules/base/report/report.js"></script>
<script language="javascript" src="<%=thisPath%>/modules/base/hx_wait_plugin/hx_wait_plugin.js"></script>

<script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
<script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
<script type="text/javascript" src="<%=thisPath%>/dwr/interface/taskMgrBean.js"></script>
<style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>

<script language="javascript" src="<%=thisPath%>/LodopFuncs.js"></script>
<object id="LODOP" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="install_lodop.exe"></embed>
</object> 
</head>

<body>


<div>
<form id="i_downForm" name="downForm" target="_down_iframe" method="post">

<input type="hidden" size="300" id="hidden_data" name="hidden_data">

<input type="hidden" id="hidden_title" name="hidden_title">

<input type="hidden" id="hidden_total" name="hidden_total">
</form>
</div>

<iframe id="_down_iframe" name="_down_iframe" style="display:none;width:900;height:300"></iframe>

<script>
	
	document.getElementById("hidden_title").value=args.title; 
	
	document.getElementById("hidden_data").value=args.data;
	
	document.getElementById("hidden_total").value=args.data.split("</T>")[1].split("</R>").length-1;
	
</script>


<div style="text-align:right;height:16px; width:100%"> 
<table style="font-size:12px;">
<tr valign="middle">

    <!-- <td ><span id="pageInfo">当前第1页/共1页</span></td> -->
    <!-- <td><button class="BB_button print" name="button" onClick="prn1_preview();" hidefocus ><font style="font-size:12px;"> 打印</font></button> </td> -->
    <td><button class="BB_button excel" id="downloadCurrExcel" hidefocus><font style="font-size:12px;"><bean:message key="task.exportData" bundle="${language}"/></font></button></td>

</tr>
</table>

</div>

<div class=cardbody id=dy>

<style type="text/css" media="screen">

.tablestyle{
    border-top: 2px solid #000000; 
    border-right: 2px solid #000000; 
    border-bottom: 1px solid #000000; 
    border-left: 1px solid #000000; 
}
.TdTitle
{

    border-bottom:1px solid #000000;
    border-left:1px solid #000000;
    padding:0px;
    margin:0px;
    font-size:12px;
    text-align:center;
    font-weight: bold;

}
.TD
{
	height: 22px;
    border-bottom:1px solid #000000;
    border-left:1px solid #000000;
    padding:0px;
    margin:0px;
    font-size:12px;
    text-align:center;
    word-break:break-all;

}

.TdRight
{
	height: 22px;
    border-bottom:1px solid #000000;
    border-left:1px solid #000000;
    padding:0px;
    margin:0px;
    text-align:right;
    font-size:12px;
    word-break:break-all;

}

.BB_button{
	
	background-repeat:no-repeat;
	border:0;
	padding-left:8px;
	padding-right:10px;
	margin-left:6px;
	background-color:#FFFFFF;
}
</style>

<table  width=1000px id="table1" align="center">
	<tr height='35px'>
		<td colspan="2" style="font-weight: bold; font-size: 20px;text-align: center"><u>
		<script>
			document.write(args.title);
		</script>
		</u></td>
	</tr>
	

	<tr height='35px'>
		<script>
			document.write("<td colspan='1' style ='font-weight: bold;text-align: right'><bean:message key="task.amount" bundle="${language}"/>："+(args.data.split("</T>")[1].split("</R>").length-1)+"</td>");
		</script>
	</tr>
</table>
	

<table id="info" width=1124px  class="tablestyle" cellSpacing=0 cellPadding=0 align="center"> 
<script>

		var rptObject = new reportObject();
	
		var data  =  args.data;
		var datas= data.split("</T>");
		
		document.write("<tr height='50' style='background-color:#DAF3F0'>");
		
		var bt = datas[0].split("</C>");
		
		for(var i=0;i<bt.length;i++)
		{
			document.write("<td class='TdTitle'>"+bt[i]+"</td>");
		}
		document.write("</tr>");
		
		var nrR = datas[1].split("</R>");
	
		for(var i=0; i<nrR.length-1;i++){
			var color = "";
			if(i%2==0) color = "TrColor";
			else color="";
			document.write("<tr height='20' class='"+color+"' id='row_"+i+"'>");
			var nrC = nrR[i].split("</C>");
			
			for(var j=0; j<nrC.length-1; j++){
				if(trim(nrC[j])=="") nrC[j]="&nbsp;";
					
				document.write("<td class='TD'>"+nrC[j]+"</td>");
			}
			document.write("</tr>");
		}
		
</script>

</table>
<br>
<br>
<br>
</div>
</body>

<script>


$(function(){
	
	$("#downloadCurrExcel").click(function(){
		var fm1 = document.getElementById("i_downForm");
	    fm1.action ="<%=thisPath%>/modules/cloud/taskMgr/jsp/exportCurrExcel.jsp";
	    fm1.submit();
	});
})


</script>

</html>
