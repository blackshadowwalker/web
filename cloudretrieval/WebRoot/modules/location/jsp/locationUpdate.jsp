<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="modules.base.*"%>
<%
    String thisPath=request.getContextPath();
	baseForm bform=(baseForm)request.getSession().getAttribute("baseuser");
	
	String user_dept=bform.locationId;
%>
<html>
<script language="javascript">
    var args = window.dialogArguments;
</script>
<head>
  <title><bean:message key="button.modify" bundle="${language}"/><bean:message key="location.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/locationBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
   <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
  <script type="text/javascript" src="<%=thisPath%>/scripts/validateForm.js"></script>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css">
	body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
	#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
	#r-result{height:100%;width:20%;float:left;}
	.labelHeader{
		align:right;
		width:200px;
	}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
</head>

<body>

<div class=cardbody style=width:250px;float:left;>

<form id="nvr_form">

<table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

  <tr>
    <td class=tablebodyhead class=labelHeader><bean:message key="location.columns.code" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_id" name="locationId"  readonly="true" disabled size=20 maxlength=40 >
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead class=labelHeader><bean:message key="location.columns.name" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_type" name="locationName"  size=20 maxlength=40 isValidate="true" notEmpty="true" >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead class=labelHeader><bean:message key="location.columns.longitude" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_code" name="longitude"  size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead class=labelHeader><bean:message key="location.columns.latitude" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_value" name="latiTude"  size=20 maxlength=80 >
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead class=labelHeader><bean:message key="location.columns.mapScaling" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_content" name="mapScaling" size=20 maxlength=40 value="" readonly="true">
    </td>
  </tr>
 
  <tr>
    <td class=tablebodyhead class=labelHeader> <bean:message key="location.label.parentLocation" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_plocationName" name="plocationName" size=15 maxlength=9 value="" readonly="true">
      <input type="hidden" id="i_dept_manager" name="parentLocationId" size=20 maxlength=9 value="" >
      <input type="hidden" name="parentLocationId_value" value="">
      <html:button property="button" onclick="forLocationTree(parentLocationId,'radio',parentLocationId_value)" styleClass="deptbutton">…</html:button>
    </td>
  </tr>
 
</table>

<script language="javascript">

    dwr.engine.setAsync(false);

    locationBean.beforeUpdateTSLocation(parseInt(args.rowID),
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

         // document.forms[0].id.locationId = colElements[0];
          
            document.forms[0].locationId.value = colElements[1];
            document.forms[0].locationName.value = colElements[2];
            document.forms[0].longitude.value = colElements[3];
            document.forms[0].latiTude.value = colElements[4];
            document.forms[0].mapScaling.value = colElements[5];
            document.forms[0].plocationName.value = colElements[6];
            document.forms[0].parentLocationId.value = colElements[7];

        },
        exceptionHandler:function(err_info)
        {
            if (err_info!="")
            {
                alert(err_info);
                window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
            }
            else
            {
                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
                window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
            }
        }
    });
    dwr.engine.setAsync(true);
</script>
</form>

<button name="button" onClick="forSure()" class="button"><bean:message key="button.label.submit" bundle="${language}"/></button>
<button name="button" onClick="forAbort()" class="button"><bean:message key="button.label.cancel" bundle="${language}"/></button>

</div>

<div id="allmap" style=width:450px;float:left; ></div>
<script language="JavaScript">    

function forLocationTree(parentLocationId,type,parentLocationId_value)
{
   // var dept = "37015oooo";
	
    var srcFile = '<%=thisPath%>'+"/modules/base/jsp/locationtree.jsp?jgbm="+'<%=user_dept%>'+"&type="+type;

    var winFeatures = "dialogHeight:600px;dialogWidth:450px;help:no;status:no";

   	var inArray = window.showModalDialog(srcFile, parentLocationId_value.value, winFeatures);
	
	if (typeof(inArray) == "undefined"||inArray == "")
	{
     	//test.value = "";
     }
     else
     {
		parentLocationId_value.value=inArray+"</R>";
		parentLocationId.value = inArray.split("</C>")[1];
		$("#i_plocationName").val(inArray.split("</C>")[2]);
		
	}
}
function forSure()    
{
   if(!$("#nvr_form").validateForm()){
		return;
   }
    var i = 0;
    var updateString = new Array();
    
    var locationId=document.forms[0].locationId.value;
    
    var locationName=document.forms[0].locationName.value;
    
    var longitude=document.forms[0].longitude.value;
    
    var latiTude=document.forms[0].latiTude.value;
    
    var mapScaling=document.forms[0].mapScaling.value;

    var parentLocationId=document.forms[0].plocationName.value;
    
    updateString[i++] = "locationId='"+document.forms[0].locationId.value+"'";
    updateString[i++] = "locationName='"+document.forms[0].locationName.value+"'";
    updateString[i++] = "longitude='"+document.forms[0].longitude.value+"'";
    updateString[i++] = "latiTude='"+document.forms[0].latiTude.value+"'";
    updateString[i++] = "mapScaling='"+document.forms[0].mapScaling.value+"'";
    updateString[i++] = "parentLocationId='"+document.forms[0].parentLocationId.value+"'";
	
	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.modify" bundle="${language}"/>?"))	
        return false;
	
    window.returnValue = updateString.toString()+"|no</C>"+locationId+"</C>"+locationName+"</C>"+longitude+"</C>"+latiTude+"</C>"+mapScaling+"</C>"+parentLocationId+"</C>";
    window.close();    
} 



function forAbort()    
{         
    window.close();    
} 

function forPrint()    
{         
    window.print();
} 

</script> 
<script type="text/javascript">

	var map = new BMap.Map("allmap");
	
	map.centerAndZoom(new BMap.Point(parseFloat($("#i_code").val()), parseFloat($("#i_value").val())), parseInt($("#i_content").val()));
	
	var marker = new BMap.Marker(new BMap.Point(parseFloat($("#i_code").val()), parseFloat($("#i_value").val())));  // 创建标注
	map.addOverlay(marker);
	
	map.enableScrollWheelZoom();   
	map.enableContinuousZoom();    
	
	function showInfo(e){
	// alert(e.point.lng + ", " + e.point.lat);
	 $("#i_code").val(e.point.lng);
	 $("#i_value").val(e.point.lat);  
	 $("#i_content").val(map.getZoom());

	 map.clearOverlays();//清除所有 markers
	 
	 marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
	 map.addOverlay(marker);   
	}
	map.addEventListener("click", showInfo);
</script>
</body>

</html>
