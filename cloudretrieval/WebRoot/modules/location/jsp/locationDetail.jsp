<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>

<%
    String thisPath=request.getContextPath();
%>

<head>
  <title><bean:message key="location.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/locationBean.js"></script>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css">
	body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
	#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
	#r-result{height:100%;width:20%;float:left;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
</head>

<body>

<div class=cardbody style=width:600px;float:left;>
<div>
  <table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

	<script>
	    var longitude,latitude,mapScaling;
	    var rowID = window.dialogArguments;
	
	    dwr.engine.setAsync(false);
	
	    locationBean.detailTSLocation(rowID,
	    {
	        callback:function(data)
	        {
	            rowElements=data.split("</R>"); 
	        
	            colElements=rowElements[0].split("</C>");
	
	            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="location.columns.code" bundle="${language}"/></td>");
	            document.write("<td class=tablebody>"+colElements[1]+"</td></tr>")
	            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="location.columns.name" bundle="${language}"/></td>");
	            document.write("<td class=tablebody>"+colElements[2]+"</td></tr>");
	            document.write("<tr><td class=tablebodyhead><bean:message key="location.columns.longitude" bundle="${language}"/></td>");
	            document.write("<td class=tablebody>"+colElements[3]+"</td></tr>");
	            document.write("<tr><td class=tablebodyhead><bean:message key="location.columns.latitude" bundle="${language}"/></td>");
	            document.write("<td class=tablebody>"+colElements[4]+"</td></tr>");
	            document.write("<tr><td class=tablebodyhead><bean:message key="location.columns.mapScaling" bundle="${language}"/></td>");
	            document.write("<td class=tablebody>"+colElements[5]+"</td></tr>");
	            longitude=colElements[3]; latitude=colElements[4]; mapScaling=colElements[5];
	       
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

  </table>
 </div>
<div id="allmap" style="width:600px; height:500px;"> </div>

</div>


<script language="JavaScript">    

function forAbort()    
{         
    window.close();    
} 

</script> 
<script type="text/javascript">
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(parseFloat(longitude), parseFloat(latitude)), parseInt(mapScaling));
	var marker = new BMap.Marker(new BMap.Point(parseFloat(longitude), parseFloat(latitude)));  // ������ע
	map.addOverlay(marker); 
	
	map.enableScrollWheelZoom();   
	map.enableContinuousZoom();  

</script>
</body>

</html>
